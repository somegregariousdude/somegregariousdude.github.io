#!/bin/bash

# unified_setup_script.sh
# Description: Master setup script for "Greg's Place" (Hugo Project).
# Recreates the full project structure, configuration, theme, and logic.
# Reference: Project Context & Phase 1-2 Refinements.
#
# USER NOTE:
# - CNAME is placed in PROJECT ROOT.
# - Formspree URL requires manual update in config/_default/params.toml.
# - Profile photo requires manual update in static/images/profile.png.

set -e

echo "🚀 STARTING UNIFIED SETUP FOR GREG'S PLACE..."

# =============================================================================
# SECTION 1: DIRECTORY SCAFFOLDING
# =============================================================================
echo "📂 [1/7] Creating Directory Structure..."

# Config
mkdir -p config/_default

# Content
mkdir -p content/posts
mkdir -p content/notes

# Static
mkdir -p static/images

# Theme Structure (Strict Theme-First Arch)
THEME_ROOT="themes/Accessible-MD"
mkdir -p "$THEME_ROOT/archetypes"
mkdir -p "$THEME_ROOT/assets/scss"
mkdir -p "$THEME_ROOT/assets/js"
mkdir -p "$THEME_ROOT/layouts/_default"
mkdir -p "$THEME_ROOT/layouts/partials"
mkdir -p "$THEME_ROOT/layouts/shortcodes"
mkdir -p "$THEME_ROOT/layouts/guestbook"
mkdir -p "$THEME_ROOT/layouts/contact" # Folder kept for safety, though using _default
mkdir -p "$THEME_ROOT/static/images"
mkdir -p "$THEME_ROOT/static/fonts"

# GitHub Workflows
mkdir -p .github/workflows

# =============================================================================
# SECTION 2: CONFIGURATION
# =============================================================================
echo "⚙️  [2/7] Generating Configuration..."

# config.toml (Core)
cat <<EOF > config/_default/config.toml
baseURL = 'https://simplygregario.us'
title = "Greg's Place"
languageCode = 'en-us'
theme = 'Accessible-MD'

[pagination]
  pagerSize = 10

[outputs]
  home = ["HTML", "RSS", "JSON"]
  section = ["HTML", "RSS"]
EOF

# params.toml (Settings)
cat <<EOF > config/_default/params.toml
[author]
  name = "Gregory Lopez"
  bio = "I'm a gay, blind, middle-aged guy from the Pacific Northwest. As an Apple and Linux fan, I enjoy tinkering with tech and coding. Audiobooks, podcasts, and retro media from the 1970s to the early 2000s are my jam. I also love good food, drinks, and laughter with friends, plus a little cannabis to keep things mellow. Pronouns: he/him."
  photo = "/images/profile.png"
  [author.location]
    city = "Burien"
    state = "Washington"
    country = "USA"

[webmentions]
  enable = true
  guestbookIntro = "Welcome to the Guestbook!"

[contact]
  # ACTION ITEM: Update this with your real Formspree URL
  formAction = "https://formspree.io/f/YOUR_ID_HERE"
  intro = "Have a question or just want to say hi? Send me a message!"

[home]
  showRecent = true
  recentLimit = 5
  recentOrder = "desc"

[[social]]
  name = "Bluesky"
  url = "https://bsky.app/profile/somegregariousdude.bsky.social"
  rel = "noopener noreferrer"
[[social]]
  name = "Facebook"
  url = "https://www.facebook.com/somegregariousdude"
  rel = "noopener noreferrer"
[[social]]
  name = "Friendica"
  url = "https://social.trom.tf/profile/thegregariousdragon"
  rel = "me noopener noreferrer"
[[social]]
  name = "GitHub"
  url = "https://github.com/somegregariousdude"
  rel = "me noopener noreferrer"
[[social]]
  name = "Mastodon"
  url = "https://dragonscave.space/@somegregariousdude"
  rel = "me noopener noreferrer"
[[social]]
  name = "Ramblio"
  url = "https://ramblio.com/user/thegregariousdragon"
  rel = "noopener noreferrer"
[[social]]
  name = "Reddit"
  url = "https://reddit.com/u/somegregariousdude"
  rel = "noopener noreferrer"
[[social]]
  name = "Twitch"
  url = "https://twitch.tv/somegregariousdude"
  rel = "noopener noreferrer"
[[social]]
  name = "YouTube"
  url = "https://youtube.com/@somegregariousdude"
  rel = "noopener noreferrer"

[[im]]
  name = "Discord"
  url = "https://discord.com/users/877529484083998751"
  rel = "noopener noreferrer"
[[im]]
  name = "Matrix"
  url = "https://matrix.to/#/@gregarious:4d2.org"
  rel = "noopener noreferrer"
[[im]]
  name = "Messenger"
  url = "https://m.me/somegregariousdude"
  rel = "noopener noreferrer"
