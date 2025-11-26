#!/bin/bash
# ==============================================================================
# SCRIPT: setup_project.sh (MASTER SNAPSHOT - V4.2)
# PURPOSE: Full Reproduction of "Greg's Place"
# RESTORED: Specific archetypes logic (Regression Fix).
# ADDED: Generators for Search, Contact, and Guestbook pages.
# ==============================================================================

echo "Initializing Greg's Place..."

# 1. DIRECTORY STRUCTURE
mkdir -p config/_default
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
mkdir -p content/articles content/status content/replies content/reposts content/likes content/bookmarks content/rsvps
mkdir -p content/pages/about content/pages/contact content/pages/guestbook content/pages/search content/pages/accessibility
mkdir -p .github/workflows

# 2. CONFIGURATION
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
  guestbookIntro = "Welcome to the Guestbook!"
[contact]
  formAction = "https://formspree.io/f/xblwegvw"
  intro = "Have a question or just want to say hi? Send me a message!"
[theme]
  colorScheme = "forest"
[[social]]
  name = "BlueSky"
  handle = "@somegregariousdude.bsky.social"
  url = "https://bsky.app/profile/somegregariousdude.bsky.social"
  rel = "nofollow"
  icon = "bluesky"
[[social]]
  name = "Facebook"
  handle = "somegregariousdude"
  url = "https://facebook.com/somegregariousdude"
  rel = "nofollow"
  icon = "facebook"
[[social]]
  name = "Friendica"
  handle = "@thegregariousdragon@social.trom.tf"
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
[[social]]
  name = "ReddIt"
  handle = "u/somegregariousdude"
  url = "https://reddit.com/u/somegregariousdude"
  rel = "nofollow"
  icon = "reddit"
[[social]]
  name = "YouTube"
  handle = "@somegregariousdude"
  url = "https://youtube.com/@somegregariousdude"
  rel = "nofollow"
  icon = "youtube"
[[im]]
  name = "Matrix"
  handle = "@gregarious:4d2.org"
  url = "https://matrix.to/#/@gregarious:4d2.org"
  rel = "nofollow"
  icon = "matrix"
[[im]]
  name = "Messenger"
  handle = "@somegregariousdude"
  url = "https://m.me/somegregariousdude"
  rel = "nofollow"
  icon = "messenger"
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

cat <<EOT > "config/_default/menus.toml"
[[main]]
  name = "Home"; url = "/"; weight = 100
[[main]]
  name = "About"; url = "/about/"; weight = 150
[[main]]
  name = "Articles"; url = "/articles/"; weight = 200
[[main]]
  name = "Status Updates"; url = "/status/"; weight = 300
[[main]]
  name = "Replies"; url = "/replies/"; weight = 400
[[main]]
  name = "Reposts"; url = "/reposts/"; weight = 500
[[main]]
  name = "Likes"; url = "/likes/"; weight = 600
[[main]]
  name = "Bookmarks"; url = "/bookmarks/"; weight = 700
[[main]]
  name = "RSVPs"; url = "/rsvps/"; weight = 800
[[main]]
  name = "Guestbook"; url = "/guestbook/"; weight = 900
[[main]]
  name = "Contact"; url = "/contact/"; weight = 1000
[[main]]
  name = "Search"; url = "/search/"; weight = 1100
EOT

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

# 3. CONTENT ARCHETYPES (Restored Individual Definitions)
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

# 4. CORE CONTENT PAGES (Including Utility Pages)
cat <<EOT > "content/pages/accessibility/index.md"
---
title: "Accessibility"
date: 2025-11-26T03:30:00-08:00
layout: "page"
summary: "My commitment to an open, usable web."
show_webmentions: false
---
## **The Philosophy**
Let’s be real: I’m blind. I use a screen reader every single day. I know exactly how frustrating it is when a website is nothing but a soup of unlabelled buttons and low-contrast text.
When I built **Greg's Place**, accessibility wasn't an afterthought or a compliance checklist—it was the foundation. My goal is simple: this site should work perfectly for everyone, regardless of how you browse the web. Whether you’re using NVDA, VoiceOver, a braille display, or just really cranked-up text magnification, you are welcome here.
## **The Standards**
I target **WCAG 2.2 Level AA** compliance. To achieve this, I’ve made some specific design choices:
* **Semantic HTML:** Everything is built with proper heading structures and landmarks so you can navigate by rotor or shortcut keys without getting a headache.
* **High Contrast:** I use an "Outlined Card" design system that relies on distinct borders rather than subtle shadows.
* **Privacy Facades:** Video embeds (like YouTube) are static images until you click them. This prevents keyboard traps and keeps third-party tracking scripts off your back.
* **No "Mouse-Only" Nonsense:** If you can click it, you can tab to it.
## **The Reality Check**
This is a personal site, not a corporate enterprise. I am the design team, the dev team, and the QA department. While I test everything thoroughly with my own tools, bugs happen. Updates break things. Sometimes I just mess up.
## **Feedback**
If you hit a barrier, please tell me. I don’t want to just "log the ticket"—I want to fix it.
* **Contact Me:** Drop me a line via the [Contact Page](/contact/).
* **The Details:** If you can, tell me what browser or assistive tech you were using when things went sideways.
Let’s keep the web open.
EOT

