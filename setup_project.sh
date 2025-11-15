#!/bin/bash
# ---
# OMNIBUS PROJECT SETUP SCRIPT (v1 - Portable)
#
# This single script reproduces the entire 'Personal Website'
# project in its current state. It is portable and can
# be run from any directory, as long as it lives in the
# project root.
# ---

# --- 0. Make Script Portable ---
# Get the directory this script is running from
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# Change to that directory
cd "$SCRIPT_DIR"

echo "--- 1. Creating All Directories ---"
mkdir -p "content/blog"
mkdir -p "static/js"
mkdir -p "themes/accessible-material-design/layouts/_default"
mkdir -p "themes/accessible-material-design/layouts/partials/icons"
mkdir -p "themes/accessible-material-design/layouts/shortcodes"
mkdir -p "themes/accessible-material-design/assets/scss"
mkdir -p "themes/accessible-material-design/static/css"
mkdir -p "themes/accessible-material-design/static/js"
mkdir -p "themes/accessible-material-design/static/images"
mkdir -p "themes/accessible-material-design/archetypes"
mkdir -p "themes/accessible-material-design/exampleSite"
mkdir -p "themes/accessible-material-design/data"
echo "✅ All directories created."

echo "--- 2. Creating hugo.toml (Final Version) ---"
cat <<'EOT' > "hugo.toml"
# ---
# This is the main configuration file for your PERSONAL site.
# ---
baseURL = "https://simplygregario.us"
languageCode = "en-us"
title = "Gregory's Personal Website"
theme = "accessible-material-design"

# --- All Author info is now under [params.author] ---
[params.author]
  name = "Gregory Lopez" 
  bio = "Gay blind dude in middle age, hailing from the Pacific Northwest. Apple/Linux fan who sometimes tinkers with tech/coding. Audiobooks, podcasts, and retro media from the 1970s to the early 2000s are my jam. Enjoy good food, drink plus laughter with friends, and a little cannabis to keep things mellow. Pronouns: he/him."
  photo = "images/avatar.png" 
  
  [params.author.address]
    locality = "Burien"
    region = "Washington"
    country = "USA"
  
  nicknames = [
    "somegregariousdude",
    "thegregariousdragon"
  ]

# --- Taxonomy Display Parameters ---
[params.taxonomy]
  showCategoriesOnPost = true
  showTagsOnPost = true
  showCategoriesOnList = true
  showTagsOnList = false

# --- Instant Messaging Profiles ---
[[params.impp]]
  name = "Discord"
  url = "https://discord.com/users/877529484083998751"
  icon = "discord"
[[params.impp]]
  name = "Matrix"
  url = "https://matrix.to/#/@gregarious:4d2.org"
  icon = "matrix"
[[params.impp]]
  name = "Messenger"
  url = "https://m.me/somegregariousdude"
  icon = "messenger"
[[params.impp]]
  name = "Signal"
  url = "https://signal.me/#eu/UOIs6b3CzdqYravUXj1jihHuK-QLTKLWYBcjiUz4XGOfuyXGdQdExKbPH3633UxT"
  icon = "signal"
[[params.impp]]
  name = "Simplex Chat"
  url = "https://smp15.simplex.im/a#2XKhZFdQoRskGLNVIpe4rU28lzDmBScikeImDMbPJXc"
  icon = "simplex"
[[params.impp]]
  name = "Telegram"
  url = "https://t.me/somegregariousdude"
  icon = "telegram"
[[params.impp]]
  name = "Threema"
  url = "https://threema.id/V424N2C4"
  icon = "threema"
[[params.impp]]
  name = "WhatsApp"
  url = "https://wa.me/+12064882148"
  icon = "whatsapp"

# --- Social Media Profiles ---
[[params.socials]]
  name = "BlueSky"
  url = "https://bsky.app/profile/somegregariousdude.bsky.social"
  rel = ""
  icon = "bluesky"
[[params.socials]]
  name = "Facebook"
  url = "https://www.facebook.com/somegregariousdude"
  rel = ""
  icon = "facebook"
[[params.socials]]
  name = "Friendica"
  url = "https://social.trom.tf/profile/thegregariousdragon"
  rel = "me"
  icon = "friendica"
[[params.socials]]
  name = "GitHub"
  url = "https://github.com/somegregariousdude"
  rel = "me"
  icon = "github"
[[params.socials]]
  name = "Mastodon"
  url = "https://dragonscave.space/@somegregariousdude"
  rel = "me"
  icon = "mastodon"
[[params.socials]]
  name = "Ramblio"
  url = "https://ramblio.com/user/thegregariousdragon"
  rel = ""
  icon = "ramblio"
[[params.socials]]
  name = "Reddit"
  url = "https://reddit.com/u/somegregariousdude"
  rel = ""
  icon = "reddit"
[[params.socials]]
  name = "Twitch"
  url = "https://twitch.tv/somegregariousdude"
  rel = ""
  icon = "twitch"
[[params.socials]]
  name = "YouTube"
  url = "https://youtube.com/@somegregariousdude"
  rel = ""
  icon = "youtube"

# --- Main Navigation Menu ---
[[menu.main]]
  name = "Home"
  url = "/"
  weight = 10
[[menu.main]]
  name = "Blog"
  url = "/blog/"
  weight = 20
[[menu.main]]
  name = "Categories"
  url = "/categories/"
  weight = 30
[[menu.main]]
  name = "Tags"
  url = "/tags/"
  weight = 40
[[menu.main]]
  name = "Search"
  url = "/search/"
  weight = 50
EOT
echo "✅ hugo.toml created."

echo "--- 3. Creating Content Files ---"
# --- Sample Blog Post ---
cat <<'EOT' > "content/blog/my-first-post.md"
---
title: "My First Post"
date: 2025-11-15T08:30:00-08:00
lastmod: 2025-11-15T08:30:00-08:00
draft: false
summary: "This is a sample post to test the new h-entry templates and make sure everything is working correctly."
categories: ["Tech", "Example"]
tags: ["Hugo", "Testing", "IndieWeb"]
---