[[im]]
  name = "Signal"
  url = "https://signal.me/#eu/UOIs6b3CzdqYravUXj1jihHuK-QLTKLWYBcjiUz4XGOfuyXGdQdExKbPH3633UxT"
  rel = "noopener noreferrer"
[[im]]
  name = "Simplex"
  url = "https.smp15.simplex.im/a#2XKhZFdQoRskGLNVIpe4rU28lzDmBScikeImDMbPJXc"
  rel = "noopener noreferrer"
[[im]]
  name = "Threema"
  url = "https://threema.id/V424N2C4"
  rel = "noopener noreferrer"
[[im]]
  name = "WhatsApp"
  url = "https://wa.me/+12064882148"
  rel = "noopener noreferrer"
EOF

# menus.toml (Navigation)
cat <<EOF > config/_default/menus.toml
[[main]]
  name = "Home"
  url = "/"
  weight = 10
[[main]]
  name = "Blog"
  url = "/posts/"
  weight = 20
[[main]]
  name = "Notes"
  url = "/notes/"
  weight = 30
[[main]]
  name = "Guestbook"
  url = "/guestbook/"
  weight = 40
[[main]]
  name = "Categories"
  url = "/categories/"
  weight = 50
[[main]]
  name = "Tags"
  url = "/tags/"
  weight = 60
[[main]]
  name = "Search"
  url = "/search/"
  weight = 70
EOF

# markup.toml (Goldmark)
cat <<EOF > config/_default/markup.toml
[goldmark]
  [goldmark.renderer]
    unsafe = false
  [goldmark.extensions]
    typographer = true
[highlight]
  style = "monokai"
  lineNos = false
  noClasses = false
EOF

# =============================================================================
# SECTION 3: THEME ASSETS (SCSS & META)
# =============================================================================
echo "🎨 [3/7] Generating Theme Assets & SCSS..."

# Theme Meta
cat <<EOF > "$THEME_ROOT/theme.toml"
name = "Accessible-MD"
description = "A custom accessible, privacy-focused theme built for Greg's Place."
license = "CC BY-SA 4.0"
min_version = "0.110.0"
EOF

cat <<EOF > "$THEME_ROOT/LICENSE"
Accessible-MD Theme - CC BY-SA 4.0
Copyright (C) $(date +%Y) Gregory Lopez
EOF

# SCSS Variables
cat <<EOF > "$THEME_ROOT/assets/scss/_variables.scss"
:root {
  --font-body: 'Noto Sans', sans-serif;
  --font-heading: 'Noto Serif', serif;
  --spacing-sm: 0.5rem;
  --spacing-md: 1rem;
  --spacing-lg: 2rem;
  --border-radius: 8px;
  --shadow-1: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
  --shadow-2: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
  --color-primary: #6200ee;
  --color-primary-variant: #3700b3;
  --color-secondary: #03dac6;
  --color-background: #ffffff;
  --color-surface: #ffffff;
  --color-error: #b00020;
  --color-on-primary: #ffffff;
  --color-on-secondary: #000000;
  --color-on-background: #000000;
  --color-on-surface: #000000;
}
@media (prefers-color-scheme: dark) {
  :root {
    --color-primary: #bb86fc;
    --color-primary-variant: #3700b3;
    --color-secondary: #03dac6;
    --color-background: #121212;
    --color-surface: #1e1e1e;
    --color-error: #cf6679;
    --color-on-primary: #000000;
    --color-on-secondary: #000000;
    --color-on-background: #ffffff;
    --color-on-surface: #ffffff;
    --shadow-1: 0 1px 3px rgba(255,255,255,0.12), 0 1px 2px rgba(255,255,255,0.24);
  }
}
EOF

# SCSS Partials
cat <<EOF > "$THEME_ROOT/assets/scss/_reset.scss"
*, *::before, *::after { box-sizing: border-box; }
body { margin: 0; padding: 0; line-height: 1.6; -webkit-font-smoothing: antialiased; }
img { max-width: 100%; display: block; }
EOF

cat <<EOF > "$THEME_ROOT/assets/scss/_typography.scss"
body { font-family: var(--font-body); color: var(--color-on-background); background-color: var(--color-background); transition: background-color 0.3s, color 0.3s; }
h1, h2, h3 { font-family: var(--font-heading); margin-bottom: var(--spacing-md); line-height: 1.2; }
a { color: var(--color-primary); text-decoration: none; font-weight: 700; }
a:hover { text-decoration: underline; }
a:focus-visible { outline: 3px solid var(--color-secondary); outline-offset: 2px; }
.skip-link { position: absolute; top: -999px; left: 0; background: var(--color-surface); color: var(--color-primary); padding: var(--spacing-md); z-index: 1000; }
.skip-link:focus { top: 0; }
EOF