cat <<EOT > "content/pages/about/index.md"
---
title: "About"
date: 2025-11-22T19:10:40-0800
lastmod: 2025-11-26T01:35:00-08:00
summary: "A little bit about me."
show_webmentions: false
---
## **The Elevator Pitch**
I’m Greg. I’m a gay, blind, middle-aged guy living in Burien, Washington. If you found this page looking for a corporate bio or some "thought leadership," you’ve definitely taken a wrong turn at the search bar. This is my digital living room—shoes off, please.
## **The Geekery**
I’m an unapologetic tech tinkerer. I straddle the line between Apple fanboy and Linux power user, mostly because I enjoy things that work *and* things I can break. Being blind, I experience the web differently than most. I built this site to be strictly accessible (WCAG 2.2 AA) not just because it’s the right thing to do, but because I know exactly how frustrating it is when the internet decides to be an obstacle course.
## **The Vibe**
Culturally, I’m pretty much permanently parked in a timeline that stretches from the 1970s straight through the late 2000s. I do occasionally dip a toe into modern media if it’s genuinely good, but I’m mostly here for the golden era. My movie night is a chaotic mix of action, comedy, and sci-fi—think *Die Hard*, *Ghostbusters*, or *The Matrix* playing on repeat. If it has practical effects or a plot hole big enough to drive a DeLorean through, I’m watching it.
My playlist is even less disciplined. It’s a constant battleground where Mötley Crüe and Def Leppard fight for dominance against Dr. Dre, Madonna, and Daft Punk. I also devour audiobooks and podcasts at a rate that probably concerns my service provider, mostly so I can pretend I’m multitasking while I mess with my latest project.
{{< youtube "UFX3gQHIroU" "Janet Jackson - Escapade" >}}
## **Fuel & Chill**
While my soul belongs to the holy trinity of burgers, tacos, and pizza, my appetite wanders the globe. I’m just as happy diving into a spicy Indian curry, Mediterranean hummus, or a bowl of pho as I am wrecking a plate of nachos. That said, I will politely (or impolitely) decline blue cheese and Brussels sprouts. Life is too short for moldy cheese and tiny, bitter cabbages.
To unwind, I enjoy good drinks, laughter with friends, and a little cannabis to keep those Pacific Northwest chill vibes authentic.
## **Wander Around**
Feel free to poke around. You can read my [Articles](/articles/) if you have some time to kill, check the [Status Updates](/status/) for my random brain noise, or sign the [Guestbook](/guestbook/) so I know I'm not just shouting into the void.
EOT

cat <<EOT > "content/pages/contact/index.md"
---
title: "Contact"
layout: "contact"
date: 2025-11-22T23:40:00-08:00
summary: "A contact form where visitors can get in touch with the author"
---
EOT

cat <<EOT > "content/pages/guestbook/index.md"
---
title: "Guestbook"
layout: "guestbook"
date: 2025-11-22T23:35:00-08:00
summary: "A place to collect webmentions from around the IndieWeb that are not tied to a particular post or page"
syndication: []
---
EOT

cat <<EOT > "content/pages/search/index.md"
---
title: "Search"
date: 2025-11-22T19:10:40-0800
layout: "search"
summary: "A page where visitors can search this website"
---
EOT

