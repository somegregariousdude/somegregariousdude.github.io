#!/bin/bash
# ---
# This script fixes the "bad character U+002D" parsing bug
# for the final time. The error was using '.wm-property'
# (invalid) instead of '(index . "wm-property")' (valid).
# ---

# --- 0. Make Script Portable ---
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR"
THEME_DIR="themes/accessible-material-design"

echo "--- 1. Overwriting comments.html partial with correct syntax ---"
# This REPLACES the comments partial
cat <<'EOT' > "$THEME_DIR/layouts/partials/comments.html"
{{/*
  This template renders all Webmentions (comments, likes, etc.)
  that have been fetched at build-time into /data/comments.json.
  
  (v5 - Corrects '.wm-property' to '(index . "wm-property")')
*/}}

{{ $allComments := .Site.Data.comments.children }}
{{ $pageComments := where $allComments "wm-target" .Permalink }}

{{ if $pageComments }}
<section class="comments card" aria-labelledby="comments-heading">
  <h2 id="comments-heading">Webmentions</h2>
  
  <ul class="comment-list">
    {{ range $pageComments }}
    <li class="comment h-cite">
      
      <header class="comment-header">
        <div class="comment-author p-author h-card">
          {{ with .author.photo }}
          <img class="u-photo" src="{{ . }}" alt="">
          {{ end }}
          <a class="p-name u-url" href="{{ .author.url | default .url }}" target="_blank" rel="noopener noreferrer">
            {{ .author.name | default "Anonymous" }}
          </a>
        </div>
        <time class="dt-published" datetime="{{ .published }}">
          {{ (time .published).Format "Jan 2, 2006 at 3:04 PM" }}
        </time>
      </header>
      
      <div class="e-content p-content">
        {{/* --- [FINAL FIX] Use 'index' function for hyphenated field --- */}}
        
        {{/* Get the property *safely* */}}
        {{ $property := (index . "wm-property") }}

        {{ with .content.text }}
          {{/* This is a text comment */}}
          {{ $safeText := . | plainify }}
          {{ $urlRegex := "(https?://[^\\s<]+)" }}
          {{ $link := "<a href=\"$1\" target=\"_blank\" rel=\"nofollow noopener noreferrer\" class=\"comment-link\">$1</a>" }}
          {{ $linkedText := $safeText | replaceRE $urlRegex $link }}
          <p>{{ $linkedText | safeHTML }}</p>
        {{ else }}
          {{/* This is a like, repost, or mention */}}
          {{ if eq $property "like-of" }}
            <p><em>Liked this post.</em></p>
          {{ end }}
          {{ if eq $property "repost-of" }}
            <p><em>Reposted this post.</em></p>
          {{ end }}
          {{ if or (eq $property "mention-of") (not $property) }}
            <p><em>Mentioned this post.</em></p>
          {{ end }}
        {{ end }}
        {{/* --- End of fix --- */}}
      </div>
      
      <a class="comment-source u-url" href="{{ .url }}" target="_blank" rel="noopener noreferrer" aria-label="View original comment">
        (Source)
      </a>
      
    </li>
    {{ end }}
  </ul>
</section>
{{ end }}
EOT
echo "✅ layouts/partials/comments.html updated."
echo "---"
echo "✅✅✅ Comment template fixed. This *is* the correct solution. ✅✅✅"