cat <<EOF > "$THEME_ROOT/assets/scss/_layout.scss"
.header-container, .footer-container, #main-content, .single-container, .list-container { max-width: 900px; margin: 0 auto; padding: 0 var(--spacing-md); }
header { padding: var(--spacing-lg) 0; border-bottom: 1px solid rgba(0,0,0,0.1); margin-bottom: var(--spacing-lg); }
footer { margin-top: var(--spacing-lg); padding: var(--spacing-lg) 0; border-top: 1px solid rgba(0,0,0,0.1); text-align: center; font-size: 0.9rem; opacity: 0.8; }
EOF

cat <<EOF > "$THEME_ROOT/assets/scss/_components.scss"
.nav-menu { list-style: none; padding: 0; display: flex; gap: var(--spacing-md); flex-wrap: wrap; }
.nav-menu li { margin: 0; }
.nav-menu a[aria-current="page"] { color: var(--color-primary); border-bottom: 2px solid var(--color-primary); }
.h-card, .post-item, .error-container, .search-page-container { background: var(--color-surface); color: var(--color-on-surface); border-radius: var(--border-radius); padding: var(--spacing-lg); margin-bottom: var(--spacing-lg); box-shadow: var(--shadow-1); transition: box-shadow 0.3s ease; }
.h-card:hover, .post-item:hover { box-shadow: var(--shadow-2); }
.profile-card { text-align: center; }
.profile-image img { width: 150px; height: 150px; border-radius: 50%; object-fit: cover; margin-bottom: var(--spacing-md); border: 4px solid var(--color-surface); box-shadow: var(--shadow-1); }
.social-list, .im-list { list-style: none; padding: 0; display: flex; justify-content: center; gap: var(--spacing-md); flex-wrap: wrap; }
.post-list { list-style: none; padding: 0; }
.post-date { display: block; font-size: 0.85rem; color: var(--color-primary-variant); margin-bottom: var(--spacing-sm); }
:root { --pagefind-ui-primary: var(--color-primary); --pagefind-ui-text: var(--color-on-surface); --pagefind-ui-background: var(--color-surface); --pagefind-ui-border: rgba(0,0,0,0.1); }
EOF

cat <<EOF > "$THEME_ROOT/assets/scss/_forms.scss"
.form-group { margin-bottom: var(--spacing-md); display: flex; flex-direction: column; }
label { font-weight: 700; margin-bottom: var(--spacing-sm); color: var(--color-primary-variant); }
input[type="text"], input[type="email"], textarea { width: 100%; padding: 12px; border: 2px solid rgba(0,0,0,0.1); border-radius: 4px; background: var(--color-background); color: var(--color-on-background); font-family: var(--font-body); font-size: 1rem; }
input:focus, textarea:focus { outline: none; border-color: var(--color-primary); box-shadow: 0 0 0 3px rgba(98, 0, 238, 0.1); }
.button { display: inline-block; padding: 12px 24px; border: none; border-radius: 4px; font-family: var(--font-heading); font-weight: 700; cursor: pointer; text-transform: uppercase; letter-spacing: 1px; text-decoration: none; }
.button.primary { background-color: var(--color-primary); color: var(--color-on-primary); }
.button.primary:hover { background-color: var(--color-primary-variant); }
@media (prefers-color-scheme: dark) { input[type="text"], input[type="email"], textarea { border: 2px solid rgba(255,255,255,0.1); background: rgba(255,255,255,0.05); } }
EOF

cat <<EOF > "$THEME_ROOT/assets/scss/_webmentions.scss"
.webmentions-container { margin-top: var(--spacing-lg); padding-top: var(--spacing-lg); border-top: 1px solid rgba(0,0,0,0.1); }
.webmention-explainer { font-size: 0.9rem; opacity: 0.8; margin-bottom: var(--spacing-md); font-style: italic; }
.mention-list { list-style: none; padding: 0; display: flex; flex-direction: column; gap: var(--spacing-md); }
.mention-item { background: var(--color-background); border: 1px solid rgba(0,0,0,0.05); padding: var(--spacing-md); border-radius: var(--border-radius); display: flex; flex-direction: column; gap: var(--spacing-sm); box-shadow: 0 1px 2px rgba(0,0,0,0.1); }
.mention-author { display: flex; align-items: center; gap: var(--spacing-sm); font-weight: 700; font-size: 0.9rem; }
.mention-author img.u-photo { width: 40px; height: 40px; border-radius: 50%; object-fit: cover; }
.mention-meta { font-size: 0.8rem; color: var(--color-primary-variant); text-transform: uppercase; margin-left: 50px; margin-top: -15px; }
.mention-content { margin-left: 50px; font-size: 0.95rem; word-wrap: break-word; }
@media (prefers-color-scheme: dark) { .mention-item { background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.1); } }
EOF

