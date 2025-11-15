#!/bin/bash
# ---
# This script updates the Webmention comment partial
# to safely "auto-link" URLs found in comments.
# ---

# --- 0. Make Script Portable ---
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR"
THEME_DIR="themes/accessible-material-design"

echo "--- 1. Overwriting comments.html partial ---"
# This REPLACES the comments partial
cat <<'EOT' > "$THEME_DIR/layouts/partials/comments.html"
{{/*
  This template renders all Webmentions (comments, likes, etc.)
  that have been fetched at build-time into /data/comments.json.
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
        {{ if .content.text }}
          {{/*
            --- [UPDATED] Auto-linker logic ---
            1. 'plainify' the text to strip all HTML (Security).
            2. Use 'replaceRE' to find URLs and wrap them
               in safe <a> tags with security attributes.
            3. Use 'safeHTML' to render the <a> tags we just created.
            [Ref: Project Context, 14]
          */}}
          {{ $safeText := .content.text | plainify }}
          {{ $urlRegex := "(https?://[^\\s<]+)" }}
          {{ $link := "<a href=\"$1\" target=\"_blank\" rel=\"nofollow noopener noreferrer\" class=\"comment-link\">$1</a>" }}
          {{ $linkedText := $safeText | replaceRE $urlRegex $link }}
          <p>{{ $linkedText | safeHTML }}</p>
          
        {{ else if eq .wm-property "like-of" }}
          <p><em>Liked this post.</em></p>
        {{ else if eq .wm-property "repost-of" }}
          <p><em>Reposted this post.</em></p>
        {{ else }}
          <p><em>Mentioned this post.</em></p>
        {{ end }}
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

echo "--- 2. Appending CSS for Comment Links ---"
# This APPENDS new styles to main.scss
cat <<'EOT' >> "$THEME_DIR/assets/scss/main.scss"

/* --- 12. Comment Link Styles --- */
/* Style for auto-linked URLs in comments */
.comment-link {
  /* This will allow long URLs to break and wrap */
  word-break: break-all;
}
EOT
echo "✅ main.scss updated with comment link style."
echo "---"
echo "✅✅✅ Comment template updated successfully! ✅✅✅"