## Welcome to the Website

This is the main body of your first blog post. It's written in **Markdown**.

You can use all the standard Markdown features, and they will be converted into semantic HTML by the `e-content` class in your `single.html` template.

### Testing Features

This post includes:
1.  **Taxonomies:** Category and Tag links at the bottom.
2.  **YouTube Embed:** A privacy-first video embed below.

{{< youtube "dQw4w9WgXcQ" "Rick Astley - Never Gonna Give You Up" >}}
EOT

# --- Homepage Content File ---
cat <<'EOT' > "content/_index.md"
---
title: "Home"
---
EOT

# --- Search Page Content File ---
cat <<'EOT' > "content/search.md"
---
title: "Search"
layout: "search" 
_pagefind_index_hidden: true
---
EOT
echo "✅ Content files created."

echo "--- 4. Creating Root Static Files ---"
# --- YouTube JS ---
cat <<'EOT' > "static/js/youtube.js"
/* ---
 * Privacy-First YouTube Embed Script
 * [Ref: Project Context, 14, 15]
--- */

function findAndLoadYouTube() {
  const players = document.querySelectorAll('.lite-youtube');

  for (const player of players) {
    player.addEventListener('click', (event) => {
      event.preventDefault(); 
      
      const videoId = player.dataset.youtubeId;
      if (!videoId) {
        console.error('YouTube video ID not found.');
        return;
      }

      const iframe = document.createElement('iframe');
      iframe.setAttribute('src', `https://www.youtube.com/embed/${videoId}?autoplay=1`);
      iframe.setAttribute('frameborder', '0');
      iframe.setAttribute('allow', 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture');
      iframe.setAttribute('allowfullscreen', 'true');
      iframe.setAttribute('title', 'YouTube Video Player');
      
      player.innerHTML = '';
      player.appendChild(iframe);
      player.classList.add('lite-youtube-loaded');
    }, { once: true });
  }
}

document.addEventListener('DOMContentLoaded', findAndLoadYouTube);
EOT
echo "✅ Root static files created."

echo "--- 5. Creating Theme Files ---"
THEME_NAME="accessible-material-design"
THEME_DIR="themes/$THEME_NAME"

# --- theme.toml ---
cat <<EOT > "$THEME_DIR/theme.toml"
name = "Accessible Material Design"
license = "MIT"
licenselink = "https://github.com/your-username/your-repo/blob/main/LICENSE"
description = "An accessible, IndieWeb-ready Hugo theme with a Material Design aesthetic and 'zero-JS' target."
homepage = "https://github.com/your-username/your-repo"
tags = ["blog", "personal", "accessible", "material", "indieweb", "zero-js", "dark-mode"]
features = ["accessible", "indieweb", "dark-mode", "blog"]
min_version = "0.120.0"

[author]
  name = "Greg"
  homepage = "https://simplygregario.us"
EOT

# --- archetypes/blog.md ---
cat <<'EOT' > "$THEME_DIR/archetypes/blog.md"
---
title: "{{ .Name | humanize }}"
date: {{ .Date }}
draft: true
summary: "A brief summary of this post."
---

Your content starts here.
EOT

# --- layouts/_default/baseof.html (Final) ---
cat <<'EOT' > "$THEME_DIR/layouts/_default/baseof.html"
<!DOCTYPE html>
<html lang="en">
{{ partial "head.html" . }}
<body>
    {{ partial "header.html" . }}
    
    <main role="main" id="main-content">
        {{ block "main" . }}{{ end }}
    </main>
    
    {{ partial "footer.html" . }}

    <script src="/js/youtube.js" defer></script>
</body>
</html>
EOT

# --- layouts/_default/list.html (Final) ---
cat <<'EOT' > "$THEME_DIR/layouts/_default/list.html"
{{ define "main" }}
  <header>
    <h1>{{ .Title }}</h1>
    <div class="e-content">
      {{ .Content }}
    </div>
  </header>

  <section aria-label="Content list">
    {{ $params := .Site.Params.taxonomy }}
    {{ range .Pages }}
      <article class="h-entry" role="article">
        
        <h2 class="p-name">
          <a href="{{ .Permalink }}" class="u-url">{{ .Title }}</a>
        </h2>

        <div class="entry-meta">
          <time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">
            {{ .Date.Format "January 2, 2006" }}
          </time>
          <a class="p-author h-card u-url" href="{{ .Site.BaseURL }}" style="display:none;">
            {{ .Site.Params.author.name }}
          </a>
        </div>
        
        <div class="p-summary">
          {{ .Summary }}
          <p>
            <a href="{{ .Permalink }}" aria-label="Read more about {{ .Title }}">
              Read more...
            </a>
          </p>
        </div>

        {{ if or (and $params.showCategoriesOnList .Params.categories) (and $params.showTagsOnList .Params.tags) }}
        <footer class="taxonomy-footer-list">
          
          {{ if and $params.showCategoriesOnList .Params.categories }}
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

          {{ if and $params.showTagsOnList .Params.tags }}
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
      <hr>
    {{ end }}
  </section>
{{ end }}
EOT

# --- layouts/_default/single.html (Final) ---
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
{{ end }}
EOT

# --- layouts/_default/search.html (Final) ---
cat <<'EOT' > "$THEME_DIR/layouts/_default/search.html"
{{ define "main" }}
  <article class="h-entry card" role="article">
    <header>
      <h1 class="p-name">{{ .Title }}</h1>
    </header>
    
    <div class="e-content">
      <p>Search all content on the site.</p>
      
      <div id="search"></div>

    </div>
  </article>
{{ end }}
EOT

# --- layouts/index.html (Final) ---
cat <<'EOT' > "$THEME_DIR/layouts/index.html"
{{ define "main" }}

<section class="recent-posts" aria-labelledby="recent-posts-heading">
    <h2 id="recent-posts-heading">Recent Posts</h2>
    
    <ul>
        {{ $pages := where .Site.RegularPages "Section" "blog" }}
        {{ range first 10 $pages.ByDate.Reverse }}
            <li>
                <a href="{{ .Permalink }}">{{ .Title }}</a>
                <time datetime="{{ .Date.Format "2006-01-02" }}">
                  ({{ .Date.Format "Jan 2, 2006" }})
                </time>
            </li>
        {{ else }}
            <li><p>No recent posts to show.</p></li>
        {{ end }}
    </ul>
</section>

<hr>

<div class="h-card" lang="en" dir="ltr">
    {{ with .Site.Params.author.photo }}
    <img class="u-photo" src="{{ . | relURL }}" alt="Profile Photo for {{ $.Site.Params.author.name }}" width="400" height="400" />
    {{ end }}

    <a class="u-url" rel="me" href="{{ .Site.BaseURL }}" aria-label="Website">
        <span class="p-name">{{ .Site.Params.author.name }}</span>
    </a>
    <data class="u-uid" value="{{ .Site.BaseURL }}" style="display:none;"></data>

    {{ with .Site.Params.author.address }}
    <div class="p-adr h-adr" aria-label="Location">
        <span class="p-locality">{{ .locality }}</span>,
        <span class="p-region">{{ .region }}</span>,
        <span class="p-country-name">{{ .country }}</span>
    </div>
    {{ end }}

    <section aria-labelledby="about-heading">
        <h2 id="about-heading">About</h2>
        
        {{ with .Site.Params.author.nicknames }}
        <p class="h-card-handles" aria-label="Common Handles">
            <strong aria-hidden="true">Handles:</strong>
            {{ range $i, $e := . }}
              {{ if $i }}, {{ end }}
              <span class="p-nickname">{{ . }}</span>
            {{ end }}
        </p>
        {{ end }}

        {{ with .Site.Params.author.bio }}
        <p class="p-note" aria-label="Biography">
            {{ . | markdownify }}
        </p>
        {{ end }}
    </section>

    {{ with .Site.Params.impp }}
    <section aria-labelledby="messaging-heading">
        <h2 id="messaging-heading">Instant Messaging Profiles</h2>
        <ul aria-label="Instant Messaging Profiles" class="icon-list">
            {{ range . }}
            <li>
                <a class="u-impp" target="_blank" rel="noopener noreferrer" href="{{ .url }}" aria-label="{{ .name }}">
                    {{ if .icon }}
                      {{ partial (printf "icons/%s.html" .icon) . }}
                    {{ end }}
                    <span>{{ .name }}</span>
                </a>
            </li>
            {{ end }}
        </ul>
    </section>
    {{ end }}

    {{ with .Site.Params.socials }}
    <section aria-labelledby="social-heading">
        <h2 id="social-heading">Social Media Profiles</h2>
        <ul aria-label="Social Media Profiles" class="icon-list">
            {{ range . }}
            <li>
                <a class="u-url" target="_blank" rel="{{ .rel }} noopener noreferrer" href="{{ .url }}" aria-label="{{ .name }}">
                    {{ if .icon }}
                      {{ partial (printf "icons/%s.html" .icon) . }}
                    {{ end }}
                    <span>{{ .name }}</span>
                </a>
            </li>
            {{ end }}
        </ul>
    </section>
    {{ end }}

</div>
{{ end }}
EOT

# --- layouts/404.html (Final) ---
cat <<'EOT' > "$THEME_DIR/layouts/404.html"
{{ define "main" }}
  <h1>Page Not Found</h1>
  <p>Sorry, but the page you were trying to view does not exist.</p>
  <p><a href="/">Return to the homepage</a></p>
{{ end }}
EOT

# --- layouts/partials/head.html (Final) ---
cat <<'EOT' > "$THEME_DIR/layouts/partials/head.html"
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ if .IsHome }}{{ .Site.Title }}{{ else }}{{ .Title }} | {{ .Site.Title }}{{ end }}</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet">
    
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
</head>
EOT