cat <<EOF > "$THEME_ROOT/assets/scss/main.scss"
@import "variables";
@import "reset";
@import "typography";
@import "layout";
@import "components";
@import "forms";
@import "webmentions";
EOF

# =============================================================================
# SECTION 4: JAVASCRIPT LOGIC
# =============================================================================
echo "📜 [4/7] Generating JavaScript..."

# init-search.js
cat <<EOF > "$THEME_ROOT/assets/js/init-search.js"
window.addEventListener('DOMContentLoaded', (event) => {
  const searchDiv = document.getElementById('search');
  if (searchDiv) {
    new PagefindUI({ element: "#search", showSubResults: true, showImages: false, excerptLength: 25 });
  }
});
EOF

# webmentions.js (Corrected routing logic)
cat <<EOF > "$THEME_ROOT/assets/js/webmentions.js"
document.addEventListener('DOMContentLoaded', () => {
  const container = document.getElementById('webmention-list');
  if (!container) return;
  
  let targetUrl = container.getAttribute('data-target');
  if (!targetUrl) {
    targetUrl = window.location.href.replace('localhost:1313', 'simplygregario.us');
  }

  const apiUrl = 'https://webmention.io/api/mentions.jf2?target=' + encodeURIComponent(targetUrl);

  fetch(apiUrl).then(response => response.json()).then(data => {
    const children = data.children || [];
    if (children.length === 0) {
      container.innerHTML = '<p class="no-mentions">No webmentions yet. Be the first!</p>';
      return;
    }
    container.innerHTML = '';
    const list = document.createElement('ul');
    list.className = 'mention-list';
    children.forEach(entry => {
      const li = document.createElement('li');
      li.className = 'mention-item h-cite';
      const authorDiv = document.createElement('div');
      authorDiv.className = 'mention-author u-author h-card';
      if (entry.author && entry.author.photo) {
        const img = document.createElement('img');
        img.src = entry.author.photo;
        img.alt = entry.author.name || 'Unknown';
        img.className = 'u-photo';
        img.loading = 'lazy';
        authorDiv.appendChild(img);
      }
      const authorName = entry.author ? entry.author.name : 'Unknown Author';
      if (entry.author && entry.author.url) {
        const a = document.createElement('a');
        a.href = entry.author.url;
        a.target = '_blank';
        a.rel = 'noopener noreferrer';
        a.className = 'u-url p-name';
        a.textContent = authorName;
        authorDiv.appendChild(a);
      } else {
        const span = document.createElement('span');
        span.className = 'p-name';
        span.textContent = authorName;
        authorDiv.appendChild(span);
      }
      const contentDiv = document.createElement('div');
      contentDiv.className = 'mention-content p-content';
      const safeText = entry.content ? (entry.content.text || entry.content.html || '').replace(/<[^>]*>?/gm, '') : '';
      contentDiv.textContent = safeText.length > 280 ? safeText.substring(0, 280) + '...' : safeText;
      const metaDiv = document.createElement('div');
      metaDiv.className = 'mention-meta';
      metaDiv.textContent = entry['wm-property'] === 'like-of' ? 'liked this' : entry['wm-property'] === 'repost-of' ? 'reposted this' : 'replied';
      li.appendChild(authorDiv);
      li.appendChild(metaDiv);
      li.appendChild(contentDiv);
      list.appendChild(li);
    });
    container.appendChild(list);
  }).catch(err => {
    container.innerHTML = '<p class="error-text">Unable to load mentions.</p>';
  });
});
EOF

# =============================================================================
# SECTION 5: HTML LAYOUTS (TEMPLATES)
# =============================================================================
echo "🏗️  [5/7] Generating HTML Layouts..."

# baseof.html
cat <<EOF > "$THEME_ROOT/layouts/_default/baseof.html"
<!DOCTYPE html>
<html lang="{{ .Site.LanguageCode | default "en-us" }}">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{{ if .IsHome }}{{ .Site.Title }}{{ else }}{{ .Title }} | {{ .Site.Title }}{{ end }}</title>
  {{ with .Description }}<meta name="description" content="{{ . }}">{{ else }}<meta name="description" content="{{ .Summary | default .Site.Params.author.bio }}">{{ end }}
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&family=Noto+Serif:wght@400;700&display=swap" rel="stylesheet">
  <link rel="webmention" href="https://webmention.io/simplygregario.us/webmention" />
  <link rel="pingback" href="https://webmention.io/simplygregario.us/xmlrpc" />
  {{ \$styles := resources.Get "scss/main.scss" | css.Sass | resources.Minify | resources.Fingerprint }}
  <link rel="stylesheet" href="{{ \$styles.Permalink }}">
  {{ template "_internal/opengraph.html" . }}
  {{ template "_internal/twitter_cards.html" . }}
