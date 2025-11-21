#!/bin/bash

# setup_profile_photo_processing.sh
# Description: Configures Hugo to crop/convert the profile photo via Assets.
# Compliance:
# - User placed file: assets/images/profile_photo.jpg
# - Target: 500x500 Center Crop, WebP format.

set -e

echo "📸 Configuring Profile Photo Processing..."

CONFIG_FILE="config/_default/params.toml"
LAYOUT_FILE="themes/Accessible-MD/layouts/index.html"

# 1. Update params.toml to point to the Asset file
# We use sed to replace the old photo line with the new filename.
echo "-> Updating author photo path in config..."
if grep -q "photo =" "$CONFIG_FILE"; then
    sed -i 's|photo = .*|photo = "images/profile_photo.jpg"|' "$CONFIG_FILE"
else
    echo "⚠️  Warning: 'photo =' not found in params.toml. Please check manually."
fi

# 2. Update the H-Card Layout to use Hugo Pipes
echo "-> Injecting Image Processing Logic into Homepage..."

# We are rewriting index.html to include the image processing block.
# This maintains the specific H-Card structure (Bio/Socials) we established.
cat <<EOF > "$LAYOUT_FILE"
{{ define "main" }}
<section class="homepage-container">
  
  <div class="h-card profile-card">
    <div class="profile-image">
      {{ \$img := resources.Get .Site.Params.author.photo }}
      {{ if \$img }}
        {{/* Crop to 500x500 Center and convert to WebP */}}
        {{ \$processed := \$img.Fill "500x500 Center webp" }}
        <img class="u-photo" src="{{ \$processed.RelPermalink }}" width="{{ \$processed.Width }}" height="{{ \$processed.Height }}" alt="{{ .Site.Params.author.name }}">
      {{ else }}
        {{/* Fallback if file is missing or not found in assets */}}
        <img class="u-photo" src="{{ .Site.Params.author.photo | relURL }}" alt="{{ .Site.Params.author.name }} (Unprocessed)">
      {{ end }}
    </div>

    <h1 class="p-name profile-name">
      <a class="u-url" href="{{ .Site.BaseURL }}">{{ .Site.Params.author.name }}</a>
    </h1>

    <div class="profile-location">
      <span class="p-locality">{{ .Site.Params.author.location.city }}</span>, 
      <span class="p-region">{{ .Site.Params.author.location.state }}</span>, 
      <span class="p-country-name">{{ .Site.Params.author.location.country }}</span>
    </div>

    <div class="profile-section">
      <h2>Bio</h2>
      <div class="p-note profile-bio">
        <p>{{ .Site.Params.author.bio }}</p>
      </div>
    </div>

    <div class="profile-socials">
      <h2>Social Media</h2>
      <ul class="social-list">
        {{ range .Site.Params.social }}
        <li>
          <a href="{{ .url }}" rel="{{ .rel }}" class="u-url brand-chip" aria-label="{{ .name }}: {{ .handle }}">
            {{ \$icon := printf "icons/brands/%s.svg" .name }}
            {{ if templates.Exists (printf "partials/%s" \$icon) }}
              <span class="brand-icon">{{ partial \$icon . }}</span>
            {{ end }}
            <span class="brand-text">{{ .handle }}</span>
          </a>
        </li>
        {{ end }}
      </ul>
    </div>

    <div class="profile-im">
      <h2>Messaging Services</h2>
      <ul class="im-list">
        {{ range .Site.Params.im }}
        <li>
          <a href="{{ .url }}" rel="{{ .rel }}" class="brand-chip" aria-label="{{ .name }}: {{ .handle }}">
            {{ \$icon := printf "icons/brands/%s.svg" .name }}
            {{ if templates.Exists (printf "partials/%s" \$icon) }}
              <span class="brand-icon">{{ partial \$icon . }}</span>
            {{ end }}
            <span class="brand-text">{{ .handle }}</span>
          </a>
        </li>
        {{ end }}
      </ul>
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
          <div class="post-meta" style="margin-bottom: 0.5rem; font-size: 0.8rem;">
            <span class="post-date" style="display: inline-block; margin-right: 0.5rem;">
              <time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">{{ .Date.Format "Jan 02, 2006" }}</time>
            </span>
            {{ if .Params.categories }}
              {{ range .Params.categories }}
              {{ \$icon := printf "icons/%s.svg" . }}
              {{ \$hasIcon := templates.Exists (printf "partials/%s" \$icon) }}
              <a href="{{ "/categories/" | relLangURL }}{{ . | urlize }}" class="p-category category-chip" style="font-size: 0.7rem; padding: 1px 6px;">
                {{ if \$hasIcon }}<span class="chip-icon" style="width: 12px; height: 12px; display: inline-block; vertical-align: -2px;">{{ partial \$icon . }}</span>{{ end }}
                <span class="chip-text">{{ . }}</span>
              </a>
              {{ end }}
            {{ end }}
          </div>
          <h3 class="entry-title" style="margin-bottom: 0.5rem; font-size: 1.2rem;">
            <a class="post-link u-url p-name" href="{{ .RelPermalink }}">{{ .Title | default "Status Update" }}</a>
          </h3>
          {{ if $.Site.Params.home.showRecentSummary }}<div class="entry-summary p-summary" style="font-size: 0.9rem; opacity: 0.9;"><p>{{ .Summary | truncate 200 }}</p></div>{{ end }}
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

echo "✅ Profile Photo pipeline configured (500x500 Center WebP)."
