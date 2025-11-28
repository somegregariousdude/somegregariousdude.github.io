#!/bin/bash
# ==============================================================================
# SCRIPT: apply_fixes.sh
# PURPOSE: Retrofit templates with strict IndieWeb 'u-url' microformats.
# CONTEXT: Fixes missing or empty canonical links in hidden metadata blocks.
# SAFETY: Overwrites specific files with known-good, full-content versions.
# ==============================================================================

echo "Applying IndieWeb Microformat Fixes..."

# 1. FIX: Universal Post Layout (_default/single.html)
# Issue: Missing u-url in hidden block.
cat <<'EOF' > "themes/Accessible-MD/layouts/_default/single.html"
{{ define "main" }}
{{/* The {{ .Type }} class allows CSS to target specific content types */}}
<article class="single-post h-entry outlined-card {{ .Type }}">
  
  <div style="display: none;" class="p-author h-card">
    <a href="{{ .Site.BaseURL }}" class="u-url p-name">{{ .Site.Params.author.name }}</a>
    <img src="{{ .Site.Params.author.photo | absURL }}" class="u-photo" alt="{{ .Site.Params.author.name }}">
    {{/* FIX: Add explicit u-url for the entry */}}
    <a href="{{ .Permalink }}" class="u-url">Permalink</a>
  </div>

  <header class="post-header">
    <div class="headline-row">
      {{ partial "ui/chip.html" . }}
      <h1 class="p-name">{{ .Title }}</h1>
    </div>
    
    {{/* QoL Metadata */}}
    <div class="post-meta">
      <div class="meta-item">
        <span class="meta-icon">{{ partial "icons/event.svg" . }}</span>
        <div class="meta-text">
          <time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">
            {{ .Date.Format "Monday, Jan 2, 2006 at 3:04 PM (MST)" }}
          </time>
          {{ if ne .Date .Lastmod }}
          <span class="dt-updated-label">
            (Updated: <time class="dt-updated" datetime="{{ .Lastmod.Format "2006-01-02T15:04:05Z07:00" }}">{{ .Lastmod.Format "Jan 2, 2006" }}</time>)
          </span>
          {{ end }}
        </div>
      </div>

      <div class="meta-item">
        <span class="meta-icon">{{ partial "icons/schedule.svg" . }}</span>
        <span class="reading-time">{{ .ReadingTime }} min read</span>
      </div>
    </div>
  </header>

  {{/* Context Blocks (MD3 Tonal) */}}
  <div class="context-container">
    {{ if .Params.reply_to }}
    <div class="context-block reply-context">
      <span class="context-icon">{{ partial "icons/replies.svg" . }}</span>
      <span class="context-label">Replying to</span>
      <a href="{{ .Params.reply_to }}" class="u-in-reply-to context-link">{{ .Params.reply_to | truncate 50 }}</a>
    </div>
    {{ end }}
    {{ if .Params.like_of }}
    <div class="context-block like-context">
      <span class="context-icon">{{ partial "icons/likes.svg" . }}</span>
      <span class="context-label">Liked</span>
      <a href="{{ .Params.like_of }}" class="u-like-of context-link">{{ .Params.like_of | truncate 50 }}</a>
    </div>
    {{ end }}
    {{ if .Params.repost_of }}
    <div class="context-block repost-context">
      <span class="context-icon">{{ partial "icons/reposts.svg" . }}</span>
      <span class="context-label">Reposted</span>
      <a href="{{ .Params.repost_of }}" class="u-repost-of context-link">{{ .Params.repost_of | truncate 50 }}</a>
    </div>
    {{ end }}
    {{ if .Params.bookmark_of }}
    <div class="context-block bookmark-context">
      <span class="context-icon">{{ partial "icons/bookmarks.svg" . }}</span>
      <span class="context-label">Bookmarked</span>
      <a href="{{ .Params.bookmark_of }}" class="u-bookmark-of context-link">{{ .Params.bookmark_of | truncate 50 }}</a>
    </div>
    {{ end }}
    {{ if and .Params.rsvp .Params.reply_to }}
    <div class="context-block rsvp-context">
      <span class="context-icon">{{ partial "icons/rsvps.svg" . }}</span>
      <span class="context-label">RSVP: <strong class="p-rsvp">{{ .Params.rsvp | upper }}</strong> to</span>
      <a href="{{ .Params.reply_to }}" class="u-in-reply-to context-link">{{ .Params.reply_to | truncate 40 }}</a>
    </div>
    {{ end }}
  </div>

  <div class="e-content">{{ .Content }}</div>

  <footer class="post-footer">
    {{/* Universal Syndication */}}
    {{ partial "syndication.html" . }}

    {{ if .Params.tags }}
    <ul class="tags">{{ range .Params.tags }}<li><a href="{{ "/tags/" | relLangURL }}{{ . | urlize }}" class="p-category">#{{ . }}</a></li>{{ end }}</ul>
    {{ end }}
  </footer>