</head>
<body>
  <a class="skip-link" href="#main-content">Skip to main content</a>
  <header role="banner">
    <nav role="navigation" aria-label="Main Navigation">
      {{ partial "header.html" . }}
    </nav>
  </header>
  <main id="main-content" role="main">
    {{ block "main" . }}{{ end }}
  </main>
  <footer role="contentinfo">
    {{ partial "footer.html" . }}
  </footer>
</body>
</html>
EOF

# Header & Footer Partials
cat <<EOF > "$THEME_ROOT/layouts/partials/header.html"
<div class="header-container">
  <div class="site-branding"><a href="{{ .Site.BaseURL }}" rel="home">{{ .Site.Title }}</a></div>
  <ul class="nav-menu">
    {{ range .Site.Menus.main }}
      <li class="nav-item"><a href="{{ .URL }}" {{ if or (eq $.RelPermalink .URL) (and (ne .URL "/") (in $.RelPermalink .URL)) }}aria-current="page"{{ end }}>{{ .Name }}</a></li>
    {{ end }}
  </ul>
</div>
EOF

cat <<EOF > "$THEME_ROOT/layouts/partials/footer.html"
<div class="footer-container">
  <p>&copy; {{ now.Format "2006" }} {{ .Site.Params.author.name }}. Content licensed under <a href="https://creativecommons.org/licenses/by-sa/4.0/" target="_blank" rel="noopener noreferrer">CC BY-SA 4.0</a>.</p>
</div>
EOF

# Homepage (index.html) - H-Card (Revised) + Microformats
cat <<EOF > "$THEME_ROOT/layouts/index.html"
{{ define "main" }}
<section class="homepage-container">
  <div class="h-card profile-card">
    <div class="profile-image"><img class="u-photo" src="{{ .Site.Params.author.photo }}" alt="{{ .Site.Params.author.name }}"></div>
    <h1 class="p-name profile-name"><a class="u-url" href="{{ .Site.BaseURL }}">{{ .Site.Params.author.name }}</a></h1>
    <div class="profile-location">
      <span class="p-locality">{{ .Site.Params.author.location.city }}</span>, 
      <span class="p-region">{{ .Site.Params.author.location.state }}</span>, 
      <span class="p-country-name">{{ .Site.Params.author.location.country }}</span>
    </div>
    <div class="profile-section"><h2>Bio</h2><div class="p-note profile-bio"><p>{{ .Site.Params.author.bio }}</p></div></div>
    <div class="profile-socials">
      <h2>Social Media</h2>
      <ul class="social-list">{{ range .Site.Params.social }}<li><a href="{{ .url }}" rel="{{ .rel }}" class="u-url social-link">{{ .name }}</a></li>{{ end }}</ul>
    </div>
    <div class="profile-im">
      <h2>Messaging Services</h2>
      <ul class="im-list">{{ range .Site.Params.im }}<li><a href="{{ .url }}" rel="{{ .rel }}" class="im-link">{{ .name }}</a></li>{{ end }}</ul>
    </div>
  </div>
  {{ if .Site.Params.home.showRecent }}
  <section class="recent-posts">
    <h2>Recent Updates</h2>
    <ul class="post-list h-feed">
      {{ \$pages := where .Site.RegularPages "Type" "in" (slice "posts" "notes") }}
      {{ if eq .Site.Params.home.recentOrder "asc" }}{{ \$pages = \$pages.ByDate }}{{ else }}{{ \$pages = \$pages.ByDate.Reverse }}{{ end }}
      {{ range first (.Site.Params.home.recentLimit | default 5) \$pages }}
      <li class="post-item">
        <article class="h-entry">
          <span class="post-date"><time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">{{ .Date.Format "Jan 02, 2006" }}</time></span>
          <a class="post-link u-url p-name" href="{{ .RelPermalink }}">{{ .Title | default "Note" }}</a>
        </article>
      </li>
      {{ end }}
    </ul>
    <div class="archive-link"><a href="/posts/">View all posts →</a></div>
  </section>
  {{ end }}
</section>
{{ end }}
EOF