# --- layouts/partials/header.html (Final) ---
cat <<'EOT' > "$THEME_DIR/layouts/partials/header.html"
<a href="#main-content" class="skip-link">Skip to Main Content</a>

<header role="banner">
    {{ if .IsHome }}
        <h1>{{ .Site.Title }}</h1>
    {{ else }}
        <p><a href="/">{{ .Site.Title }}</a></p>
    {{ end }}

    <nav role="navigation" aria-label="Main Navigation">
        <ul>
            {{ range .Site.Menus.main }}
                <li>
                    <a href="{{ .URL }}">{{ .Name }}</a>
                </li>
            {{ end }}
        </ul>
    </nav>
</header>
EOT

# --- layouts/partials/footer.html (Final) ---
cat <<'EOT' > "$THEME_DIR/layouts/partials/footer.html"
<footer role="contentinfo">
    <p>&copy; {{ now.Year }} {{ .Site.Params.author.name | default "Your Name" }}. All rights reserved.</p>
</footer>
EOT

# --- layouts/shortcodes/youtube.html (Final) ---
cat <<'EOT' > "$THEME_DIR/layouts/shortcodes/youtube.html"
{{ $videoID := .Get 0 }}
{{ $videoTitle := .Get 1 }}

{{ if not $videoID }}
  {{ errorf "youtube shortcode: Missing Video ID. Usage: {{< youtube \"ID\" \"Title\" >}}" }}
{{ end }}
{{ if not $videoTitle }}
  {{ errorf "youtube shortcode: Missing Video Title. Usage: {{< youtube \"ID\" \"Title\" >}}" }}
{{ end }}

