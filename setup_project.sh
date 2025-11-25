#!/bin/bash
# ==============================================================================
# SCRIPT: setup_project.sh (MASTER SNAPSHOT)
# PURPOSE: Full Reproduction of "Greg's Place" Website Environment
# CONTEXT: Consolidates all logic from setup_phase_01a through 03b.
#          Represents the "Final State" of the codebase as of Phase 3.
#          UPDATED: Includes final README.md and project_context.txt.
# AUTHOR: Lead Web Designer (Gemini) for Greg's Place
# ==============================================================================

echo "Initializing Greg's Place..."

# ==============================================================================
# 1. DIRECTORY STRUCTURE
# ==============================================================================
echo "Creating directory structure..."

# Root Config
mkdir -p config/_default

# Theme Structure
THEME_ROOT="themes/Accessible-MD"
mkdir -p "$THEME_ROOT/archetypes"
mkdir -p "$THEME_ROOT/assets/scss"
mkdir -p "$THEME_ROOT/assets/js"
mkdir -p "$THEME_ROOT/assets/images"
mkdir -p "$THEME_ROOT/layouts/_default/_markup"
mkdir -p "$THEME_ROOT/layouts/partials/ui"
mkdir -p "$THEME_ROOT/layouts/partials/icons"
mkdir -p "$THEME_ROOT/layouts/pages"
mkdir -p "$THEME_ROOT/layouts/shortcodes"
mkdir -p "$THEME_ROOT/static"

# Content Sections
mkdir -p content/articles
mkdir -p content/status
mkdir -p content/replies
mkdir -p content/reposts
mkdir -p content/likes
mkdir -p content/bookmarks
mkdir -p content/rsvps
mkdir -p content/pages/about
mkdir -p content/pages/contact
mkdir -p content/pages/guestbook
mkdir -p content/pages/search

# GitHub Workflow
mkdir -p .github/workflows

# ==============================================================================
# 2. CONFIGURATION (Split Config Strategy)
# ==============================================================================
echo "Generating Configuration..."

# hugo.toml (Main)
cat <<EOT > "config/_default/hugo.toml"
baseURL = "https://simplygregario.us"
title = "Greg's Place"
theme = "Accessible-MD"
languageCode = "en-us"

[pagination]
  pagerSize = 10

[permalinks]
  pages = "/:slug/"
  articles = "/articles/:year-:month-:day/:slug/"
  status = "/status/:year-:month-:day/:contentbasename/"
  replies = "/replies/:year-:month-:day/:contentbasename/"
  reposts = "/reposts/:year-:month-:day/:contentbasename/"
  likes = "/likes/:year-:month-:day/:contentbasename/"
  bookmarks = "/bookmarks/:year-:month-:day/:contentbasename/"
  rsvps = "/rsvps/:year-:month-:day/:contentbasename/"

[outputs]
  home = ["HTML", "RSS", "JSON"]
  section = ["HTML", "RSS", "JSON"]

[css]
  [css.sass]
    enable = true
EOT

# params.toml (Site Variables)
cat <<EOT > "config/_default/params.toml"
[author]
  name = "Gregory Lopez"
  bio = "I'm a gay, blind, middle-aged guy from the Pacific Northwest. As an Apple and Linux fan, I enjoy tinkering with tech and coding. Audiobooks, podcasts, and retro media from the 1970s to the early 2000s are my jam. I also love good food, drinks, and laughter with friends, plus a little cannabis to keep things mellow."
  photo = "images/profile_photo.jpg"

  [author.location]
    city = "Burien"
    state = "Washington"
    country = "USA"

[webmentions]
  enable = true
  show_webmentions = true
  username = "simplygregario.us"
  guestbookIntro = ""

[contact]
  formAction = "https://formspree.io/f/xblwegvw"
  intro = "Have a question or just want to say hi? Send me a message!"

[theme]
  colorScheme = "forest"

[[social]]
  name = "BlueSky"
  handle = "@somegregariousdude.bsky.social"
  url = "https://bsky.app/profile/somegregariousdude.bsky.social"
  rel = "me"
  icon = "bluesky"

[[social]]
  name = "Friendica"
  handle = "thegregariousdragon"
  url = "https://social.trom.tf/profile/thegregariousdragon"
  rel = "me"
  icon = "friendica"

[[social]]
  name = "GitHub"
  handle = "somegregariousdude"
  url = "https://github.com/somegregariousdude"
  rel = "me"
  icon = "github"

[[social]]
  name = "Mastodon"
  handle = "@somegregariousdude@dragonscave.space"
  url = "https://dragonscave.space/@somegregariousdude"
  rel = "me"
  icon = "mastodon"

[[im]]
  name = "Matrix"
  handle = "@gregarious:4d2.org"
  url = "https://matrix.to/#/@gregarious:4d2.org"
  rel = "nofollow"
  icon = "matrix"

[[im]]
  name = "Signal"
  handle = "gregarious.42"
  url = "https://signal.me/#eu/UOIs6b3CzdqYravUXj1jihHuK-QLTKLWYBcjiUz4XGOfuyXGdQdExKbPH3633UxT"
  rel = "nofollow"
  icon = "signal"
  
[[im]]
  name = "Simplex Chat"
  handle = "Gregory Lopez"
  url = "https.smp15.simplex.im/a#2XKhZFdQoRskGLNVIpe4rU28lzDmBScikeImDMbPJXc"
  rel = "nofollow"
  icon = "simplex"
EOT

# menus.toml (Navigation)
cat <<EOT > "config/_default/menus.toml"
[[main]]
  name = "Home"
  url = "/"
  weight = 100

[[main]]
  name = "About"
  url = "/about/"
  weight = 150

[[main]]
  name = "Articles"
  url = "/articles/"
  weight = 200

[[main]]
  name = "Status Updates"
  url = "/status/"
  weight = 300

[[main]]
  name = "Replies"
  url = "/replies/"
  weight = 400

[[main]]
  name = "Reposts"
  url = "/reposts/"
  weight = 500

[[main]]
  name = "Likes"
  url = "/likes/"
  weight = 600

[[main]]
  name = "Bookmarks"
  url = "/bookmarks/"
  weight = 700

[[main]]
  name = "RSVPs"
  url = "/rsvps/"
  weight = 800

[[main]]
  name = "Guestbook"
  url = "/guestbook/"
  weight = 900

[[main]]
  name = "Contact"
  url = "/contact/"
  weight = 1000

[[main]]
  name = "Search"
  url = "/search/"
  weight = 1100
EOT

# markup.toml (Security & Rendering)
cat <<EOT > "config/_default/markup.toml"
[goldmark]
  [goldmark.renderer]
    unsafe = false 
  [goldmark.parser]
    attribute = { block = true, title = true }

[highlight]
  style = "monokai"
  lineNos = false
  noClasses = false
EOT

# ==============================================================================
# 3. THEME ARCHETYPES
# ==============================================================================
echo "Generating Archetypes..."

cat <<EOT > "$THEME_ROOT/archetypes/default.md"
+++
title = "{{ replace .Name "-" " " | title }}"
date = {{ .Date }}
lastmod = {{ .Date }}
draft = true
summary = ""
show_webmentions = true
+++
EOT

cat <<EOT > "$THEME_ROOT/archetypes/articles.md"
+++
title = "{{ replace .Name "-" " " | title }}"
date = {{ .Date }}
lastmod = {{ .Date }}
draft = true
summary = ""
tags = []
syndication = []
show_webmentions = true
+++

Write your article content here.
EOT

cat <<EOT > "$THEME_ROOT/archetypes/status.md"
+++
title = "{{ replace .Name "-" " " | title }}"
date = {{ .Date }}
lastmod = {{ .Date }}
draft = false
summary = ""
tags = []
syndication = []
+++

Write your status update here.
EOT

cat <<EOT > "$THEME_ROOT/archetypes/replies.md"
+++
title = "Reply to {{ replace .Name "-" " " | title }}"
date = {{ .Date }}
lastmod = {{ .Date }}
draft = false
summary = ""
reply_to = "" 
tags = []
syndication = []
+++
EOT

cat <<EOT > "$THEME_ROOT/archetypes/reposts.md"
+++
title = "Repost: {{ replace .Name "-" " " | title }}"
date = {{ .Date }}
lastmod = {{ .Date }}
draft = false
repost_of = ""
tags = []
syndication = []
+++
EOT

cat <<EOT > "$THEME_ROOT/archetypes/likes.md"
+++
title = "Like: {{ replace .Name "-" " " | title }}"
date = {{ .Date }}
lastmod = {{ .Date }}
draft = false
like_of = ""
tags = []
syndication = []
+++
EOT

cat <<EOT > "$THEME_ROOT/archetypes/bookmarks.md"
+++
title = "{{ replace .Name "-" " " | title }}"
date = {{ .Date }}
lastmod = {{ .Date }}
draft = false
summary = ""
bookmark_of = ""
tags = []
syndication = []
+++
EOT

cat <<EOT > "$THEME_ROOT/archetypes/rsvps.md"
+++
title = "RSVP: {{ replace .Name "-" " " | title }}"
date = {{ .Date }}
lastmod = {{ .Date }}
draft = false
summary = ""
reply_to = ""
rsvp = "yes"
tags = []
syndication = []
+++
EOT

# ==============================================================================
# 4. SCSS STYLES (Architecture)
# ==============================================================================
echo "Generating SCSS..."

cat <<EOT > "$THEME_ROOT/assets/scss/_variables.scss"
:root {
  /* MD3 Dimension Tokens */
  --md-sys-shape-corner-medium: 12px;
  --md-sys-spacing-base: 8px;
  
  /* DEFAULT THEME: "The Sound" */
  --md-sys-color-primary: #4A5D8A;
  --md-sys-color-on-primary: #FFFFFF;
  --md-sys-color-secondary: #4A7A7A;
  --md-sys-color-tertiary: #E98A78;
  --md-sys-color-surface: #FFFFFF;
  --md-sys-color-on-surface: #1C1B1F;
  --md-sys-color-outline: #79747E;
  --md-sys-color-outline-variant: #CAC4D0;
}