# Single Layout (Default) - With Webmention Explainer + P-Author
cat <<EOF > "$THEME_ROOT/layouts/_default/single.html"
{{ define "main" }}
<div class="single-container">
  <article class="h-entry">
    <header class="post-header">
      {{ if .Title }}<h1 class="p-name post-title">{{ .Title }}</h1>{{ end }}
      <div class="post-meta">
        <a class="u-url" href="{{ .RelPermalink }}"><time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">{{ .Date.Format "January 02, 2006" }}</time></a>
        <span class="reading-time">• {{ .ReadingTime }} min read</span>
      </div>
    </header>
    <div class="e-content post-content">{{ .Content }}</div>
    {{ if .Params.tags }}<footer class="post-footer"><div class="post-tags"><span>Tags:</span><ul>{{ range .Params.tags }}<li><a href="{{ "/tags/" | relLangURL }}{{ . | urlize }}" class="p-category">{{ . }}</a></li>{{ end }}</ul></div></footer>{{ end }}
    <div class="p-author h-card" style="display:none;">
      <a class="u-url p-name" href="{{ .Site.BaseURL }}" rel="author">{{ .Site.Params.author.name }}</a>
      <img class="u-photo" src="{{ .Site.Params.author.photo }}" alt="{{ .Site.Params.author.name }}">
    </div>
  </article>
  {{ if and (ne .Params.disableComments true) (ne .Site.Params.webmentions.enable false) }}
  <section id="webmentions" class="webmentions-container">
    <h2>Webmentions</h2>
    <div class="webmention-explainer">
      <p><strong>Have something to say?</strong> Write a reply on your own site linking to this post, then send a <a href="https://indieweb.org/Webmention" target="_blank">Webmention</a>.</p>
      <label for="target-url" style="font-size: 0.85rem; display: block; margin-bottom: 0.5rem; color: var(--color-primary-variant);">Link to this URL in your post:</label>
      <input type="text" id="target-url" readonly value="{{ .Permalink }}" onclick="this.select();" style="width: 100%; padding: 8px; border: 1px solid rgba(0,0,0,0.1); border-radius: 4px; background: rgba(0,0,0,0.05); font-family: monospace; font-size: 0.9rem; margin-bottom: 1rem;">
    </div>
    <div id="webmention-list" class="webmention-list" data-target="{{ .Permalink }}"><p class="placeholder-text"><em>Loading Webmentions...</em></p></div>
    {{ \$js := resources.Get "js/webmentions.js" | resources.Minify | resources.Fingerprint }}
    <script src="{{ \$js.Permalink }}" defer></script>
  </section>
  {{ end }}
</div>
{{ end }}
EOF

# Guestbook Layout - Explicit Routing to BaseURL
cat <<EOF > "$THEME_ROOT/layouts/guestbook/single.html"
{{ define "main" }}
<div class="single-container">
  <article class="h-entry">
    <header class="post-header">
      <h1 class="p-name post-title">{{ .Title }}</h1>
      <div class="post-meta">
        <time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">{{ .Date.Format "January 02, 2006" }}</time>
        <time class="dt-updated" datetime="{{ .Lastmod.Format "2006-01-02T15:04:05Z07:00" }}" style="display:none;">{{ .Lastmod.Format "January 02, 2006" }}</time>
        <a class="p-category" href="/categories/guestbook/" style="display:none;">Guestbook</a>
      </div>
    </header>
    <div class="e-content post-content">
      <p class="guestbook-intro lead">{{ .Site.Params.webmentions.guestbookIntro | default "Welcome to the Guestbook!" }}</p>
      {{ .Content }}
    </div>
    <div class="p-author h-card" style="display:none;">
      <a class="u-url p-name" href="{{ .Site.BaseURL }}" rel="author">{{ .Site.Params.author.name }}</a>
      <img class="u-photo" src="{{ .Site.Params.author.photo }}" alt="{{ .Site.Params.author.name }}">
    </div>
  </article>
  <section id="webmentions" class="webmentions-container">
    <h2>Sign the Guestbook</h2>
    <div class="webmention-explainer">
      <p><strong>Want to sign the Guestbook?</strong> Write a post on your site linking to the URL below, then send a <a href="https://indieweb.org/Webmention">Webmention</a>.</p>
      <label for="guestbook-url" style="font-size: 0.85rem; display: block; margin-bottom: 0.5rem; color: var(--color-primary-variant);">Link to this URL in your post:</label>
      <input type="text" id="guestbook-url" readonly value="{{ .Site.BaseURL }}" onclick="this.select();" style="width: 100%; padding: 8px; border: 1px solid rgba(0,0,0,0.1); border-radius: 4px; background: rgba(0,0,0,0.05); font-family: monospace; font-size: 0.9rem; margin-bottom: 1rem;">
    </div>
    <div id="webmention-list" class="webmention-list" data-target="{{ .Site.BaseURL }}"><p class="placeholder-text"><em>Loading messages...</em></p></div>
    {{ \$js := resources.Get "js/webmentions.js" | resources.Minify | resources.Fingerprint }}
    <script src="{{ \$js.Permalink }}" defer></script>
  </section>
</div>
{{ end }}
EOF