<div class="lite-youtube" data-youtube-id="{{ $videoID }}">
  <img src="https://i.ytimg.com/vi/{{ $videoID }}/hqdefault.jpg"
       alt="Thumbnail for {{ $videoTitle }}"
       class="lite-youtube-thumbnail" />
  <button class="lite-youtube-play" aria-label="Play video: {{ $videoTitle }}">
    <svg width="68" height="48" viewBox="0 0 68 48"
         fill="currentColor" aria-hidden="true" focusable="false">
      <path d="M66.52 7.74c-.78-2.93-2.49-5.41-5.42-6.19C55.79.0 34.00.0 34.00.0S12.21.0 6.90 1.55c-2.93.78-4.64 3.26-5.42 6.19C.0 13.25.0 24.00.0 24.00s.0 10.75 1.48 16.26c.78 2.93 2.49 5.41 5.42 6.19C12.21 48.0 34.00 48.0 34.00 48.0s21.79.0 27.10-1.55c2.93-.78 4.64-3.26 5.42-6.19C68.0 34.75 68.0 24.00 68.0 24.00s.0-10.75-1.48-16.26zM27.0 34.0l18.0-10.0L27.0 14.0v20.0z"></path>
    </svg>
  </button>
</div>
EOT
echo "✅ Theme layouts, partials, and shortcodes created."