[data-theme="market"] { --md-sys-color-primary: #4E342E; --md-sys-color-secondary: #C62828; --md-sys-color-tertiary: #F9A825; }
[data-theme="mountain"] { --md-sys-color-primary: #455A64; --md-sys-color-secondary: #00838F; --md-sys-color-tertiary: #7E57C2; }
[data-theme="forest"] { --md-sys-color-primary: #1B5E20; --md-sys-color-secondary: #5D4037; --md-sys-color-tertiary: #8BC34A; }
[data-theme="sunset"] { --md-sys-color-primary: #311B92; --md-sys-color-secondary: #880E4F; --md-sys-color-tertiary: #FF6D00; }

@media (prefers-color-scheme: dark) {
  :root {
    --md-sys-color-surface: #1C1B1F;
    --md-sys-color-on-surface: #E6E1E5;
    --md-sys-color-outline: #938F99;
    --md-sys-color-primary: #B0C4DE;
  }
}
EOT

cat <<EOT > "$THEME_ROOT/assets/scss/_base.scss"
body {
  margin: 0;
  font-family: 'Noto Sans', sans-serif;
  background-color: var(--md-sys-color-surface);
  color: var(--md-sys-color-on-surface);
  line-height: 1.5;
}

h1, h2, h3, h4 { font-family: 'Noto Serif', serif; margin-top: 0; }

:focus-visible { outline: 3px solid var(--md-sys-color-primary); outline-offset: 2px; }

.skip-link {
  position: absolute; top: -100px; left: 0;
  background: var(--md-sys-color-primary); color: var(--md-sys-color-on-primary);
  padding: 8px; z-index: 9999;
}
.skip-link:focus { top: 0; }
EOT

cat <<EOT > "$THEME_ROOT/assets/scss/_typography.scss"
/* TYPE SCALE & MD3 MAPPINGS */
h1, h2, h3, h4, h5, h6 {
  font-family: 'Noto Serif', serif;
  color: var(--md-sys-color-on-surface);
  margin-top: 2rem; margin-bottom: 1rem; line-height: 1.2;
}
h1 { font-size: 2.5rem; font-weight: 700; margin-top: 0; }
h2 { font-size: 2rem; font-weight: 600; }
h3 { font-size: 1.75rem; font-weight: 600; }
h4 { font-size: 1.5rem; font-weight: 600; }
h5 { font-size: 1.25rem; font-weight: 600; }
h6 { font-size: 1rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; }

p { font-family: 'Noto Sans', sans-serif; font-size: 1rem; line-height: 1.6; margin-bottom: 1rem; color: var(--md-sys-color-on-surface); }

a { color: var(--md-sys-color-primary); text-decoration: underline; text-decoration-thickness: 1px; text-underline-offset: 2px; }
a:hover { text-decoration-thickness: 2px; background-color: rgba(var(--md-sys-color-primary), 0.05); }

hr { border: 0; height: 1px; background-color: var(--md-sys-color-outline-variant); margin: 2rem 0; width: 100%; }

blockquote {
  margin: 1.5rem 0; padding: 1rem 1.5rem;
  border-left: 4px solid var(--md-sys-color-primary);
  background-color: rgba(var(--md-sys-color-primary), 0.05);
  font-style: italic;
  border-radius: 0 var(--md-sys-shape-corner-medium) var(--md-sys-shape-corner-medium) 0;
}
blockquote p:last-child { margin-bottom: 0; }

ul, ol { margin-bottom: 1rem; padding-left: 2rem; }
li { margin-bottom: 0.5rem; line-height: 1.6; }
li::marker { color: var(--md-sys-color-secondary); }

code { font-family: monospace; background-color: var(--md-sys-color-outline-variant); color: var(--md-sys-color-on-surface); padding: 0.2em 0.4em; border-radius: 4px; font-size: 0.9em; }

/* Tables */
.table-wrapper { overflow-x: auto; margin-bottom: 1.5rem; border: 1px solid var(--md-sys-color-outline-variant); border-radius: var(--md-sys-shape-corner-medium); }
.md-table { width: 100%; border-collapse: collapse; font-size: 0.95rem; border: none; }
.md-table caption { caption-side: top; text-align: left; padding: 12px 16px; font-family: 'Noto Serif', serif; font-weight: 700; color: var(--md-sys-color-primary); background-color: rgba(var(--md-sys-color-primary), 0.05); border-bottom: 1px solid var(--md-sys-color-outline-variant); }
.md-table th, .md-table td { padding: 12px 16px; border-bottom: 1px solid var(--md-sys-color-outline-variant); white-space: nowrap; }
.md-table th { background-color: var(--md-sys-color-surface); font-weight: 600; color: var(--md-sys-color-on-surface); text-align: left; }
.md-table tr:last-child td { border-bottom: none; }
.md-table tbody tr:nth-child(even) { background-color: rgba(var(--md-sys-color-primary), 0.02); }

/* Code Blocks */
pre { background-color: #272822; color: #f8f8f2; padding: 1rem; border-radius: var(--md-sys-shape-corner-medium); overflow-x: auto; margin-bottom: 1.5rem; border: 1px solid var(--md-sys-color-outline-variant); }
pre code { background-color: transparent; color: inherit; padding: 0; }
.code-block-wrapper { position: relative; margin-bottom: 1.5rem; }
.code-block-wrapper pre { margin-bottom: 0; }
.copy-code-btn { position: absolute; top: 8px; right: 8px; background-color: var(--md-sys-color-surface); border: 1px solid var(--md-sys-color-outline); color: var(--md-sys-color-primary); border-radius: 50%; width: 32px; height: 32px; display: flex; align-items: center; justify-content: center; cursor: pointer; opacity: 0.5; transition: opacity 0.2s, background-color 0.2s; z-index: 2; }
.copy-code-btn:hover, .copy-code-btn:focus-visible { opacity: 1; background-color: var(--md-sys-color-outline-variant); }
.copy-code-btn svg { width: 18px; height: 18px; fill: currentColor; }
EOT

cat <<EOT > "$THEME_ROOT/assets/scss/_layout.scss"
.container { max-width: 800px; margin: 0 auto; padding: 0 16px; }

.site-header { padding: 16px 0; border-bottom: 1px solid var(--md-sys-color-outline-variant); background: var(--md-sys-color-surface); position: relative; }
.header-inner { display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; }
.site-title { font-family: 'Noto Serif', serif; font-weight: 700; font-size: 1.25rem; text-decoration: none; color: var(--md-sys-color-on-surface); }

.nav-list { list-style: none; padding: 0; margin: 0; display: flex; gap: 16px; flex-wrap: wrap; }
.nav-list a { text-decoration: none; color: var(--md-sys-color-on-surface); font-weight: 500; }
.nav-list a[aria-current="page"] { color: var(--md-sys-color-primary); border-bottom: 2px solid var(--md-sys-color-primary); }

.menu-toggle { display: none; background: none; border: 1px solid var(--md-sys-color-outline); border-radius: 8px; cursor: pointer; padding: 8px; color: var(--md-sys-color-primary); }
.menu-toggle .icon-box svg { width: 24px; height: 24px; fill: currentColor; display: block; }

@media (max-width: 768px) {
  .menu-toggle { display: block; }
  .site-header { padding-bottom: 8px; }
  #main-nav { width: 100%; margin-top: 16px; }
  .nav-list { display: none; flex-direction: column; gap: 8px; width: 100%; padding-bottom: 16px; }
  .nav-list.is-open { display: flex; animation: slideDown 0.2s ease-out; }
  .nav-list li { width: 100%; }
  .nav-list a { display: block; padding: 12px; background-color: rgba(var(--md-sys-color-primary), 0.05); border-radius: 8px; }
  .nav-list a:hover { background-color: rgba(var(--md-sys-color-primary), 0.1); }
}

@keyframes slideDown { from { opacity: 0; transform: translateY(-10px); } to { opacity: 1; transform: translateY(0); } }

.site-footer { border-top: 1px solid var(--md-sys-color-outline-variant); margin-top: 32px; padding: 16px 0; }
.feed-item { margin-bottom: 16px; }

/* Section Intro */
.section-intro { margin-bottom: 24px; font-size: 1.1rem; line-height: 1.6; color: var(--md-sys-color-on-surface); max-width: 65ch; }
EOT

cat <<EOT > "$THEME_ROOT/assets/scss/_components.scss"
.outlined-card {
  background-color: var(--md-sys-color-surface);
  border: 1px solid var(--md-sys-color-outline-variant);
  border-radius: var(--md-sys-shape-corner-medium);
  padding: 16px;
  transition: background-color 0.2s ease, border-color 0.2s ease;
}
.outlined-card:hover { border-color: var(--md-sys-color-outline); background-color: rgba(var(--md-sys-color-primary), 0.05); }

.chip { display: inline-flex; align-items: center; border: 1px solid var(--md-sys-color-outline); border-radius: 8px; padding: 4px 8px; font-size: 0.875rem; margin-bottom: 8px; gap: 8px; }
.chip-icon svg, .brand-icon svg { width: 18px; height: 18px; fill: currentColor; display: block; }

.social-links, .im-links { list-style: none; padding: 0; }
.social-link { display: inline-flex; align-items: center; gap: 8px; text-decoration: none; }

.webmentions-container { margin-top: 24px; }

.headline-row { display: flex; align-items: center; gap: 12px; margin-bottom: 8px; }
.headline-row h1 { margin: 0; }
.headline-row h2 { margin: 0; font-size: 1.25rem; line-height: 1.3; }
.headline-row a { text-decoration: none; color: inherit; }
.headline-row a:hover { text-decoration: underline; text-decoration-color: var(--md-sys-color-primary); }

.chip-icon-only { border: 1px solid var(--md-sys-color-outline); border-radius: 50%; padding: 8px; display: inline-flex; justify-content: center; align-items: center; width: 20px; height: 20px; color: var(--md-sys-color-primary); }
.chip-icon-only:hover { background-color: rgba(var(--md-sys-color-primary), 0.1); }
EOT

cat <<EOT > "$THEME_ROOT/assets/scss/_images.scss"
.md-figure { margin: 2rem 0; display: block; }
.md-image { max-width: 100%; height: auto; display: block; border-radius: var(--md-sys-shape-corner-medium); border: 1px solid var(--md-sys-color-outline-variant); background-color: var(--md-sys-color-surface); }
.md-figcaption { margin-top: 0.75rem; font-size: 0.9rem; color: var(--md-sys-color-outline); font-family: 'Noto Sans', sans-serif; text-align: center; font-style: italic; }
.md-gallery-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(150px, 1fr)); gap: 12px; margin: 2rem 0; }
.gallery-item { display: block; border-radius: var(--md-sys-shape-corner-medium); overflow: hidden; border: 1px solid var(--md-sys-color-outline-variant); transition: border-color 0.2s, transform 0.2s; aspect-ratio: 1 / 1; }
.gallery-item:hover, .gallery-item:focus-visible { border-color: var(--md-sys-color-primary); transform: scale(1.02); outline: none; }
.gallery-item img { width: 100%; height: 100%; object-fit: cover; display: block; }
EOT

cat <<EOT > "$THEME_ROOT/assets/scss/_youtube.scss"
.youtube-lite { position: relative; width: 100%; aspect-ratio: 16 / 9; overflow: hidden; cursor: pointer; background-color: #000; display: flex; align-items: center; justify-content: center; padding: 0; }
.youtube-lite img { width: 100%; height: 100%; object-fit: cover; opacity: 0.8; transition: opacity 0.3s ease; }
.youtube-lite:hover img, .youtube-lite:focus-visible img { opacity: 1; }
.youtube-lite .play-button { position: absolute; width: 68px; height: 48px; background-color: rgba(33, 33, 33, 0.8); border-radius: 12px; z-index: 1; transition: background-color 0.2s ease; display: flex; align-items: center; justify-content: center; }
.youtube-lite:hover .play-button, .youtube-lite:focus-visible .play-button { background-color: #f00; }
.youtube-lite .play-button::before { content: ""; border-style: solid; border-width: 10px 0 10px 20px; border-color: transparent transparent transparent #fff; }
.youtube-lite iframe { width: 100%; height: 100%; border: none; }
EOT

cat <<EOT > "$THEME_ROOT/assets/scss/_mastodon.scss"
.mastodon-card { max-width: 600px; margin: 2rem auto; font-family: 'Noto Sans', sans-serif; }
.mastodon-header { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 1rem; }
.mastodon-author { display: flex; gap: 12px; align-items: center; }
.mastodon-author img.u-photo { border-radius: 50%; object-fit: cover; background-color: var(--md-sys-color-outline-variant); }
.author-meta { display: flex; flex-direction: column; line-height: 1.2; }
.author-meta a { text-decoration: none; color: var(--md-sys-color-on-surface); }
.author-meta a:hover { text-decoration: underline; }
.p-nickname { font-size: 0.85rem; color: var(--md-sys-color-outline); }
.mastodon-logo { color: var(--md-sys-color-primary); width: 24px; height: 24px; }
.mastodon-logo svg { width: 100%; height: 100%; fill: currentColor; }
.mastodon-card .e-content { font-size: 1rem; line-height: 1.5; margin-bottom: 1rem; }
.mastodon-card .e-content p { margin-bottom: 0.5rem; }
.mastodon-card .e-content a { color: var(--md-sys-color-secondary); word-break: break-all; }
.mastodon-media { display: grid; gap: 8px; margin-bottom: 1rem; border-radius: 8px; overflow: hidden; }
.mastodon-media img { width: 100%; height: auto; display: block; background-color: rgba(0,0,0,0.05); }
.mastodon-footer { display: flex; align-items: center; justify-content: space-between; border-top: 1px solid var(--md-sys-color-outline-variant); padding-top: 12px; font-size: 0.85rem; color: var(--md-sys-color-outline); }
.mastodon-stats { display: flex; gap: 16px; }
.button-small { text-decoration: none; color: var(--md-sys-color-primary); font-weight: 600; }
.button-small:hover { background-color: rgba(var(--md-sys-color-primary), 0.1); padding: 4px 8px; margin: -4px -8px; border-radius: 4px; }
EOT

cat <<EOT > "$THEME_ROOT/assets/scss/main.scss"
@import "variables";
@import "base";
@import "typography";
@import "layout";
@import "components";
@import "youtube";
@import "mastodon";
@import "images";
EOT

# ==============================================================================
# 5. JAVASCRIPT MODULES
# ==============================================================================
echo "Generating JS..."

cat <<EOT > "$THEME_ROOT/assets/js/menu.js"
document.addEventListener('DOMContentLoaded', () => {
    const toggle = document.getElementById('menu-toggle');
    const menu = document.getElementById('main-menu');

    if (!toggle || !menu) return;

    toggle.addEventListener('click', () => {
        const isExpanded = toggle.getAttribute('aria-expanded') === 'true';
        toggle.setAttribute('aria-expanded', !isExpanded);
        menu.classList.toggle('is-open');
        const label = isExpanded ? "Open Menu" : "Close Menu";
        toggle.setAttribute('aria-label', label);
    });
});
EOT

cat <<EOT > "$THEME_ROOT/assets/js/copy-code.js"
document.addEventListener('DOMContentLoaded', () => {
    const copyButtons = document.querySelectorAll('.copy-code-btn');

    copyButtons.forEach(btn => {
        btn.addEventListener('click', () => {
            const pre = btn.nextElementSibling;
            const code = pre.querySelector('code');
            const text = code.innerText;

            navigator.clipboard.writeText(text).then(() => {
                const originalIcon = btn.innerHTML;
                btn.innerHTML = '<span role="img" aria-label="Copied">✓</span>'; 
                btn.setAttribute('aria-label', 'Copied!');
                setTimeout(() => {
                    btn.innerHTML = originalIcon;
                    btn.setAttribute('aria-label', 'Copy code to clipboard');
                }, 2000);
            }).catch(err => {
                console.error('Failed to copy:', err);
            });
        });
    });
});
EOT

cat <<EOT > "$THEME_ROOT/assets/js/youtube-lite.js"
document.addEventListener('DOMContentLoaded', () => {
    const players = document.querySelectorAll('.youtube-lite');

    players.forEach(player => {
        player.addEventListener('click', (e) => loadVideo(player));
        player.addEventListener('keydown', (e) => {
            if (e.key === 'Enter' || e.key === ' ') {
                e.preventDefault();
                loadVideo(player);
            }
        });
    });

    function loadVideo(wrapper) {
        if (wrapper.dataset.loaded) return;
        const id = wrapper.dataset.id;
        const title = wrapper.getAttribute('aria-label');
        const iframe = document.createElement('iframe');
        iframe.setAttribute('src', \`https://www.youtube-nocookie.com/embed/\${id}?autoplay=1\`);
        iframe.setAttribute('title', title);
        iframe.setAttribute('allow', 'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture');
        iframe.setAttribute('allowfullscreen', '');
        wrapper.innerHTML = '';
        wrapper.appendChild(iframe);
        wrapper.dataset.loaded = 'true';
    }
});
EOT

cat <<EOT > "$THEME_ROOT/assets/js/webmentions.js"
/**
 * Webmention Logic (Patched: Invalid Date Fix + Missing Author URL)
 */
(function() {
    const container = document.getElementById('webmentions');
    if (!container) return;

    const target = container.dataset.target;
    const list = document.getElementById('webmentions-list');
    const itemsPerPage = 20;
    let currentPage = 1;
    let allMentions = [];

    const apiUrl = 'https://webmention.io/api/mentions.jf2?target=' + encodeURIComponent(target);

    fetch(apiUrl)
        .then(response => {
            if (!response.ok) throw new Error('Network response was not ok');
            return response.json();
        })
        .then(data => {
            allMentions = (data.children || []).filter(item => {
                const hasContent = item.content && (item.content.text || item.content.html);
                const hasAuthor = item.author && item.author.name;
                return hasContent || hasAuthor;
            });
            
            if (allMentions.length === 0) {
                list.innerHTML = '<p>No mentions yet. Be the first!</p>';
                return;
            }
            renderPage(1);
        })
        .catch(error => {
            list.innerHTML = '<p class="error">Unable to load conversation at this time.</p>';
            console.error('Webmention Fetch Error:', error);
        });

    function renderPage(page) {
        list.innerHTML = '';
        const start = (page - 1) * itemsPerPage;
        const end = start + itemsPerPage;
        const pageItems = allMentions.slice(start, end);
        pageItems.forEach(item => {
            const article = document.createElement('article');
            article.className = 'mention h-cite outlined-card';
            article.innerHTML = buildMentionHTML(item);
            list.appendChild(article);
        });
        if (allMentions.length > itemsPerPage) {
            renderPaginationControls(page);
        }
    }

    function renderPaginationControls(page) {
        const totalPages = Math.ceil(allMentions.length / itemsPerPage);
        const nav = document.createElement('nav');
        nav.className = 'pagination-controls';
        nav.ariaLabel = "Webmention Pagination";
        if (page > 1) {
            const prev = document.createElement('button');
            prev.innerText = 'Previous';
            prev.className = 'button-secondary';
            prev.onclick = () => { currentPage--; renderPage(currentPage); list.focus(); };
            nav.appendChild(prev);
        }
        if (page < totalPages) {
            const next = document.createElement('button');
            next.innerText = 'Next';
            next.className = 'button-secondary';
            next.onclick = () => { currentPage++; renderPage(currentPage); list.focus(); };
            nav.appendChild(next);
        }
        list.appendChild(nav);
    }

    function buildMentionHTML(item) {
        const author = item.author || {};
        const name = author.name || 'Anonymous';
        const authorLink = author.url 
            ? \`<a href="\${author.url}" class="p-name u-url" rel="nofollow">\${name}</a>\`
            : \`<span class="p-name">\${name}</span>\`;
        const content = sanitize(item.content ? item.content.html || item.content.text : '');
        let timeHtml = '';
        if (item.published) {
            const dateStr = new Date(item.published).toLocaleDateString();
            if (dateStr !== 'Invalid Date') {
                timeHtml = \`<time class="dt-published">\${dateStr}</time>\`;
            }
        }
        return \`
            <div class="mention-author u-author h-card">
                <img src="\${author.photo || '/images/default-avatar.png'}" alt="" class="u-photo">
                \${authorLink}
            </div>
            <div class="mention-content p-content">\${content}</div>
            \${timeHtml}
        \`;
    }

    function sanitize(html) {
        const parser = new DOMParser();
        const doc = parser.parseFromString(html, 'text/html');
        const forbidden = ['script', 'iframe', 'object', 'style', 'link', 'meta'];
        forbidden.forEach(tag => {
            const elements = doc.querySelectorAll(tag);
            elements.forEach(el => el.remove());
        });
        const allElements = doc.querySelectorAll('*');
        allElements.forEach(el => {
            Array.from(el.attributes).forEach(attr => {
                if (attr.name.startsWith('on') || (attr.name === 'href' && attr.value.toLowerCase().startsWith('javascript:'))) {
                    el.removeAttribute(attr.name);
                }
            });
        });
        return doc.body.innerHTML;
    }
})();
EOT

# ==============================================================================
# 6. HTML LAYOUTS (Templates & Partials)
# ==============================================================================
echo "Generating HTML Layouts..."

# UI Partials
cat <<EOT > "$THEME_ROOT/layouts/partials/ui/chip.html"
{{ \$type := .Type }}
{{ \$iconName := .Type }}
{{ \$vibe := "Icon" }}
{{ if eq .Layout "guestbook" }}{{ \$iconName = "guestbook" }}{{ end }}
{{ if eq .Layout "contact" }}{{ \$iconName = "contact" }}{{ end }}
{{ if eq .Layout "search" }}{{ \$iconName = "search" }}{{ end }}
{{ if eq .Title "About" }}{{ \$iconName = "about" }}{{ end }}
{{ if eq \$iconName "status" }}{{ \$vibe = "Bubble" }}{{ end }}
{{ if eq \$iconName "replies" }}{{ \$vibe = "Reply" }}{{ end }}
{{ if eq \$iconName "reposts" }}{{ \$vibe = "Repeat" }}{{ end }}
{{ if eq \$iconName "likes" }}{{ \$vibe = "Heart" }}{{ end }}
{{ if eq \$iconName "bookmarks" }}{{ \$vibe = "Bookmark" }}{{ end }}
{{ if eq \$iconName "rsvps" }}{{ \$vibe = "Event" }}{{ end }}
{{ if eq \$iconName "articles" }}{{ \$vibe = "Article" }}{{ end }}
{{ if eq \$iconName "pages" }}{{ \$vibe = "Page" }}{{ end }}
{{ if eq \$iconName "categories" }}{{ \$vibe = "Category" }}{{ end }}
{{ if eq \$iconName "tags" }}{{ \$vibe = "Tag" }}{{ end }}
{{ if eq \$iconName "guestbook" }}{{ \$vibe = "Book" }}{{ end }}
{{ if eq \$iconName "contact" }}{{ \$vibe = "Envelope" }}{{ end }}
{{ if eq \$iconName "search" }}{{ \$vibe = "Magnifier" }}{{ end }}
{{ if eq \$iconName "about" }}{{ \$vibe = "Info" }}{{ end }}
<div class="chip chip-icon-only">
  <span class="chip-icon" role="img" aria-label="{{ \$vibe }}">
    {{ partial (printf "icons/%s.svg" \$iconName) . }}
  </span>
</div>
EOT

cat <<EOT > "$THEME_ROOT/layouts/partials/ui/social-link.html"
<li>
  <a href="{{ .url }}" rel="{{ .rel }}" class="u-url social-link" style="text-decoration: none;">
    <span class="brand-name" style="font-weight: 600; color: var(--md-sys-color-primary);">{{ .name }}</span>
    <span class="brand-handle" style="color: var(--md-sys-color-on-surface); opacity: 0.8; margin-left: 4px;">{{ .handle }}</span>
  </a>
</li>
EOT

# Core Partials
cat <<EOT > "$THEME_ROOT/layouts/partials/head.html"
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{{ if .IsHome }}{{ .Site.Title }}{{ else }}{{ .Title }} | {{ .Site.Title }}{{ end }}</title>
{{ hugo.Generator }}
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&family=Noto+Serif:wght@400;700&display=swap" rel="stylesheet">
{{ with .Site.Params.webmentions.username }}
<link rel="webmention" href="https://webmention.io/{{ . }}/webmention" />
<link rel="pingback" href="https://webmention.io/{{ . }}/xmlrpc" />
{{ end }}
{{ if .Site.Params.authorization_endpoint }}<link rel="authorization_endpoint" href="{{ .Site.Params.authorization_endpoint }}">{{ end }}
{{ if .Site.Params.token_endpoint }}<link rel="token_endpoint" href="{{ .Site.Params.token_endpoint }}">{{ end }}
{{ if .Site.Params.micropub }}<link rel="micropub" href="{{ .Site.Params.micropub }}">{{ end }}
{{ \$opts := dict "transpiler" "libsass" "targetPath" "css/style.css" }}
{{ \$style := resources.Get "scss/main.scss" | css.Sass \$opts | resources.Minify | resources.Fingerprint }}
<link rel="stylesheet" href="{{ \$style.RelPermalink }}">
EOT

cat <<EOT > "$THEME_ROOT/layouts/partials/header.html"
<header role="banner" class="site-header">
  <div class="container header-inner">
    <a href="/" class="site-title">{{ .Site.Title }}</a>
    <button id="menu-toggle" class="menu-toggle" aria-expanded="false" aria-controls="main-menu" aria-label="Open Menu">
      <span class="icon-box">{{ partial "icons/menu.svg" . }}</span>
    </button>
    <nav role="navigation" aria-label="Main Navigation" id="main-nav">
      <ul id="main-menu" class="nav-list">
        {{ range .Site.Menus.main }}
        <li><a href="{{ .URL }}" {{ if or (eq .URL $.RelPermalink) (eq .URL $.Permalink) }}aria-current="page"{{ end }}>{{ .Name }}</a></li>
        {{ end }}
      </ul>
    </nav>
  </div>
</header>
EOT

cat <<EOT > "$THEME_ROOT/layouts/partials/footer.html"
<footer role="contentinfo" class="site-footer">
  <div class="container">
    <p>&copy; {{ now.Year }} {{ .Site.Params.author.name }}</p>
    <p>Content licensed under <a href="http://creativecommons.org/licenses/by-sa/4.0/" target="_blank" rel="noopener">CC BY-SA 4.0</a>.</p>
  </div>
</footer>
EOT

# Render Hooks
cat <<EOT > "$THEME_ROOT/layouts/_default/_markup/render-image.html"
{{- \$img := .Page.Resources.GetMatch .Destination -}}
{{- \$alt := .PlainText | default "" -}}
{{- \$caption := .Title | default "" -}}
<figure class="md-figure {{ if not \$img }}md-figure-remote{{ end }}">
  {{- if \$img -}}
    {{- \$tiny := \$img.Resize "480x webp" -}}
    {{- \$small := \$img.Resize "800x webp" -}}
    {{- \$medium := \$img.Resize "1200x webp" -}}
    <img class="md-image" src="{{ \$small.RelPermalink }}" srcset="{{ \$tiny.RelPermalink }} 480w, {{ \$small.RelPermalink }} 800w, {{ \$medium.RelPermalink }} 1200w" sizes="(max-width: 600px) 100vw, 800px" alt="{{ \$alt }}" loading="lazy" width="{{ \$img.Width }}" height="{{ \$img.Height }}">
  {{- else -}}
    <img class="md-image" src="{{ .Destination | safeURL }}" alt="{{ \$alt }}" title="{{ \$caption }}" loading="lazy">
  {{- end -}}
  {{- if \$caption -}}<figcaption class="md-figcaption">{{ \$caption | safeHTML }}</figcaption>{{- end -}}
</figure>
EOT

cat <<EOT > "$THEME_ROOT/layouts/_default/_markup/render-table.html"
<div class="table-wrapper">
  <table class="md-table">
    {{- with .Attributes.caption }}<caption>{{ . }}</caption>{{- end }}
    <thead>{{- range .THead }}<tr>{{- range . }}<th scope="col" {{ with .Alignment }}style="text-align:{{ . }}"{{ end }}>{{- .Text -}}</th>{{- end }}</tr>{{- end }}</thead>
    <tbody>{{- range .TBody }}<tr>{{- range . }}<td {{ with .Alignment }}style="text-align:{{ . }}"{{ end }}>{{- .Text -}}</td>{{- end }}</tr>{{- end }}</tbody>
  </table>
</div>
EOT

cat <<EOT > "$THEME_ROOT/layouts/_default/_markup/render-codeblock.html"
<div class="code-block-wrapper">
  <button class="copy-code-btn" aria-label="Copy code to clipboard">{{ partial "icons/content_copy.svg" . }}</button>
  <pre{{ if .Attributes }} {{ .Attributes | safeHTMLAttr }}{{ end }}><code>{{ .Inner }}</code></pre>
</div>
EOT

# Base Layout
cat <<EOT > "$THEME_ROOT/layouts/_default/baseof.html"
<!DOCTYPE html>
<html lang="{{ .Site.LanguageCode }}">
<head>{{ partial "head.html" . }}</head>
<body>
  <a class="skip-link" href="#main-content">Skip to content</a>
  {{ partial "header.html" . }}
  <main id="main-content" role="main" class="container">{{ block "main" . }}{{ end }}</main>
  {{ partial "footer.html" . }}
  {{ \$js := slice (resources.Get "js/webmentions.js") (resources.Get "js/youtube-lite.js") (resources.Get "js/menu.js") (resources.Get "js/copy-code.js") | resources.Concat "js/main.js" | resources.Minify | resources.Fingerprint }}
  <script src="{{ \$js.RelPermalink }}" defer></script>
</body>
</html>
EOT

# Main Layouts
cat <<EOT > "$THEME_ROOT/layouts/index.html"
{{ define "main" }}
<section class="feed-stream">
  <article class="h-card profile-card outlined-card" style="margin-bottom: 2rem;">
    <h1 class="p-name">{{ .Site.Params.author.name }}</h1>
    {{ \$avatar := resources.Get .Site.Params.author.photo }}
    {{ if \$avatar }}
      {{ \$avatar := \$avatar.Fill "500x500 Center webp" }}
      <img class="u-photo" src="{{ \$avatar.RelPermalink }}" alt="Profile Photo" width="{{ \$avatar.Width }}" height="{{ \$avatar.Height }}">
    {{ else }}
      <div class="u-photo-placeholder" style="background:#ccc;width:150px;height:150px;border-radius:50%;">?</div>
    {{ end }}
    <p class="p-note">{{ .Site.Params.author.bio }}</p>
    <div class="profile-meta"><span class="p-locality">{{ .Site.Params.author.location.city }}</span>, <span class="p-region">{{ .Site.Params.author.location.state }}</span></div>
    <h2>Social Media</h2>
    <ul class="social-links">{{ range .Site.Params.social }}{{ partial "ui/social-link.html" . }}{{ end }}</ul>
    {{ if .Site.Params.im }}<h2>Messaging Services</h2><ul class="im-links">{{ range .Site.Params.im }}{{ partial "ui/social-link.html" . }}{{ end }}</ul>{{ end }}
  </article>

  <h1>Latest Updates</h1>
  {{ \$allowed_sections := slice "articles" "status" "replies" "reposts" "likes" "bookmarks" "rsvps" }}
  {{ \$feed := where .Site.RegularPages "Section" "in" \$allowed_sections }}
  {{ \$paginator := .Paginate \$feed }}

  <div class="post-feed">
    {{ range \$paginator.Pages }}
      <article class="feed-item outlined-card h-entry">
        <header class="feed-header">
          <div class="headline-row">{{ partial "ui/chip.html" . }}<h2 class="p-name"><a href="{{ .Permalink }}" class="u-url">{{ .Title }}</a></h2></div>
          <time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">{{ .Date.Format "Jan 02, 2006" }}</time>
        </header>
        <div class="feed-content p-summary">{{ if .Params.summary }}{{ .Params.summary }}{{ else }}{{ .Content | plainify | truncate 500 }}{{ end }}</div>
        <a href="{{ .Permalink }}" class="u-url">Read More</a>
      </article>
    {{ else }}
      <div class="outlined-card"><h3>No updates found.</h3><p>The stream is currently quiet.</p></div>
    {{ end }}
  </div>
  {{ template "_internal/pagination.html" . }}
</section>
{{ end }}
EOT

cat <<EOT > "$THEME_ROOT/layouts/index.json"
{
    "version": "https://jsonfeed.org/version/1",
    "title": "{{ .Site.Title }}",
    "home_page_url": "{{ .Site.BaseURL }}",
    "feed_url": "{{ .Permalink }}",
    "items": [
        {{ range \$index, \$element := .Site.RegularPages }}{{ if \$index }},{{ end }}
        {
            "id": "{{ .Permalink }}",
            "url": "{{ .Permalink }}",
            "title": "{{ .Title }}",
            "content_html": {{ .Content | jsonify }},
            "date_published": "{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}"
        }
        {{ end }}
    ]
}
EOT

cat <<EOT > "$THEME_ROOT/layouts/_default/list.html"
{{ define "main" }}
<section class="list-feed h-feed">
  <div class="headline-row">{{ partial "ui/chip.html" . }}<h1 class="p-name">{{ .Title }}</h1></div>
  {{ with .Content }}<div class="section-intro p-summary">{{ . }}</div>{{ end }}
  <div class="post-feed">
    {{ range .Paginator.Pages }}
      <article class="feed-item outlined-card h-entry {{ .Type }}">
        <div style="display: none;" class="p-author h-card"><a href="{{ .Site.BaseURL }}" class="u-url p-name">{{ .Site.Params.author.name }}</a></div>
        <header class="feed-header">
          <div class="headline-row">{{ partial "ui/chip.html" . }}<h2 class="p-name"><a href="{{ .Permalink }}" class="u-url">{{ .Title }}</a></h2></div>
          <time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">{{ .Date.Format "Jan 02, 2006" }}</time>
        </header>
        {{ if .Params.reply_to }}<div class="context-mini">↪ Replying to <a href="{{ .Params.reply_to }}" class="u-in-reply-to">{{ .Params.reply_to | truncate 40 }}</a></div>{{ end }}
        {{ if .Params.like_of }}<div class="context-mini">♥ Liked <a href="{{ .Params.like_of }}" class="u-like-of">{{ .Params.like_of | truncate 40 }}</a></div>{{ end }}
        {{ if .Params.repost_of }}<div class="context-mini">↻ Reposted <a href="{{ .Params.repost_of }}" class="u-repost-of">{{ .Params.repost_of | truncate 40 }}</a></div>{{ end }}
        {{ if .Params.bookmark_of }}<div class="context-mini">🔖 Bookmarked <a href="{{ .Params.bookmark_of }}" class="u-bookmark-of">{{ .Params.bookmark_of | truncate 40 }}</a></div>{{ end }}
        {{ if .Params.rsvp }}<div class="context-mini">📅 RSVP: <span class="p-rsvp">{{ .Params.rsvp | upper }}</span></div>{{ end }}
        <div class="feed-content p-summary">{{ if .Params.summary }}{{ .Params.summary }}{{ else }}{{ .Content | truncate 500 }}{{ end }}</div>
      </article>
    {{ end }}
  </div>
  {{ template "_internal/pagination.html" . }}
</section>
{{ end }}
EOT

cat <<EOT > "$THEME_ROOT/layouts/_default/list.json"
{
    "version": "https://jsonfeed.org/version/1",
    "title": "{{ .Title }} | {{ .Site.Title }}",
    "home_page_url": "{{ .Site.BaseURL }}",
    "feed_url": "{{ .Permalink }}",
    "items": [
        {{ range \$index, \$element := .Paginator.Pages }}{{ if \$index }},{{ end }}
        {
            "id": "{{ .Permalink }}",
            "url": "{{ .Permalink }}",
            "title": "{{ .Title }}",
            "content_html": {{ .Content | jsonify }},
            "date_published": "{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}"
        }
        {{ end }}
    ]
}
EOT

cat <<EOT > "$THEME_ROOT/layouts/_default/single.html"
{{ define "main" }}
<article class="single-post h-entry outlined-card">
  <div style="display: none;" class="p-author h-card"><a href="{{ .Site.BaseURL }}" class="u-url p-name">{{ .Site.Params.author.name }}</a><img src="{{ .Site.Params.author.photo | absURL }}" class="u-photo" alt="{{ .Site.Params.author.name }}"></div>
  <header class="post-header">
    <div class="headline-row">{{ partial "ui/chip.html" . }}<h1 class="p-name">{{ .Title }}</h1></div>
    <a href="{{ .Permalink }}" class="u-url" style="text-decoration: none; color: inherit;"><time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">{{ .Date.Format "January 2, 2006" }}</time></a>
  </header>

  {{ if .Params.reply_to }}<div class="context-block reply-context"><p>Replying to: <a href="{{ .Params.reply_to }}" class="u-in-reply-to">{{ .Params.reply_to }}</a></p></div>{{ end }}
  {{ if .Params.like_of }}<div class="context-block like-context"><p>Liked: <a href="{{ .Params.like_of }}" class="u-like-of">{{ .Params.like_of }}</a></p></div>{{ end }}
  {{ if .Params.repost_of }}<div class="context-block repost-context"><p>Reposted: <a href="{{ .Params.repost_of }}" class="u-repost-of">{{ .Params.repost_of }}</a></p></div>{{ end }}
  {{ if .Params.bookmark_of }}<div class="context-block bookmark-context"><p>Bookmarked: <a href="{{ .Params.bookmark_of }}" class="u-bookmark-of">{{ .Params.bookmark_of }}</a></p></div>{{ end }}
  {{ if and .Params.rsvp .Params.reply_to }}<div class="context-block rsvp-context"><p>RSVP: <span class="p-rsvp">{{ .Params.rsvp | upper }}</span> to <a href="{{ .Params.reply_to }}" class="u-in-reply-to">{{ .Params.reply_to }}</a></p></div>{{ end }}

  <div class="e-content">{{ .Content }}</div>

  <footer class="post-footer">
    {{ if .Params.syndication }}
    <div class="syndication-container"><span class="syndication-label">Also on:</span>
      <ul class="syndication-list" style="display: inline; padding: 0; list-style: none;">
        {{ range .Params.syndication }}
          {{ \$synURL := . }}{{ \$match := false }}{{ \$name := "" }}
          {{ range \$.Site.Params.social }}{{ if in \$synURL .url }}{{ \$match = true }}{{ \$name = .name }}{{ end }}{{ end }}
          <li style="display: inline; margin-right: 12px;"><a href="{{ \$synURL }}" class="u-syndication" rel="syndication">{{ if \$match }}{{ \$name }}{{ else }}{{ replaceRE "^https?://([^/]+).*" "\$1" \$synURL }}{{ end }}</a></li>
        {{ end }}
      </ul>
    </div>
    {{ end }}
    {{ if .Params.tags }}<ul class="tags">{{ range .Params.tags }}<li><a href="{{ "/tags/" | relLangURL }}{{ . | urlize }}" class="p-category">#{{ . }}</a></li>{{ end }}</ul>{{ end }}
  </footer>
</article>

{{ if .Params.show_webmentions }}
<section id="webmentions" class="webmentions-container outlined-card" data-target="{{ .Permalink }}" aria-labelledby="mentions-heading">
  <h2 id="mentions-heading">Webmentions</h2>
  <div class="webmention-explainer"><p>Have your say. Write a post on your own site and link to <code>{{ .Permalink }}</code> to appear here!</p></div>
  <div id="webmentions-list"><p>Loading...</p></div>
</section>
{{ end }}
{{ end }}
EOT

cat <<EOT > "$THEME_ROOT/layouts/_default/search.html"
{{ define "main" }}
<section class="search-page outlined-card h-entry">
  <div style="display: none;"><div class="p-author h-card"><a href="{{ .Site.BaseURL }}" class="u-url p-name">{{ .Site.Params.author.name }}</a><img src="{{ .Site.Params.author.photo | absURL }}" class="u-photo" alt="{{ .Site.Params.author.name }}"></div><a href="{{ .Permalink }}" class="u-url"></a><time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">{{ .Date }}</time><span class="p-category">Search</span></div>
  <header class="page-header"><div class="headline-row">{{ partial "ui/chip.html" . }}<h1 class="p-name">Search</h1></div></header>
  <div id="search" role="search"></div>
</section>
<link href="/pagefind/pagefind-ui.css" rel="stylesheet">
<script src="/pagefind/pagefind-ui.js"></script>
<script>window.addEventListener('DOMContentLoaded', (event) => { new PagefindUI({ element: "#search", showSubResults: true }); });</script>
{{ end }}
EOT

cat <<EOT > "$THEME_ROOT/layouts/404.html"
{{ define "main" }}
<section class="error-page outlined-card">
  <h1>404: Page Not Found</h1>
  <p>Sorry, the page you are looking for has moved or does not exist.</p>
  <div class="recovery-actions">
    <a href="/" class="button-primary">Back to Home</a>
    <div class="search-recovery"><p>Or try searching for it:</p><div id="search"></div></div>
  </div>
</section>
<link href="/pagefind/pagefind-ui.css" rel="stylesheet">
<script src="/pagefind/pagefind-ui.js"></script>
<script>window.addEventListener('DOMContentLoaded', (event) => { new PagefindUI({ element: "#search", showSubResults: true }); });</script>
{{ end }}
EOT

cat <<EOT > "$THEME_ROOT/layouts/pages/guestbook.html"
{{ define "main" }}
<section class="guestbook-page outlined-card h-entry">
  <div style="display: none;"><div class="p-author h-card"><a href="{{ .Site.BaseURL }}" class="u-url p-name">{{ .Site.Params.author.name }}</a><img src="{{ .Site.Params.author.photo | absURL }}" class="u-photo" alt="{{ .Site.Params.author.name }}"></div><a href="{{ .Permalink }}" class="u-url"></a><time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">{{ .Date }}</time><span class="p-category">Guestbook</span></div>
  <header class="page-header">
    <div class="headline-row">{{ partial "ui/chip.html" . }}<h1 class="p-name">Guestbook</h1></div>
    <p class="p-summary">{{ .Site.Params.webmentions.guestbookIntro }}</p>
  </header>
  <div class="e-content">{{ .Content }}</div>
  <footer class="post-footer">
    {{ if .Params.syndication }}
    <div class="syndication-container"><span class="syndication-label">Also on:</span>
      <ul class="syndication-list" style="display: inline; padding: 0; list-style: none;">
        {{ range .Params.syndication }}
          {{ \$synURL := . }}{{ \$match := false }}{{ \$name := "" }}
          {{ range \$.Site.Params.social }}{{ if in \$synURL .url }}{{ \$match = true }}{{ \$name = .name }}{{ end }}{{ end }}
          <li style="display: inline; margin-right: 12px;"><a href="{{ \$synURL }}" class="u-syndication" rel="syndication">{{ if \$match }}{{ \$name }}{{ else }}{{ replaceRE "^https?://([^/]+).*" "\$1" \$synURL }}{{ end }}</a></li>
        {{ end }}
      </ul>
    </div>
    {{ end }}
    {{ if .Params.tags }}<ul class="tags">{{ range .Params.tags }}<li><a href="{{ "/tags/" | relLangURL }}{{ . | urlize }}" class="p-category">#{{ . }}</a></li>{{ end }}</ul>{{ end }}
  </footer>
</section>
<section id="webmentions" class="webmentions-container outlined-card h-feed" data-target="{{ .Site.BaseURL }}" aria-labelledby="guestbook-heading">
  <h2 id="guestbook-heading">Signatures</h2>
  <div class="webmention-explainer"><p>This guestbook is powered by Webmentions. Write a post on your own site and link to <code>{{ .Site.BaseURL }}</code> to appear here!</p></div>
  <div id="webmentions-list"><p>Loading recent signatures...</p></div>
</section>
{{ end }}
EOT

cat <<EOT > "$THEME_ROOT/layouts/pages/contact.html"
{{ define "main" }}
<section class="contact-page outlined-card h-entry">
  <div style="display: none;"><div class="p-author h-card"><a href="{{ .Site.BaseURL }}" class="u-url p-name">{{ .Site.Params.author.name }}</a><img src="{{ .Site.Params.author.photo | absURL }}" class="u-photo" alt="{{ .Site.Params.author.name }}"></div><a href="{{ .Permalink }}" class="u-url"></a><time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">{{ .Date }}</time><span class="p-category">Contact Form</span></div>
  <header class="page-header">
    <div class="headline-row">{{ partial "ui/chip.html" . }}<h1 class="p-name">Contact Me</h1></div>
    <p class="p-summary">{{ .Site.Params.contact.intro }}</p>
  </header>
  <div class="e-content">{{ .Content }}</div>
  {{ if .Params.tags }}<footer class="post-footer"><ul class="tags">{{ range .Params.tags }}<li><a href="{{ "/tags/" | relLangURL }}{{ . | urlize }}" class="p-category">#{{ . }}</a></li>{{ end }}</ul></footer>{{ end }}
  <form action="{{ .Site.Params.contact.formAction }}" method="POST" class="contact-form" aria-label="Contact Form">
    <div class="form-group"><label for="name">Name</label><input type="text" id="name" name="name" required></div>
    <div class="form-group"><label for="email">Email</label><input type="email" id="email" name="email" required></div>
    <div class="form-group"><label for="message">Message</label><textarea id="message" name="message" rows="5" required></textarea></div>
    <button type="submit" class="button-primary">Send Message</button>
  </form>
</section>
{{ end }}
EOT

# Shortcodes
cat <<EOT > "$THEME_ROOT/layouts/shortcodes/youtube.html"
{{ \$id := .Get 0 }}{{ \$title := .Get 1 | default "Play Video" }}
<div class="youtube-lite outlined-card" data-id="{{ \$id }}" role="button" tabindex="0" aria-label="{{ \$title }}" title="{{ \$title }}">
  <img src="https://img.youtube.com/vi/{{ \$id }}/maxresdefault.jpg" alt="Video Thumbnail" loading="lazy">
  <div class="play-button" aria-hidden="true"></div>
</div>
EOT

cat <<EOT > "$THEME_ROOT/layouts/shortcodes/gallery.html"
{{ \$match := .Get "match" | default "gallery/*" }}
{{ \$images := .Page.Resources.Match \$match }}
{{ if \$images }}
<div class="md-gallery-grid">
  {{ range \$images }}
    {{ \$thumb := .Fill "600x600 Center webp" }}
    {{ \$altText := .Params.alt | default .Title | default .Name }}
    <a href="{{ .RelPermalink }}" class="gallery-item" target="_blank" aria-label="View full size: {{ \$altText }}">
      <img src="{{ \$thumb.RelPermalink }}" alt="{{ \$altText }}" width="{{ \$thumb.Width }}" height="{{ \$thumb.Height }}" loading="lazy">
    </a>
  {{ end }}
</div>
{{ else }}<p class="error">No images found for gallery match: {{ \$match }}</p>{{ end }}
EOT

cat <<EOT > "$THEME_ROOT/layouts/shortcodes/mastodon.html"
{{ \$host := .Get "host" }}
{{ \$id := .Get "id" }}
{{ if and \$host \$id }}
  {{ \$apiURL := printf "https://%s/api/v1/statuses/%s" \$host \$id }}
  {{ \$data := dict }}
  {{ \$response := resources.GetRemote \$apiURL }}
  {{ if \$response }}
    {{ if eq \$response.StatusCode 200 }}
      {{ \$data = \$response.Content | transform.Unmarshal }}
    {{ else }}
      <div class="mastodon-card error outlined-card"><p><strong>Error:</strong> Could not fetch Mastodon post (Status {{ \$response.StatusCode }}).</p><p><a href="https://{{ \$host }}/@{{ \$id }}">View Original on {{ \$host }}</a></p></div>
    {{ end }}
  {{ else }}
    <div class="mastodon-card error outlined-card"><p><strong>Error:</strong> Unable to reach Mastodon instance ({{ \$host }}).</p></div>
  {{ end }}
  {{ if \$data }}
    <article class="mastodon-card outlined-card" lang="{{ \$data.language | default "en" }}">
      <header class="mastodon-header">
        <div class="mastodon-author">
          {{ \$avatar := resources.GetRemote \$data.account.avatar }}
          {{ if \$avatar }}{{ if \$avatar.Err }}<div class="u-photo-placeholder">?</div>{{ else }}<img src="{{ \$avatar.RelPermalink }}" alt="" class="u-photo" width="48" height="48" loading="lazy">{{ end }}{{ else }}<div class="u-photo-placeholder">?</div>{{ end }}
          <div class="author-meta">
            <a href="{{ \$data.account.url }}" class="p-name u-url" target="_blank" rel="noopener noreferrer"><strong>{{ \$data.account.display_name | default \$data.account.username }}</strong></a>
            <span class="p-nickname">@{{ \$data.account.username }}@{{ \$host }}</span>
          </div>
        </div>
        <div class="mastodon-logo" aria-label="Mastodon Post">{{ partial "icons/mastodon.svg" . }}</div>
      </header>
      <div class="e-content">{{ \$data.content | safeHTML }}</div>
      {{ if \$data.media_attachments }}
      <div class="mastodon-media">
        {{ range \$data.media_attachments }}{{ if eq .type "image" }}{{ \$img := resources.GetRemote .url }}{{ if \$img }}{{ if not \$img.Err }}<img src="{{ \$img.RelPermalink }}" alt="{{ .description | default "Attached image" }}" loading="lazy">{{ end }}{{ end }}{{ end }}{{ end }}
      </div>
      {{ end }}
      <footer class="mastodon-footer">
        <time class="dt-published" datetime="{{ \$data.created_at }}">{{ dateFormat "Jan 02, 2006" \$data.created_at }}</time>
        <div class="mastodon-stats"><span>↩ {{ \$data.replies_count }}</span><span>↻ {{ \$data.reblogs_count }}</span><span>♥ {{ \$data.favourites_count }}</span></div>
        <a href="{{ \$data.url }}" class="button-small" target="_blank" rel="noopener noreferrer">View Original</a>
      </footer>
    </article>
  {{ end }}
{{ else }}<p class="error"><strong>Mastodon Shortcode Error:</strong> Missing 'host' or 'id' parameter.</p>{{ end }}
EOT

# ==============================================================================
# 7. CONTENT (Pages & Indices)
# ==============================================================================
echo "Generating Content..."

cat <<EOT > "content/articles/_index.md"
---
title: "Articles"
description: "Long-form thoughts and essays."
sort_by: "date"
sort_order: "desc"
---

Welcome to my long-form writing. Here you'll find essays, stories, and deep dives that need a bit more space than a quick note. Grab a cup of coffee and settle in.
EOT

cat <<EOT > "content/status/_index.md"
---
title: "Status Updates"
description: "Quick notes and life updates."
sort_by: "date"
sort_order: "desc"
---

These are my "micro-posts"—similar to tweets. Expect quick life updates, random thoughts, and behind-the-scenes moments. Short, sweet, and to the point.
EOT

cat <<EOT > "content/replies/_index.md"
---
title: "Replies"
description: "Conversations and responses across the web."
sort_by: "date"
sort_order: "desc"
---

The web is all about conversation. This page collects my responses to posts from other people around the internet. It’s the other half of the dialogue.
EOT

cat <<EOT > "content/reposts/_index.md"
---
title: "Reposts"
description: "Things I found worth sharing."
sort_by: "date"
sort_order: "desc"
---

Sharing is caring. These are posts from other creators that I found valuable, funny, or important enough to boost on my own site.
EOT

cat <<EOT > "content/likes/_index.md"
---
title: "Likes"
description: "Content I appreciated."
sort_by: "date"
sort_order: "desc"
---

A digital nod of appreciation. This is a collection of content I’ve "liked" from around the web—think of it as a public log of things that made me smile or think.
EOT

cat <<EOT > "content/bookmarks/_index.md"
---
title: "Bookmarks"
description: "Links saved for later reference."
sort_by: "date"
sort_order: "desc"
---

My personal library of links. These are articles, tools, and sites I’ve saved for future reference. Feel free to browse through my reading list.
EOT

cat <<EOT > "content/rsvps/_index.md"
---
title: "RSVPs"
description: "Events I am attending or tracking."
sort_by: "date"
sort_order: "desc"
---

My social calendar. This tracks public events I’ve responded to, whether I'm attending in person, watching online, or just interested.
EOT

cat <<EOT > "content/pages/about/index.md"
---
title: "About"
date: $(date +%Y-%m-%dT%H:%M:%S%z)
summary: "A little bit about me."
---

## Hello, I'm Gregory.

I am a web designer and developer based in **Burien, Washington**. 

This site is built with the **Accessible-MD** theme, focusing on:
* **Accessibility:** Strict adherence to WCAG 2.2 AA standards.
* **IndieWeb:** Owning my own data and social interactions.
* **Simplicity:** Using static HTML/CSS over heavy JavaScript frameworks.

### My Tools
* **Engine:** Hugo Extended
* **Design:** Material Design 3 (Outlined)
* **Search:** Pagefind
EOT

cat <<EOT > "content/pages/contact/index.md"
---
title: "Contact"
layout: "contact"
date: $(date +%Y-%m-%dT%H:%M:%S%z)
summary: "A contact form where visitors can get in touch with the author"
---
EOT

cat <<EOT > "content/pages/guestbook/index.md"
---
title: "Guestbook"
layout: "guestbook"
date: $(date +%Y-%m-%dT%H:%M:%S%z)
summary: "A place to collect webmentions from around the IndieWeb that are not tied to a particular post or page"
syndication: []
---
EOT

cat <<EOT > "content/pages/search/index.md"
---
title: "Search"
date: $(date +%Y-%m-%dT%H:%M:%S%z)
layout: "search"
summary: "A page where visitors can search this website"
---
EOT

# ==============================================================================
# 8. UTILITIES (As-Is Reproduction)
# ==============================================================================
echo "Generating Utilities..."

cat <<'GENERATOR' > generate_icons.sh
#!/bin/bash
# ==============================================================================
# SCRIPT: generate_icons.sh (STABILITY MODE)
# PURPOSE: Fetch essential SVGs.
#          - Social Links are now Text-Only (no icons needed).
#          - Mastodon Shortcode STILL NEEDS mastodon.svg.
# ==============================================================================

ICON_DIR="themes/Accessible-MD/layouts/partials/icons"
mkdir -p "$ICON_DIR"

# 1. System Icons (Material Symbols)
declare -A SYSTEM_ICONS=(
    ["search"]="search"
    ["menu"]="menu"
    ["close"]="close"
    ["home"]="home"
    ["articles"]="article"
    ["status"]="chat_bubble"
    ["replies"]="reply"
    ["reposts"]="repeat"
    ["likes"]="favorite"
    ["bookmarks"]="bookmark"
    ["rsvps"]="event"
    ["guestbook"]="import_contacts"
    ["contact"]="mail"
    ["about"]="info"
    ["pages"]="description"
    ["categories"]="category" 
    ["tags"]="label"
    ["content_copy"]="content_copy"
    ["check"]="check"
)

echo "--- Updating System Icons ---"
for NAME in "${!SYSTEM_ICONS[@]}"; do
    MATERIAL_NAME="${SYSTEM_ICONS[$NAME]}"
    TARGET="$ICON_DIR/$NAME.svg"
    
    if [ ! -f "$TARGET" ]; then
        echo "Fetching $NAME..."
        URL="https://raw.githubusercontent.com/google/material-design-icons/master/symbols/web/${MATERIAL_NAME}/materialsymbolsoutlined/${MATERIAL_NAME}_24px.svg"
        
        if curl -s -L -f "$URL" -o "$TARGET"; then
             echo "  ✓ OK"
        else
             echo "  X ERROR: Could not fetch '$MATERIAL_NAME'."
             rm -f "$TARGET"
        fi
    fi
done

# 2. Essential Brand Icons (Manual List)
# We only fetch what is strictly required by Shortcodes/Layouts.
# We skip the social loop to avoid CI failures.

MASTODON_TARGET="$ICON_DIR/mastodon.svg"
if [ ! -f "$MASTODON_TARGET" ]; then
    echo "Fetching Essential Brand: Mastodon..."
    # Use Simple Icons CDN as primary, fallback to raw if needed
    if curl -s -L -f "https://cdn.simpleicons.org/mastodon" -o "$MASTODON_TARGET"; then
        echo "  ✓ OK"
    else
        echo "  X Failed to fetch Mastodon icon."
        # Create blank to prevent build crash
        echo '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none"/></svg>' > "$MASTODON_TARGET"
    fi
fi

echo "Icon generation complete."
GENERATOR
chmod +x generate_icons.sh

cat <<'NEWPOST' > new_post.sh
#!/bin/bash
# ==============================================================================
# SCRIPT: new_post.sh
# PURPOSE: Automate content creation with dynamic directory naming (Slug vs Timestamp)
# CONTEXT: Source [156-169] - Scripting & Automation Standards
# AUTHOR: Lead Web Designer (Gemini) for Greg's Place
# ==============================================================================

# Check for arguments
if [ -z "$1" ]; then
  echo "Error: Content Type is required."
  echo "Usage: ./new_post.sh [type] \"[optional title]\""
  echo "Types: articles, status, replies, reposts, likes, bookmarks, rsvps"
  exit 1
fi

TYPE=$1
TITLE=$2

# Normalize Type (remove trailing slashes if present)
TYPE=${TYPE%/}

# ------------------------------------------------------------------------------
# LOGIC BLOCK: Validate Title Requirements
# [Source: 166] Articles & Bookmarks: Title is Required.
# ------------------------------------------------------------------------------
if [[ "$TYPE" == "articles" || "$TYPE" == "bookmarks" ]]; then
  if [ -z "$TITLE" ]; then
    echo "Error: Title is REQUIRED for '$TYPE'."
    exit 1
  fi
fi

# ------------------------------------------------------------------------------
# LOGIC BLOCK: Determine Directory Name
# ------------------------------------------------------------------------------

DIR_NAME=""

if [ -n "$TITLE" ]; then
  # [Source: 166, 168] If Title provided: Use slug-based directory.
  # Convert title to slug (lowercase, replace spaces/symbols with hyphens)
  # Standardizing on a simple sed/tr chain for portability.
  SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed -e 's/[^a-z0-9]/-/g' -e 's/-\+/-/g' -e 's/^-\|-$//g')
  DIR_NAME="$SLUG"
else
  # [Source: 169] If Title omitted: Use Timestamp-based directory.
  # Format: YYYY-MM-DD-HHMM
  TIMESTAMP=$(date +%Y-%m-%d-%H%M)
  DIR_NAME="$TIMESTAMP"
fi

# ------------------------------------------------------------------------------
# LOGIC BLOCK: Execute Hugo Command
# [Source: 82] All content files must use "Leaf Bundles" (directory + index.md).
# ------------------------------------------------------------------------------

TARGET_PATH="$TYPE/$DIR_NAME/index.md"

echo "Creating new $TYPE..."
echo "Path: content/$TARGET_PATH"

# Execute Hugo new command
# We explicitly set --kind to ensure the correct archetype is used from the theme.
hugo new content "$TARGET_PATH" --kind "$TYPE"

echo "Done."
NEWPOST
chmod +x new_post.sh

cat <<'DEBUGSERVER' > debug_server.sh
#!/bin/bash
# ==============================================================================
# SCRIPT: debug_server.sh
# PURPOSE: Run Hugo in background and trap all errors to a file
# USAGE: ./debug_server.sh
# ==============================================================================

LOG_FILE="errors.txt"

# 1. Cleanup: Stop any existing Hugo servers to free up Port 1313
# We silence the output in case no server is running.
pkill hugo > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Stopped previous Hugo instance."
fi

# 2. Setup: clear the old log file so you see fresh errors only
echo "--- New Session: $(date) ---" > "$LOG_FILE"

echo "Starting Hugo Server..."

# 3. Execution:
# -D -E -F: Your standard Drafts/Expired/Future flags
# --disableFastRender: Ensures full rebuilds (slower but more accurate for errors)
# --gc: Garbage Collection (Matches your build pipeline Source [181])
# --printI18nWarnings: catch missing translation strings
# > "$LOG_FILE" 2>&1: Redirects BOTH stdout and stderr to the text file
hugo server \
  --disableFastRender \
  -D -E -F \
  --gc \
  --printI18nWarnings \
  > "$LOG_FILE" 2>&1 &

# Capture the Process ID of the last command (Hugo)
HUGO_PID=$!

echo "✅ Hugo is running in the background (PID: $HUGO_PID)."
echo "📄 Logs are being captured in '$LOG_FILE'."
echo "To stop the server, run: kill $HUGO_PID"
DEBUGSERVER
chmod +x debug_server.sh

# ==============================================================================
# 9. ROOT FILES (Updated Documentation)
# ==============================================================================
echo "Generating Root Files..."

cat <<EOT > ".gitignore"
# Build Artifacts
/public
/resources

# Environment & Dependencies
.DS_Store
.env
node_modules/

# Hugo Cache
.hugo_build.lock
# Build error log
errors.txt
EOT

echo "simplygregario.us" > "$THEME_ROOT/static/CNAME"

cat <<EOT > "LICENSE"
MIT License

Copyright (c) $(date +%Y) Gregory Lopez

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOT

# Updated README.md
cat <<EOT > "README.md"
# Greg's Place

An IndieWeb-focused, accessible static site built with Hugo.

## 1. Project Overview
This project is a static site designed with a focus on **Accessibility (WCAG 2.2 AA)** and **IndieWeb** principles. It uses the custom **"Accessible-MD"** theme, which implements Material Design 3 concepts using zero-JS styling and "Outlined Cards" for high contrast.

### Key Design Features
* **Inline Headers:** Category chips (using semantic icons) are aligned inline with post titles.
* **Privacy First:** Media embeds use "Static Facades" (click-to-load or build-time fetch) to prevent third-party tracking.
* **Utility Pages:** Guestbook and Contact pages use specific microformats to support IndieWeb discovery while maintaining a clean UI.
* **Stability:** Social links are text-only to prevent build failures from external icon APIs.

## 2. Cheat Sheet (Script Usage)

### Content Creation
Use the \`new_post.sh\` script to generate content.
**Usage:** \`./new_post.sh [type] "[optional title]"\`

| Type | Title | Folder Strategy | Notes |
| :--- | :--- | :--- | :--- |
| **articles** | **Required** | Slug (e.g., \`/my-post/\`) | Long-form essays. |
| **bookmarks** | **Required** | Slug (e.g., \`/cool-tool/\`) | Saved links. Requires \`bookmark_of\` URL. |
| **status** | Optional | Timestamp* | Quick notes. |
| **replies** | Optional | Timestamp* | Responses. Requires \`reply_to\` URL. |
| **reposts** | Optional | Timestamp* | Shares. Requires \`repost_of\` URL. |
| **likes** | Optional | Timestamp* | Appreciations. Requires \`like_of\` URL. |
| **rsvps** | Optional | Timestamp* | Events. Requires \`rsvp\` status & \`reply_to\`. |

***Quirk (Timestamp Fallback):** For optional types, if you omit the title, the script automatically creates a timestamp-based directory.

### Working with Images
This site uses an advanced image engine that automatically optimizes files.

**1. Single Images**
Just use standard Markdown. The system will automatically generate responsive WebP versions and styled captions.
\`\`\`markdown
![Alt text](my-photo.jpg "This caption appears below the image")
\`\`\`

**2. Galleries**
To display a grid of images, use the gallery shortcode.
**Step A: Map Metadata** (In your post's front matter)
\`\`\`toml
[[resources]]
  src = "images/photo1.jpg"
  [resources.params]
    alt = "A detailed description for screen readers"
\`\`\`
**Step B: Insert Shortcode**
\`\`\`markdown
{{< gallery match="images/*" >}}
\`\`\`

### Accessible Data Tables
Data tables must include a **Caption**. Use the attribute syntax on the line immediately following the table:
\`\`\`markdown
| Date | Event |
| :--- | :--- |
| Nov 24 | Meetup |
{caption="Upcoming Events"}
\`\`\`

## 3. Shortcode Reference

### YouTube (Lite Facade)
Embeds a static thumbnail.
\`\`\`go
{{< youtube "VIDEO_ID" "Descriptive Title" >}}
\`\`\`

### Mastodon (Static Facade)
Fetches the post content at **build time** and renders it as static HTML.
\`\`\`go
{{< mastodon host="mastodon.social" id="123456789" >}}
\`\`\`

## 4. Installation (Reproduction)
To reproduce this environment on a fresh machine, run the setup_project.sh script.

## 5. Deployment
This site deploys via **GitHub Actions** to GitHub Pages.
* **Trigger:** Push to \`main\`.
* **Process:** Icon Generation -> Hugo Build (Minified) -> Pagefind Indexing -> Deploy.
* **Domain:** \`simplygregario.us\` (CNAME is stored in \`themes/Accessible-MD/static/\`).

## 6. License
* **Codebase:** MIT License (See \`LICENSE\` file).
* **Content:** [Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)](http://creativecommons.org/licenses/by-sa/4.0/).
EOT

# Updated project_context.txt
cat <<EOT > "project_context.txt"
# Project Context: Greg's Place

## CONFIGURATION SPECIFICATION & GLOBAL PARAMETERS
This section defines the required structure for the \`config/_default/\` files.
All settings must include comments explaining their function and default values.
### 1. Main Configuration (hugo.toml)
* Base URL: \`https://simplygregario.us\`
* Title: "Greg's Place"
* Theme: "Accessible-MD"
* Language Code: "en-us"
* Permalinks:
    * \`pages = "/:slug/"\` (Critical: Ensures /about/ works at root).
    * \`articles = "/articles/:year-:month-:day/:slug/"\`
    * \`status = "/status/:year-:month-:day/:contentbasename/"\`
    * \`replies = "/replies/:year-:month-:day/:contentbasename/"\`
    * \`reposts = "/reposts/:year-:month-:day/:contentbasename/"\`
    * \`likes = "/likes/:year-:month-:day/:contentbasename/"\`
    * \`bookmarks = "/bookmarks/:year-:month-:day/:contentbasename/"\`
    * \`rsvps = "/rsvps/:year-:month-:day/:contentbasename/"\`
* Pagination: \`pagerSize = 10\`
* Outputs: Home and Section must output \`["HTML", "RSS", "JSON"]\` for feed syndication.
### 2. Parameters (params.toml)
* [author]
    * \`name\`: "Gregory Lopez"
    * \`bio\`: Short plain-text bio for H-Card meta tags.
    * \`photo\`: "images/profile_photo.jpg" (Refers to physical file: themes/Accessible-MD/assets/images/profile_photo.jpg)
    * \`[author.location]\`: City (Burien), State (Washington), Country (USA).
* [webmentions]
    * \`enable\`: true
    * \`show_webmentions\`: true (Global Default).
    * \`username\`: "simplygregario.us" # This is the webmention.io username.
    * \`guestbookIntro\`: "Welcome to the Guestbook!"
* [contact]
    * \`formAction\`: (e.g., Formspree URL)
    * \`intro\`: "Have a question or just want to say hi? Send me a message!"
* [theme]
    * \`colorScheme\`: Options: "sound", "market", "mountain", "forest", "sunset".
* [[social]] & [[im]] (Repeated Blocks for H-Card)
    * Display Strategy: Text-Only Links ("Name: @Handle") for maximum accessibility and stability.
    * Required Keys: \`name\`, \`handle\`, \`url\`, \`rel\`.

### 3. Menus (menus.toml)
* Structure: \`[[main]]\` array with 100-level weight spacing.
* Order: Home (100), About (150), Articles (200), Status (300), Replies (400), Reposts (500), Likes (600), Bookmarks (700), RSVPs (800), Guestbook (900), Contact (1000), Search (1100).
### 4. Markup (markup.toml)
* [goldmark.renderer]: \`unsafe = false\` (Strict Security Policy).
* [goldmark.parser]: \`attribute = { block = true, title = true }\` (Required for Accessible Table captions).
* [highlight]: \`style = "monokai"\`, \`lineNos = false\`, \`noClasses = false\`.
---

## CORE ARCHITECTURE & PHILOSOPHY

* Priority: Strict adherence to W3C Standards, WCAG 2.2 AA Accessibility, and IndieWeb principles.
* Engine: Hugo Extended.
* Theme Structure: All functional code (layouts, SCSS, JS) resides in \`themes/Accessible-MD/\`.
* Asset Strategy:
    * CNAME: Must live in \`themes/Accessible-MD/static/CNAME\`.
    (Note: Hugo copies this to the deployment root during build, satisfying GitHub's requirements).
    * Static Files: \`favicon.ico\` and other root assets live in \`themes/Accessible-MD/static/\`.
    * Icons: Functional UI icons (Material Symbols) are fetched dynamically. Brand icons are restricted to essential use cases (e.g., Mastodon shortcode) to prevent build fragility.
* Content Structure: Leaf Bundles (directory + \`index.md\`) for all content types to ensure asset colocation.
* License Strategy (Hybrid):
    * **Codebase:** The root \`LICENSE\` file must use the **MIT License**.
    * **Content:** All creative content (text, media) is licensed under **Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)**.
---

## CORE SITE TEMPLATES & LOGIC

### 1. Homepage (River of News)
* Layout: Profile Card -> "Latest Updates" Heading -> Feed Stream.
* Query: Fetches content from specific "Allowed Sections" (articles, status, replies, etc.) to prevent utility pages from leaking into the stream.
* H-Card: Full profile metadata (Bio, Location, Social, IM) displayed at the top.
* Image Processing: The theme must automatically crop the author photo to 500x500 WebP (\`Fit "500x500 Center webp"\`) for performance.
* Feed Logic: Uses standard Hugo pagination. If \`summary\` is missing, truncates body text to 500 chars.
### 2. Section Lists (Feed Pages)
* Template: \`layouts/_default/list.html\`
* Section Intros: The template MUST check for and render the content (\`{{ .Content }}\`) of the section's \`_index.md\` file immediately after the title.
This allows for user-friendly explanations of content types.
* Display: Outlined Cards with inline headers.
### 3. Single Post Layout
* Header: Inline layout where the Category Chip acts as a visual signpost next to the Title.
* Content: Standard body content.
* Context Blocks: If \`reply_to\`, \`like_of\`, etc., are present, they appear *above* the content.
* **Image Engine:**
    * **Single Images:** Uses a Render Hook (\`render-image.html\`) to intercept standard Markdown images.
    Automatically generates responsive \`srcset\` (WebP), adds lazy loading, and wraps in \`<figure>\` with \`<figcaption>\`.
    * **Galleries:** Uses a Shortcode (\`gallery.html\`) to display a responsive grid of Page Resources.
* **Accessible Tables:** Uses a Render Hook (\`render-table.html\`) to enforce captions and mobile responsiveness.
* **Smart Syndication:** Automatically converts known syndication URLs (matching \`params.toml\`) into clean text links (e.g., "Mastodon") instead of raw URLs.
* Webmentions: Must be rendered in a Distinct Card (\`<section class="outlined-card">\`) completely separate from the main \`<article>\` content.
### 4. Utility Pages
* **Guestbook:** Must act as an \`h-entry\` for the page itself, but an \`h-feed\` for the comments section. Includes Smart Syndication links.
**Critical:** Must support Syndication (POSSE) links in the footer, unlike standard pages.
* Search: Dedicated page (\`layouts/_default/search.html\`) initializing Pagefind UI.
* 404: User-friendly error page with a "Back to Home" button and an embedded search box.
---

## DOCUMENTATION & MAINTAINABILITY

* Source Code Documentation:
    * Headers: Major files must begin with a brief comment explaining the file's role.
    * Inline: Complex logic must have concise comments explaining the "Why."
* Archetypes & Frontmatter Standards:
    * \`lastmod\`: (ISO 8601) Required for SEO and RSS feed freshness.
    * \`summary\`: Required for Homepage display.
    * \`show_webmentions\`: Optional boolean to override global config.
    * IndieWeb Parameters: \`reply_to\`, \`like_of\`, \`repost_of\`, \`bookmark_of\`, \`rsvp\`.

---

## SHORTCODE STANDARDS & LIBRARY

* **Philosophy:** "Static Facades."
Shortcodes must NEVER inject third-party iframes or client-side scripts that track the user.
* **Implementation:** Fetches must happen at **Build Time** (using \`resources.GetRemote\`) to ensure privacy and performance.
* **Library:**
    1.  **YouTube (\`youtube\`):**
        * **Logic:** Loads a static thumbnail image.
        Only calls the privacy-enhanced YouTube API (\`youtube-nocookie.com\`) upon user click.
        * **Usage:** \`{{< youtube "VIDEO_ID" "Title for A11y" >}}\`
    2.  **Mastodon (\`mastodon\`):**
        * **Logic:** Fetches API JSON at build time.
        Downloads/proxies all images to local assets. Sanitizes HTML content.
        * **Usage:** \`{{< mastodon host="instance.url" id="123456789" >}}\`
    3.  **Gallery (\`gallery\`):**
        * **Logic:** Scans Page Resources for images matching a pattern.
        Generates 600x600 WebP thumbnails. Renders in a responsive grid.
        * **Usage:** \`{{< gallery match="images/*" >}}\`
        * **Accessibility:** Requires defining \`alt\` text in the page's \`resources\` front matter.
---

## DEVELOPMENT & AUTOMATION STANDARDS

* Toolchain: Hugo Extended (Version pinned in workflow), NodeJS (LTS).
* **Syntax Standards:**
    * Modern Hugo syntax only (e.g., use \`[pagination]\`, \`css.Sass\`).
    * **Constraint:** No backslashes (\\) allowed inside Hugo template variables.
* **CI/CD Pipeline (GitHub Actions):**
    * Trigger: Push to 'main'.
    * **Pre-Build:** \`./generate_icons.sh\` (Safe Mode: fetches System icons + specific required Brand icons).
    * Build Command: \`hugo --minify --gc\` (Garbage Collection enabled).
    * Post-Processing: \`npx pagefind --site public\` (Client-side indexing).
    * Deployment: \`actions/deploy-pages\`.
* Portability: Scripts must run on macOS/Linux with standard dependencies (Hugo, Node, Git).
* Regression Policy: Any regressions  must be avoided. If creating or modifying scripts, sanity checks must be performed to ensure regression free code. If potential regressions are detected, notification and an explanation of the potential regression are required before proceeding.
* \`new_post.sh\` Logic:
    * Articles/Bookmarks: Title is Required. Generates slug-based directory.
    * Status/Replies/etc: Title is Optional.
    * If Title provided -> Slug-based directory.
    * If Title omitted -> Timestamp-based directory (\`YYYY-MM-DD-HHMM\`).
* \`generate_icons.sh\`: Fetches Material Design system icons. Does NOT fetch dynamic social icons to ensure build stability.
* \`debug_server.sh\`: Runs Hugo with aggressive error logging (\`--printI18nWarnings\`, \`--disableFastRender\`) to a text file.
---

## PRIVACY & ACCESSIBILITY

* WCAG 2.2 AA: All interactive elements must meet contrast (4.5:1) and target size (24x24px) requirements.
* YouTube Facade: Videos must use the "Lite Facade" pattern (static image, click-to-load) to prevent tracking on page load.
---

## STYLING & UX (MATERIAL DESIGN 3)

### 1. Visual System
* Metaphor: "Outlined Cards." High contrast borders instead of shadows.
* Palette: MD3 Compliant (Primary/Secondary/Tertiary).
* Themes (PNW Inspired): Presets defined in \`_variables.scss\`.
    * "The Sound" (Default)
    * "The Market"
    * "The Mountain"
    * "The Forest"
    * "The Sunset"

### 2. Typography & Utilities
* Type Scale: Mapped to MD3 specs in \`_typography.scss\`.
* Code Blocks: Must use a Render Hook to wrap blocks in a container that includes a "Copy to Clipboard" button.
* **Tables:** Uses a Render Hook to enforce captions and mobile responsiveness (scroll wrapper).
* **Images:** Responsive figures with semantic captions and "Outlined Card" styling.
* Mobile Menu: "Hamburger" toggle using \`aria-expanded\` state management (no checkbox hacks).
---

## JAVASCRIPT POLICY & SECURITY PROTOCOL

* Principle: Minimal, purposeful JS.
* Approved Use Cases: Interaction Utilities (Menus), Webmentions, Copy Code.
* Webmentions Security (Client-Side Sanitization):
    * **Constraint:** Incoming HTML content must be parsed to prevent XSS.
    * **Allowlist:** Only semantic text tags (p, a, em, strong, blockquote) are permitted.
    * **Blocklist:** All script, iframe, object, and style tags must be stripped.
    * **Attribute Scrubbing:** All event handlers (e.g., onload, onclick) and javascript: URIs must be removed.
    * Valid href URLs must be preserved.
* Pagination Constraint: If fetch returns > 20 items, the display must paginate client-side using custom JS.
---

## PROJECT PHASING STATUS

* Phase 1 (Foundation): COMPLETE.
(Structure, Config, Archetypes, Base Layouts, SCSS).
* Phase 2 (Interaction): COMPLETE.
(Feeds, Webmentions, Search, Forms, Privacy Facade, Mobile Menu, Typography, Microformats, Static Shortcodes, Accessible Tables, Image Engine, Stability Refactor).
* Phase 3 (Deployment): COMPLETE. (GitHub Actions, CNAME, License).

### Script execution
The website can be built from scratch after running 'hugo new site [site name]' (replacing [Site Name] with your preferred folder name), switching to the newly created directory and importing the setup_project.sh script to your newly minted Hugo project's root. Make it executeable with 'chmod +x setup_project.sh' and then run it to begin.
EOT

cat <<EOT > ".github/workflows/hugo.yml"
# [Source: 178] CI/CD Pipeline
name: Deploy to GitHub Pages

on:
  # [Source: 179] Trigger: Push to 'main' branch.
  push:
    branches: ["main"]
  
  # Allows manual run from the Actions tab
  workflow_dispatch:

# Sets permissions of the GITHUB_TOKEN to allow deployment to GitHub Pages
permissions:
  contents: read
  pages: write
  id-token: write

# Allow only one concurrent deployment
concurrency:
  group: "pages"
  cancel-in-progress: false

# [Source: 176] Development & Environment
jobs:
  # Build Job
  build:
    runs-on: ubuntu-latest # [Source: 180]
    steps:
      - name: Checkout
        uses: actions/checkout@v4
        with:
          submodules: recursive

      - name: Setup Node
        uses: actions/setup-node@v4
        with:
          node-version: '20' # [Source: 177] NodeJS (LTS)
          cache: 'npm'

      - name: Install Dependencies
        run: npm ci

      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v3
        with:
          hugo-version: '0.152.2' # [Source: 177] Pinned to match local environment
          extended: true

      # --- NEW STEP: Generate Icons ---
      # This ensures SVG assets are downloaded before the site builds.
      - name: Generate Icons
        run: |
          chmod +x generate_icons.sh
          ./generate_icons.sh

      - name: Build with Hugo
        # [Source: 181] Garbage Collection and Minification enabled
        run: hugo --minify --gc

      - name: Build Search Index (Pagefind)
        # [Source: 182] Client-side search indexing
        run: npx pagefind --site public

      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: ./public

  # Deployment Job
  deploy:
    environment:
      name: github-pages
      url: \${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4 # [Source: 183]
EOT

echo "Master Setup Complete. 'Greg's Place' is ready for development."