</article>

{{ partial "share-buttons.html" . }}

{{/* Universal Webmentions (Smart Fallback) */}}
{{ $show := .Params.show_webmentions }}
{{ if eq $show nil }}
  {{ $show = .Site.Params.webmentions.show_webmentions }}
{{ end }}

{{ if $show }}
  {{ partial "webmentions-card.html" (dict 
      "context" .
      "description" "Have your say. Write a post on your own site and link to this URL to appear here!"
  ) }}
{{ end }}
{{ end }}
EOF

# 2. FIX: Photos Layout (photos/single.html)
# Issue: Missing u-url in hidden block.
cat <<'EOF' > "themes/Accessible-MD/layouts/photos/single.html"
{{ define "main" }}
<article class="single-post h-entry outlined-card photos">
  
  {{/* Hidden Author Block for Microformats */}}
  <div style="display: none;" class="p-author h-card">
    <a href="{{ .Site.BaseURL }}" class="u-url p-name">{{ .Site.Params.author.name }}</a>
    <img src="{{ .Site.Params.author.photo | absURL }}" class="u-photo" alt="{{ .Site.Params.author.name }}">
    {{/* FIX: Add explicit u-url for the entry */}}
    <a href="{{ .Permalink }}" class="u-url">Permalink</a>
  </div>

  <header class="post-header">
    <div class="headline-row">
      {{ partial "ui/chip.html" . }}
      <h1 class="p-name">{{ .Title }}</h1>
    </div>
    
    <div class="post-meta">
      <div class="meta-item">
        <span class="meta-icon">{{ partial "icons/event.svg" . }}</span>
        <time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">
          {{ .Date.Format "Monday, Jan 2, 2006 at 3:04 PM (MST)" }}
        </time>
      </div>
    </div>
  </header>

  {{/* The Content (containing the image) */}}
  {{/* The render-image hook will ensure the img tag has class="u-photo" */}}
  <div class="e-content">
    {{ .Content }}
  </div>

  <footer class="post-footer">
    {{ partial "syndication.html" . }}
    {{ if .Params.tags }}
    <ul class="tags">{{ range .Params.tags }}<li><a href="{{ "/tags/" | relLangURL }}{{ . | urlize }}" class="p-category">#{{ . }}</a></li>{{ end }}</ul>
    {{ end }}
  </footer>
</article>

{{ partial "share-buttons.html" . }}

{{ if .Params.show_webmentions | default .Site.Params.webmentions.show_webmentions }}
  {{ partial "webmentions-card.html" (dict "context" . "description" "Seen something you like? Let me know!") }}
{{ end }}
{{ end }}
EOF

# 3. FIX: Guestbook Page (pages/guestbook.html)
# Issue: Empty u-url anchor tag.
cat <<'EOF' > "themes/Accessible-MD/layouts/pages/guestbook.html"
{{ define "main" }}

<header class="page-header">
  <div class="headline-row">
    {{ partial "ui/chip.html" . }}
    <h1 class="p-name">Guestbook</h1>
  </div>
</header>

<section class="guestbook-intro outlined-card h-entry">
  <div style="display: none;">
     <div class="p-author h-card"><a href="{{ .Site.BaseURL }}" class="u-url p-name">{{ .Site.Params.author.name }}</a></div>
     {{/* FIX: Add text content to the anchor */}}
     <a href="{{ .Permalink }}" class="u-url">Permalink</a>
     <time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">{{ .Date }}</time>
     {{ range .Params.tags }}<span class="p-category">{{ . }}</span>{{ end }}
  </div>

  <div class="e-content">
    <p class="lead">{{ .Site.Params.webmentions.guestbookIntro }}</p>
    {{ .Content }}
  </div>

  {{/* UNIVERSAL SYNDICATION PARTIAL */}}
  {{ partial "syndication.html" . }}