echo "--- 6. Creating All Icon Partials ---"
cat <<'EOT' > "$THEME_DIR/layouts/partials/icons/bluesky.html"
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false"><path d="M14.5 19.33c-.74 0-1.47-.09-2.18-.28-1.55-.4-2.92-1.15-4.12-2.22-2.28-2.04-3.66-4.9-3.95-7.98-.11-1.22.14-2.4.72-3.46.51-.93 1.28-1.7 2.22-2.29.98-.6 2.1-.94 3.26-1 1.2-.06 2.4.15 3.5.63.98.42 1.86 1.08 2.59 1.92.71.82 1.25 1.8 1.58 2.87.35 1.12.45 2.29.28 3.44-.2 1.28-.78 2.48-1.68 3.52-1.73 2-4.13 3.28-6.73 3.68-.03 0-.06 0-.09.01-.2 0-.4-.02-.6-.02Z"></path></svg>
EOT
cat <<'EOT' > "$THEME_DIR/layouts/partials/icons/discord.html"
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false"><path d="M21.7,3.2 C20.2,2.1 18.6,1.2 16.9,0.7 C16.8,0.7 16.7,0.7 16.5,0.7 C16.1,0.8 15.7,1.0 15.4,1.3 C15.2,1.6 15.0,2.0 15.0,2.4 C15.0,2.5 15.0,2.5 15.0,2.6 C13.1,2.2 11.2,2.2 9.4,2.6 C9.3,2.5 9.3,2.5 9.3,2.4 C9.3,2.0 9.1,1.6 8.9,1.3 C8.6,1.0 8.2,0.8 7.8,0.7 C7.7,0.7 7.5,0.7 7.4,0.7 C5.7,1.2 4.1,2.1 2.6,3.2 C2.6,3.2 2.5,3.2 2.5,3.2 C1.1,5.6 0.2,8.2 0.0,10.8 C0.0,10.9 0.0,11.0 0.0,11.1 C0.0,11.1 0.1,11.2 0.2,11.2 C1.6,12.0 3.0,12.6 4.4,13.2 C4.5,13.2 4.6,13.2 4.7,13.1 C4.9,12.8 5.1,12.4 5.3,12.0 C5.1,11.9 4.9,11.8 4.7,11.7 C4.7,11.7 4.6,11.7 4.6,11.6 C4.6,11.6 4.6,11.5 4.7,11.4 C7.2,10.0 9.9,10.0 12.5,11.4 C12.6,11.5 12.7,11.6 12.7,11.6 C12.7,11.7 12.6,11.7 12.6,11.7 C12.4,11.8 12.2,11.9 12.0,12.0 C12.2,12.4 12.4,12.8 12.6,13.1 C12.7,13.2 12.8,13.2 12.9,13.2 C14.3,12.6 15.7,12.0 17.1,11.2 C17.2,11.2 17.3,11.1 17.3,11.1 C17.3,11.0 17.3,10.9 17.3,10.8 C17.1,8.2 16.2,5.6 14.8,3.2 C14.8,3.2 14.7,3.2 14.7,3.2 C13.7,2.5 12.6,2.0 11.5,1.7 C11.4,1.7 11.3,1.7 11.2,1.8 C10.9,2.0 10.7,2.2 10.5,2.5 C10.1,3.4 9.7,4.3 9.4,5.2 C9.4,5.3 9.4,5.3 9.4,5.4 C9.4,5.4 9.5,5.4 9.5,5.4 C10.1,5.2 10.6,5.0 11.2,4.8 C11.3,4.8 11.4,4.8 11.5,4.8 C12.8,4.8 14.1,5.1 15.3,5.7 C15.4,5.7 15.5,5.7 15.6,5.6 C15.6,5.6 15.6,5.5 15.6,5.4 C15.3,4.5 14.9,3.6 14.5,2.7 C14.4,2.6 14.4,2.5 14.4,2.4 C14.5,2.3 14.5,2.2 14.6,2.2 C14.7,2.1 14.9,2.0 15.0,2.0 C15.1,2.0 15.2,2.0 15.3,2.0 C15.4,2.1 15.5,2.1 15.6,2.2 C16.2,2.5 16.8,2.8 17.4,3.2 C17.5,3.3 17.5,3.3 17.6,3.3 C17.7,3.3 17.7,3.2 17.7,3.1 C17.4,2.4 17.1,1.7 16.7,1.1 C16.7,1.0 16.7,1.0 16.7,1.0 C16.8,1.0 16.8,1.0 16.9,1.0 C18.3,1.4 19.7,2.1 21.0,3.1 C21.1,3.1 21.1,3.2 21.2,3.2 C21.2,3.3 21.2,3.4 21.1,3.4 C19.8,4.9 18.6,6.3 17.5,7.6 C17.4,7.7 17.3,7.8 17.3,7.9 C17.3,8.0 17.4,8.1 17.5,8.1 C18.4,8.6 19.2,9.1 20.0,9.7 C20.1,9.7 20.2,9.8 20.2,9.8 C20.2,9.9 20.2,10.0 20.1,10.1 C19.2,12.9 17.8,15.5 15.8,17.7 C15.8,17.7 15.7,17.8 15.6,17.8 C15.6,17.8 15.5,17.7 15.5,17.7 C14.8,17.1 14.1,16.5 13.4,15.9 C13.3,15.8 13.2,15.8 13.1,15.8 C13.0,15.8 13.0,15.9 12.9,15.9 C13.2,16.2 13.5,16.5 13.8,16.8 C13.8,16.8 13.8,16.9 13.8,16.9 C13.8,17.0 13.7,17.0 13.7,17.0 C13.0,17.5 12.3,17.9 11.5,18.3 C11.4,18.3 11.3,18.3 11.2,18.2 C11.0,18.0 10.7,17.8 10.5,17.5 C10.1,16.6 9.7,15.7 9.4,14.8 C9.4,14.7 9.4,14.7 9.4,14.6 C9.4,14.6 9.5,14.6 9.5,14.6 C10.1,14.8 10.6,15.0 11.2,15.2 C11.3,15.2 11.4,15.2 11.5,15.2 C12.8,15.2 14.1,14.9 15.3,14.3 C15.4,14.3 15.5,14.3 15.6,14.4 C15.6,14.4 15.6,14.5 15.6,14.6 C15.3,15.5 14.9,16.4 14.5,17.3 C14.4,17.4 14.4,17.5 14.4,17.6 C14.5,17.7 14.5,17.8 14.6,17.8 C14.7,17.9 14.9,18.0 15.0,18.0 C15.1,18.0 15.2,18.0 15.3,18.0 C15.4,17.9 15.5,17.9 15.6,17.8 C16.2,17.5 16.8,17.2 17.4,16.8 C17.5,16.7 17.5,16.7 17.6,16.7 C17.7,16.7 17.7,16.8 17.7,16.9 C17.4,17.6 17.1,18.3 16.7,18.9 C16.7,19.0 16.7,19.0 16.7,19.0 C16.8,19.0 16.8,19.0 16.9,19.0 C18.3,18.6 19.7,17.9 21.0,16.9 C21.1,16.9 21.1,16.8 21.2,16.8 C21.2,16.7 21.2,16.6 21.1,16.6 C19.8,15.1 18.6,13.7 17.5,12.4 C17.4,12.3 17.3,12.2 17.3,12.1 C17.3,12.0 17.4,11.9 17.5,11.9 C18.4,11.4 19.2,10.9 20.0,10.3 C20.1,10.3 20.2,10.2 20.2,10.2 C20.2,10.1 20.2,10.0 20.1,9.9 C21.0,7.1 21.6,4.2 21.7,3.4 C21.7,3.3 21.7,3.3 21.7,3.2 Z"/></svg>
EOT
cat <<'EOT' > "$THEME_DIR/layouts/partials/icons/facebook.html"
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false"><path d="M22 12c0-5.52-4.48-10-10-10S2 6.48 2 12c0 4.84 3.44 8.87 8 9.8V15H8v-3h2V9.5C10 7.57 11.57 6 13.5 6H16v3h-2c-.55 0-1 .45-1 1v2h3v3h-3v6.95c5.05-.5 9-4.76 9-9.85Z"></path></svg>
EOT
cat <<'EOT' > "$THEME_DIR/layouts/partials/icons/friendica.html"
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false"><path d="M20 22h-4v-7h-2v7h-4V10a2 2 0 012-2h6a2 2 0 012 2v12zM6 14a3 3 0 100-6 3 3 0 000 6zM20 7a3 3 0 100-6 3 3 0 000 6zM6 7a3 3 0 100-6 3 3 0 000 6zM20 14a3 3 0 100-6 3 3 0 000 6z"></path></svg>
EOT
cat <<'EOT' > "$THEME_DIR/layouts/partials/icons/github.html"
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false"><path d="M12 2A10 10 0 0 0 2 12c0 4.42 2.87 8.17 6.84 9.5.5.09.68-.22.68-.48 0-.24-.01-1.02-.01-1.88-2.78.6-3.37-1.34-3.37-1.34-.46-1.16-1.11-1.47-1.11-1.47-.91-.62.07-.6.07-.6 1 .07 1.53 1.03 1.53 1.03.89 1.53 2.34 1.09 2.91.83.09-.65.35-1.09.64-1.34-2.22-.25-4.56-1.11-4.56-4.94 0-1.09.39-1.98 1.03-2.68-.1-.25-.45-1.27.1-2.64 0 0 .84-.27 2.75 1.02.8-.22 1.65-.33 2.5-.33s1.7.11 2.5.33c1.91-1.29 2.75-1.02 2.75-1.02.55 1.37.2 2.39.1 2.64.64.7 1.03 1.59 1.03 2.68 0 3.84-2.34 4.68-4.57 4.94.36.31.68.92.68 1.85 0 1.34-.01 2.42-.01 2.74 0 .27.18.58.69.48A10 10 0 0 0 22 12C22 6.48 17.52 2 12 2Z"></path></svg>
EOT
cat <<'EOT' > "$THEME_DIR/layouts/partials/icons/mastodon.html"
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false"><path d="M23.19 5.4c0-1.3-1.0-2.3-2.3-2.3h-3.3c-1.1 0-2.2.6-2.8 1.5-1.2 1.8-2.6 2.3-4.1 2.5v3.4c2.1.2 3.8 1.2 4.1 2.5.3 1.3-.2 2.6-1.2 3.4-.8.6-1.9.9-3 .9-1.3 0-2.5-.5-3.5-1.3-.7-.6-1.3-1.3-1.7-2.1-.4-.8-.6-1.7-.6-2.6V8.6c0-2.2-1.8-4-4-4H1.1C.5 4.6 0 5.1 0 5.8v.5c0 .7.5 1.2 1.1 1.2h3.1c.4 0 .8.3.8.8v8.6c0 3.2 1.4 6.2 3.9 8.2 2.6 2 6 2.5 9.1 1.2 3.5-1.5 5.8-4.8 5.8-8.6 0-1.8-.6-3.5-1.6-4.9-1.1-1.4-2.6-2.3-4.2-2.8V9.1c1.8-.2 3.4-1.2 4.3-2.6.7-1 1.1-2.2 1.1-3.4v-.7Z"></path></svg>
EOT
cat <<'EOT' > "$THEME_DIR/layouts/partials/icons/matrix.html"
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2ZM7 15.5v-7h1.5v7H7Zm4.5 0v-7H13v7h-1.5Zm4.5 0v-7H17v7h-1.5Z"></path></svg>
EOT
cat <<'EOT' > "$THEME_DIR/layouts/partials/icons/messenger.html"
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2Zm3.6 13.06L14 13.5V11c0-1.1-.9-2-2-2s-2 .9-2 2v.5l-1.6 1.56c-.39.39-.39 1.02 0 1.41l.7.7c.39.39 1.02.39 1.41 0L12 15.18l1.5 1.5c.39.39 1.02.39 1.41 0l.7-.7c.39-.39.39-1.02 0-1.42Z"></path></svg>
EOT
cat <<'EOT' > "$THEME_DIR/layouts/partials/icons/ramblio.html"
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false"><path d="M16 7H5a2 2 0 00-2 2v6a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-3zm3 8H5V9h14v6zM7 13h2v-2H7v2z"></path></svg>
EOT
cat <<'EOT' > "$THEME_DIR/layouts/partials/icons/reddit.html"
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2Zm0 16c-2.21 0-4-1.79-4-4 0-1.1.45-2.1 1.17-2.83L8 13.5v-1.3c0-.28.22-.5.5-.5h7c.28 0 .5.22.5.5v1.3l-1.17 1.67C15.55 15.9 16 16.9 16 18c0 2.21-1.79 4-4 4Zm-2.5-5.5c-.83 0-1.5-.67-1.5-1.5S8.67 9.5 9.5 9.5s1.5.67 1.5 1.5-.67 1.5-1.5 1.5Zm5 0c-.83 0-1.5-.67-1.5-1.5S13.67 9.5 14.5 9.5s1.5.67 1.5 1.5-.67 1.5-1.5 1.5Z"></path></svg>
EOT
cat <<'EOT' > "$THEME_DIR/layouts/partials/icons/signal.html"
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false"><path d="M19.1 1.9C17.8.6 16.1 0 14.4 0c-1.8 0-3.5.7-4.8 1.9C8.3 3.2 7.6 4.9 7.6 6.7c0 1.6.6 3.1 1.6 4.3 1 1.2 2.5 1.9 4.1 1.9 1.8 0 3.5-.7 4.8-1.9C19.4 9.8 20 8.1 20 6.4c.1-1.7-.6-3.4-1.9-4.5Zm-4.8 9.5c-1.3 0-2.5-.5-3.4-1.4-.9-.9-1.4-2.1-1.4-3.4 0-1.3.5-2.5 1.4-3.4.9-.9 2.1-1.4 3.4-1.4 1.3 0 2.5.5 3.4 1.4.9.9 1.4 2.1 1.4 3.4 0 1.3-.5 2.5-1.4 3.4-.9.9-2.1 1.4-3.4 1.4Z"></path><path d="M11.6 14.1c-1.7-.3-3.3-.8-4.9-1.5-3.3-1.6-5.4-4.8-5.4-8.4V0H0v4.1c0 4.6 2.7 8.6 6.6 10.4 1.8.8 3.7 1.4 5.7 1.7 3.5.5 7.1.5 10.6 0 2-.3 3.9-.9 5.7-1.7C22.8 12.7 24 10.5 24 8.2v-4h-1.3v4c0 1.9-.9 3.6-2.5 4.6-1.5.9-3.2 1.5-5 1.8-2.6.4-5.3.4-7.9 0-1.4-.2-2.8-.5-4.1-.9 2.1 1.2 4.4 1.8 6.9 1.8h.4c1.1 0 2.2-.1 3.3-.4 1.5-.3 3-.8 4.3-1.5 1.5-.8 2.6-2.1 2.6-3.6V.1h-1.3v4.1c0 .9-.5 1.7-1.3 2.1-.8.4-1.7.6-2.6.6-.5 0-1-.1-1.5-.1-1.7-.3-3.3-.8-4.9-1.5-1.1-.5-2.2-1.1-3.2-1.8 1.4.6 2.9 1 4.4 1.2 2.6.4 5.3.4 7.9 0 1-.2 2-.5 2.9-.8-.2 1-1.2 1.8-2.3 2.3-1.3.6-2.7 1-4.1 1.2-1.9.3-3.8.3-5.7 0Z"></path></svg>
EOT
cat <<'EOT' > "$THEME_DIR/layouts/partials/icons/simplex.html"
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2ZM12.7 17.5h-2v-2h2v2Zm0-3.5h-2c0-1.5-1.1-2.7-2.5-3v-1.5c2.3.2 4 2.2 4 4.5v-1.5Zm-5 0H5.5v-5h3.4c1.3 0 2.4 1.1 2.4 2.4s-1.1 2.6-2.4 2.6H7.7v-1.5Zm0-2.6h.8c.4 0 .8-.3.8-.8s-.3-.8-.8-.8H7.7v1.6Z"></path></svg>
EOT
cat <<'EOT' > "$THEME_DIR/layouts/partials/icons/telegram.html"
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false"><path d="M22 12c0-5.52-4.48-10-10-10S2 6.48 2 12s4.48 10 10 10 10-4.48 10-10ZM9.5 16.5l8-3.5-6.5-4L18 8.5 9.5 16.5Z"></path></svg>
EOT
cat <<'EOT' > "$THEME_DIR/layouts/partials/icons/threema.html"
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2Zm-4 12c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2Zm4 0c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2Zm4 0c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2Z"></path></svg>
EOT
cat <<'EOT' > "$THEME_DIR/layouts/partials/icons/twitch.html"
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false"><path d="M2.1 0 0 2.1v17.5H4.2v4.2h4.2l4.2-4.2H17l6.3-6.3V0H2.1Zm17.5 13.3-3.5 3.5h-4.2l-3.5 3.5v-3.5H4.2V2.1h15.4v11.2ZM15.4 6.3v4.2H14V6.3h1.4Zm-4.2 0v4.2H9.8V6.3h1.4Z"></path></svg>
EOT
cat <<'EOT' > "$THEME_DIR/layouts/partials/icons/whatsapp.html"
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false"><path d="M12.04 2C6.58 2 2.13 6.45 2.13 11.91c0 1.79.47 3.51 1.34 5.04l-1.35 4.92 5.04-1.34c1.47.79 3.12 1.22 4.88 1.22h.01c5.46 0 9.91-4.45 9.91-9.91S17.5 2 12.04 2Zm0 18.06c-1.57 0-3.09-.39-4.46-1.1l-.32-.19-3.3  .87.88-3.22-.21-.33c-.8-1.4-1.22-3-1.22-4.67 0-4.49 3.65-8.13 8.14-8.13 4.49 0 8.13 3.65 8.13 8.13s-3.64 8.13-8.13 8.13Zm4.44-5.2c-.24-.12-1.44-.71-1.67-.79-.22-.08-.38-.12-.54.12-.16.24-.63.79-.78.95-.14.16-.29.18-.54.06s-1.05-.39-2-1.23c-.74-.66-1.23-1.47-1.38-1.72-.14-.24-.02-.38.11-.5.11-.11.24-.29.37-.43.12-.14.16-.24.24-.4s.04-.38-.02-.5c-.06-.12-.54-1.3-.74-1.78-.2-.48-.4-.42-.54-.42h-.5c-.16 0-.42.06-.63.3.21.24-.42.66-.42 1.6 0 .94.43 1.85.5 1.97.06.12.87 1.4 2.1 1.98.29.13.52.21.7.29.35.15.67.13.91.08.28-.06.87-.35 1-.71.12-.35.12-.66.08-.71-.04-.06-.16-.1-.32-.18Z"></path></svg>
EOT
cat <<'EOT' > "$THEME_DIR/layouts/partials/icons/youtube.html"
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false"><path d="M21.58 7.19c-.23-.86-.9-1.52-1.76-1.76C18.25 5 12 5 12 5s-6.25 0-7.82.43c-.86.23-1.52.9-1.76 1.76C2 8.75 2 12 2 12s0 3.25.43 4.81c.23.86.9 1.52 1.76 1.76C5.75 19 12 19 12 19s6.25 0 7.82-.43c.86-.23 1.52-.9 1.76-1.76C22 15.25 22 12 22 12s0-3.25-.43-4.81ZM9.75 15.5V8.5l6 3.5-6 3.5Z"></path></svg>
EOT
echo "✅ All 17 icon partials created."