# 5. SCSS STYLES
cat <<EOT > "$THEME_ROOT/assets/scss/_variables.scss"
:root {
  --md-sys-shape-corner-medium: 12px;
  --md-sys-spacing-base: 8px;
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
body { margin: 0; font-family: 'Noto Sans', sans-serif; background-color: var(--md-sys-color-surface); color: var(--md-sys-color-on-surface); line-height: 1.5; }
h1, h2, h3, h4 { font-family: 'Noto Serif', serif; margin-top: 0; }
:focus-visible { outline: 3px solid var(--md-sys-color-primary); outline-offset: 2px; }
.skip-link { position: absolute; top: -100px; left: 0; background: var(--md-sys-color-primary); color: var(--md-sys-color-on-primary); padding: 8px; z-index: 9999; }
.skip-link:focus { top: 0; }
EOT

cat <<EOT > "$THEME_ROOT/assets/scss/_typography.scss"
h1, h2, h3, h4, h5, h6 { font-family: 'Noto Serif', serif; color: var(--md-sys-color-on-surface); margin-top: 2rem; margin-bottom: 1rem; line-height: 1.2; }
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
blockquote { margin: 1.5rem 0; padding: 1rem 1.5rem; border-left: 4px solid var(--md-sys-color-primary); background-color: rgba(var(--md-sys-color-primary), 0.05); font-style: italic; border-radius: 0 var(--md-sys-shape-corner-medium) var(--md-sys-shape-corner-medium) 0; }
blockquote p:last-child { margin-bottom: 0; }
ul, ol { margin-bottom: 1rem; padding-left: 2rem; }
li { margin-bottom: 0.5rem; line-height: 1.6; }
li::marker { color: var(--md-sys-color-secondary); }
code { font-family: monospace; background-color: var(--md-sys-color-outline-variant); color: var(--md-sys-color-on-surface); padding: 0.2em 0.4em; border-radius: 4px; font-size: 0.9em; }
table { width: 100%; border-collapse: collapse; margin: 1.5rem 0; font-size: 0.95rem; }
th, td { padding: 12px; border: 1px solid var(--md-sys-color-outline-variant); text-align: left; }
th { background-color: rgba(var(--md-sys-color-primary), 0.05); font-weight: 700; }
pre { background-color: #272822; color: #f8f8f2; padding: 1rem; border-radius: var(--md-sys-shape-corner-medium); overflow-x: auto; margin-bottom: 1.5rem; border: 1px solid var(--md-sys-color-outline-variant); }
pre code { background-color: transparent; color: inherit; padding: 0; }
.code-block-wrapper { position: relative; margin-bottom: 1.5rem; }
.code-block-wrapper pre { margin-bottom: 0; }
.copy-code-btn { position: absolute; top: 8px; right: 8px; background-color: var(--md-sys-color-surface); border: 1px solid var(--md-sys-color-outline); color: var(--md-sys-color-primary); border-radius: 50%; width: 32px; height: 32px; display: flex; align-items: center; justify-content: center; cursor: pointer; opacity: 0.5; transition: opacity 0.2s, background-color 0.2s; z-index: 2; }
.copy-code-btn:hover, .copy-code-btn:focus-visible { opacity: 1; background-color: var(--md-sys-color-outline-variant); }
.copy-code-btn svg { width: 18px; height: 18px; fill: currentColor; }
.table-wrapper { overflow-x: auto; margin-bottom: 1.5rem; border: 1px solid var(--md-sys-color-outline-variant); border-radius: var(--md-sys-shape-corner-medium); }
.md-table { width: 100%; border-collapse: collapse; font-size: 0.95rem; border: none; }
.md-table caption { caption-side: top; text-align: left; padding: 12px 16px; font-family: 'Noto Serif', serif; font-weight: 700; color: var(--md-sys-color-primary); background-color: rgba(var(--md-sys-color-primary), 0.05); border-bottom: 1px solid var(--md-sys-color-outline-variant); }
.md-table th, .md-table td { padding: 12px 16px; border-bottom: 1px solid var(--md-sys-color-outline-variant); white-space: nowrap; }
.md-table th { background-color: var(--md-sys-color-surface); font-weight: 600; color: var(--md-sys-color-on-surface); text-align: left; }
.md-table tr:last-child td { border-bottom: none; }
.md-table tbody tr:nth-child(even) { background-color: rgba(var(--md-sys-color-primary), 0.02); }
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
.section-intro { margin-bottom: 24px; font-size: 1.1rem; line-height: 1.6; color: var(--md-sys-color-on-surface); max-width: 65ch; }
EOT

cat <<EOT > "$THEME_ROOT/assets/scss/_components.scss"
.outlined-card { background-color: var(--md-sys-color-surface); border: 1px solid var(--md-sys-color-outline-variant); border-radius: var(--md-sys-shape-corner-medium); padding: 16px; transition: background-color 0.2s ease, border-color 0.2s ease; }
.outlined-card:hover { border-color: var(--md-sys-color-outline); background-color: rgba(var(--md-sys-color-primary), 0.05); }
.chip { display: inline-flex; align-items: center; border: 1px solid var(--md-sys-color-outline); border-radius: 8px; padding: 4px 8px; font-size: 0.875rem; margin-bottom: 8px; gap: 8px; }
.chip-icon svg, .brand-icon svg { width: 18px; height: 18px; fill: currentColor; display: block; }
.social-links, .im-links { list-style: none; padding: 0; }
.social-link { display: inline-flex; align-items: center; gap: 8px; text-decoration: none; }
.webmentions-container { margin-top: 24px; }
.headline-row { display: flex; align-items: center; gap: 12px; margin-bottom: 8px; }
.headline-row h1 { margin: 0; }
.chip-icon-only { border: 1px solid var(--md-sys-color-outline); border-radius: 50%; padding: 8px; display: inline-flex; justify-content: center; align-items: center; width: 20px; height: 20px; color: var(--md-sys-color-primary); }
.chip-icon-only:hover { background-color: rgba(var(--md-sys-color-primary), 0.1); }
.feed-header .headline-row { margin-bottom: 4px; }
.headline-row h2 { margin: 0; font-size: 1.25rem; line-height: 1.3; }
.headline-row a { text-decoration: none; color: inherit; }
.headline-row a:hover { text-decoration: underline; text-decoration-color: var(--md-sys-color-primary); }
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

cat <<EOT > "$THEME_ROOT/assets/scss/_share.scss"
.share-card { margin-top: 2rem; margin-bottom: 2rem; h3 { margin-top: 0; font-size: 1.25rem; } }
.share-buttons-row { display: flex; gap: 12px; flex-wrap: wrap; }
.share-btn { display: inline-flex; align-items: center; justify-content: center; width: 48px; height: 48px; border-radius: 50%; border: 1px solid var(--md-sys-color-outline); background-color: transparent; color: var(--md-sys-color-primary); cursor: pointer; transition: background-color 0.2s, transform 0.2s; &:hover { background-color: rgba(var(--md-sys-color-primary), 0.1); transform: scale(1.05); } svg { width: 24px; height: 24px; fill: currentColor; } }
dialog#fedi-share-dialog { border: 1px solid var(--md-sys-color-outline-variant); border-radius: var(--md-sys-shape-corner-medium); background: var(--md-sys-color-surface); color: var(--md-sys-color-on-surface); padding: 24px; max-width: 400px; width: 90%; &::backdrop { background: rgba(0, 0, 0, 0.5); } h3 { margin-top: 0; } .form-group { margin: 16px 0; } input { width: 100%; padding: 12px; border-radius: 8px; border: 1px solid var(--md-sys-color-outline); background: var(--md-sys-color-surface); color: var(--md-sys-color-on-surface); } .dialog-actions { display: flex; justify-content: flex-end; gap: 12px; } button { padding: 8px 16px; border-radius: 20px; border: none; cursor: pointer; font-weight: 600; } .button-primary { background: var(--md-sys-color-primary); color: var(--md-sys-color-on-primary); } .button-secondary { background: transparent; color: var(--md-sys-color-primary); } }
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
@import "share";
EOT

# 6. JAVASCRIPT MODULES
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
            }).catch(err => { console.error('Failed to copy:', err); });
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
            if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); loadVideo(player); }
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
(function() {
    const container = document.getElementById('webmentions');
    if (!container) return;
    const target = container.dataset.target;
    const list = document.getElementById('webmentions-list');
    const itemsPerPage = 20;
    let currentPage = 1;
    let allMentions = [];
    const apiUrl = 'https://webmention.io/api/mentions.jf2?target=' + encodeURIComponent(target);
    fetch(apiUrl).then(response => {
            if (!response.ok) throw new Error('Network response was not ok');
            return response.json();
        }).then(data => {
            allMentions = (data.children || []).filter(item => {
                const hasContent = item.content && (item.content.text || item.content.html);
                const hasAuthor = item.author && item.author.name;
                return hasContent || hasAuthor;
            });
            if (allMentions.length === 0) { list.innerHTML = '<p>No mentions yet. Be the first!</p>'; return; }
            renderPage(1);
        }).catch(error => { list.innerHTML = '<p class="error">Unable to load conversation at this time.</p>'; console.error('Webmention Fetch Error:', error); });
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
        if (allMentions.length > itemsPerPage) { renderPaginationControls(page); }
    }
    function renderPaginationControls(page) {
        const totalPages = Math.ceil(allMentions.length / itemsPerPage);
        const nav = document.createElement('nav');
        nav.className = 'pagination-controls';
        nav.ariaLabel = "Webmention Pagination";
        if (page > 1) {
            const prev = document.createElement('button');
            prev.innerText = 'Previous'; prev.className = 'button-secondary';
            prev.onclick = () => { currentPage--; renderPage(currentPage); list.focus(); };
            nav.appendChild(prev);
        }
        if (page < totalPages) {
            const next = document.createElement('button');
            next.innerText = 'Next'; next.className = 'button-secondary';
            next.onclick = () => { currentPage++; renderPage(currentPage); list.focus(); };
            nav.appendChild(next);
        }
        list.appendChild(nav);
    }
    function buildMentionHTML(item) {
        const author = item.author || {};
        const name = author.name || 'Anonymous';
        const authorLink = author.url ? \`<a href="\${author.url}" class="p-name u-url" rel="nofollow">\${name}</a>\` : \`<span class="p-name">\${name}</span>\`;
        const content = sanitize(item.content ? item.content.html || item.content.text : '');
        let timeHtml = '';
        if (item.published) {
            const dateStr = new Date(item.published).toLocaleDateString();
            if (dateStr !== 'Invalid Date') { timeHtml = \`<time class="dt-published">\${dateStr}</time>\`; }
        }
        return \`<div class="mention-author u-author h-card"><img src="\${author.photo || '/images/default-avatar.png'}" alt="" class="u-photo">\${authorLink}</div><div class="mention-content p-content">\${content}</div>\${timeHtml}\`;
    }
    function sanitize(html) {
        const parser = new DOMParser();
        const doc = parser.parseFromString(html, 'text/html');
        const forbidden = ['script', 'iframe', 'object', 'style', 'link', 'meta'];
        forbidden.forEach(tag => { const elements = doc.querySelectorAll(tag); elements.forEach(el => el.remove()); });
        const allElements = doc.querySelectorAll('*');
        allElements.forEach(el => {
            Array.from(el.attributes).forEach(attr => {
                if (attr.name.startsWith('on') || (attr.name === 'href' && attr.value.toLowerCase().startsWith('javascript:'))) { el.removeAttribute(attr.name); }
            });
        });
        return doc.body.innerHTML;
    }
})();
EOT

cat <<EOT > "$THEME_ROOT/assets/js/share.js"
document.addEventListener('DOMContentLoaded', () => {
    const dialog = document.getElementById('fedi-share-dialog');
    const fediBtns = document.querySelectorAll('.fediverse-btn');
    const goBtn = document.getElementById('fedi-go-btn');
    const input = document.getElementById('fedi-domain');
    let activeHandle = ''; 
    if (!dialog) return;
    let currentTitle = document.title;
    let currentUrl = window.location.href;
    fediBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            activeHandle = btn.dataset.handle || '';
            dialog.showModal();
            input.focus();
        });
    });
    goBtn.addEventListener('click', () => {
        const domain = input.value.trim();
        if (!domain) return;
        let text = \`\${currentTitle} \${currentUrl}\`;
        if (activeHandle) { text += \` via \${activeHandle}\`; }
        const shareUrl = \`https://\${domain}/share?text=\${encodeURIComponent(text)}\`;
        window.open(shareUrl, '_blank', 'noopener,noreferrer');
        dialog.close();
    });
});
EOT

# 7. HTML LAYOUTS
cat <<EOT > "$THEME_ROOT/layouts/partials/ui/chip.html"
{{ \$type := .Type }}
{{ \$iconName := .Type }}
{{ \$vibe := "Icon" }}
{{ \$label := .Type | humanize }}
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
    {{ if .icon }}
      <span class="brand-icon" aria-hidden="true" style="color: var(--md-sys-color-primary); display: flex; align-items: center;">
        {{ partial (printf "icons/%s.svg" .icon) . }}
      </span>
    {{ end }}
    <span class="brand-name" style="font-weight: 600; color: var(--md-sys-color-primary);">{{ .name }}</span>
    <span class="brand-handle" style="color: var(--md-sys-color-on-surface); opacity: 0.8; margin-left: 4px;">{{ .handle }}</span>
  </a>
</li>
EOT

cat <<EOT > "$THEME_ROOT/layouts/partials/social-meta.html"
<meta property="og:title" content="{{ .Title }}">
<meta property="og:description" content="{{ .Summary | default .Site.Params.author.bio | truncate 160 }}">
<meta property="og:type" content="{{ if .IsPage }}article{{ else }}website{{ end }}">
<meta property="og:url" content="{{ .Permalink }}">
<meta property="og:site_name" content="{{ .Site.Title }}">
{{ \$img := .Resources.GetMatch "*feature*" }}
{{ if not \$img }}{{ \$img = .Resources.GetMatch "*cover*" }}{{ end }}
{{ if not \$img }}{{ \$img = .Resources.GetMatch "*.jpg" }}{{ end }}
{{ if not \$img }}{{ \$img = .Resources.GetMatch "*.png" }}{{ end }}
{{ if not \$img }}{{ \$img = resources.Get .Site.Params.author.photo }}{{ end }}
{{ if \$img }}
  {{ \$socialImg := \$img.Fill "1200x630 Center webp" }}
  <meta property="og:image" content="{{ \$socialImg.Permalink }}">
  <meta property="og:image:width" content="{{ \$socialImg.Width }}">
  <meta property="og:image:height" content="{{ \$socialImg.Height }}">
  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:image" content="{{ \$socialImg.Permalink }}">
{{ else }}
  <meta name="twitter:card" content="summary">
{{ end }}
<meta name="twitter:title" content="{{ .Title }}">
<meta name="twitter:description" content="{{ .Summary | default .Site.Params.author.bio | truncate 160 }}">
EOT

cat <<EOT > "$THEME_ROOT/layouts/partials/share-buttons.html"
{{ \$bluesky := index (where .Site.Params.social "name" "BlueSky") 0 }}
{{ \$mastodon := index (where .Site.Params.social "name" "Mastodon") 0 }}
{{ \$friendica := index (where .Site.Params.social "name" "Friendica") 0 }}
<section class="share-card outlined-card">
  <h3>Share this</h3>
  <div class="share-buttons-row">
    <a href="https://bsky.app/intent/compose?text={{ .Title | urlquery }}%20{{ .Permalink | urlquery }}{{ if \$bluesky }}%20via%20{{ \$bluesky.handle | urlquery }}{{ end }}" 
       target="_blank" rel="noopener noreferrer" class="share-btn" aria-label="Share on BlueSky">
       {{ partial "icons/bluesky.svg" . }}
    </a>
    <a href="https://www.facebook.com/sharer/sharer.php?u={{ .Permalink | urlquery }}" 
       target="_blank" rel="noopener noreferrer" class="share-btn" aria-label="Share on Facebook">
       {{ partial "icons/facebook.svg" . }}
    </a>
    <button class="share-btn fediverse-btn" data-network="friendica" 
            {{ if \$friendica }}data-handle="{{ \$friendica.handle }}"{{ end }} aria-label="Share on Friendica">
       {{ partial "icons/friendica.svg" . }}
    </button>
    <button class="share-btn fediverse-btn" data-network="mastodon" 
            {{ if \$mastodon }}data-handle="{{ \$mastodon.handle }}"{{ end }} aria-label="Share on Mastodon">
       {{ partial "icons/mastodon.svg" . }}
    </button>
    <a href="https://reddit.com/submit?url={{ .Permalink | urlquery }}&title={{ .Title | urlquery }}" 
       target="_blank" rel="noopener noreferrer" class="share-btn" aria-label="Share on Reddit">
       {{ partial "icons/reddit.svg" . }}
    </a>
  </div>
</section>
<dialog id="fedi-share-dialog" class="outlined-card">
  <form method="dialog">
    <h3>Share to the Fediverse</h3>
    <p>Enter your instance domain (e.g., <code>mastodon.social</code>):</p>
    <div class="form-group"><label for="fedi-domain" class="sr-only">Instance Domain</label><input type="text" id="fedi-domain" placeholder="your-instance.com" required></div>
    <div class="dialog-actions"><button value="cancel" class="button-secondary">Cancel</button><button id="fedi-go-btn" type="button" class="button-primary">Share</button></div>
  </form>
</dialog>
EOT

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
{{ partial "social-meta.html" . }}
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
    <p>
      Content licensed under <a href="http://creativecommons.org/licenses/by-sa/4.0/" target="_blank" rel="noopener">CC BY-SA 4.0</a>.
      <span aria-hidden="true" style="margin: 0 8px;">|</span>
      <a href="/accessibility/">Accessibility</a>
    </p>
  </div>
</footer>
EOT

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

cat <<EOT > "$THEME_ROOT/layouts/_default/baseof.html"
<!DOCTYPE html>
<html lang="{{ .Site.LanguageCode }}">
<head>
  {{ partial "head.html" . }}
</head>
<body>
  <a class="skip-link" href="#main-content">Skip to content</a>
  {{ partial "header.html" . }}
  <main id="main-content" role="main" class="container">
    {{ block "main" . }}{{ end }}
  </main>
  {{ partial "footer.html" . }}
  {{ \$js := slice (resources.Get "js/webmentions.js") (resources.Get "js/youtube-lite.js") (resources.Get "js/menu.js") (resources.Get "js/copy-code.js") (resources.Get "js/share.js") | resources.Concat "js/main.js" | resources.Minify | resources.Fingerprint }}
  <script src="{{ \$js.RelPermalink }}" defer></script>
</body>
</html>
EOT

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
    <h2>Social Media</h2><ul class="social-links">{{ range .Site.Params.social }}{{ partial "ui/social-link.html" . }}{{ end }}</ul>
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

cat <<EOT > "$THEME_ROOT/layouts/_default/rss.xml"
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:media="http://search.yahoo.com/mrss/">
  <channel>
    <title>{{ if eq  .Title  .Site.Title }}{{ .Site.Title }}{{ else }}{{ .Title }} | {{ .Site.Title }}{{ end }}</title>
    <link>{{ .Permalink }}</link>
    <description>{{ if ne  .Title  .Site.Title }}{{ .Title }} | {{ end }}{{ .Site.Title }}</description>
    <generator>Hugo -- gohugo.io</generator>
    <language>{{ .Site.LanguageCode }}</language>
    {{ if not .Date.IsZero }}<lastBuildDate>{{ .Date.Format "Mon, 02 Jan 2006 15:04:05 -0700" | safeHTML }}</lastBuildDate>{{ end }}
    {{ with .OutputFormats.Get "RSS" }}{{ printf "<atom:link href=%q rel=\"self\" type=%q />" .Permalink .MediaType | safeHTML }}{{ end }}
    {{ range .Pages }}
    <item>
      <title>{{ .Title }}</title>
      <link>{{ .Permalink }}</link>
      <pubDate>{{ .Date.Format "Mon, 02 Jan 2006 15:04:05 -0700" | safeHTML }}</pubDate>
      <guid>{{ .Permalink }}</guid>
      <description>{{ .Summary | transform.XMLEscape | safeHTML }}</description>
      <content:encoded>{{ .Content | transform.XMLEscape | safeHTML }}</content:encoded>
      {{ \$img := .Resources.GetMatch "**.jpg" }}{{ if not \$img }}{{ \$img = .Resources.GetMatch "**.png" }}{{ end }}
      {{ with \$img }}{{ \$rssImg := .Resize "1200x jpeg" }}<media:content url="{{ \$rssImg.Permalink }}" type="image/jpeg" medium="image" width="{{ \$rssImg.Width }}" height="{{ \$rssImg.Height }}"/>{{ end }}
    </item>
    {{ end }}
  </channel>
</rss>
EOT

cat <<EOT > "$THEME_ROOT/layouts/_default/single.html"
{{ define "main" }}
<article class="single-post h-entry outlined-card">
  <div style="display: none;" class="p-author h-card">
    <a href="{{ .Site.BaseURL }}" class="u-url p-name">{{ .Site.Params.author.name }}</a>
    <img src="{{ .Site.Params.author.photo | absURL }}" class="u-photo" alt="{{ .Site.Params.author.name }}">
  </div>
  <header class="post-header">
    <div class="headline-row">
      {{ partial "ui/chip.html" . }}
      <h1 class="p-name">{{ .Title }}</h1>
    </div>
    <a href="{{ .Permalink }}" class="u-url" style="text-decoration: none; color: inherit;">
      <time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">
        {{ .Date.Format "January 2, 2006" }}
      </time>
    </a>
  </header>
  {{ if .Params.reply_to }}<div class="context-block reply-context"><p>Replying to: <a href="{{ .Params.reply_to }}" class="u-in-reply-to">{{ .Params.reply_to }}</a></p></div>{{ end }}
  {{ if .Params.like_of }}<div class="context-block like-context"><p>Liked: <a href="{{ .Params.like_of }}" class="u-like-of">{{ .Params.like_of }}</a></p></div>{{ end }}
  {{ if .Params.repost_of }}<div class="context-block repost-context"><p>Reposted: <a href="{{ .Params.repost_of }}" class="u-repost-of">{{ .Params.repost_of }}</a></p></div>{{ end }}
  {{ if .Params.bookmark_of }}<div class="context-block bookmark-context"><p>Bookmarked: <a href="{{ .Params.bookmark_of }}" class="u-bookmark-of">{{ .Params.bookmark_of }}</a></p></div>{{ end }}
  {{ if and .Params.rsvp .Params.reply_to }}<div class="context-block rsvp-context"><p>RSVP: <span class="p-rsvp">{{ .Params.rsvp | upper }}</span> to <a href="{{ .Params.reply_to }}" class="u-in-reply-to">{{ .Params.reply_to }}</a></p></div>{{ end }}
  <div class="e-content">{{ .Content }}</div>
  <footer class="post-footer">
    {{ if .Params.syndication }}
    <div class="syndication-container">
      <span class="syndication-label">Also on:</span>
      <div class="syndication-chips" style="display: inline-flex; flex-wrap: wrap; gap: 8px; margin-top: 8px;">
        {{ range .Params.syndication }}
          {{ \$synURL := . }}
          {{ \$match := false }}
          {{ \$data := dict }}
          {{ range \$.Site.Params.social }}
             {{ if in \$synURL .url }}
               {{ \$match = true }}
               {{ \$data = . }}
             {{ end }}
          {{ end }}
          <a href="{{ \$synURL }}" class="chip u-syndication" rel="syndication" style="text-decoration: none;">
            {{ if \$match }}
               {{ if \$data.icon }}<span class="chip-icon" aria-hidden="true" style="color: var(--md-sys-color-primary);">{{ partial (printf "icons/%s.svg" \$data.icon) . }}</span>{{ end }}
               <span class="chip-label">{{ \$data.name }}</span>
            {{ else }}
               <span class="chip-label">{{ replaceRE "^https?://([^/]+).*" "\$1" \$synURL }}</span>
            {{ end }}
          </a>
        {{ end }}
      </div>
    </div>
    {{ end }}
    {{ if .Params.tags }}<ul class="tags">{{ range .Params.tags }}<li><a href="{{ "/tags/" | relLangURL }}{{ . | urlize }}" class="p-category">#{{ . }}</a></li>{{ end }}</ul>{{ end }}
  </footer>
</article>
{{ partial "share-buttons.html" . }}
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
  <div style="display: none;">
     <div class="p-author h-card"><a href="{{ .Site.BaseURL }}" class="u-url p-name">{{ .Site.Params.author.name }}</a><img src="{{ .Site.Params.author.photo | absURL }}" class="u-photo" alt="{{ .Site.Params.author.name }}"></div>
     <a href="{{ .Permalink }}" class="u-url"></a><time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">{{ .Date }}</time><span class="p-category">Search</span>
  </div>
  <header class="page-header">
    <div class="headline-row">{{ partial "ui/chip.html" . }}<h1 class="p-name">Search</h1></div>
  </header>
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
  <div style="display: none;">
     <div class="p-author h-card"><a href="{{ .Site.BaseURL }}" class="u-url p-name">{{ .Site.Params.author.name }}</a><img src="{{ .Site.Params.author.photo | absURL }}" class="u-photo" alt="{{ .Site.Params.author.name }}"></div>
     <a href="{{ .Permalink }}" class="u-url"></a><time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">{{ .Date }}</time><span class="p-category">Guestbook</span>
  </div>
  <header class="page-header">
    <div class="headline-row">{{ partial "ui/chip.html" . }}<h1 class="p-name">Guestbook</h1></div>
    <p class="p-summary">{{ .Site.Params.webmentions.guestbookIntro }}</p>
  </header>
  <div class="e-content">{{ .Content }}</div>
  <footer class="post-footer">
    {{ if .Params.syndication }}
    <div class="syndication-container">
      <span class="syndication-label">Also on:</span>
      <div class="syndication-chips" style="display: inline-flex; flex-wrap: wrap; gap: 8px; margin-top: 8px;">
        {{ range .Params.syndication }}
          {{ \$synURL := . }}
          {{ \$match := false }}
          {{ \$data := dict }}
          {{ range \$.Site.Params.social }}
             {{ if in \$synURL .url }}
               {{ \$match = true }}
               {{ \$data = . }}
             {{ end }}
          {{ end }}
          <a href="{{ \$synURL }}" class="chip u-syndication" rel="syndication" style="text-decoration: none;">
            {{ if \$match }}
               {{ if \$data.icon }}<span class="chip-icon" aria-hidden="true" style="color: var(--md-sys-color-primary);">{{ partial (printf "icons/%s.svg" \$data.icon) . }}</span>{{ end }}
               <span class="chip-label">{{ \$data.name }}</span>
            {{ else }}
               <span class="chip-label">{{ replaceRE "^https?://([^/]+).*" "\$1" \$synURL }}</span>
            {{ end }}
          </a>
        {{ end }}
      </div>
    </div>
    {{ end }}
    {{ if .Params.tags }}<ul class="tags">{{ range .Params.tags }}<li><a href="{{ "/tags/" | relLangURL }}{{ . | urlize }}" class="p-category">#{{ . }}</a></li>{{ end }}</ul>{{ end }}
  </footer>
</section>
{{ partial "share-buttons.html" . }}
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
  <div style="display: none;">
     <div class="p-author h-card"><a href="{{ .Site.BaseURL }}" class="u-url p-name">{{ .Site.Params.author.name }}</a><img src="{{ .Site.Params.author.photo | absURL }}" class="u-photo" alt="{{ .Site.Params.author.name }}"></div>
     <a href="{{ .Permalink }}" class="u-url"></a><time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">{{ .Date }}</time><span class="p-category">Contact Form</span>
  </div>
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
{{ \$host := .Get "host" }}{{ \$id := .Get "id" }}
{{ if and \$host \$id }}
  {{ \$apiURL := printf "https://%s/api/v1/statuses/%s" \$host \$id }}
  {{ \$data := dict }}{{ \$response := resources.GetRemote \$apiURL }}
  {{ if \$response }}{{ if eq \$response.StatusCode 200 }}{{ \$data = \$response.Content | transform.Unmarshal }}{{ else }}<div class="mastodon-card error outlined-card"><p><strong>Error:</strong> Could not fetch Mastodon post.</p></div>{{ end }}{{ else }}<div class="mastodon-card error outlined-card"><p><strong>Error:</strong> Unable to reach Mastodon.</p></div>{{ end }}
  {{ if \$data }}
    <article class="mastodon-card outlined-card" lang="{{ \$data.language | default "en" }}">
      <header class="mastodon-header">
        <div class="mastodon-author">
          {{ \$avatar := resources.GetRemote \$data.account.avatar }}
          {{ if \$avatar }}{{ if \$avatar.Err }}<div class="u-photo-placeholder">?</div>{{ else }}<img src="{{ \$avatar.RelPermalink }}" alt="" class="u-photo" width="48" height="48" loading="lazy">{{ end }}{{ else }}<div class="u-photo-placeholder">?</div>{{ end }}
          <div class="author-meta"><a href="{{ \$data.account.url }}" class="p-name u-url" target="_blank"><strong>{{ \$data.account.display_name | default \$data.account.username }}</strong></a><span class="p-nickname">@{{ \$data.account.username }}@{{ \$host }}</span></div>
        </div>
        <div class="mastodon-logo" aria-label="Mastodon Post">{{ partial "icons/mastodon.svg" . }}</div>
      </header>
      <div class="e-content">{{ \$data.content | safeHTML }}</div>
      {{ if \$data.media_attachments }}<div class="mastodon-media">{{ range \$data.media_attachments }}{{ if eq .type "image" }}{{ \$img := resources.GetRemote .url }}{{ if \$img }}{{ if not \$img.Err }}<img src="{{ \$img.RelPermalink }}" alt="{{ .description }}" loading="lazy">{{ end }}{{ end }}{{ end }}{{ end }}</div>{{ end }}
      <footer class="mastodon-footer">
        <time class="dt-published" datetime="{{ \$data.created_at }}">{{ dateFormat "Jan 02, 2006" \$data.created_at }}</time>
        <div class="mastodon-stats"><span>↩ {{ \$data.replies_count }}</span><span>↻ {{ \$data.reblogs_count }}</span><span>♥ {{ \$data.favourites_count }}</span></div>
        <a href="{{ \$data.url }}" class="button-small" target="_blank">View Original</a>
      </footer>
    </article>
  {{ end }}
{{ else }}<p class="error"><strong>Error:</strong> Missing 'host' or 'id'.</p>{{ end }}
EOT

# 8. HELPER SCRIPTS
cat <<'GENERATOR' > generate_icons.sh
#!/bin/bash
ICON_DIR="themes/Accessible-MD/layouts/partials/icons"
mkdir -p "$ICON_DIR"
declare -A SYSTEM_ICONS=(
    ["search"]="search" ["menu"]="menu" ["close"]="close" ["home"]="home"
    ["articles"]="article" ["status"]="chat_bubble" ["replies"]="reply"
    ["reposts"]="repeat" ["likes"]="favorite" ["bookmarks"]="bookmark"
    ["rsvps"]="event" ["guestbook"]="import_contacts" ["contact"]="mail"
    ["about"]="info" ["pages"]="description" ["categories"]="category" 
    ["tags"]="label" ["content_copy"]="content_copy" ["check"]="check" ["share"]="share"
)
echo "--- Updating System Icons ---"
for NAME in "${!SYSTEM_ICONS[@]}"; do
    MATERIAL_NAME="${SYSTEM_ICONS[$NAME]}"
    TARGET="$ICON_DIR/$NAME.svg"
    if [ ! -f "$TARGET" ]; then
        echo "Fetching System: $NAME..."
        URL="https://raw.githubusercontent.com/google/material-design-icons/master/symbols/web/${MATERIAL_NAME}/materialsymbolsoutlined/${MATERIAL_NAME}_24px.svg"
        curl -s -L -f "$URL" -o "$TARGET" || echo "  X Failed to fetch $NAME"
    fi
done
declare -A SOCIAL_ICONS=(
    ["bluesky"]="bluesky" ["facebook"]="facebook" ["github"]="github"
    ["mastodon"]="mastodon" ["matrix"]="matrix" ["messenger"]="messenger"
    ["reddit"]="reddit" ["signal"]="signal" ["simplex"]="simplex" ["youtube"]="youtube"
)
echo "--- Updating Social Icons ---"
for NAME in "${!SOCIAL_ICONS[@]}"; do
    SLUG="${SOCIAL_ICONS[$NAME]}"
    TARGET="$ICON_DIR/$NAME.svg"
    if [ ! -f "$TARGET" ]; then
        echo "Fetching Social: $NAME..."
        URL="https://cdn.simpleicons.org/$SLUG"
        if curl -s -L -f "$URL" -o "$TARGET"; then echo "  ✓ OK"; else echo "  X ERROR: Could not fetch '$NAME'. Creating fallback."; echo '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect></svg>' > "$TARGET"; fi
    fi
done
TARGET="$ICON_DIR/friendica.svg"
if [ ! -f "$TARGET" ]; then
    echo "Fetching Special: friendica..."
    URL="https://raw.githubusercontent.com/friendica/friendica/stable/images/friendica.svg"
    if curl -s -L -f "$URL" -o "$TARGET"; then echo "  ✓ OK"; else echo "  X ERROR: Could not fetch Friendica icon."; echo '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect></svg>' > "$TARGET"; fi
fi
echo "Icon generation complete."
GENERATOR
chmod +x generate_icons.sh

cat <<'NEWPOST' > new_post.sh
#!/bin/bash
if [ -z "$1" ]; then echo "Error: Content Type is required."; echo "Usage: ./new_post.sh [type] \"[optional title]\""; exit 1; fi
TYPE=$1; TITLE=$2; TYPE=${TYPE%/}
if [[ "$TYPE" == "articles" || "$TYPE" == "bookmarks" ]]; then if [ -z "$TITLE" ]; then echo "Error: Title is REQUIRED for '$TYPE'."; exit 1; fi; fi
DIR_NAME=""; if [ -n "$TITLE" ]; then SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed -e 's/[^a-z0-9]/-/g' -e 's/-\+/-/g' -e 's/^-\|-$//g'); DIR_NAME="$SLUG"; else TIMESTAMP=$(date +%Y-%m-%d-%H%M); DIR_NAME="$TIMESTAMP"; fi
TARGET_PATH="$TYPE/$DIR_NAME/index.md"
echo "Creating new $TYPE..."; echo "Path: content/$TARGET_PATH"
hugo new content "$TARGET_PATH" --kind "$TYPE"
echo "Done."
NEWPOST
chmod +x new_post.sh

cat <<'DEBUGSERVER' > debug_server.sh
#!/bin/bash
LOG_FILE="errors.txt"
pkill hugo > /dev/null 2>&1
echo "--- New Session: $(date) ---" > "$LOG_FILE"
echo "Starting Hugo Server..."
hugo server --disableFastRender -D -E -F --gc --printI18nWarnings > "$LOG_FILE" 2>&1 &
HUGO_PID=$!
echo "✅ Hugo is running in the background (PID: $HUGO_PID)."
echo "📄 Logs are being captured in '$LOG_FILE'."
DEBUGSERVER
chmod +x debug_server.sh

echo "Master Setup Complete. 'Greg's Place' is ready for development."