# Contact Layout (_default/contact.html)
cat <<EOF > "$THEME_ROOT/layouts/_default/contact.html"
{{ define "main" }}
<div class="single-container">
  <article class="h-entry">
    <header class="post-header"><h1 class="p-name post-title">{{ .Title }}</h1></header>
    <div class="e-content post-content">
      <p class="lead">{{ .Site.Params.contact.intro }}</p>
      {{ .Content }}
      <form class="contact-form" action="{{ .Site.Params.contact.formAction }}" method="POST">
        <div class="form-group"><label for="name">Name</label><input type="text" id="name" name="name" required aria-required="true" placeholder="Your Name"></div>
        <div class="form-group"><label for="email">Email</label><input type="email" id="email" name="email" required aria-required="true" placeholder="name@example.com"></div>
        <div class="form-group"><label for="message">Message</label><textarea id="message" name="message" rows="6" required aria-required="true" placeholder="Type your message here..."></textarea></div>
        <input type="text" name="_gotcha" style="display:none">
        <button type="submit" class="button primary">Send Message</button>
      </form>
      {{ if eq .Site.Params.contact.formAction "" }}
      <div class="alert warning" style="margin-top: 2rem; padding: 1rem; background: #fff3cd; color: #856404; border-radius: 4px;"><strong>Configuration Required:</strong> Please set <code>formAction</code> in params.toml.</div>
      {{ end }}
    </div>
  </article>
</div>
{{ end }}
EOF

# List Layout
cat <<EOF > "$THEME_ROOT/layouts/_default/list.html"
{{ define "main" }}
<div class="list-container h-feed">
  <header class="list-header"><h1 class="p-name">{{ .Title }}</h1>{{ with .Content }}<div class="list-description p-summary">{{ . }}</div>{{ end }}</header>
  <ul class="post-list archive-list">
    {{ range .Paginator.Pages }}
    <li class="post-item"><article class="entry-summary h-entry">
      <div class="entry-meta"><time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">{{ .Date.Format "Jan 02, 2006" }}</time></div>
      <h2 class="entry-title"><a class="u-url p-name" href="{{ .RelPermalink }}">{{ if .Title }}{{ .Title }}{{ else }}Note posted on {{ .Date.Format "January 2, 2006" }}{{ end }}</a></h2>
      {{ if .Summary }}<div class="entry-excerpt p-summary"><p>{{ .Summary | truncate 150 }}</p></div>{{ end }}
    </article></li>
    {{ end }}
  </ul>
  {{ if gt .Paginator.TotalPages 1 }}
  <nav class="pagination" role="navigation" aria-label="Pagination">
    {{ if .Paginator.HasPrev }}<a class="page-link prev" href="{{ .Paginator.Prev.URL }}">&larr; Newer Posts</a>{{ else }}<span class="page-link disabled">&larr; Newer Posts</span>{{ end }}
    <span class="page-number">Page {{ .Paginator.PageNumber }} of {{ .Paginator.TotalPages }}</span>
    {{ if .Paginator.HasNext }}<a class="page-link next" href="{{ .Paginator.Next.URL }}">Older Posts &rarr;</a>{{ else }}<span class="page-link disabled">Older Posts &rarr;</span>{{ end }}
  </nav>
  {{ end }}
</div>
{{ end }}
EOF

# Terms Layout
cat <<EOF > "$THEME_ROOT/layouts/_default/terms.html"
{{ define "main" }}
<div class="terms-container">
  <header class="page-header"><h1>{{ .Title }}</h1></header>
  <ul class="terms-list">{{ range .Data.Terms.ByCount }}<li class="term-item"><a href="{{ .Page.RelPermalink }}" class="term-link">{{ .Page.Title }} <span class="term-count">({{ .Count }})</span></a></li>{{ end }}</ul>
</div>
{{ end }}
EOF

# 404 & Search & JSON
cat <<EOF > "$THEME_ROOT/layouts/404.html"
{{ define "main" }}
<div class="error-container"><h1 class="error-title">404: Page Not Found</h1><p class="error-message">Sorry, we couldn't find that page.</p><div class="search-wrapper"><p class="search-explainer">Try searching the archives:</p><div id="search"></div></div><div class="error-nav"><a href="{{ .Site.BaseURL }}" class="button primary">Go Home</a></div><link href="/pagefind/pagefind-ui.css" rel="stylesheet"><script src="/pagefind/pagefind-ui.js"></script>{{ \$js := resources.Get "js/init-search.js" | resources.Minify | resources.Fingerprint }}<script src="{{ \$js.Permalink }}"></script></div>
{{ end }}
EOF

cat <<EOF > "$THEME_ROOT/layouts/_default/search.html"
{{ define "main" }}
<div class="search-page-container"><header class="page-header"><h1>{{ .Title }}</h1><div class="page-description">{{ .Content }}</div></header><div id="search" class="search-ui"></div><link href="/pagefind/pagefind-ui.css" rel="stylesheet"><script src="/pagefind/pagefind-ui.js"></script>{{ \$js := resources.Get "js/init-search.js" | resources.Minify | resources.Fingerprint }}<script src="{{ \$js.Permalink }}"></script></div>
{{ end }}
EOF