echo "--- 7. Creating Final Combined main.scss ---"
# This is the final, combined stylesheet
cat <<'EOT' > "$THEME_DIR/assets/scss/main.scss"
/* ---
 * ACCESSIBLE MATERIAL DESIGN STYLESHEET (FINAL)
--- */

/* --- 1. Material Color Palette (Deep Indigo) --- */
:root {
    --font-sans: "Noto Sans", sans-serif;
    --color-primary: #303F9F;
    --color-background: #F5F5F5;
    --color-surface: #FFFFFF;
    --color-on-background: #212121;
    --color-on-surface: #212121;
    --color-border: #E0E0E0;
    --shadow-elevation-1: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
    --shadow-elevation-2: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
}

@media (prefers-color-scheme: dark) {
    :root {
        --color-primary: #7986CB;
        --color-background: #121212;
        --color-surface: #1E1E1E;
        --color-on-background: #E0E0E0;
        --color-on-surface: #E0E0E0;
        --color-border: #2C2C2C;
        --shadow-elevation-1: 0 1px 3px rgba(0,0,0,0.4), 0 1px 2px rgba(0,0,0,0.5);
        --shadow-elevation-2: 0 3px 6px rgba(0,0,0,0.5), 0 3px 6px rgba(0,0,0,0.6);
    }
}

