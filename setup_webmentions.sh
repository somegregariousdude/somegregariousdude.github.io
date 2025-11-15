#!/bin/bash
# ---
# This one-time script scaffolds the Webmention
# comment system into your theme.
# ---

# --- 0. Make Script Portable ---
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR"
THEME_DIR="themes/accessible-material-design"

echo "--- 1. Creating data directory ---"
mkdir -p "data"
touch "data/.gitkeep"
echo "✅ Created data/ directory."

echo "--- 2. Creating comments.html partial ---"
# This is the template that renders your comments
cat <<'EOT' > "$THEME_DIR/layouts/partials/comments.html"
{{/*
  This template renders all Webmentions (comments, likes, etc.)
  that have been fetched at build-time into /data/comments.json.
  
  It is Zero-JS, accessible, and secure.
*/}}

{{/* Get all comments for the *entire site* */}}
{{ $allComments := .Site.Data.comments.children }}

{{/* Filter down to *only* comments for the *current page* */}}
{{ $pageComments := where $allComments "wm-target" .Permalink }}

{{ if $pageComments }}
<section class="comments card" aria-labelledby="comments-heading">
  <h2 id="comments-heading">Webmentions</h2>
  
  <ul class="comment-list">
    {{ range $pageComments }}
    <li class="comment h-cite">
      
      <header class="comment-header">
        {{/* Author Info */}}
        <div class="comment-author p-author h-card">
          {{ with .author.photo }}
          <img class="u-photo" src="{{ . }}" alt="">
          {{ end }}
          <a class="p-name u-url" href="{{ .author.url | default .url }}" target="_blank" rel="noopener noreferrer">
            {{ .author.name | default "Anonymous" }}
          </a>
        </div>
        
        {{/* Publish Date */}}
        <time class="dt-published" datetime="{{ .published }}">
          {{ (time .published).Format "Jan 2, 2006 at 3:04 PM" }}
        </time>
      </header>
      
      {{/* Comment Content
        We use 'plainify' to strip all HTML.
        This is a critical security step to prevent XSS.
        [Ref: Project Context, source 14]
      */}}
      <div class="e-content p-content">
        {{ if .content.text }}
          <p>{{ .content.text | plainify }}</p>
        {{ else if eq .wm-property "like-of" }}
          <p><em>Liked this post.</em></p>
        {{ else if eq .wm-property "repost-of" }}
          <p><em>Reposted this post.</em></p>
        {{ else }}
          <p><em>Mentioned this post.</em></p>
        {{ end }}
      </div>
      
      {{/* Link to original */}}
      <a class="comment-source u-url" href="{{ .url }}" target="_blank" rel="noopener noreferrer" aria-label="View original comment">
        (Source)
      </a>
      
    </li>
    {{ end }}
  </ul>
</section>
{{ end }}
EOT
echo "✅ Created layouts/partials/comments.html"

echo "--- 3. Overwriting head.html to add Webmention links ---"
# This REPLACES head.html
cat <<'EOT' > "$THEME_DIR/layouts/partials/head.html"
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ if .IsHome }}{{ .Site.Title }}{{ else }}{{ .Title }} | {{ .Site.Title }}{{ end }}</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,400;0,700;1,400&display.swap" rel="stylesheet">
    
    {{ $style := resources.Get "scss/main.scss" | toCSS }}
    <link href="{{ $style.RelPermalink }}" rel="stylesheet">

    <link href="/pagefind/pagefind-ui.css" rel="stylesheet">
    <script src="/pagefind/pagefind-ui.js" defer></script>
    <script>
      window.addEventListener('DOMContentLoaded', (event) => {
        new PagefindUI({ 
          element: "#search",
          showSubResults: true,
          showEmptyFilters: false
        });
      });
    </script>

    {{/* --- [NEW] Webmention Links --- */}}
    {{/* These tell other sites where to send notifications */}}
    {{ if .IsPage }}
    <link rel="webmention" href="https://webmention.io/simplygregario.us/webmention" />
    <link rel="pingback" href="https://webmention.io/simplygregario.us/xmlrpc" />
    {{ end }}
</head>
EOT
echo "✅ head.html updated with Webmention links."

echo "--- 4. Overwriting single.html to call comments partial ---"
# This REPLACES single.html
cat <<'EOT' > "$THEME_DIR/layouts/_default/single.html"
{{ define "main" }}
  <article class="h-entry" role="article">
    
    <header>
      <h1 class="p-name">{{ .Title }}</h1>
      <div class="entry-meta">
        <span>Published: 
          <time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">
            {{ .Date.Format "January 2, 2006" }}
          </time>
        </span>
        {{ if .Lastmod.After .Date }}
          <span>Updated: 
            <time class="dt-updated" datetime="{{ .Lastmod.Format "2006-01-02T15:04:05Z07:00" }}">
              {{ .Lastmod.Format "January 2, 2006" }}
            </time>
          </span>
        {{ end }}
        <a class="p-author h-card u-url" href="{{ .Site.BaseURL }}" style="display:none;">
          {{ .Site.Params.author.name }}
        </a>
      </div>
    </header>

    <div class="e-content">
      {{ .Content }}
    </div>

    <a href="{{ .Permalink }}" class="u-url" style="display:none;">Permalink</a>

    {{ $params := .Site.Params.taxonomy }}
    {{ if or (and $params.showCategoriesOnPost .Params.categories) (and $params.showTagsOnPost .Params.tags) }}
    <footer class="taxonomy-footer">
      {{ if and $params.showCategoriesOnPost .Params.categories }}
      <div class="taxonomy-list" aria-label="Categories">
        <strong>Categories:</strong>
        <ul>
          {{ range .Params.categories }}
          <li>
            <a href="{{ "/categories/" | relLangURL }}{{ . | urlize }}" class="p-category">{{ . }}</a>
          </li>
          {{ end }}
        </ul>
      </div>
      {{ end }}
      {{ if and $params.showTagsOnPost .Params.tags }}
      <div class="taxonomy-list" aria-label="Tags">
        <strong>Tags:</strong>
        <ul>
          {{ range .Params.tags }}
          <li>
            <a href="{{ "/tags/" | relLangURL }}{{ . | urlize }}" class="p-category">{{ . }}</a>
          </li>
          {{ end }}
        </ul>
      </div>
      {{ end }}
    </footer>
    {{ end }}
  </article>

  {{/* --- [NEW] Call the comments partial --- */}}
  {{ partial "comments.html" . }}

{{ end }}
EOT
echo "✅ single.html updated to call comments partial."

echo "--- 5. Appending CSS for Comments ---"
# This APPENDS new styles to main.scss
cat <<'EOT' >> "$THEME_DIR/assets/scss/main.scss"

/* --- 11. Webmention Comment Styles --- */
.comments ul {
  list-style: none;
  padding: 0;
  margin: 0;
}
.comment {
  margin-top: 1.5em;
  padding-top: 1.5em;
  border-top: 1px solid var(--color-border);
}
.comment:first-child {
  margin-top: 0;
  padding-top: 0;
  border-top: none;
}
.comment-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  gap: 1em;
  margin-bottom: 1em;
}
.comment-author {
  display: flex;
  align-items: center;
  gap: 0.75em;
  font-weight: 700;
}
.comment-author img {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  border: 2px solid var(--color-border);
}
.comment-header time {
  font-size: 0.9em;
  opacity: 0.7;
}
.comment-source {
  font-size: 0.8em;
  opacity: 0.7;
  margin-top: 1em;
  display: inline-block;
}
EOT
echo "✅ main.scss updated with comment styles."
echo "---"
echo "✅✅✅ Webmention setup script complete! ✅✅✅"