</section>

{{ partial "share-buttons.html" . }}

{{ partial "webmentions-card.html" (dict 
    "context" . 
    "target" .Site.BaseURL 
    "title" "Signatures" 
    "description" "This guestbook is powered by Webmentions. Write a post on your own site and link to this page to appear here!"
    "extraClasses" "h-feed"
) }}

{{ end }}
EOF

# 4. FIX: Contact Page (pages/contact.html)
# Issue: Empty u-url anchor tag.
cat <<'EOF' > "themes/Accessible-MD/layouts/pages/contact.html"
{{ define "main" }}
<section class="contact-page outlined-card h-entry">
  {{/* Hidden Metadata for Parsers */}}
  <div style="display: none;">
     <div class="p-author h-card">
       <a href="{{ .Site.BaseURL }}" class="u-url p-name">{{ .Site.Params.author.name }}</a>
       <img src="{{ .Site.Params.author.photo | absURL }}" class="u-photo" alt="{{ .Site.Params.author.name }}">
     </div>
     {{/* FIX: Add text content to the anchor */}}
     <a href="{{ .Permalink }}" class="u-url">Permalink</a>
     <time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">{{ .Date }}</time>
     {{ range .Params.tags }}<span class="p-category">{{ . }}</span>{{ end }}
  </div>

  <header class="page-header">
    <div class="headline-row">
      {{ partial "ui/chip.html" . }}
      {{/* Hardcoded P-Name */}}
      <h1 class="p-name">Contact Me</h1>
    </div>
    <p class="p-summary">{{ .Site.Params.contact.intro }}</p>
  </header>

  <div class="e-content">{{ .Content }}</div>

  {{ if .Params.tags }}
  <footer class="post-footer">
    <ul class="tags">
      {{ range .Params.tags }}
      <li><a href="{{ "/tags/" | relLangURL }}{{ . | urlize }}" class="p-category">#{{ . }}</a></li>
      {{ end }}
    </ul>
  </footer>
  {{ end }}

  <form action="{{ .Site.Params.contact.formAction }}" method="POST" class="contact-form" aria-label="Contact Form">
    <div class="form-group"><label for="name">Name</label><input type="text" id="name" name="name" required></div>
    <div class="form-group"><label for="email">Email</label><input type="email" id="email" name="email" required></div>
    <div class="form-group"><label for="message">Message</label><textarea id="message" name="message" rows="5" required></textarea></div>
    <button type="submit" class="button-primary">Send Message</button>
  </form>
{{ partial "syndication.html" . }}
</section>
{{ end }}
EOF

# 5. FIX: Search Page (_default/search.html)
# Issue: Empty u-url anchor tag.
cat <<'EOF' > "themes/Accessible-MD/layouts/_default/search.html"
{{ define "main" }}
<section class="search-page outlined-card h-entry">
  {{/* Hidden Metadata for Parsers */}}
  <div style="display: none;">
     <div class="p-author h-card">
       <a href="{{ .Site.BaseURL }}" class="u-url p-name">{{ .Site.Params.author.name }}</a>
       <img src="{{ .Site.Params.author.photo | absURL }}" class="u-photo" alt="{{ .Site.Params.author.name }}">
     </div>
     {{/* FIX: Add text content to the anchor */}}
     <a href="{{ .Permalink }}" class="u-url">Permalink</a>
     <time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">{{ .Date }}</time>
     {{ range .Params.tags }}<span class="p-category">{{ . }}</span>{{ end }}
  </div>

  <header class="page-header">
    <div class="headline-row">
      {{ partial "ui/chip.html" . }}
      {{/* Hardcoded P-Name */}}
      <h1 class="p-name">Search</h1>
    </div>
  </header>
  
  <div id="search" role="search"></div>
{{ partial "syndication.html" . }}
</section>

<link href="/pagefind/pagefind-ui.css" rel="stylesheet">
<script src="/pagefind/pagefind-ui.js"></script>
<script>window.addEventListener('DOMContentLoaded', (event) => { new PagefindUI({ element: "#search", showSubResults: true }); });</script>
{{ end }}
EOF

echo "✓ Fixes applied. Please restart Hugo server to verify."