/* --- 2. Base & Typography --- */
body {
    font-family: var(--font-sans);
    background-color: var(--color-background);
    color: var(--color-on-background);
    line-height: 1.6;
    margin: 0;
    padding: 0;
}
main {
    max-width: 800px;
    margin: 1em auto;
    padding: 1em;
}
h1, h2, h3, h4, h5, h6 {
    font-weight: 700;
}
a {
    color: var(--color-primary);
    text-decoration: none;
}
a:hover, a:focus {
    text-decoration: underline;
}
a:focus {
    outline: 2px solid var(--color-primary);
    outline-offset: 2px;
}
hr {
  border: none;
  border-top: 1px solid var(--color-border);
  margin: 2em 0;
}

/* --- 3. Material "Card" Component --- */
.card {
    background-color: var(--color-surface);
    color: var(--color-on-surface);
    border: 1px solid var(--color-border);
    border-radius: 8px;
    padding: 1.5em;
    margin-bottom: 2em;
    box-shadow: var(--shadow-elevation-1);
    transition: box-shadow 0.2s ease-in-out;
}
.card:hover,
.card:focus-within {
    box-shadow: var(--shadow-elevation-2);
}

/* --- 4. Component-Specific Styles --- */
[role="banner"],
[role="contentinfo"] {
    max-width: 800px;
    margin: 0 auto;
    padding: 1em;
}
.h-card,
.recent-posts {
    @extend .card;
}
.h-entry[role="article"] {
    @extend .card;
}
.u-photo {
  max-width: 150px;
  border-radius: 50%;
  border: 4px solid var(--color-surface);
  box-shadow: var(--shadow-elevation-1);
}