cat <<EOF > "$THEME_ROOT/layouts/index.json"
{ "version": "https://jsonfeed.org/version/1.1", "title": "{{ .Site.Title }}", "home_page_url": "{{ .Site.BaseURL }}", "feed_url": "{{ .Permalink }}", "items": [ {{ range \$index, \$element := where .Site.RegularPages "Type" "in" (slice "posts" "notes") }} {{ if \$index }},{{ end }} { "id": "{{ .Permalink }}", "url": "{{ .Permalink }}", "title": "{{ .Title }}", "content_html": {{ .Content | jsonify }}, "date_published": "{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}" } {{ end }} ] }
EOF

# =============================================================================
# SECTION 6: CONTENT FILES
# =============================================================================
echo "📝 [6/7] Generating Content Archetypes & Pages..."

cat <<EOF > "$THEME_ROOT/archetypes/_default.md"
---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
lastmod: {{ .Date }}
draft: true
description: ""
disableComments: false
---
EOF

cat <<EOF > "$THEME_ROOT/archetypes/posts.md"
---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
lastmod: {{ .Date }}
draft: true
summary: ""
categories: []
tags: []
disableComments: false
---
EOF

cat <<EOF > "$THEME_ROOT/archetypes/notes.md"
---
date: {{ .Date }}
draft: true
tags: []
disableComments: false
---
EOF

cat <<EOF > content/guestbook.md
---
title: "Guestbook"
date: $(date +%Y-%m-%dT%H:%M:%S%z)
layout: "guestbook"
disableComments: false
---
EOF

cat <<EOF > content/contact.md
---
title: "Contact"
date: $(date +%Y-%m-%dT%H:%M:%S%z)
layout: "contact"
type: "contact"
disableComments: true
---
EOF

cat <<EOF > content/search.md
---
title: "Search Archives"
layout: "search"
disableComments: true
---
Type your query below to search across all blog posts and notes.
EOF

# =============================================================================
# SECTION 7: ROOT & DEPLOYMENT
# =============================================================================
echo "🛡️  [7/7] Finalizing Root Files & Workflow..."

# Static Assets
cat <<EOF > static/robots.txt
User-agent: *
Allow: /
Sitemap: https://simplygregario.us/sitemap.xml
EOF

cat <<EOF > static/images/icon.svg
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><rect width="512" height="512" rx="15%" fill="#6200ee"/><text x="50%" y="50%" dominant-baseline="middle" text-anchor="middle" fill="white" font-family="sans-serif" font-size="300" font-weight="bold">G</text></svg>
EOF
touch static/favicon.ico
# Placeholder photo (Gray pixel)
echo "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNkYAAAAAYAAjCB0C8AAAAASUVORK5CYII=" | base64 -d > static/images/profile.png

# CNAME (Placed in PROJECT ROOT per User Instruction)
echo "simplygregario.us" > CNAME

# .gitignore
cat <<EOF > .gitignore
public/
resources/
.hugo_build.lock
node_modules/
package-lock.json
.DS_Store
EOF

# GitHub Workflow
cat <<EOF > .github/workflows/hugo.yml
name: Deploy Hugo site to Pages
on:
  push:
    branches: ["main"]
  workflow_dispatch:
permissions:
  contents: read
  pages: write
  id-token: write
concurrency:
  group: "pages"
  cancel-in-progress: false
defaults:
  run:
    shell: bash
jobs:
  build:
    runs-on: ubuntu-latest
    env:
      HUGO_VERSION: 0.139.0
    steps:
      - name: Install Hugo CLI
        run: |
          wget -O \${{ runner.temp }}/hugo.deb https://github.com/gohugoio/hugo/releases/download/v\${HUGO_VERSION}/hugo_extended_\${HUGO_VERSION}_linux-amd64.deb \\
          && sudo dpkg -i \${{ runner.temp }}/hugo.deb
      - name: Install Node.js
        uses: actions/setup-node@v4
        with:
          node-version: 'lts/*'
      - name: Checkout
        uses: actions/checkout@v4
        with:
          submodules: recursive
      - name: Setup Pages
        id: pages
        uses: actions/configure-pages@v5
      - name: Install Dependencies
        run: "[[ -f package-lock.json || -f npm-shrinkwrap.json ]] && npm ci || true"
      - name: Build with Hugo
        env:
          HUGO_ENVIRONMENT: production
          HUGO_ENV: production
        run: hugo --minify --gc
      - name: Index Search (Pagefind)
        run: npx pagefind --site public
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: ./public
  deploy:
    environment:
      name: github-pages
      url: \${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
EOF

echo "✅ UNIFIED SETUP COMPLETE!"
echo "⚠️  REMINDER: Update your Formspree URL in config/_default/params.toml."
echo "⚠️  REMINDER: Replace static/images/profile.png with your real photo."