/* --- 5. Navigation & Skip Link --- */
.skip-link {
    position: absolute;
    top: -1000px;
    left: -1000px;
    height: 1px;
    width: 1px;
    overflow: hidden;
}
.skip-link:focus {
    position: fixed;
    top: 10px;
    left: 10px;
    background-color: var(--color-surface);
    color: var(--color-on-surface);
    border: 2px solid var(--color-primary);
    padding: 1em;
    z-index: 9999;
    height: auto;
    width: auto;
    overflow: visible;
    box-shadow: var(--shadow-elevation-2);
}
nav[role="navigation"] ul {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    flex-wrap: wrap;
    gap: 1em;
}

/* --- 6. Recent Posts List --- */
.recent-posts ul {
    list-style: none;
    padding-left: 0;
}
.recent-posts li {
    margin-bottom: 0.5em;
}
.recent-posts time {
    color: var(--color-on-surface);
    opacity: 0.7;
    margin-left: 0.5em;
    font-size: 0.9em;
}

/* --- 7. Icon List Styles --- */
.icon-list {
    list-style: none;
    padding-left: 0;
}
.icon-list a {
    display: inline-flex;
    align-items: center;
    gap: 0.75em;
    padding: 0.25em;
    border-radius: 4px;
}
.icon-list svg {
    width: 1.25em;
    height: 1.25em;
    flex-shrink: 0;
    fill: var(--color-primary);
}
.icon-list a:hover svg,
.icon-list a:focus svg {
    fill: var(--color-primary);
}

/* --- 8. YouTube Shortcode Styles --- */
.lite-youtube {
    position: relative;
    display: block;
    max-width: 100%;
    background-color: #000;
    border-radius: 8px;
    overflow: hidden;
    cursor: pointer;
    box-shadow: var(--shadow-elevation-1);
    padding-top: 56.25%;
}
.lite-youtube-thumbnail {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    opacity: 0.8;
    transition: opacity 0.2s ease;
}
.lite-youtube:hover .lite-youtube-thumbnail {
    opacity: 1;
}
.lite-youtube-play {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 68px;
    height: 48px;
    padding: 0;
    border: none;
    background: none;
    color: #FFF;
    opacity: 0.8;
    transition: opacity 0.2s ease;
    cursor: pointer;
}
.lite-youtube:hover .lite-youtube-play {
    opacity: 1;
}
.lite-youtube-play:focus {
    outline: 2px solid var(--color-primary);
    outline-offset: 4px;
    opacity: 1;
}
.lite-youtube-play svg {
    fill: #FFF;
    filter: drop-shadow(0 0 8px rgba(0,0,0,0.5));
}
.lite-youtube-loaded {
    padding-top: 0;
}
.lite-youtube iframe {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}

/* --- 9. Taxonomy Styles (Categories & Tags) --- */
.taxonomy-footer, .taxonomy-footer-list {
    margin-top: 2em;
    padding-top: 1em;
    border-top: 1px solid var(--color-border);
    font-size: 0.9em;
}
.taxonomy-list {
    margin-bottom: 0.5em;
}
.taxonomy-list ul {
    list-style: none;
    padding: 0;
    margin: 0;
    display: inline;
}
.taxonomy-list li {
    display: inline-block;
    margin-right: 0.5em;
    margin-top: 0.5em;
}
.taxonomy-list a.p-category {
    display: inline-block;
    padding: 0.25em 0.75em;
    border-radius: 16px;
    background-color: var(--color-background);
    color: var(--color-primary);
    border: 1px solid var(--color-border);
    text-decoration: none;
    transition: background-color 0.2s ease;
}
.taxonomy-list a.p-category:hover,
.taxonomy-list a.p-category:focus {
    background-color: var(--color-primary);
    color: var(--color-surface);
    text-decoration: none;
}

/* --- 10. Pagefind Search Styles --- */
:root {
  --pagefind-ui-primary: var(--color-primary);
  --pagefind-ui-text: var(--color-on-surface);
  --pagefind-ui-background: var(--color-surface);
  --pagefind-ui-border: var(--color-border);
  --pagefind-ui-tag: var(--color-background);
  --pagefind-ui-font: var(--font-sans);
  --pagefind-ui-border-radius: 8px;
  --pagefind-ui-modal-box-shadow: var(--shadow-elevation-2);
}
.pagefind-ui__search-input {
    border-radius: 8px !important;
    border: 2px solid var(--color-border) !important;
    background-color: var(--color-background) !important;
    color: var(--color-on-surface) !important;
}
.pagefind-ui__search-input:focus {
    border-color: var(--color-primary) !Fimportant;
    box-shadow: none !important;
}
.pagefind-ui__result-link:hover,
.pagefind-ui__result-link:focus {
    background-color: var(--color-background) !important;
}
EOT
echo "✅ Final main.scss created."

echo "--- 8. Creating Placeholder Files ---"
touch "$THEME_DIR/static/js/.gitkeep"
touch "$THEME_DIR/static/css/.gitkeep"
touch "$THEME_DIR/LICENSE"
touch "$THEME_DIR/README.md"
echo "✅ Placeholders created."

echo "---"
echo "✅✅✅ OMNIBUS PROJECT SCRIPT COMPLETE ✅✅✅"
echo "The entire site structure and theme are now in place."
