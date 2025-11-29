#!/bin/bash
# ==============================================================================
# SCRIPT: setup_project.sh
# PURPOSE: Full Reproduction of "Greg's Place"
# GENERATED: Automatically via maintenance/update_setup.sh
# ==============================================================================

echo "Initializing Greg's Place..."

# 1. DIRECTORY STRUCTURE
mkdir -p config/_default
THEME_ROOT="themes/Accessible-MD"
mkdir -p "$THEME_ROOT/archetypes" "$THEME_ROOT/assets/scss" "$THEME_ROOT/assets/js" "$THEME_ROOT/assets/images"
mkdir -p "$THEME_ROOT/layouts/_default/_markup" "$THEME_ROOT/layouts/partials/ui" "$THEME_ROOT/layouts/partials/icons"
mkdir -p "$THEME_ROOT/layouts/pages" "$THEME_ROOT/layouts/photos" "$THEME_ROOT/layouts/shortcodes" "$THEME_ROOT/static"
mkdir -p content/articles content/photos content/status content/replies content/reposts content/likes content/bookmarks content/rsvps
mkdir -p content/pages/about content/pages/contact content/pages/guestbook content/pages/search content/pages/accessibility
mkdir -p .github/workflows

# 2. FILE REPRODUCTION
# File: config/_default/hugo.toml
cat <<'EOF' > "config/_default/hugo.toml"
baseURL = "https://simplygregario.us"
title = "Greg's Place"
theme = "Accessible-MD"
languageCode = "en-us"

# Pagination [Source: 18]
[pagination]
  pagerSize = 10

# Permalinks [Source: 10-17]
[permalinks]
  pages = "/:slug/"
  articles = "/articles/:year-:month-:day/:slug/"
  photos = "/photos/:year-:month-:day/:slug/"
  status = "/status/:year-:month-:day/:contentbasename/"
  replies = "/replies/:year-:month-:day/:contentbasename/"
  reposts = "/reposts/:year-:month-:day/:contentbasename/"
  likes = "/likes/:year-:month-:day/:contentbasename/"
  bookmarks = "/bookmarks/:year-:month-:day/:contentbasename/"
  rsvps = "/rsvps/:year-:month-:day/:contentbasename/"

# Outputs [Source: 19]
[outputs]
  home = ["HTML", "RSS", "JSON"]
  section = ["HTML", "RSS", "JSON"]

# Sass/SCSS [Source: 184]
[css]
  [css.sass]
    enable = true
EOF

# File: config/_default/params.toml
cat <<'EOF' > "config/_default/params.toml"
# ==============================================================================
# FILE: config/_default/params.toml
# PURPOSE: Site-wide Variables and IndieWeb Configuration
# CONTEXT: Source [20-47]
# ==============================================================================

# [Source: 21] Author Metadata for H-Card and SEO
[author]
  name = "Gregory Lopez"
  # [Source: 23] Short plain-text bio for H-Card meta tags.
  bio = "I'm a gay, blind, middle-aged guy from the Pacific Northwest. As an Apple and Linux fan, I enjoy tinkering with tech and coding. Audiobooks, podcasts, and retro media from the 1970s to the early 2000s are my jam. I also love good food, drinks, and laughter with friends, plus a little cannabis to keep things mellow."
  # [Source: 24] Root-relative path to profile photo.
  photo = "images/profile_photo.jpg"

  [author.location]
    city = "Burien"
    state = "Washington"
    country = "USA"

# [NEW] IndieAuth Endpoints
authorization_endpoint = "https://indieauth.com/auth"
token_endpoint = "https://tokens.indieauth.com/token"
micropub = "https://indiekit.simplygregario.us/micropub"

# [Source: 26] Webmention.io Integration
[webmentions]
  enable = true
  # [Source: 28] Global Default. Can be overridden in Frontmatter.
  show_webmentions = true
  # [Source: 29] Must match the specific account name used on webmention.io.
  username = "simplygregario.us"
  guestbookIntro = "Greetings... Think of this page as a virtual guestbook lying on a desk with a pen beside it, inviting visitors like you to sign it and leave a message."

# [Source: 31] Contact Form Settings
[contact]
  # [Source: 32] Formspree or similar URL
  formAction = "https://formspree.io/f/xblwegvw"
  intro = "Have a question or just want to say hi? Send me a message!"

# [Source: 34] Visual Theming
[theme]
  # Options: "sound", "market", "mountain", "forest", "sunset"
  colorScheme = "sunset"

# [Source: 36] Social Media - Dynamic Block
# Used by generate_icons.sh to fetch SVGs from Simple Icons.

[[social]]
  name = "BlueSky"
  handle = "@somegregariousdude.bsky.social"
  url = "https://bsky.app/profile/somegregariousdude.bsky.social"
  rel = "me"
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
# [Source: 45] Instant Messaging - Dynamic Block
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
EOF

# File: config/_default/menus.toml
cat <<'EOF' > "config/_default/menus.toml"
# ==============================================================================
# FILE: config/_default/menus.toml
# PURPOSE: Main Navigation Structure
# CONTEXT: Source [48-62]
# ==============================================================================

[[main]]
  name = "Home"
  url = "/"
  weight = 100

[[main]]
  # [Source: 52] Optional. Must appear between Home and Articles.
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
  # [New] Photos Content Type
  name = "Photos"
  url = "/photos/"
  weight = 350

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
EOF

# File: config/_default/markup.toml
cat <<'EOF' > "config/_default/markup.toml"
# [Source: 64] Strict Security Policy
[goldmark]
  [goldmark.renderer]
    unsafe = true 
  [goldmark.parser]
    attribute = { block = true, title = true }

# [Source: 65] Syntax Highlighting
[highlight]
  style = "monokai"
  lineNos = false
  noClasses = false
EOF

# File: package.json
cat <<'EOF' > "package.json"
{
  "name": "blog",
  "version": "1.0.0",
  "description": "An IndieWeb-focused, accessible static site built with Hugo.",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "type": "commonjs",
  "dependencies": {
    "pagefind": "^1.4.0"
  }
}
EOF

# File: package-lock.json
cat <<'EOF' > "package-lock.json"
{
  "name": "blog",
  "version": "1.0.0",
  "lockfileVersion": 3,
  "requires": true,
  "packages": {
    "": {
      "name": "blog",
      "version": "1.0.0",
      "license": "ISC",
      "dependencies": {
        "pagefind": "^1.4.0"
      }
    },
    "node_modules/@pagefind/darwin-arm64": {
      "version": "1.4.0",
      "resolved": "https://registry.npmjs.org/@pagefind/darwin-arm64/-/darwin-arm64-1.4.0.tgz",
      "integrity": "sha512-2vMqkbv3lbx1Awea90gTaBsvpzgRs7MuSgKDxW0m9oV1GPZCZbZBJg/qL83GIUEN2BFlY46dtUZi54pwH+/pTQ==",
      "cpu": [
        "arm64"
      ],
      "license": "MIT",
      "optional": true,
      "os": [
        "darwin"
      ]
    },
    "node_modules/@pagefind/darwin-x64": {
      "version": "1.4.0",
      "resolved": "https://registry.npmjs.org/@pagefind/darwin-x64/-/darwin-x64-1.4.0.tgz",
      "integrity": "sha512-e7JPIS6L9/cJfow+/IAqknsGqEPjJnVXGjpGm25bnq+NPdoD3c/7fAwr1OXkG4Ocjx6ZGSCijXEV4ryMcH2E3A==",
      "cpu": [
        "x64"
      ],
      "license": "MIT",
      "optional": true,
      "os": [
        "darwin"
      ]
    },
    "node_modules/@pagefind/freebsd-x64": {
      "version": "1.4.0",
      "resolved": "https://registry.npmjs.org/@pagefind/freebsd-x64/-/freebsd-x64-1.4.0.tgz",
      "integrity": "sha512-WcJVypXSZ+9HpiqZjFXMUobfFfZZ6NzIYtkhQ9eOhZrQpeY5uQFqNWLCk7w9RkMUwBv1HAMDW3YJQl/8OqsV0Q==",
      "cpu": [
        "x64"
      ],
      "license": "MIT",
      "optional": true,
      "os": [
        "freebsd"
      ]
    },
    "node_modules/@pagefind/linux-arm64": {
      "version": "1.4.0",
      "resolved": "https://registry.npmjs.org/@pagefind/linux-arm64/-/linux-arm64-1.4.0.tgz",
      "integrity": "sha512-PIt8dkqt4W06KGmQjONw7EZbhDF+uXI7i0XtRLN1vjCUxM9vGPdtJc2mUyVPevjomrGz5M86M8bqTr6cgDp1Uw==",
      "cpu": [
        "arm64"
      ],
      "license": "MIT",
      "optional": true,
      "os": [
        "linux"
      ]
    },
    "node_modules/@pagefind/linux-x64": {
      "version": "1.4.0",
      "resolved": "https://registry.npmjs.org/@pagefind/linux-x64/-/linux-x64-1.4.0.tgz",
      "integrity": "sha512-z4oddcWwQ0UHrTHR8psLnVlz6USGJ/eOlDPTDYZ4cI8TK8PgwRUPQZp9D2iJPNIPcS6Qx/E4TebjuGJOyK8Mmg==",
      "cpu": [
        "x64"
      ],
      "license": "MIT",
      "optional": true,
      "os": [
        "linux"
      ]
    },
    "node_modules/@pagefind/windows-x64": {
      "version": "1.4.0",
      "resolved": "https://registry.npmjs.org/@pagefind/windows-x64/-/windows-x64-1.4.0.tgz",
      "integrity": "sha512-NkT+YAdgS2FPCn8mIA9bQhiBs+xmniMGq1LFPDhcFn0+2yIUEiIG06t7bsZlhdjknEQRTSdT7YitP6fC5qwP0g==",
      "cpu": [
        "x64"
      ],
      "license": "MIT",
      "optional": true,
      "os": [
        "win32"
      ]
    },
    "node_modules/pagefind": {
      "version": "1.4.0",
      "resolved": "https://registry.npmjs.org/pagefind/-/pagefind-1.4.0.tgz",
      "integrity": "sha512-z2kY1mQlL4J8q5EIsQkLzQjilovKzfNVhX8De6oyE6uHpfFtyBaqUpcl/XzJC/4fjD8vBDyh1zolimIcVrCn9g==",
      "license": "MIT",
      "bin": {
        "pagefind": "lib/runner/bin.cjs"
      },
      "optionalDependencies": {
        "@pagefind/darwin-arm64": "1.4.0",
        "@pagefind/darwin-x64": "1.4.0",
        "@pagefind/freebsd-x64": "1.4.0",
        "@pagefind/linux-arm64": "1.4.0",
        "@pagefind/linux-x64": "1.4.0",
        "@pagefind/windows-x64": "1.4.0"
      }
    }
  }
}
EOF

# File: .gitignore
cat <<'EOF' > ".gitignore"
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
content/styleguide/
EOF

# File: CNAME
cat <<'EOF' > "CNAME"
simplygregario.us
EOF

# File: LICENSE
cat <<'EOF' > "LICENSE"
MIT License

Copyright (c) 2025 Gregory Lopez

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
EOF

# File: README.md
cat <<'EOF' > "README.md"
# Greg's Place

An IndieWeb-focused, accessible static site built with Hugo.

## 1. Key Features (v5.4)
* **Accessibility First (WCAG 2.2 AA):**
    * **Navigation Drawer:** Traps focus (Inert), supports Escape key.
    * **Sticky Header:** Keeps navigation visible for low-vision users.
    * **Toast Notifications:** Accessible status updates (Live Regions).
* **Quality of Life (QoL):**
    * **Rich Metadata:** Full Date/Time, Timezone, and Reading Time on all posts.
    * **Easy Copying:** "Pill" buttons to copy Webmention URLs instantly.
    * **Guestbook:** Dedicated Intro card + Site-wide Signature aggregation.
* **Material Design 3 (Complete):**
    * **Distinct Themes:** 5 unique color palettes for Light and Dark modes.
    * **Elevation & Shape:** Surface Tones, Pill shapes, and State Layers.
* **IndieWeb:** Native support for Webmentions, Microformats, and POSSE.

## 2. Cheat Sheet (Script Usage)

### Content Creation
Use the `new_post.sh` script to generate content.
**Usage:** `./new_post.sh [type] "[optional title]"`

| Type | Title | Folder Strategy | Notes |
| :--- | :--- | :--- | :--- |
| **articles** | **Required** | Slug (e.g., `/my-post/`) | Long-form essays. |
| **bookmarks** | **Required** | Slug (e.g., `/cool-tool/`) | Saved links. |
| **status** | Optional | Timestamp* | Quick notes. |
| **replies** | Optional | Timestamp* | Responses. Requires `reply_to`. |
| **reposts** | Optional | Timestamp* | Shares. Requires `repost_of`. |
| **likes** | Optional | Timestamp* | Appreciations. Requires `like_of`. |
| **rsvps** | Optional | Timestamp* | Events. Requires `rsvp`. |

***Quirk:** If you omit the title for optional types, the script automatically creates a timestamp-based directory.

### Maintenance
* **Rebuild Setup Script:** `./update_setup.sh` (Root Directory)
    * **Run this after ANY code change** to update the "Golden Master" backup.
* **Generate Icons:** `./generate_icons.sh`
    * Fetches SVGs at build time.

## 3. Shortcode Reference

### YouTube (Lite Facade)
Embeds a static thumbnail. Only loads the player on click.
```go
{{< youtube "VIDEO_ID" "Descriptive Title" >}}
```

### Mastodon (Static Facade)
Fetches content at **build time**.
```go
{{< mastodon host="mastodon.social" id="123456789" >}}
```

### Gallery
Renders a responsive grid of images from the page bundle.
```go
{{< gallery match="images/*" >}}
```

## 4. Installation & Deployment
* **Reproduction:** Run `./setup_project.sh` to rebuild this exact environment.
* **Deployment:** Pushing to `main` triggers GitHub Actions (Hugo Build -> Pagefind Index -> Deploy).

## 5. License
* **Codebase:** MIT License.
* **Content:** [Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)](http://creativecommons.org/licenses/by-sa/4.0/).
EOF

# File: project_context.txt
cat <<'EOF' > "project_context.txt"
# Project Context: Greg's Place (Master Spec v5.4)

## CONFIGURATION SPECIFICATION & GLOBAL PARAMETERS
This section defines the required structure for the `config/_default/` files.
All settings must include comments explaining their function and default values.

### 1. Main Configuration (hugo.toml)
* **Base URL:** `https://simplygregario.us`
* **Title:** "Greg's Place"
* **Theme:** "Accessible-MD"
* **Permalinks:**
    * `pages = "/:slug/"` (Critical: Ensures /about/ works at root).
    * `articles`, `bookmarks` -> Slug-based.
    * `status`, `replies`, etc. -> Timestamp-based.
* **Outputs:** Home/Section must output `["HTML", "RSS", "JSON"]`.

### 2. Parameters (params.toml)
* **[author]**: Name, Bio (H-Card), Photo, Location.
* **[webmentions]**: `username`, `show_webmentions`.
    * `guestbookIntro`: Text for the Guestbook Welcome Card.
* **[theme]**: Options: "sound", "market", "mountain", "forest", "sunset".
* **Social:** Display Strategy: Text-Only Links ("Name: @Handle") for accessibility.

---

## CORE ARCHITECTURE & PHILOSOPHY

* **Priority:** W3C Standards, WCAG 2.2 AA Accessibility, IndieWeb.
* **Privacy:** "Static Facades" for all embeds. No tracking pixels on load.
* **Regression Policy:**
    * **Visuals:** "Outlined Card" metaphor (High Contrast Borders).
    * **Accessibility:** Focus states must always be visible.
    * **Integrity:** `setup_project.sh` must always reflect the current production state.

---

## STYLING & UX (MATERIAL DESIGN 3 - COMPLETE)

### 1. Visual System
* **Themes:** 5 Distinct Palettes defined in `_variables.scss`.
    * **Light Mode:** High contrast. Backgrounds are **Tinted Off-Whites**.
    * **Dark Mode:** Backgrounds are **Deeply Tinted Surfaces** (e.g., Deep Evergreen).
* **Elevation (Surface Tones):**
    * **Dark Mode:** Uses Semi-transparent White Overlays.
    * **Light Mode:** Uses **Primary Color Tints** + Soft Shadows.
* **Shape:** "Pill" inputs (28px) and Medium Cards (12px).

### 2. Typography & Layout
* **Typescale:** Tight Headlines (`1.12` leading), Loose Body (`1.6` leading).
* **Navigation:**
    * **Desktop:** Sticky Top App Bar (requires `scroll-padding-top`).
    * **Mobile:** **Navigation Drawer** (Modal Side-Sheet) with focus trapping (Inert).
* **Metadata (QoL):**
    * Posts display **Full Date/Time** (with Timezone) and **Reading Time** (Clock Icon).
    * "Last Updated" date appears if different from publish date.

### 3. Interaction & Motion
* **State Layers:** Interactive elements use overlay tints instead of color swaps.
* **Motion:** All animations use MD3 Standard Easing.
* **Feedback:** "Copy Code" and "Copy URL" triggers an accessible **Toast Notification**.

---

## JAVASCRIPT POLICY & SECURITY

* **Principle:** Minimal, purposeful JS. No frameworks.
* **Approved Modules:**
    1.  **Menu:** Handles state toggling, Scrim clicks, and **Inert Attribute** management.
    2.  **Webmentions:** Client-side fetch and HTML sanitization.
    3.  **Share Modal:** Native `<dialog>` element.
    4.  **Toast:** Live region management for status updates.
    5.  **Copy Logic:** Handles `data-clipboard-text` for generic copy buttons (URL pills).
    6.  **Search:** Pagefind (Client-side) with customized MD3 styling.

---

## CONTENT ARCHETYPES & TEMPLATES

* **Architecture:**
    * **Universal Layout:** `single.html` handles all content types (Articles, Status, Replies) via conditional logic.
    * **Universal Webmentions:** `partials/webmentions-card.html` handles the UI.
        * **Articles:** Target = `.Permalink`
        * **Guestbook:** Target = `.Site.BaseURL`
* **Frontmatter:**
    * `show_webmentions`: Boolean toggle (Defaults to true via smart fallback).
    * IndieWeb Params: `reply_to`, `like_of`, `repost_of`, `bookmark_of`, `rsvp`.

---

## DEVELOPMENT & AUTOMATION STANDARDS

* **Source of Truth:** `setup_project.sh` (Generated via `update_setup.sh`).
* **Content Creation:** `./new_post.sh [type] "Title"`
* **Icons:** `./generate_icons.sh` (Build-time fetch).
* **Deployment:** GitHub Actions -> Pagefind Indexing -> Pages.

---

## HYBRID ARCHITECTURE (STATIC + DYNAMIC)

* **Hosting:** GitHub Pages (Static Content).
* **Identity:** IndieAuth.com (RelMeAuth via GitHub/Mastodon).
* **Publishing Backend:** IndieKit (Node.js on DigitalOcean).
    * **URL:** `https://indiekit.simplygregario.us`
    * **Role:** Receives Micropub requests -> Commits Markdown to GitHub.
    * **Database:** MongoDB Atlas (Stores media metadata & syndication targets).
EOF

# File: new_post.sh
cat <<'EOF' > "new_post.sh"
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
  echo "Types: articles, photos, status, replies, reposts, likes, bookmarks, rsvps"
  exit 1
fi

TYPE=$1
TITLE=$2

# Normalize Type (remove trailing slashes if present)
TYPE=${TYPE%/}

# ------------------------------------------------------------------------------
# LOGIC BLOCK: Validate Title Requirements
# [Source: 166] Articles & Bookmarks: Title is Required.
# [Update] Photos: Title is Optional (Snapshot mode).
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
hugo new content "$TARGET_PATH" --kind "$TYPE"

echo "Done."
EOF

# File: generate_icons.sh
cat <<'EOF' > "generate_icons.sh"
#!/bin/bash
# ==============================================================================
# SCRIPT: generate_icons.sh (LOCAL ASSET BUILDER - CLEAN MODE)
# PURPOSE: Fetch SVGs at build time.
# SAFETY: Wipes 'icons/' dir first to remove orphaned files.
# ==============================================================================

ICON_DIR="themes/Accessible-MD/layouts/partials/icons"

# 1. CLEANUP
echo "--- Cleaning Icon Directory ---"
if [ -d "$ICON_DIR" ]; then
    rm -f "$ICON_DIR"/*.svg
    echo "✓ Removed old SVGs."
fi
mkdir -p "$ICON_DIR"

# 2. SYSTEM ICONS (Material Symbols)
declare -A SYSTEM_ICONS=(
    ["search"]="search"
    ["menu"]="menu"
    ["close"]="close"
    ["home"]="home"
    ["articles"]="article"
    ["photos"]="photo_camera"
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
    ["share"]="share"
    ["event"]="event"
    ["schedule"]="schedule"
    ["styleguide"]="palette"
)

echo "--- Fetching System Icons ---"
for NAME in "${!SYSTEM_ICONS[@]}"; do
    MATERIAL_NAME="${SYSTEM_ICONS[$NAME]}"
    TARGET="$ICON_DIR/$NAME.svg"
    
    # Simple Fetch
    URL="https://raw.githubusercontent.com/google/material-design-icons/master/symbols/web/${MATERIAL_NAME}/materialsymbolsoutlined/${MATERIAL_NAME}_24px.svg"
    if curl -s -L -f "$URL" -o "$TARGET"; then
        echo "  ✓ $NAME"
    else
        echo "  X Failed to fetch $NAME"
    fi
done

# 3. SOCIAL ICONS (Simple Icons)
declare -A SOCIAL_ICONS=(
    ["bluesky"]="bluesky"
    ["facebook"]="facebook"
    ["github"]="github"
    ["mastodon"]="mastodon"
    ["matrix"]="matrix"
    ["messenger"]="messenger"
    ["reddit"]="reddit"
    ["signal"]="signal"
    ["simplex"]="simplex"
    ["youtube"]="youtube"
)

echo "--- Fetching Social Icons ---"
for NAME in "${!SOCIAL_ICONS[@]}"; do
    TARGET="$ICON_DIR/$NAME.svg"
    URL="https://cdn.simpleicons.org/$NAME" # Slug matches name
    
    if curl -s -L -f "$URL" -o "$TARGET"; then
         echo "  ✓ $NAME"
    else
         echo "  X Failed: $NAME (Creating fallback)"
         echo '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect></svg>' > "$TARGET"
    fi
done

# 4. FRIENDICA SPECIAL
TARGET="$ICON_DIR/friendica.svg"
URL="https://raw.githubusercontent.com/friendica/friendica/develop/images/friendica.svg"
if curl -s -L -f "$URL" -o "$TARGET"; then echo "  ✓ friendica"; else echo "  X Failed friendica"; fi

echo "Icon generation complete."
EOF

# File: debug_server.sh
cat <<'EOF' > "debug_server.sh"
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
EOF

# File: .github/workflows/hugo.yml
cat <<'EOF' > ".github/workflows/hugo.yml"
# [Source: 178] CI/CD Pipeline
name: Deploy to GitHub Pages

on:
  # Trigger on Push to Main (Deployment)
  push:
    branches: ["main"]
  
  # Trigger on PR to Main (Validation - Enables Status Checks)
  pull_request:
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
          node-version: '22' # [UPDATED] Matches Production Server (LTS)
          cache: 'npm'

      - name: Install Dependencies
        run: npm ci

      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v3
        with:
          hugo-version: '0.152.2' # [Source: 177] Pinned to match local environment
          extended: true

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
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    # Only deploy when pushing to main. Skips deployment on Pull Requests.
    if: github.ref == 'refs/heads/main'
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4 # [Source: 183]

  # [NEW] Webmention Sender Job
  # This runs ONLY after a successful deployment to 'main'
  send-webmentions:
    needs: deploy
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'
    steps:
      - name: Trigger Webmention.app
        # Pings the service to scan your RSS feed for new links to notify
        run: |
          curl -X POST "https://webmention.app/check/?url=https://simplygregario.us/index.xml&token=${{ secrets.WEBMENTION_TOKEN }}"
EOF

# File: themes/Accessible-MD/assets/scss/_base.scss
cat <<'EOF' > "themes/Accessible-MD/assets/scss/_base.scss"
body {
  margin: 0;
  font-family: 'Noto Sans', sans-serif;
  background-color: var(--md-sys-color-surface);
  color: var(--md-sys-color-on-surface);
  line-height: 1.5;
}

h1, h2, h3, h4 {
  font-family: 'Noto Serif', serif;
  margin-top: 0;
}

/* [Source: 194] Focus Appearance - High Contrast */
:focus-visible {
  outline: 3px solid var(--md-sys-color-primary);
  outline-offset: 2px;
}

/* [Source: 193] Skip Link */
.skip-link {
  position: absolute;
  top: -100px;
  left: 0;
  background: var(--md-sys-color-primary);
  color: var(--md-sys-color-on-primary);
  padding: 8px;
  z-index: 9999;
}

.skip-link:focus {
  top: 0;
}

/* [Patch] Sticky Header Anchor Offset */
html {
  scroll-padding-top: 100px;
}
EOF

# File: themes/Accessible-MD/assets/scss/_components.scss
cat <<'EOF' > "themes/Accessible-MD/assets/scss/_components.scss"
.outlined-card {
  background-color: var(--md-sys-color-surface);
  border: 1px solid var(--md-sys-color-outline-variant);
  border-radius: var(--md-sys-shape-corner-medium);
  padding: 16px;
  transition: background-color 0.2s ease, border-color 0.2s ease;
}

.outlined-card:hover {
  border-color: var(--md-sys-color-outline);
  background-color: rgba(var(--md-sys-color-primary), 0.05); /* Faked opacity */
}

/* Chips [Source: 111] */
.chip {
  display: inline-flex;
  align-items: center;
  border: 1px solid var(--md-sys-color-outline);
  border-radius: 8px;
  padding: 4px 8px;
  font-size: 0.875rem;
  margin-bottom: 8px;
  gap: 8px; /* Space between icon and text */
}

.chip-icon svg, .brand-icon svg {
  width: 18px;
  height: 18px;
  fill: currentColor;
  display: block;
}

.social-links, .im-links {
  list-style: none;
  padding: 0;
}

.social-link {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  text-decoration: none;
}

/* Webmentions [Refactored for Phase 02i] */
.webmentions-container {
  margin-top: 24px; /* Gap between Post Card and Mentions Card */
  /* Old border styles removed since it is now a card */
}

/* Header Layouts */
.headline-row {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-bottom: 8px;
}

.headline-row h1 {
  margin: 0;
}

.chip-icon-only {
  border: 1px solid var(--md-sys-color-outline);
  border-radius: 50%;
  padding: 8px;
  display: inline-flex;
  justify-content: center;
  align-items: center;
  width: 20px;
  height: 20px;
  color: var(--md-sys-color-primary);
}

.chip-icon-only:hover {
  background-color: rgba(var(--md-sys-color-primary), 0.1);
}

.feed-header .headline-row {
  margin-bottom: 4px;
}

.headline-row h2 {
  margin: 0;
  font-size: 1.25rem;
  line-height: 1.3;
}

.headline-row a {
  text-decoration: none;
  color: inherit;
}

.headline-row a:hover {
  text-decoration: underline;
  text-decoration-color: var(--md-sys-color-primary);
}

/* [Patch] Mobile Profile Photo Fix */
.u-photo {
  max-width: 100%;
  height: auto;
  border-radius: 50%;
}

/* [Patch] MD3 Search Bar (Pagefind Override) */
:root {
  --pagefind-ui-border-radius: 24px; /* Pill Shape */
  --pagefind-ui-font: 'Noto Sans', sans-serif;
  --pagefind-ui-primary: var(--md-sys-color-primary);
  --pagefind-ui-text: var(--md-sys-color-on-surface);
  --pagefind-ui-background: var(--md-sys-color-surface);
  --pagefind-ui-border: var(--md-sys-color-outline);
}

.pagefind-ui__search-input {
  border-radius: 28px !important; /* Force Pill Shape */
  padding-left: 24px !important;
  padding-right: 24px !important;
  border: 1px solid var(--md-sys-color-outline) !important;
  background-color: var(--md-sys-color-surface) !important;
  transition: border-color 0.2s var(--md-sys-motion-easing-standard);
}

.pagefind-ui__search-input:focus {
  outline: 2px solid var(--md-sys-color-primary) !important;
  outline-offset: 2px;
  border-color: var(--md-sys-color-primary) !important;
}

.pagefind-ui__drawer {
  /* Ensure dropdown results match our theme */
  background-color: var(--md-sys-color-surface) !important;
  border: 1px solid var(--md-sys-color-outline-variant);
  border-radius: var(--md-sys-shape-corner-medium);
  margin-top: 8px;
}

/* [Patch] MD3 State Layers */
.feed-item {
  @include state-layer;
}

.chip {
  @include state-layer(var(--md-sys-color-primary));
}

/* Ensure the chip icon stays colored correctly under the layer */
.chip:hover {
  background-color: transparent; /* Remove old hover */
}

/* [Patch] MD3 State Layers */
.feed-item {
  @include state-layer;
}

.chip {
  @include state-layer(var(--md-sys-color-primary));
}

/* Ensure the chip icon stays colored correctly under the layer */
.chip:hover {
  background-color: transparent; /* Remove old hover */
}

/* [Patch] Social Link State Layers */
.social-link {
  /* Add breathing room for the hover effect */
  padding: 8px 12px; 
  border-radius: 8px;
  margin: -8px -12px; /* Negative margin prevents layout shift */
  
  /* Apply the MD3 interaction */
  @include state-layer(var(--md-sys-color-primary));
}

/* [Patch] Code Block Copy Button - MD3 Interaction */
.copy-code-btn {
  /* Ensure it has the Pill/Circle shape */
  border-radius: 50%;
  border: 1px solid var(--md-sys-color-outline);
  
  /* Apply the State Layer Mixin */
  @include state-layer(var(--md-sys-color-primary));
  
  /* Clean up transition */
  transition: opacity 0.2s var(--md-sys-motion-easing-standard), background-color 0.2s;
}

.copy-code-btn:hover {
  /* Remove the old flat background, rely on State Layer tint */
  background-color: transparent; 
  border-color: var(--md-sys-color-primary);
}

/* [Patch] Search Results Elevation */
.pagefind-ui__drawer {
  /* Level 2: Floating menu */
  @include elevation(2);
}

/* [Patch] Pagefind Results Polish (MD3 List Item Style) */

/* The Dropdown Container */
.pagefind-ui__drawer {
  background-color: var(--md-sys-color-surface) !important;
  border: 1px solid var(--md-sys-color-outline-variant) !important;
  border-radius: 12px !important;
  box-shadow: none !important; /* We use our own Elevation mixin elsewhere */
  padding: 8px !important;
  margin-top: 8px !important;
}

/* Individual Result Item */
.pagefind-ui__result {
  border: none !important;
  border-radius: 8px !important; /* Inner radius */
  padding: 12px !important;
  margin-bottom: 4px !important;
  transition: background-color 0.2s var(--md-sys-motion-easing-standard);
  
  /* Use CSS nesting for interaction */
  &:hover, &:focus-within {
    background-color: rgba(var(--md-sys-color-primary), 0.08) !important; /* State Layer */
  }
}

/* The Result Image (Thumbnail) */
.pagefind-ui__result-thumb {
  border-radius: 8px !important;
  width: 64px !important;
  height: 64px !important;
  object-fit: cover;
  background-color: var(--md-sys-color-outline-variant);
}

/* Typography Overrides */
.pagefind-ui__result-title {
  font-family: 'Noto Serif', serif !important;
  font-weight: 600 !important;
  font-size: 1.125rem !important;
  color: var(--md-sys-color-primary) !important;
}

.pagefind-ui__result-excerpt {
  font-family: 'Noto Sans', sans-serif !important;
  font-size: 0.95rem !important;
  color: var(--md-sys-color-on-surface) !important;
  margin-top: 4px !important;
}

/* The "Mark" (Highlighting text matches) */
/* We replace the default yellow with a Theme-appropriate highlight */
.pagefind-ui__result-excerpt mark {
  background-color: rgba(var(--md-sys-color-tertiary), 0.3) !important;
  color: inherit !important;
  border-radius: 2px;
  padding: 0 2px;
  font-weight: 700;
}

/* The "Clear" Button in the Search Input */
.pagefind-ui__suppressed {
  color: var(--md-sys-color-on-surface) !important;
  opacity: 0.7;
}
.pagefind-ui__button {
  background: var(--md-sys-color-surface) !important;
  color: var(--md-sys-color-primary) !important;
  border: 1px solid var(--md-sys-color-outline) !important;
  border-radius: 20px !important; /* Pill button */
  margin-top: 12px;
}

/* [Patch] MD3 Snackbar (Toast) */
.md-toast {
  visibility: hidden; /* Hide from DOM when inactive */
  min-width: 250px;
  max-width: 90vw; /* Mobile safety */
  background-color: var(--md-sys-color-on-surface); /* Inverse Background */
  color: var(--md-sys-color-surface); /* Inverse Text */
  text-align: center;
  border-radius: 4px; /* MD3 Spec for single-line */
  padding: 14px 16px;
  position: fixed;
  z-index: 2000; /* Above everything, including Drawer */
  left: 50%;
  bottom: 24px; /* Resting position */
  transform: translateX(-50%) translateY(100%); /* Start slightly down */
  font-family: 'Noto Sans', sans-serif;
  font-size: 0.9rem;
  font-weight: 500;
  
  /* Motion */
  transition: transform 0.3s var(--md-sys-motion-easing-emphasized), 
              opacity 0.3s linear, 
              visibility 0s linear 0.3s;
  opacity: 0;
  
  /* Shadow for lift */
  box-shadow: 0 3px 5px -1px rgba(0,0,0,0.2), 
              0 6px 10px 0 rgba(0,0,0,0.14), 
              0 1px 18px 0 rgba(0,0,0,0.12);
}

.md-toast.show {
  visibility: visible;
  opacity: 1;
  transform: translateX(-50%) translateY(0); /* Slide up to position */
  transition: transform 0.3s var(--md-sys-motion-easing-emphasized), 
              opacity 0.3s linear, 
              visibility 0s linear 0s;
}

/* [Patch] Fix Generic Card Hover (MD3 Strictness) */
/* Static cards should NOT react to hover. Only interactive ones (feed-item) should. */
.outlined-card:hover {
  background-color: var(--md-sys-color-surface); /* Reset to base */
  border-color: var(--md-sys-color-outline-variant); /* Reset to base */
}

/* Re-apply interaction ONLY for Feed Items (which have State Layers) */
.feed-item:hover {
  /* The State Layer mixin handles the tint, so we just ensure the border stays distinct */
  border-color: var(--md-sys-color-outline);
}

/* [Patch] Webmention Layout (MD3 List Item) */
.mention {
  margin-bottom: 1rem;
  padding: 16px;
  /* Use a cleaner layout for comments */
  display: grid;
  grid-template-columns: 48px 1fr;
  gap: 16px;
  align-items: start;
}

.mention-author {
  /* Force the author block to just be the image context */
  grid-column: 1;
  display: flex;
  justify-content: center;
}

.mention-author img.u-photo {
  width: 40px;
  height: 40px;
  border-radius: 50%; /* Circle Avatar */
  object-fit: cover;
  border: 1px solid var(--md-sys-color-outline-variant);
}

/* The name and content live in the second column */
.mention-content-wrapper {
  grid-column: 2;
  display: flex;
  flex-direction: column;
}

/* We need to target the generated HTML structure. 
   Currently: .mention-author contains the link/name.
   We might need to adjust this via CSS since we can't easily change the JS structure 
   without breaking the script.
   
   Workaround: Flexbox the whole card.
*/
.mention {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.mention-author {
  display: flex;
  align-items: center;
  gap: 12px;
  font-family: 'Noto Sans', sans-serif;
  font-weight: 600;
  font-size: 1rem;
  color: var(--md-sys-color-on-surface);
}

.mention-author a {
  text-decoration: none;
  color: inherit;
}

.mention-author a:hover {
  text-decoration: underline;
  text-decoration-color: var(--md-sys-color-primary);
}

.mention-content {
  font-family: 'Noto Sans', sans-serif;
  font-size: 1rem;
  line-height: 1.5;
  color: var(--md-sys-color-on-surface);
  /* Indent slightly to align with text above? No, keep flush left on mobile. */
}

.mention time {
  font-size: 0.85rem;
  color: var(--md-sys-color-outline);
  margin-top: 4px;
  display: block;
}

/* [Patch] Post Metadata Styles */
.post-meta {
  display: flex;
  flex-wrap: wrap;
  gap: 16px;
  margin-top: 8px;
  margin-bottom: 16px;
  font-size: 0.9rem;
  color: var(--md-sys-color-outline);
}

.meta-item {
  display: flex;
  align-items: center;
  gap: 6px;
}

.meta-icon svg {
  width: 18px;
  height: 18px;
  fill: currentColor;
}

.dt-updated-label {
  font-style: italic;
  opacity: 0.8;
  margin-left: 4px;
}

/* [Patch] Webmention Copy Field */
.webmention-header {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  align-items: center;
  gap: 12px;
  margin-bottom: 16px;
  border-bottom: 1px solid var(--md-sys-color-outline-variant);
  padding-bottom: 12px;
}

.webmention-header h2 {
  margin: 0;
  font-size: 1.5rem;
}

.webmention-copy-field {
  display: inline-flex;
  align-items: center;
  background-color: var(--md-sys-color-surface); /* Contrast against card */
  border: 1px solid var(--md-sys-color-outline);
  border-radius: 24px; /* Pill */
  padding: 4px 4px 4px 16px;
  max-width: 100%;
}

.url-text {
  font-family: monospace;
  font-size: 0.85rem;
  color: var(--md-sys-color-on-surface);
  margin-right: 8px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  max-width: 200px; /* Truncate long URLs on mobile */
}

.copy-btn {
  background: var(--md-sys-color-primary);
  color: var(--md-sys-color-on-primary);
  border: none;
  border-radius: 50%;
  width: 32px;
  height: 32px;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  @include state-layer(currentColor);
}

.copy-btn svg {
  width: 16px;
  height: 16px;
  fill: currentColor;
}

/* [Patch] MD3 Context Blocks (IndieWeb) */

.context-container {
  display: flex;
  flex-direction: column;
  gap: 8px;
  margin-bottom: 24px;
}

.context-block {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 12px 16px;
  border-radius: 12px; /* MD3 Medium Shape */
  
  /* MD3 Tonal Surface: Tinted background, no outline */
  background-color: rgba(var(--md-sys-color-primary), 0.08);
  color: var(--md-sys-color-on-surface);
  
  font-family: 'Noto Sans', sans-serif;
  font-size: 0.95rem;
}

.context-icon svg {
  width: 20px;
  height: 20px;
  fill: var(--md-sys-color-primary);
  display: block;
}

.context-label {
  font-weight: 600;
  color: var(--md-sys-color-primary);
  white-space: nowrap;
}

.context-link {
  text-decoration: none;
  color: var(--md-sys-color-on-surface);
  opacity: 0.8;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  
  /* Add State Layer for interaction */
  padding: 4px 8px;
  border-radius: 4px;
  margin-left: auto; /* Push to right if we want, or keep inline */
  @include state-layer(var(--md-sys-color-primary));
}

/* Specific Tints for different types (Optional: kept uniform for now to match MD3 system) */

/* List View Mini-Context */
.context-mini {
  display: flex;
  align-items: center;
  gap: 8px;
  margin-bottom: 12px;
  font-size: 0.85rem;
  color: var(--md-sys-color-outline);
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 0.05em;
}

.context-mini svg {
  width: 16px;
  height: 16px;
  fill: currentColor;
}

.context-mini a {
  color: inherit;
  text-decoration: none;
  border-bottom: 1px dotted currentColor;
}

/* [Patch] Syndication (POSSE) Styles */
.syndication-container {
  margin-top: 24px;
  padding-top: 16px;
  border-top: 1px solid var(--md-sys-color-outline-variant);
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.syndication-label {
  font-size: 0.85rem;
  font-weight: 500;
  color: var(--md-sys-color-outline);
  text-transform: uppercase;
  letter-spacing: 0.05em;
}

.syndication-chips {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}

/* Ensure syndication chips look like standard chips but maybe smaller/distinct */
.chip.u-syndication {
  @include state-layer(var(--md-sys-color-secondary));
  border-color: var(--md-sys-color-outline-variant);
}

/* [Patch] MD3 Hero Card & Chip Styles */

/* 1. Profile Hero Card (md-hero-card) */
.md-hero-card {
  /* Elevation: Lift it slightly */
  @include elevation(1);
  /* Use Surface Container High for a distinct background tint */
  background-color: var(--md-sys-color-surface-container-high) !important;
  border-radius: 20px; /* Softer, friendlier corners */
}

.hero-content-wrapper {
  display: grid;
  grid-template-columns: 200px 1fr; /* Image width | Content width */
  gap: 32px;
  align-items: start;
}

.hero-avatar-area {
  grid-column: 1;
  text-align: center;
}

.hero-avatar-area h1 {
  /* H1 is visible here but text-only on mobile */
  font-size: 2rem; /* Display Small size */
  margin-bottom: 12px;
}

.hero-details-area {
  grid-column: 2;
  padding-top: 12px;
}

/* 2. MD3 Assist Chips for Social Links (Replaces List) */
.social-chips-row {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin-top: 8px;
  list-style: none; /* Remove list item dots */
}

.social-chip {
  /* MD3 Assist Chip Styling */
  display: inline-flex;
  align-items: center;
  border-radius: 20px; /* Pill Shape */
  padding: 6px 12px;
  border: 1px solid var(--md-sys-color-outline-variant);
  background-color: var(--md-sys-color-surface); /* Inner Surface */
  text-decoration: none;
  font-size: 0.9rem;
  color: var(--md-sys-color-on-surface);
  
  /* Apply state layer for interaction */
  @include state-layer(var(--md-sys-color-primary));
}

.social-chip .brand-icon {
  margin-right: 6px;
  color: var(--md-sys-color-primary);
}

.social-chip:hover {
  background-color: var(--md-sys-color-surface) !important; /* Reset component hover */
  border-color: var(--md-sys-color-outline);
}


/* 3. Tablet/Mobile Adjustments */
@media (max-width: 768px) {
  .hero-content-wrapper {
    grid-template-columns: 1fr; /* Stacked */
    gap: 16px;
  }
  .hero-avatar-area {
    grid-column: 1;
    text-align: left;
    display: flex;
    align-items: center;
    gap: 16px;
  }
  .hero-avatar-area h1 {
    display: none; /* Hide H1 visually, keep in DOM for microformats */
  }
  .u-photo {
    width: 100px;
    height: 100px;
  }
}

/* [Patch] Hero Card Metadata Visibility Fix */
.profile-meta.is-mobile-hidden {
  display: none;
}
.profile-meta.is-desktop-hidden {
  display: block;
}

@media (min-width: 769px) {
  .profile-meta.is-mobile-hidden {
    display: block;
  }
  .profile-meta.is-desktop-hidden {
    display: none;
  }
}
EOF

# File: themes/Accessible-MD/assets/scss/_images.scss
cat <<'EOF' > "themes/Accessible-MD/assets/scss/_images.scss"
/* --- MD3 Images & Galleries --- */

/* Single Image Wrapper */
.md-figure {
  margin: 2rem 0;
  display: block;
}

/* The Image Itself */
.md-image {
  max-width: 100%;
  height: auto;
  display: block;
  border-radius: var(--md-sys-shape-corner-medium);
  border: 1px solid var(--md-sys-color-outline-variant);
  background-color: var(--md-sys-color-surface);
}

/* Captions */
.md-figcaption {
  margin-top: 0.75rem;
  font-size: 0.9rem;
  color: var(--md-sys-color-outline);
  font-family: 'Noto Sans', sans-serif;
  text-align: center;
  font-style: italic;
}

/* Gallery Grid (Responsive Masonry-ish) */
.md-gallery-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
  gap: 12px;
  margin: 2rem 0;
}

.gallery-item {
  display: block;
  border-radius: var(--md-sys-shape-corner-medium);
  overflow: hidden;
  border: 1px solid var(--md-sys-color-outline-variant);
  transition: border-color 0.2s, transform 0.2s;
  aspect-ratio: 1 / 1; /* Force square thumbnails */
}

.gallery-item:hover, .gallery-item:focus-visible {
  border-color: var(--md-sys-color-primary);
  transform: scale(1.02);
  outline: none;
}

.gallery-item img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}
EOF

# File: themes/Accessible-MD/assets/scss/_layout.scss
cat <<'EOF' > "themes/Accessible-MD/assets/scss/_layout.scss"
.container {
  max-width: 800px;
  margin: 0 auto;
  padding: 0 16px;
}

.site-header {
  padding: 16px 0;
  border-bottom: 1px solid var(--md-sys-color-outline-variant);
  background: var(--md-sys-color-surface);
  position: sticky; top: 0; z-index: 100; max-height: 100vh; overflow-y: auto; /* For z-index context */
}

.header-inner {
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-wrap: wrap;
}

.site-title {
  font-family: 'Noto Serif', serif;
  font-weight: 700;
  font-size: 1.25rem;
  text-decoration: none;
  color: var(--md-sys-color-on-surface);
}

/* --- Desktop Navigation (Default) --- */
.nav-list {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  gap: 16px;
  flex-wrap: wrap;
}

.nav-list a {
  text-decoration: none;
  color: var(--md-sys-color-on-surface);
  font-weight: 500;
}

.nav-list a[aria-current="page"] {
  color: var(--md-sys-color-primary);
  border-bottom: 2px solid var(--md-sys-color-primary);
}

/* --- Mobile Toggle Button --- */
.menu-toggle {
  display: none; /* Hidden on Desktop */
  background: none;
  border: 1px solid var(--md-sys-color-outline);
  border-radius: 8px;
  cursor: pointer;
  padding: 8px;
  color: var(--md-sys-color-primary);
}

.menu-toggle .icon-box svg {
  width: 24px;
  height: 24px;
  fill: currentColor;
  display: block;
}

/* --- Mobile Responsive States --- */
@media (max-width: 768px) {
  .menu-toggle {
    display: block; /* Show button */
  }

  .site-header {
    padding-bottom: 8px;
  }

  #main-nav {
    width: 100%; /* Force new line */
    margin-top: 16px;
  }

  /* Hidden State */
  .nav-list {
    display: none; 
    flex-direction: column;
    gap: 8px;
    width: 100%;
    padding-bottom: 16px;
  }

  /* Expanded State (Toggled via JS) */
  .nav-list.is-open {
    display: flex;
    animation: slideDown 0.2s ease-out;
  }

  .nav-list li {
    width: 100%;
  }

  .nav-list a {
    display: block;
    padding: 12px;
    background-color: rgba(var(--md-sys-color-primary), 0.05);
    border-radius: 8px;
  }
  
  .nav-list a:hover {
     background-color: rgba(var(--md-sys-color-primary), 0.1);
  }
}

@keyframes slideDown {
  from { opacity: 0; transform: translateY(-10px); }
  to { opacity: 1; transform: translateY(0); }
}

.site-footer {
  border-top: 1px solid var(--md-sys-color-outline-variant);
  margin-top: 32px;
  padding: 16px 0;
}

.feed-item {
  margin-bottom: 16px;
}

/* Section Intro (Added Phase 02o) */
.section-intro {
  margin-bottom: 24px;
  font-size: 1.1rem;
  line-height: 1.6;
  color: var(--md-sys-color-on-surface);
  max-width: 65ch; /* Optimal reading width for introductory text */
}

/* [Patch] MD3 Navigation Drawer Upgrade */
@media (max-width: 768px) {
  /* The Drawer Itself */
  .nav-list {
    display: block; /* Always exist in DOM for transitions */
    position: fixed;
    top: 0;
    right: 0; /* Slide in from Right */
    width: 300px; /* Standard MD3 width */
    max-width: 80%;
    height: 100vh;
    background-color: var(--md-sys-color-surface);
    border-left: 1px solid var(--md-sys-color-outline-variant);
    box-shadow: -4px 0 12px rgba(0,0,0,0.2); /* Scrim shadow */
    padding: 72px 16px 24px 16px; /* Top padding to clear close button space */
    z-index: 1000;
    
    /* Animation State: Closed */
    transform: translateX(100%);
    transition: transform 0.3s var(--md-sys-motion-easing-standard); /* MD3 Standard Easing */
    overflow-y: auto;
  }

  /* Animation State: Open */
  .nav-list.is-open {
    display: block;
    transform: translateX(0);
  }

  /* The Backdrop (Scrim) */
  /* We use the ::before pseudo-element on the nav container when open */
  #main-nav.has-scrim::before {
    content: "";
    position: fixed;
    inset: 0;
    background-color: rgba(0,0,0,0.5);
    z-index: 999;
    animation: fadeIn 0.3s;
  }

  /* Close Button visibility */
  .menu-toggle {
    position: relative;
    z-index: 1001; /* Above the drawer so it can toggle back */
  }
}

@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}

/* [Patch] Safari Visibility Fix */
@media (max-width: 768px) {
  .nav-list {
    /* VISIBILITY LOCK: Ensure it is completely hidden when closed */
    visibility: hidden;
    
    /* Transition: Transform (slide) + Visibility (delayed hide) */
    /* We delay hiding visibility (0.3s) so the slide animation finishes first */
    transition: transform 0.3s var(--md-sys-motion-easing-standard), visibility 0s linear 0.3s;
    
    /* Safety: Ensure Safari treats this as a fixed layer */
    -webkit-transform: translateX(100%);
    transform: translateX(100%);
  }

  .nav-list.is-open {
    /* VISIBILITY UNLOCK: Show immediately when open */
    visibility: visible;
    
    /* Remove delay so it appears instantly as it slides in */
    transition: transform 0.3s var(--md-sys-motion-easing-standard), visibility 0s linear 0s;
    
    -webkit-transform: translateX(0);
    transform: translateX(0);
  }
}

/* [Patch] MD3 State Layers */
.nav-list a {
  @include state-layer(var(--md-sys-color-primary));
  /* Remove old hover background */
  &:hover { background-color: transparent; }
}

/* [Patch] MD3 State Layers */
.nav-list a {
  @include state-layer(var(--md-sys-color-primary));
  /* Remove old hover background */
  &:hover { background-color: transparent; }
}

/* [Patch] MD3 Elevation Application */
.site-header {
  /* Level 2: Standard for Top App Bars */
  @include elevation(2);
  /* Ensure border stays visible or remove it if elevation is enough separation */
  border-bottom: 1px solid rgba(var(--md-sys-color-outline), 0.2); 
}

@media (max-width: 768px) {
  .nav-list {
    /* Level 3: Modal Navigation Drawer sits above the header */
    @include elevation(3);
  }
}

/* [Patch] MD3 Navigation Active Pill */
.nav-list a {
  /* Reset the padding added by state layers for uniformity */
  padding: 8px 12px;
  border-radius: 20px;
}

.nav-list a[aria-current="page"] {
  /* Remove old underline */
  border-bottom: none;
  /* Add MD3 Pill look: Tinted background */
  background-color: rgba(var(--md-sys-color-primary), 0.12); 
  color: var(--md-sys-color-primary); /* Primary text on Tinted Primary background */
  font-weight: 700;
}
EOF

# File: themes/Accessible-MD/assets/scss/_mastodon.scss
cat <<'EOF' > "themes/Accessible-MD/assets/scss/_mastodon.scss"
/* Mastodon Static Facade */
/* Extends .outlined-card logic but specific to social embeds */

.mastodon-card {
  /* Inherits base .outlined-card styles from _components.scss */
  max-width: 600px;
  margin: 2rem auto;
  font-family: 'Noto Sans', sans-serif;
}

.mastodon-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin-bottom: 1rem;
}

.mastodon-author {
  display: flex;
  gap: 12px;
  align-items: center;
}

.mastodon-author img.u-photo {
  border-radius: 50%;
  object-fit: cover;
  background-color: var(--md-sys-color-outline-variant);
}

.author-meta {
  display: flex;
  flex-direction: column;
  line-height: 1.2;
}

.author-meta a {
  text-decoration: none;
  color: var(--md-sys-color-on-surface);
}

.author-meta a:hover {
  text-decoration: underline;
}

.p-nickname {
  font-size: 0.85rem;
  color: var(--md-sys-color-outline);
}

.mastodon-logo {
  color: var(--md-sys-color-primary);
  width: 24px;
  height: 24px;
}

.mastodon-logo svg {
  width: 100%;
  height: 100%;
  fill: currentColor;
}

.mastodon-card .e-content {
  font-size: 1rem;
  line-height: 1.5;
  margin-bottom: 1rem;
}

.mastodon-card .e-content p {
  margin-bottom: 0.5rem;
}

.mastodon-card .e-content a {
  color: var(--md-sys-color-secondary);
  word-break: break-all;
}

.mastodon-media {
  display: grid;
  gap: 8px;
  margin-bottom: 1rem;
  border-radius: 8px;
  overflow: hidden;
}

.mastodon-media img {
  width: 100%;
  height: auto;
  display: block;
  background-color: rgba(0,0,0,0.05);
}

.mastodon-footer {
  display: flex;
  align-items: center;
  justify-content: space-between;
  border-top: 1px solid var(--md-sys-color-outline-variant);
  padding-top: 12px;
  font-size: 0.85rem;
  color: var(--md-sys-color-outline);
}

.mastodon-stats {
  display: flex;
  gap: 16px;
}

.button-small {
  text-decoration: none;
  color: var(--md-sys-color-primary);
  font-weight: 600;
}

.button-small:hover {
  background-color: rgba(var(--md-sys-color-primary), 0.1);
  padding: 4px 8px;
  margin: -4px -8px;
  border-radius: 4px;
}

/* [Patch] Modernize Mastodon Button */
.mastodon-footer .button-small {
  padding: 6px 12px;
  border-radius: 16px;
  background-color: transparent;
  /* Use mixin for interaction */
  @include state-layer(var(--md-sys-color-primary));
  
  /* Override old hover */
  &:hover {
    background-color: transparent; 
    padding: 6px 12px;
    margin: 0;
  }
}
EOF

# File: themes/Accessible-MD/assets/scss/_share.scss
cat <<'EOF' > "themes/Accessible-MD/assets/scss/_share.scss"
.share-card {
  margin-top: 2rem;
  margin-bottom: 2rem;
  
  h3 {
    margin-top: 0;
    font-size: 1.25rem;
  }
}

.share-buttons-row {
  display: flex;
  gap: 12px;
  flex-wrap: wrap;
}

.share-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 48px;
  height: 48px;
  border-radius: 50%;
  border: 1px solid var(--md-sys-color-outline);
  background-color: transparent;
  color: var(--md-sys-color-primary);
  cursor: pointer;
  transition: background-color 0.2s, transform 0.2s;
  
  &:hover {
    background-color: rgba(var(--md-sys-color-primary), 0.1);
    transform: scale(1.05);
  }
  
  svg {
    width: 24px;
    height: 24px;
    fill: currentColor;
  }
}

/* Modal Styling */
dialog#fedi-share-dialog {
  border: 1px solid var(--md-sys-color-outline-variant);
  border-radius: var(--md-sys-shape-corner-medium);
  background: var(--md-sys-color-surface);
  color: var(--md-sys-color-on-surface);
  padding: 24px;
  max-width: 400px;
  width: 90%;
  
  &::backdrop {
    background: rgba(0, 0, 0, 0.5);
  }
  
  h3 {
    margin-top: 0;
  }
  
  .form-group {
    margin: 16px 0;
    
    input {
      width: 100%;
      padding: 12px;
      border: 1px solid var(--md-sys-color-outline);
      border-radius: 8px;
      background: var(--md-sys-color-surface);
      color: var(--md-sys-color-on-surface);
      font-size: 1rem;
    }
  }
  
  .dialog-actions {
    display: flex;
    justify-content: flex-end;
    gap: 12px;
  }
  
  button {
    padding: 8px 16px;
    border-radius: 20px;
    border: none;
    cursor: pointer;
    font-weight: 600;
  }
  
  .button-primary {
    background: var(--md-sys-color-primary);
    color: var(--md-sys-color-on-primary);
  }
  
  .button-secondary {
    background: transparent;
    color: var(--md-sys-color-primary);
    
    &:hover {
      background: rgba(var(--md-sys-color-primary), 0.1);
    }
  }
}

/* [Patch] MD3 State Layers */
.share-btn {
  @include state-layer(var(--md-sys-color-primary));
  &:hover { background-color: transparent; transform: scale(1.05); }
}

/* [Patch] MD3 State Layers */
.share-btn {
  @include state-layer(var(--md-sys-color-primary));
  &:hover { background-color: transparent; transform: scale(1.05); }
}

/* [Patch] Dialog Elevation */
dialog#fedi-share-dialog {
  /* Level 3: Modal Dialog */
  @include elevation(3);
  border: none; /* Elevation defines the edge now */
}

/* [Patch] Force Icon Visibility */
.share-btn svg,
.share-btn svg path {
  /* Force the icon to use the button's text color (Primary) */
  fill: currentColor !important;
}

/* Ensure the button itself has the correct text color */
.share-btn {
  color: var(--md-sys-color-primary) !important;
}

/* [Hotfix] Aggressive Visibility for Button Icons */
.share-btn svg, 
.share-btn svg * {
  /* Force the fill to be the Primary Theme Color */
  fill: var(--md-sys-color-primary) !important;
  
  /* Fallback for stroke-based icons */
  color: var(--md-sys-color-primary) !important;
}
EOF

# File: themes/Accessible-MD/assets/scss/_typography.scss
cat <<'EOF' > "themes/Accessible-MD/assets/scss/_typography.scss"
/* TYPE SCALE & MD3 MAPPINGS */
/* Font Family Defaults */
:root {
  --font-headline: 'Noto Serif', serif;
  --font-body: 'Noto Sans', sans-serif;
}

/* Base Color & Margins */
h1, h2, h3, h4, h5, h6 {
  font-family: var(--font-headline);
  color: var(--md-sys-color-on-surface);
  margin-top: 2rem;
  margin-bottom: 1rem;
}

/* MD3 Display & Headline Styles */
/* Large text needs TIGHTER spacing (-tracking) and leading to hold together */

h1 { 
  font-size: 2.5rem; 
  font-weight: 700; 
  line-height: 1.12; /* Tighter leading for large text */
  letter-spacing: -0.02em; /* Negative tracking */
  margin-top: 0; 
}

h2 { 
  font-size: 2rem; 
  font-weight: 600; 
  line-height: 1.2; 
  letter-spacing: -0.01em; 
}

h3 { 
  font-size: 1.75rem; 
  font-weight: 600; 
  line-height: 1.25; 
  letter-spacing: 0; /* Neutral tracking */
}

/* MD3 Title Styles */
/* Medium text needs standard spacing */

h4 { 
  font-size: 1.5rem; 
  font-weight: 600; 
  line-height: 1.3; 
  letter-spacing: 0.01em; 
}

h5 { 
  font-size: 1.25rem; 
  font-weight: 600; 
  line-height: 1.3; 
  letter-spacing: 0.01em; 
}

/* MD3 Label/Overline */
/* Small caps need VERY LOOSE spacing to be readable */
h6 { 
  font-size: 1rem; 
  font-weight: 600; 
  text-transform: uppercase; 
  letter-spacing: 0.06em; /* Wide tracking */
  line-height: 1.4;
}

/* MD3 Body Styles */
/* Body text needs positive tracking for accessibility */

p {
  font-family: var(--font-body);
  font-size: 1.125rem; /* 18px Body Large */
  line-height: 1.6; /* Relaxed reading height */
  letter-spacing: 0.01em; /* Breathing room */
  margin-bottom: 1rem;
  color: var(--md-sys-color-on-surface);
  max-width: 70ch; /* Optimal reading line length */
}

/* Links */
a {
  color: var(--md-sys-color-primary);
  text-decoration: underline;
  text-decoration-thickness: 1px;
  text-underline-offset: 2px;
  transition: background-color 0.2s;
}

a:hover {
  text-decoration-thickness: 2px;
  background-color: rgba(var(--md-sys-color-primary), 0.05);
}

/* Utilities */
hr {
  border: 0;
  height: 1px;
  background-color: var(--md-sys-color-outline-variant);
  margin: 2rem 0;
  width: 100%;
}

blockquote {
  margin: 1.5rem 0;
  padding: 1rem 1.5rem;
  border-left: 4px solid var(--md-sys-color-primary);
  background-color: rgba(var(--md-sys-color-primary), 0.05);
  font-style: italic;
  border-radius: 0 var(--md-sys-shape-corner-medium) var(--md-sys-shape-corner-medium) 0;
}
blockquote p:last-child { margin-bottom: 0; }

ul, ol { margin-bottom: 1rem; padding-left: 2rem; }
li { margin-bottom: 0.5rem; line-height: 1.6; letter-spacing: 0.01em; }
li::marker { color: var(--md-sys-color-secondary); }

/* Code */
code {
  font-family: monospace;
  background-color: var(--md-sys-color-outline-variant);
  color: var(--md-sys-color-on-surface);
  padding: 0.2em 0.4em;
  border-radius: 4px;
  font-size: 0.9em;
}

pre {
  background-color: #272822;
  color: #f8f8f2;
  padding: 1rem;
  border-radius: var(--md-sys-shape-corner-medium);
  overflow-x: auto;
  margin-bottom: 1.5rem;
  border: 1px solid var(--md-sys-color-outline-variant);
}
pre code { background-color: transparent; padding: 0; }

/* Tables */
table { width: 100%; border-collapse: collapse; margin: 1.5rem 0; font-size: 0.95rem; }
th, td { padding: 12px; border: 1px solid var(--md-sys-color-outline-variant); text-align: left; }
th { background-color: rgba(var(--md-sys-color-primary), 0.05); font-weight: 700; }

/* Helper Wrapper for Code Copy Button */
.code-block-wrapper { position: relative; margin-bottom: 1.5rem; }
.code-block-wrapper pre { margin-bottom: 0; }

.copy-code-btn {
  position: absolute; top: 8px; right: 8px;
  background-color: var(--md-sys-color-surface);
  border: 1px solid var(--md-sys-color-outline);
  color: var(--md-sys-color-primary);
  border-radius: 50%; width: 32px; height: 32px;
  display: flex; align-items: center; justify-content: center;
  cursor: pointer; opacity: 0.5; z-index: 2;
  transition: opacity 0.2s, background-color 0.2s;
}
.copy-code-btn:hover { opacity: 1; background-color: var(--md-sys-color-outline-variant); }
.copy-code-btn svg { width: 18px; height: 18px; fill: currentColor; }

/* Table Wrapper */
.table-wrapper {
  overflow-x: auto; margin-bottom: 1.5rem;
  border: 1px solid var(--md-sys-color-outline-variant);
  border-radius: var(--md-sys-shape-corner-medium);
}
.md-table { width: 100%; border-collapse: collapse; font-size: 0.95rem; border: none; }
.md-table caption {
  caption-side: top; text-align: left; padding: 12px 16px;
  font-family: var(--font-headline); font-weight: 700;
  color: var(--md-sys-color-primary);
  background-color: rgba(var(--md-sys-color-primary), 0.05);
  border-bottom: 1px solid var(--md-sys-color-outline-variant);
}
.md-table th, .md-table td { padding: 12px 16px; border-bottom: 1px solid var(--md-sys-color-outline-variant); white-space: nowrap; }
.md-table th { background-color: var(--md-sys-color-surface); font-weight: 600; color: var(--md-sys-color-on-surface); }
.md-table tr:last-child td { border-bottom: none; }
.md-table tbody tr:nth-child(even) { background-color: rgba(var(--md-sys-color-primary), 0.02); }

/* [Patch] MD3 Body Element Polish */

/* 1. Blockquotes: "Container" Style */
blockquote {
  margin: 2rem 0;
  padding: 1.5rem 2rem;
  /* Surface Variant background (tinted) */
  background-color: rgba(var(--md-sys-color-primary), 0.08);
  /* Thick accent on the left */
  border-left: 4px solid var(--md-sys-color-primary);
  /* Rounded corners (Top-Right, Bottom-Right) */
  border-radius: 0 16px 16px 0;
  position: relative;
}

/* Optional: Add a subtle Quote Icon watermark */
blockquote::before {
  content: "“";
  position: absolute;
  top: -10px;
  right: 10px;
  font-family: serif;
  font-size: 4rem;
  color: var(--md-sys-color-primary);
  opacity: 0.1;
  pointer-events: none;
}

/* 2. Horizontal Rules: "Divider" Token */
hr {
  border: 0;
  height: 1px;
  /* Use Outline Variant for subtle separation */
  background-color: var(--md-sys-color-outline-variant);
  margin: 3rem auto; /* More breathing room */
  width: 100%;
  max-width: 200px; /* Center it nicely */
}

/* 3. Tables: "Data Grid" Style */
.table-wrapper {
  border: 1px solid var(--md-sys-color-outline-variant);
  border-radius: 12px; /* Matches Card Radius */
  overflow: hidden; /* Clips the inner table corners */
  margin-bottom: 2rem;
}

.md-table th {
  /* Header Row: Distinct Tint */
  background-color: rgba(var(--md-sys-color-primary), 0.12);
  color: var(--md-sys-color-on-surface);
  font-weight: 700;
  text-transform: uppercase;
  font-size: 0.85rem;
  letter-spacing: 0.05em;
  border-bottom: 1px solid var(--md-sys-color-outline-variant);
}

.md-table td {
  border-bottom: 1px solid var(--md-sys-color-outline-variant);
}

/* Zebra Striping */
.md-table tbody tr:nth-child(even) {
  background-color: rgba(var(--md-sys-color-on-surface), 0.03);
}
EOF

# File: themes/Accessible-MD/assets/scss/_variables.scss
cat <<'EOF' > "themes/Accessible-MD/assets/scss/_variables.scss"
:root {
  /* --- GLOBAL SHAPE & SPACING --- */
  --md-sys-shape-corner-medium: 12px;
  --md-sys-spacing-base: 8px;
  
  /* MD3 Motion Easing */
  --md-sys-motion-easing-standard: cubic-bezier(0.2, 0.0, 0, 1.0);
  --md-sys-motion-easing-emphasized: cubic-bezier(0.2, 0.0, 0, 1.0);
  --md-sys-motion-easing-decelerate: cubic-bezier(0.05, 0.7, 0.1, 1.0);
  
  /* Shared Text Colors */
  --md-sys-color-on-surface-dark: #E6E1E5;
  --md-sys-color-outline-dark: #938F99;
  --md-sys-color-outline-variant-dark: #49454F;
}

/* ==========================================================================
   THEME 1: THE SOUND (Default)
   Light: Ice Blue | Dark: Midnight Blue
   ========================================================================== */
:root {
  /* DISTINCT LIGHT BACKGROUND */
  --md-sys-color-surface: #F4F6F8; /* Alice Blue tint */
  --md-sys-color-on-surface: #1C1B1F;
  --md-sys-color-outline: #79747E;
  --md-sys-color-outline-variant: #CAC4D0;
  
  --md-sys-color-primary: #4A5D8A;
  --md-sys-color-on-primary: #FFFFFF;
  --md-sys-color-secondary: #4A7A7A;
  --md-sys-color-tertiary: #A64B3B;
  
  /* Light Mode Elevation Tint: Primary Color */
  --md-elevation-overlay: var(--md-sys-color-primary);
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-sys-color-surface: #0F111A;
    --md-sys-color-on-surface: var(--md-sys-color-on-surface-dark);
    --md-sys-color-outline: var(--md-sys-color-outline-dark);
    --md-sys-color-outline-variant: var(--md-sys-color-outline-variant-dark);
    
    --md-sys-color-primary: #B0C4DE;
    --md-sys-color-secondary: #A7C7C7;
    --md-sys-color-tertiary: #FFB4A2;
    
    /* Dark Mode Elevation Tint: White */
    --md-elevation-overlay: #FFFFFF;
  }
}

/* ==========================================================================
   THEME 2: THE MARKET
   Light: Warm Cream | Dark: Espresso
   ========================================================================== */
[data-theme="market"] {
  --md-sys-color-surface: #FFF8F4; /* Floral White */
  --md-sys-color-primary: #4E342E;
  --md-sys-color-secondary: #C62828;
  --md-sys-color-tertiary: #985E00;
  --md-elevation-overlay: var(--md-sys-color-primary);
}

@media (prefers-color-scheme: dark) {
  [data-theme="market"] {
    --md-sys-color-surface: #1A120F;
    --md-sys-color-primary: #D7CCC8;
    --md-sys-color-secondary: #EF9A9A;
    --md-sys-color-tertiary: #FFE082;
    --md-elevation-overlay: #FFFFFF;
  }
}

/* ==========================================================================
   THEME 3: THE MOUNTAIN
   Light: Ghost White | Dark: Slate
   ========================================================================== */
[data-theme="mountain"] {
  --md-sys-color-surface: #F5F7FA; /* Cool Grey-White */
  --md-sys-color-primary: #455A64;
  --md-sys-color-secondary: #00838F;
  --md-sys-color-tertiary: #5E35B1;
  --md-elevation-overlay: var(--md-sys-color-primary);
}

@media (prefers-color-scheme: dark) {
  [data-theme="mountain"] {
    --md-sys-color-surface: #101416;
    --md-sys-color-primary: #B0BEC5;
    --md-sys-color-secondary: #80DEEA;
    --md-sys-color-tertiary: #B39DDB;
    --md-elevation-overlay: #FFFFFF;
  }
}

/* ==========================================================================
   THEME 4: THE FOREST
   Light: Mint Cream | Dark: Deep Evergreen
   ========================================================================== */
[data-theme="forest"] {
  --md-sys-color-surface: #F4F7F4; /* Subtle Green Tint */
  --md-sys-color-primary: #1B5E20;
  --md-sys-color-secondary: #5D4037;
  --md-sys-color-tertiary: #33691E;
  --md-elevation-overlay: var(--md-sys-color-primary);
}

@media (prefers-color-scheme: dark) {
  [data-theme="forest"] {
    --md-sys-color-surface: #0E140E;
    --md-sys-color-primary: #A5D6A7;
    --md-sys-color-secondary: #BCAAA4;
    --md-sys-color-tertiary: #C5E1A5;
    --md-elevation-overlay: #FFFFFF;
  }
}

/* ==========================================================================
   THEME 5: THE SUNSET
   Light: Lavender Blush | Dark: Plum
   ========================================================================== */
[data-theme="sunset"] {
  --md-sys-color-surface: #FFF5F7; /* Warm Pink Tint */
  --md-sys-color-primary: #311B92;
  --md-sys-color-secondary: #880E4F;
  --md-sys-color-tertiary: #BF360C;
  --md-elevation-overlay: var(--md-sys-color-primary);
}

@media (prefers-color-scheme: dark) {
  [data-theme="sunset"] {
    --md-sys-color-surface: #1A0F14;
    --md-sys-color-primary: #9FA8DA;
    --md-sys-color-secondary: #F48FB1;
    --md-sys-color-tertiary: #FFCC80;
    --md-elevation-overlay: #FFFFFF;
  }
}
EOF

# File: themes/Accessible-MD/assets/scss/_youtube.scss
cat <<'EOF' > "themes/Accessible-MD/assets/scss/_youtube.scss"
.youtube-lite {
  position: relative;
  width: 100%;
  aspect-ratio: 16 / 9;
  overflow: hidden;
  cursor: pointer;
  background-color: #000;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0;
  border-radius: var(--md-sys-shape-corner-medium);
  
  /* Add State Layer to the whole container */
  @include state-layer(white);
}

.youtube-lite img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  opacity: 0.8;
  transition: opacity 0.3s var(--md-sys-motion-easing-standard);
}

.youtube-lite:hover img,
.youtube-lite:focus-visible img {
  opacity: 0.6; /* Dim image slightly to make play button pop */
}

/* Play Button */
.youtube-lite .play-button {
  position: absolute;
  width: 68px;
  height: 48px;
  background-color: rgba(33, 33, 33, 0.8);
  border-radius: 12px;
  z-index: 2;
  transition: transform 0.2s var(--md-sys-motion-easing-standard), background-color 0.2s;
  display: flex;
  align-items: center;
  justify-content: center;
}

/* MD3: Scale up on hover instead of just changing color */
.youtube-lite:hover .play-button {
  background-color: #f00;
  transform: scale(1.1);
}

.youtube-lite .play-button::before {
  content: "";
  border-style: solid;
  border-width: 10px 0 10px 20px;
  border-color: transparent transparent transparent #fff;
}

.youtube-lite iframe {
  width: 100%;
  height: 100%;
  border: none;
}
EOF

# File: themes/Accessible-MD/assets/scss/main.scss
cat <<'EOF' > "themes/Accessible-MD/assets/scss/main.scss"
@import "variables";
@import "elevation";
@import "state_layer";
@import "base";
@import "typography";
@import "forms";
@import "layout";
@import "components";
@import "youtube";
@import "mastodon";
@import "images";
@import "share";
@import "utility_pages";
@import "content_types";
EOF

# File: themes/Accessible-MD/assets/scss/_elevation.scss
cat <<'EOF' > "themes/Accessible-MD/assets/scss/_elevation.scss"
/* MD3 Elevation System (Surface Tones) */
@mixin elevation($level) {
  --elevation-tint: 0;
  @if $level == 1 { --elevation-tint: 0.05; }
  @if $level == 2 { --elevation-tint: 0.08; }
  @if $level == 3 { --elevation-tint: 0.11; }
  @if $level == 4 { --elevation-tint: 0.12; }
  @if $level == 5 { --elevation-tint: 0.14; }
  background-image: linear-gradient(
    rgba(var(--md-elevation-overlay), var(--elevation-tint)),
    rgba(var(--md-elevation-overlay), var(--elevation-tint))
  );
  background-color: color-mix(in srgb, var(--md-elevation-overlay) calc(var(--elevation-tint) * 100%), var(--md-sys-color-surface));
  @supports not (background-color: color-mix(in srgb, red, blue)) { background-color: var(--md-sys-color-surface); }
  @media (prefers-color-scheme: light) { box-shadow: 0px #{$level}px #{$level * 2}px rgba(0, 0, 0, 0.1); }
}
EOF

# File: themes/Accessible-MD/assets/scss/_state_layer.scss
cat <<'EOF' > "themes/Accessible-MD/assets/scss/_state_layer.scss"
/* MD3 State Layer Mixin */
@mixin state-layer($color: currentColor) {
  position: relative; overflow: hidden;
  &::before {
    content: ""; position: absolute; inset: 0; background-color: $color;
    opacity: 0; z-index: 1; pointer-events: none;
    transition: opacity 0.2s var(--md-sys-motion-easing-standard, ease);
  }
  &:hover::before { opacity: 0.08; }
  &:focus-visible::before { opacity: 0.12; }
  &:active::before { opacity: 0.12; }
}
EOF

# File: themes/Accessible-MD/assets/scss/_forms.scss
cat <<'EOF' > "themes/Accessible-MD/assets/scss/_forms.scss"
/* MD3 Forms & Buttons */
input[type="text"], input[type="email"], textarea {
  width: 100%; padding: 12px 16px; border: 1px solid var(--md-sys-color-outline);
  border-radius: 8px; background-color: var(--md-sys-color-surface);
  color: var(--md-sys-color-on-surface); font-family: 'Noto Sans', sans-serif;
  font-size: 1rem; transition: border-color 0.2s var(--md-sys-motion-easing-standard); margin-bottom: 1rem;
}
input[type="text"], input[type="email"] { border-radius: 28px; padding-left: 24px; padding-right: 24px; }
input:focus, textarea:focus { outline: 2px solid var(--md-sys-color-primary); outline-offset: 2px; border-color: var(--md-sys-color-primary); }
button, .button-primary, .button-secondary {
  display: inline-flex; align-items: center; justify-content: center;
  padding: 10px 24px; border-radius: 20px; font-weight: 600; font-family: 'Noto Sans', sans-serif;
  cursor: pointer; text-decoration: none; border: none; @include state-layer(currentColor);
}
.button-primary { background-color: var(--md-sys-color-primary); color: var(--md-sys-color-on-primary); }
.button-secondary { background-color: transparent; color: var(--md-sys-color-primary); border: 1px solid var(--md-sys-color-outline); }
EOF

# File: themes/Accessible-MD/assets/scss/_content_types.scss
cat <<'EOF' > "themes/Accessible-MD/assets/scss/_content_types.scss"
/* MD3 Content Type Variations */

/* 1. STATUS UPDATES ("The Note Card") */
article.status {
  background-color: var(--md-sys-color-surface-variant); /* Tinted Background */
  border: none;
  border-radius: 16px;
  color: var(--md-sys-color-on-surface-variant);
}
article.status .outlined-card:hover {
  background-color: var(--md-sys-color-surface-variant); 
}

/* 2. BOOKMARKS ("The Reference") */
article.bookmarks {
  border: 2px dashed var(--md-sys-color-outline);
  background-color: transparent;
}
article.bookmarks .post-header h1 {
  text-decoration: underline;
  text-decoration-style: dotted;
  text-decoration-color: var(--md-sys-color-tertiary);
}

/* 3. REPLIES ("The Thread") */
article.replies {
  border-left: 4px solid var(--md-sys-color-tertiary);
  border-radius: 4px 12px 12px 4px;
  padding-left: 24px;
}
article.replies .context-block {
  background-color: rgba(var(--md-sys-color-tertiary), 0.1);
  border: 1px solid rgba(var(--md-sys-color-tertiary), 0.2);
}

/* 4. LIKES ("The Signal") */
article.likes {
  border-radius: 100px;
  padding: 12px 24px;
  display: flex;
  align-items: center;
  gap: 16px;
  flex-wrap: wrap;
}
.feed-item.likes .e-content, 
.feed-item.likes footer {
  display: none; /* Hide body content in feed */
}
article.likes .context-block {
  margin: 0; padding: 0; background: none; border: none; flex-grow: 1;
}

/* 5. REPOSTS ("The Frame") */
article.reposts {
  background-color: var(--md-sys-color-surface);
  border: 1px solid var(--md-sys-color-outline-variant);
  position: relative;
  overflow: hidden;
}
article.reposts::before {
  content: "⟳";
  position: absolute;
  top: -20px; right: 10px; font-size: 100px;
  color: var(--md-sys-color-secondary);
  opacity: 0.05; pointer-events: none; line-height: 1;
}

/* 6. RSVPs ("The Ticket") */
article.rsvps {
  border-left: 12px solid var(--md-sys-color-primary);
  border-radius: 4px 12px 12px 4px;
}
article.rsvps .context-label strong {
  background-color: var(--md-sys-color-primary);
  color: var(--md-sys-color-on-primary);
  padding: 2px 6px;
  border-radius: 4px;
}

/* 7. PHOTOS ("The Gallery Frame") */
article.photos {
  border: 2px solid var(--md-sys-color-primary);
  background-color: var(--md-sys-color-surface);
}

article.photos .md-figure {
  /* Pull the image to the edges of the card for a "bleed" effect on mobile */
  margin-left: -16px;
  margin-right: -16px;
  width: calc(100% + 32px);
  max-width: none;
  border-radius: 0;
  border-left: none;
  border-right: none;
}

/* Ensure focus visibility remains on links inside */
article.photos a:focus-visible {
  outline-offset: -2px; /* Pull outline inside to avoid clipping */
}
EOF

# File: themes/Accessible-MD/assets/scss/_utility_pages.scss
cat <<'EOF' > "themes/Accessible-MD/assets/scss/_utility_pages.scss"
/* MD3 Utility Page Styles */
.guestbook-intro {
  border-left: 8px solid var(--md-sys-color-secondary) !important;
  background-color: var(--md-sys-color-surface-variant) !important;
  color: var(--md-sys-color-on-surface-variant) !important;
  border-radius: 4px 12px 12px 4px !important;
}
.guestbook-intro .lead { font-size: 1.2rem; font-weight: 500; margin-bottom: 1rem; }
.contact-page {
  border-top: 4px solid var(--md-sys-color-primary) !important;
  border-radius: 4px 4px 12px 12px !important;
  @include elevation(2);
}
.search-page {
  border: 2px solid var(--md-sys-color-tertiary) !important;
  box-shadow: 0 0 0 1px var(--md-sys-color-surface) inset !important;
  background-image: radial-gradient(var(--md-sys-color-outline-variant) 1px, transparent 1px);
  background-size: 20px 20px;
  background-color: var(--md-sys-color-surface);
}
.search-tips {
  background-color: var(--md-sys-color-surface-variant);
  color: var(--md-sys-color-on-surface-variant);
  padding: 16px; border-radius: 12px; margin-bottom: 24px; font-size: 0.95rem;
  border-left: 4px solid var(--md-sys-color-tertiary);
}
.search-tips h2 { margin-top: 0; font-size: 1.1rem; display: flex; align-items: center; gap: 8px; }
article.manifesto {
  padding: 32px !important;
  border: 1px solid var(--md-sys-color-outline-variant);
  box-shadow: inset 0 0 0 4px var(--md-sys-color-surface), inset 0 0 0 5px var(--md-sys-color-outline-variant);
}
article.manifesto .post-header { text-align: center; margin-bottom: 3rem; border-bottom: 1px solid var(--md-sys-color-outline-variant); padding-bottom: 2rem; }
article.manifesto .p-name { font-size: 3rem; margin-bottom: 0.5rem; }
article.manifesto .headline-row { justify-content: center; }
EOF

# File: themes/Accessible-MD/assets/js/copy-code.js
cat <<'EOF' > "themes/Accessible-MD/assets/js/copy-code.js"
document.addEventListener('DOMContentLoaded', () => {
    // Select both code block buttons and generic copy buttons
    const copyButtons = document.querySelectorAll('.copy-code-btn, .copy-btn');
    const toast = document.getElementById('global-toast');
    let toastTimeout;

    function showToast(message) {
        if (!toast) return;
        toast.textContent = message;
        toast.classList.add('show');
        clearTimeout(toastTimeout);
        toastTimeout = setTimeout(() => {
            toast.classList.remove('show');
        }, 4000);
    }

    copyButtons.forEach(btn => {
        btn.addEventListener('click', () => {
            let textToCopy = '';

            // Strategy 1: Data Attribute (Direct Copy)
            if (btn.hasAttribute('data-clipboard-text')) {
                textToCopy = btn.getAttribute('data-clipboard-text');
            } 
            // Strategy 2: Sibling Code Block (Legacy Support)
            else {
                const pre = btn.nextElementSibling;
                if (pre && pre.querySelector('code')) {
                    textToCopy = pre.querySelector('code').innerText;
                }
            }

            if (!textToCopy) return;

            navigator.clipboard.writeText(textToCopy).then(() => {
                // Visual Feedback
                const originalIcon = btn.innerHTML;
                btn.innerHTML = '<span role="img" aria-label="Copied">✓</span>'; 
                btn.setAttribute('aria-label', 'Copied!');
                
                showToast("Copied to clipboard");
                
                setTimeout(() => {
                    btn.innerHTML = originalIcon;
                    // Restore label based on type
                    const label = btn.classList.contains('copy-code-btn') ? 'Copy code' : 'Copy link';
                    btn.setAttribute('aria-label', label);
                }, 2000);
            }).catch(err => {
                console.error('Failed to copy:', err);
                showToast("Failed to copy");
            });
        });
    });
});
EOF

# File: themes/Accessible-MD/assets/js/menu.js
cat <<'EOF' > "themes/Accessible-MD/assets/js/menu.js"
document.addEventListener('DOMContentLoaded', () => {
    const toggle = document.getElementById('menu-toggle');
    const menu = document.getElementById('main-menu');
    const navContainer = document.getElementById('main-nav');
    
    // Targets to hide from VoiceOver when menu is open
    const mainContent = document.getElementById('main-content');
    const footer = document.querySelector('.site-footer');

    if (!toggle || !menu) return;

    // Helper: Close Menu
    function closeMenu() {
        toggle.setAttribute('aria-expanded', 'false');
        toggle.setAttribute('aria-label', 'Open Menu');
        menu.classList.remove('is-open');
        navContainer.classList.remove('has-scrim');
        
        // Restore scrolling and accessibility
        document.body.style.overflow = ''; 
        if (mainContent) mainContent.removeAttribute('inert');
        if (footer) footer.removeAttribute('inert');
    }

    // Helper: Open Menu
    function openMenu() {
        toggle.setAttribute('aria-expanded', 'true');
        toggle.setAttribute('aria-label', 'Close Menu');
        menu.classList.add('is-open');
        navContainer.classList.add('has-scrim');
        
        // Lock scrolling and hide background content from VoiceOver
        document.body.style.overflow = 'hidden';
        if (mainContent) mainContent.setAttribute('inert', '');
        if (footer) footer.setAttribute('inert', '');
    }

    // 1. Toggle Click
    toggle.addEventListener('click', (e) => {
        e.stopPropagation();
        const isExpanded = toggle.getAttribute('aria-expanded') === 'true';
        if (isExpanded) {
            closeMenu();
        } else {
            openMenu();
        }
    });

    // 2. Click Outside (Scrim) to Close
    document.addEventListener('click', (e) => {
        const isExpanded = toggle.getAttribute('aria-expanded') === 'true';
        if (isExpanded && !menu.contains(e.target) && !toggle.contains(e.target)) {
            closeMenu();
        }
    });

    // 3. Escape Key to Close
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && toggle.getAttribute('aria-expanded') === 'true') {
            closeMenu();
            toggle.focus();
        }
    });
});
EOF

# File: themes/Accessible-MD/assets/js/share.js
cat <<'EOF' > "themes/Accessible-MD/assets/js/share.js"
document.addEventListener('DOMContentLoaded', () => {
    const dialog = document.getElementById('fedi-share-dialog');
    const fediBtns = document.querySelectorAll('.fediverse-btn');
    const goBtn = document.getElementById('fedi-go-btn');
    const input = document.getElementById('fedi-domain');
    
    let activeHandle = ''; // Store the handle of the network clicked

    if (!dialog) return;

    let currentTitle = document.title;
    let currentUrl = window.location.href;

    // 1. Open Modal & Capture Handle
    fediBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            // Read the handle specific to this button (Friendica vs Mastodon)
            activeHandle = btn.dataset.handle || '';
            
            dialog.showModal();
            input.focus();
        });
    });

    // 2. Handle "Go"
    goBtn.addEventListener('click', () => {
        const domain = input.value.trim();
        if (!domain) return;

        // Construct Text: "Title URL via @handle"
        let text = `${currentTitle} ${currentUrl}`;
        if (activeHandle) {
            text += ` via ${activeHandle}`;
        }

        // Generic Fediverse Share URL Pattern
        const shareUrl = `https://${domain}/share?text=${encodeURIComponent(text)}`;
        
        window.open(shareUrl, '_blank', 'noopener,noreferrer');
        dialog.close();
    });
});
EOF

# File: themes/Accessible-MD/assets/js/webmentions.js
cat <<'EOF' > "themes/Accessible-MD/assets/js/webmentions.js"
/**
 * Webmention Logic
 * Context: Source [214] Minimal, purposeful JS.
 * Refactored: Phase 02j (Robustness Patch)
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
            // [Patch] Filter out completely empty/malformed items
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
            prev.onclick = () => { 
                currentPage--; 
                renderPage(currentPage);
                list.focus(); 
            };
            nav.appendChild(prev);
        }

        if (page < totalPages) {
            const next = document.createElement('button');
            next.innerText = 'Next';
            next.className = 'button-secondary';
            next.onclick = () => { 
                currentPage++; 
                renderPage(currentPage);
                list.focus();
            };
            nav.appendChild(next);
        }
        
        list.appendChild(nav);
    }

    function buildMentionHTML(item) {
        const author = item.author || {};
        const name = author.name || 'Anonymous';
        // [Patch] Handle missing URLs to prevent broken/internal links
        const authorLink = author.url 
            ? `<a href="${author.url}" class="p-name u-url" rel="nofollow">${name}</a>`
            : `<span class="p-name">${name}</span>`;
            
        const content = sanitize(item.content ? item.content.html || item.content.text : '');
        
        // [Patch] Handle missing dates
        let timeHtml = '';
        if (item.published) {
            const dateStr = new Date(item.published).toLocaleDateString();
            if (dateStr !== 'Invalid Date') {
                timeHtml = `<time class="dt-published">${dateStr}</time>`;
            }
        }
        
        return `
            <div class="mention-author u-author h-card">
                <img src="${author.photo || '/images/default-avatar.png'}" alt="" class="u-photo">
                ${authorLink}
            </div>
            <div class="mention-content p-content">
                ${content}
            </div>
            ${timeHtml}
        `;
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
                if (attr.name.startsWith('on') || 
                   (attr.name === 'href' && attr.value.toLowerCase().startsWith('javascript:'))) {
                    el.removeAttribute(attr.name);
                }
            });
        });

        return doc.body.innerHTML;
    }
})();
EOF

# File: themes/Accessible-MD/assets/js/youtube-lite.js
cat <<'EOF' > "themes/Accessible-MD/assets/js/youtube-lite.js"
document.addEventListener('DOMContentLoaded', () => {
    const players = document.querySelectorAll('.youtube-lite');

    players.forEach(player => {
        // Handle Mouse Click
        player.addEventListener('click', (e) => loadVideo(player));

        // Handle Keyboard (Enter/Space)
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
        
        // [Source: 191] Call API only on click
        // Using youtube-nocookie for extra privacy
        const iframe = document.createElement('iframe');
        iframe.setAttribute('src', `https://www.youtube-nocookie.com/embed/${id}?autoplay=1`);
        iframe.setAttribute('title', title);
        iframe.setAttribute('allow', 'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture');
        iframe.setAttribute('allowfullscreen', '');
        
        // Clear thumbnail and play button
        wrapper.innerHTML = '';
        wrapper.appendChild(iframe);
        wrapper.dataset.loaded = 'true';
    }
});
EOF

# File: themes/Accessible-MD/layouts/index.html
cat <<'EOF' > "themes/Accessible-MD/layouts/index.html"
{{ define "main" }}
<section class="feed-stream">

  {{/* 1. AUTHOR PROFILE CARD (The MD3 Hero - h-card is preserved) */}}
  <article class="h-card profile-card outlined-card md-hero-card" style="margin-bottom: 2rem;">
    
    {{/* Hero Layout Container */}}
    <div class="hero-content-wrapper">
      
      {{/* Image Side */}}
      <div class="hero-avatar-area">
        {{/* p-name is preserved here for h-card compliance */}}
        <h1 class="p-name">{{ .Site.Params.author.name }}</h1>
        {{ $avatar := resources.Get .Site.Params.author.photo }}
        {{ if $avatar }}
          {{ $avatar := $avatar.Fill "500x500 Center webp" }}
          {{/* u-photo is preserved here */}}
          <img class="u-photo" src="{{ $avatar.RelPermalink }}" alt="Profile Photo" width="{{ $avatar.Width }}" height="{{ $avatar.Height }}">
        {{ else }}
          <div class="u-photo-placeholder" style="background:#ccc;width:150px;height:150px;border-radius:50%;">?</div>
        {{ end }}
        
        {{/* Location is visible near photo on mobile view */}}
        <div class="profile-meta is-desktop-hidden">
          <span class="p-locality">{{ .Site.Params.author.location.city }}</span>,
          <span class="p-region">{{ .Site.Params.author.location.state }}</span>
        </div>
      </div>

      {{/* Text & Links Side */}}
      <div class="hero-details-area">
        {{/* p-note (bio) is preserved */}}
        <p class="p-note">{{ .Site.Params.author.bio }}</p>

        <div class="profile-meta is-mobile-hidden">
          <span class="p-locality">{{ .Site.Params.author.location.city }}</span>,
          <span class="p-region">{{ .Site.Params.author.location.state }}</span>
        </div>
        
        <h2>Social Media</h2>
        {{/* Social Links rendered as MD3 Assist Chips */}}
        <div class="social-chips-row">
          {{ range .Site.Params.social }}
            {{ partial "ui/social-chip.html" . }}
          {{ end }}
        </div>

        {{ if .Site.Params.im }}
        <h2>Messaging Services</h2>
        <div class="social-chips-row">
          {{ range .Site.Params.im }}
            {{ partial "ui/social-chip.html" . }}
          {{ end }}
        </div>
        {{ end }}
      </div>
      
    </div>
  </article>

  {{/* 2. FEED SECTION TITLE */}}
  <h1>Latest Updates</h1>

  {{/* 3. FEED LOGIC (h-entry is preserved on <article> below) */}}
  {{ $allowed_sections := slice "articles" "status" "replies" "reposts" "likes" "bookmarks" "rsvps" }}
  {{ $feed := where .Site.RegularPages "Section" "in" $allowed_sections }}
  {{ $paginator := .Paginate $feed }}

  <div class="post-feed">
    {{ range $paginator.Pages }}
      {{/* MICROFORMAT CHECK: h-entry is preserved here */}}
      <article class="feed-item outlined-card h-entry {{ .Type }}">
        <header class="feed-header">
          <div class="headline-row">
            {{ partial "ui/chip.html" . }}
            <h2 class="p-name"><a href="{{ .Permalink }}" class="u-url">{{ .Title }}</a></h2>
          </div>
          <time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">
            {{ .Date.Format "Jan 02, 2006" }}
          </time>
        </header>
        <div class="feed-content p-summary">
          {{ if .Params.summary }}{{ .Params.summary }}{{ else }}{{ .Content | plainify | truncate 500 }}{{ end }}
        </div>
        <a href="{{ .Permalink }}" class="u-url">Read More</a>
      </article>
    {{ else }}
      <div class="outlined-card">
        <h3>No updates found.</h3>
        <p>The stream is currently quiet.</p>
      </div>
    {{ end }}
  </div>

  {{ template "_internal/pagination.html" . }}
</section>
{{ end }}
EOF

# File: themes/Accessible-MD/layouts/index.json
cat <<'EOF' > "themes/Accessible-MD/layouts/index.json"
{
    "version": "https://jsonfeed.org/version/1",
    "title": "{{ .Site.Title }}",
    "home_page_url": "{{ .Site.BaseURL }}",
    "feed_url": "{{ .Permalink }}",
    "items": [
        {{ range $index, $element := .Site.RegularPages }}{{ if $index }},{{ end }}
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
EOF

# File: themes/Accessible-MD/layouts/404.html
cat <<'EOF' > "themes/Accessible-MD/layouts/404.html"
{{ define "main" }}
<section class="error-page outlined-card">
  <h1>404: Page Not Found</h1>
  <p>Sorry, the page you are looking for has moved or does not exist.</p>

  <div class="recovery-actions">
    <a href="/" class="button-primary">Back to Home</a>
    
    <div class="search-recovery">
      <p>Or try searching for it:</p>
      <div id="search"></div>
    </div>
  </div>
</section>

<link href="/pagefind/pagefind-ui.css" rel="stylesheet">
<script src="/pagefind/pagefind-ui.js"></script>

<script>
    window.addEventListener('DOMContentLoaded', (event) => {
        new PagefindUI({ element: "#search", showSubResults: true });
    });
</script>
{{ end }}
EOF

# File: themes/Accessible-MD/layouts/_default/baseof.html
cat <<'EOF' > "themes/Accessible-MD/layouts/_default/baseof.html"
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

  {{/* BUNDLE: Webmentions + YouTube + Menu + Copy Code */}}
  {{ $js := slice (resources.Get "js/webmentions.js") (resources.Get "js/youtube-lite.js") (resources.Get "js/menu.js") (resources.Get "js/copy-code.js") (resources.Get "js/share.js") (resources.Get "js/share.js") (resources.Get "js/share.js") | resources.Concat "js/main.js" | resources.Minify | resources.Fingerprint }}
  <script src="{{ $js.RelPermalink }}" defer></script>
</body>
</html>
EOF

# File: themes/Accessible-MD/layouts/_default/list.html
cat <<'EOF' > "themes/Accessible-MD/layouts/_default/list.html"
{{ define "main" }}
<section class="list-feed h-feed">
  <div class="headline-row">
     {{ partial "ui/chip.html" . }}
     <h1 class="p-name">{{ .Title }}</h1>
  </div>

  {{ with .Content }}
  <div class="section-intro p-summary">
    {{ . }}
  </div>
  {{ end }}
  
  <div class="post-feed">
    {{ range .Paginator.Pages }}
      {{/* Add .Type class for CSS targeting */}}
      <article class="feed-item outlined-card h-entry {{ .Type }}">
        <div style="display: none;" class="p-author h-card">
           <a href="{{ .Site.BaseURL }}" class="u-url p-name">{{ .Site.Params.author.name }}</a>
        </div>

        {{/* Context Mini-Header */}}
        {{ if .Params.reply_to }}<div class="context-mini">{{ partial "icons/replies.svg" . }} <span>Replying to <a href="{{ .Params.reply_to }}" class="u-in-reply-to">{{ .Params.reply_to | truncate 30 }}</a></span></div>{{ end }}
        {{ if .Params.like_of }}<div class="context-mini">{{ partial "icons/likes.svg" . }} <span>Liked <a href="{{ .Params.like_of }}" class="u-like-of">{{ .Params.like_of | truncate 30 }}</a></span></div>{{ end }}
        {{ if .Params.repost_of }}<div class="context-mini">{{ partial "icons/reposts.svg" . }} <span>Reposted <a href="{{ .Params.repost_of }}" class="u-repost-of">{{ .Params.repost_of | truncate 30 }}</a></span></div>{{ end }}
        {{ if .Params.bookmark_of }}<div class="context-mini">{{ partial "icons/bookmarks.svg" . }} <span>Bookmarked <a href="{{ .Params.bookmark_of }}" class="u-bookmark-of">{{ .Params.bookmark_of | truncate 30 }}</a></span></div>{{ end }}
        {{ if .Params.rsvp }}<div class="context-mini">{{ partial "icons/rsvps.svg" . }} <span>RSVP: <span class="p-rsvp">{{ .Params.rsvp | upper }}</span></span></div>{{ end }}

        <header class="feed-header">
          <div class="headline-row">
            {{ partial "ui/chip.html" . }}
            <h2 class="p-name"><a href="{{ .Permalink }}" class="u-url">{{ .Title }}</a></h2>
          </div>
          <time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">
            {{ .Date.Format "Jan 02, 2006" }}
          </time>
        </header>

        <div class="feed-content p-summary">
          {{ if .Params.summary }}{{ .Params.summary }}{{ else }}{{ .Content | truncate 500 }}{{ end }}
        </div>
      </article>
    {{ end }}
  </div>
  {{ template "_internal/pagination.html" . }}
</section>
{{ end }}
EOF

# File: themes/Accessible-MD/layouts/_default/list.json
cat <<'EOF' > "themes/Accessible-MD/layouts/_default/list.json"
{
    "version": "https://jsonfeed.org/version/1",
    "title": "{{ .Title }} | {{ .Site.Title }}",
    "home_page_url": "{{ .Site.BaseURL }}",
    "feed_url": "{{ .Permalink }}",
    "items": [
        {{ range $index, $element := .Paginator.Pages }}{{ if $index }},{{ end }}
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
EOF

# File: themes/Accessible-MD/layouts/_default/single.html
cat <<'EOF' > "themes/Accessible-MD/layouts/_default/single.html"
{{ define "main" }}
{{/* The {{ .Type }} class allows CSS to target specific content types */}}
<article class="single-post h-entry outlined-card {{ .Type }}">
  
  {{/* METADATA BLOCK: Hidden */}}
  <div style="display: none;">
    <div class="p-author h-card">
      <a href="{{ .Site.BaseURL }}" class="u-url p-name">{{ .Site.Params.author.name }}</a>
      <img src="{{ .Site.Params.author.photo | absURL }}" class="u-photo" alt="{{ .Site.Params.author.name }}">
    </div>
    {{/* FIX: Strict u-url */}}
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

  {{/* Context Blocks */}}
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
    {{ partial "syndication.html" . }}

    {{ if .Params.tags }}
    {{/* FIX: Clean p-category (no visual #) */}}
    <ul class="tags">
      {{ range .Params.tags }}
      <li>
        <a href="{{ "/tags/" | relLangURL }}{{ . | urlize }}" rel="tag">
          <span aria-hidden="true">#</span><span class="p-category">{{ . }}</span>
        </a>
      </li>
      {{ end }}
    </ul>
    {{ end }}
  </footer>
</article>

{{ partial "share-buttons.html" . }}

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

# File: themes/Accessible-MD/layouts/photos/single.html
cat <<'EOF' > "themes/Accessible-MD/layouts/photos/single.html"
{{ define "main" }}
<article class="single-post h-entry outlined-card photos">
  
  <div style="display: none;">
    <div class="p-author h-card">
      <a href="{{ .Site.BaseURL }}" class="u-url p-name">{{ .Site.Params.author.name }}</a>
      <img src="{{ .Site.Params.author.photo | absURL }}" class="u-photo" alt="{{ .Site.Params.author.name }}">
    </div>
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

  <div class="e-content">
    {{ .Content }}
  </div>

  <footer class="post-footer">
    {{ partial "syndication.html" . }}
    {{ if .Params.tags }}
    <ul class="tags">
      {{ range .Params.tags }}
      <li>
        <a href="{{ "/tags/" | relLangURL }}{{ . | urlize }}" rel="tag">
          <span aria-hidden="true">#</span><span class="p-category">{{ . }}</span>
        </a>
      </li>
      {{ end }}
    </ul>
    {{ end }}
  </footer>
</article>

{{ partial "share-buttons.html" . }}

{{ if .Params.show_webmentions | default .Site.Params.webmentions.show_webmentions }}
  {{ partial "webmentions-card.html" (dict "context" . "description" "Seen something you like? Let me know!") }}
{{ end }}
{{ end }}
EOF

# File: themes/Accessible-MD/layouts/_default/rss.xml
cat <<'EOF' > "themes/Accessible-MD/layouts/_default/rss.xml"
<rss version="2.0" 
     xmlns:atom="http://www.w3.org/2005/Atom" 
     xmlns:content="http://purl.org/rss/1.0/modules/content/"
     xmlns:media="http://search.yahoo.com/mrss/">
  <channel>
    <title>{{ if eq  .Title  .Site.Title }}{{ .Site.Title }}{{ else }}{{ .Title }} | {{ .Site.Title }}{{ end }}</title>
    <link>{{ .Permalink }}</link>
    <description>{{ if ne  .Title  .Site.Title }}{{ .Title }} | {{ end }}{{ .Site.Title }}</description>
    <generator>Hugo -- gohugo.io</generator>
    <language>{{ .Site.LanguageCode }}</language>
    {{ if .Site.Params.author.name }}<managingEditor>{{ .Site.Params.author.name }}</managingEditor>{{ end }}
    {{ if .Site.Params.author.name }}<webMaster>{{ .Site.Params.author.name }}</webMaster>{{ end }}
    {{ if .Site.Copyright }}<copyright>{{ .Site.Copyright }}</copyright>{{ end }}
    {{ if not .Date.IsZero }}<lastBuildDate>{{ .Date.Format "Mon, 02 Jan 2006 15:04:05 -0700" | safeHTML }}</lastBuildDate>{{ end }}
    {{ with .OutputFormats.Get "RSS" }}
        {{ printf "<atom:link href=%q rel=\"self\" type=%q />" .Permalink .MediaType | safeHTML }}
    {{ end }}
    
    {{/* RANGE: Iterate over regular pages in this section */}}
    {{ range .Pages }}
    <item>
      <title>{{ .Title }}</title>
      <link>{{ .Permalink }}</link>
      <pubDate>{{ .Date.Format "Mon, 02 Jan 2006 15:04:05 -0700" | safeHTML }}</pubDate>
      {{ with .Site.Params.author.name }}<author>{{ . }}</author>{{ end }}
      <guid>{{ .Permalink }}</guid>
      <description>{{ .Summary | transform.XMLEscape | safeHTML }}</description>
      
      {{/* FEATURE: Full Content */}}
      <content:encoded>{{ .Content | transform.XMLEscape | safeHTML }}</content:encoded>
      
      {{/* FEATURE: Media/Featured Image Detection */}}
      {{/* Logic: Grab the first image found in the page bundle */}}
      {{ $img := .Resources.GetMatch "**.jpg" }}
      {{ if not $img }}{{ $img = .Resources.GetMatch "**.png" }}{{ end }}
      {{ if not $img }}{{ $img = .Resources.GetMatch "**.webp" }}{{ end }}
      
      {{ with $img }}
        {{ $rssImg := .Resize "1200x jpeg" }}
        <media:content url="{{ $rssImg.Permalink }}" type="image/jpeg" medium="image" width="{{ $rssImg.Width }}" height="{{ $rssImg.Height }}"/>
      {{ end }}
    </item>
    {{ end }}
  </channel>
</rss>
EOF

# File: themes/Accessible-MD/layouts/_default/search.html
cat <<'EOF' > "themes/Accessible-MD/layouts/_default/search.html"
{{ define "main" }}
<section class="search-page outlined-card h-entry">
  <div style="display: none;">
     <div class="p-author h-card">
       <a href="{{ .Site.BaseURL }}" class="u-url p-name">{{ .Site.Params.author.name }}</a>
       <img src="{{ .Site.Params.author.photo | absURL }}" class="u-photo" alt="{{ .Site.Params.author.name }}">
     </div>
     <a href="{{ .Permalink }}" class="u-url">Permalink</a>
     <time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">{{ .Date }}</time>
     {{ range .Params.tags }}<span class="p-category">{{ . }}</span>{{ end }}
  </div>

  <header class="page-header">
    <div class="headline-row">
      {{ partial "ui/chip.html" . }}
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

# File: themes/Accessible-MD/layouts/_default/_markup/render-codeblock.html
cat <<'EOF' > "themes/Accessible-MD/layouts/_default/_markup/render-codeblock.html"
<div class="code-block-wrapper">
  <button class="copy-code-btn" aria-label="Copy code to clipboard">
    {{ partial "icons/content_copy.svg" . }}
  </button>
  <pre{{ if .Attributes }} {{ .Attributes | safeHTMLAttr }}{{ end }}><code>{{ .Inner }}</code></pre>
</div>
EOF

# File: themes/Accessible-MD/layouts/_default/_markup/render-image.html
cat <<'EOF' > "themes/Accessible-MD/layouts/_default/_markup/render-image.html"
{{- $img := .Page.Resources.GetMatch .Destination -}}
{{/* Priority: 1. Markdown Text, 2. Front Matter Resource Param, 3. Empty */}}
{{- $alt := .PlainText | default "" -}}
{{- if and (eq $alt "") $img -}}
  {{- $alt = $img.Params.alt | default "" -}}
{{- end -}}
{{- $caption := .Title | default "" -}}

<figure class="md-figure {{ if not $img }}md-figure-remote{{ end }}">
  {{- if $img -}}
    {{/* LOCAL IMAGE PROCESSING */}}
    {{- $tiny := $img.Resize "480x webp" -}}
    {{- $small := $img.Resize "800x webp" -}}
    {{- $medium := $img.Resize "1200x webp" -}}
    
    {{/* MICROFORMAT: u-photo applied */}}
    <img 
      class="md-image u-photo" 
      src="{{ $small.RelPermalink }}" 
      srcset="
        {{ $tiny.RelPermalink }} 480w,
        {{ $small.RelPermalink }} 800w,
        {{ $medium.RelPermalink }} 1200w"
      sizes="(max-width: 600px) 100vw, 800px"
      alt="{{ $alt }}"
      loading="lazy"
      width="{{ $img.Width }}"
      height="{{ $img.Height }}"
    >
  {{- else -}}
    {{/* REMOTE IMAGE FALLBACK */}}
    {{/* MICROFORMAT: u-photo applied */}}
    <img 
      class="md-image u-photo" 
      src="{{ .Destination | safeURL }}" 
      alt="{{ $alt }}" 
      title="{{ $caption }}"
      loading="lazy"
    >
  {{- end -}}

  {{- if $caption -}}
    <figcaption class="md-figcaption">{{ $caption | safeHTML }}</figcaption>
  {{- end -}}
</figure>
EOF

# File: themes/Accessible-MD/layouts/_default/_markup/render-table.html
cat <<'EOF' > "themes/Accessible-MD/layouts/_default/_markup/render-table.html"
<div class="table-wrapper">
  <table class="md-table">
    {{- with .Attributes.caption }}
      <caption>{{ . }}</caption>
    {{- end }}
    <thead>
      {{- range .THead }}
        <tr>
          {{- range . }}
            <th scope="col" {{ with .Alignment }}style="text-align:{{ . }}"{{ end }}>
              {{- .Text -}}
            </th>
          {{- end }}
        </tr>
      {{- end }}
    </thead>
    <tbody>
      {{- range .TBody }}
        <tr>
          {{- range . }}
            <td {{ with .Alignment }}style="text-align:{{ . }}"{{ end }}>
              {{- .Text -}}
            </td>
          {{- end }}
        </tr>
      {{- end }}
    </tbody>
  </table>
</div>
EOF

# File: themes/Accessible-MD/layouts/partials/head.html
cat <<'EOF' > "themes/Accessible-MD/layouts/partials/head.html"
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{{ if .IsHome }}{{ .Site.Title }}{{ else }}{{ .Title }} | {{ .Site.Title }}{{ end }}</title>
{{ hugo.Generator }}

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&family=Noto+Serif:wght@400;700&display=swap" rel="stylesheet">

{{/* INDIEWEB DISCOVERY */}}
{{ with .Site.Params.webmentions.username }}
<link rel="webmention" href="https://webmention.io/{{ . }}/webmention" />
<link rel="pingback" href="https://webmention.io/{{ . }}/xmlrpc" />
{{ end }}
{{ if .Site.Params.authorization_endpoint }}<link rel="authorization_endpoint" href="{{ .Site.Params.authorization_endpoint }}">{{ end }}
{{ if .Site.Params.token_endpoint }}<link rel="token_endpoint" href="{{ .Site.Params.token_endpoint }}">{{ end }}
{{ if .Site.Params.micropub }}<link rel="micropub" href="{{ .Site.Params.micropub }}">{{ end }}

{{ $opts := dict "transpiler" "libsass" "targetPath" "css/style.css" }}
{{ $style := resources.Get "scss/main.scss" | css.Sass $opts | resources.Minify | resources.Fingerprint }}
<link rel="stylesheet" href="{{ $style.RelPermalink }}">
{{ partial "social-meta.html" . }}
EOF

# File: themes/Accessible-MD/layouts/partials/header.html
cat <<'EOF' > "themes/Accessible-MD/layouts/partials/header.html"
<header role="banner" class="site-header">
  <div class="container header-inner">
    <a href="/" class="site-title">{{ .Site.Title }}</a>
    
    <button id="menu-toggle" class="menu-toggle" aria-expanded="false" aria-controls="main-menu" aria-label="Open Menu">
      <span class="icon-box">
        {{ partial "icons/menu.svg" . }}
      </span>
    </button>

    <nav role="navigation" aria-label="Main Navigation" id="main-nav">
      <ul id="main-menu" class="nav-list">
        {{ range .Site.Menus.main }}
        <li>
          <a href="{{ .URL }}" {{ if or (eq .URL $.RelPermalink) (eq .URL $.Permalink) }}aria-current="page"{{ end }}>
            {{ .Name }}
          </a>
        </li>
        {{ end }}
      </ul>
    </nav>
  </div>
</header>
EOF

# File: themes/Accessible-MD/layouts/partials/footer.html
cat <<'EOF' > "themes/Accessible-MD/layouts/partials/footer.html"
<footer role="contentinfo" class="site-footer">
  <div class="container">
    <p>&copy; {{ now.Year }} {{ .Site.Params.author.name }}</p>
    <p>
      Content licensed under <a href="http://creativecommons.org/licenses/by-sa/4.0/" target="_blank" rel="noopener">CC BY-SA 4.0</a>.
      <span aria-hidden="true" style="margin: 0 8px;">|</span>
      <a href="/accessibility/">Accessibility</a>
      
      {{/* DEV ONLY LINK */}}
      {{ if hugo.IsServer }}
      <span aria-hidden="true" style="margin: 0 8px;">|</span>
      <a href="/styleguide/" style="color: var(--md-sys-color-tertiary);">⚠️ Style Guide</a>
      {{ end }}
    </p>
  </div>
  
  {{/* MD3 Snackbar Container (Live Region) */}}
  <div id="global-toast" class="md-toast" role="status" aria-live="polite"></div>
</footer>
EOF

# File: themes/Accessible-MD/layouts/partials/social-meta.html
cat <<'EOF' > "themes/Accessible-MD/layouts/partials/social-meta.html"
{{/* =======================================================================
   PARTIAL: social-meta.html
   PURPOSE: Generates Open Graph & Twitter Cards for rich social sharing.
   LOGIC: Auto-detects featured images or falls back to author photo.
   ======================================================================= */}}

{{/* 1. BASIC METADATA */}}
<meta property="og:title" content="{{ .Title }}">
<meta property="og:description" content="{{ .Summary | default .Site.Params.author.bio | truncate 160 }}">
<meta property="og:type" content="{{ if .IsPage }}article{{ else }}website{{ end }}">
<meta property="og:url" content="{{ .Permalink }}">
<meta property="og:site_name" content="{{ .Site.Title }}">

{{/* 2. IMAGE DETECTION LOGIC */}}
{{/* Priority: 1. "feature" in name, 2. "cover" in name, 3. Any image, 4. Profile Photo */}}
{{ $img := .Resources.GetMatch "*feature*" }}
{{ if not $img }}{{ $img = .Resources.GetMatch "*cover*" }}{{ end }}
{{ if not $img }}{{ $img = .Resources.GetMatch "*.jpg" }}{{ end }}
{{ if not $img }}{{ $img = .Resources.GetMatch "*.png" }}{{ end }}

{{/* Fallback: Site Author Photo */}}
{{ if not $img }}
  {{ $img = resources.Get .Site.Params.author.photo }}
{{ end }}

{{/* 3. GENERATE IMAGE TAGS */}}
{{ if $img }}
  {{/* Resize to recommended OG dimensions (1200x630) for best crop */}}
  {{ $socialImg := $img.Fill "1200x630 Center webp" }}
  
  <meta property="og:image" content="{{ $socialImg.Permalink }}">
  <meta property="og:image:width" content="{{ $socialImg.Width }}">
  <meta property="og:image:height" content="{{ $socialImg.Height }}">
  
  {{/* Twitter/Fediverse Card Style */}}
  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:image" content="{{ $socialImg.Permalink }}">
{{ else }}
  {{/* Absolute fail-safe if no images exist at all */}}
  <meta name="twitter:card" content="summary">
{{ end }}

{{/* 4. TWITTER/FEDIVERSE TITLE & DESC */}}
<meta name="twitter:title" content="{{ .Title }}">
<meta name="twitter:description" content="{{ .Summary | default .Site.Params.author.bio | truncate 160 }}">
EOF

# File: themes/Accessible-MD/layouts/partials/share-buttons.html
cat <<'EOF' > "themes/Accessible-MD/layouts/partials/share-buttons.html"
{{ $bluesky := index (where .Site.Params.social "name" "BlueSky") 0 }}
{{ $mastodon := index (where .Site.Params.social "name" "Mastodon") 0 }}
{{ $friendica := index (where .Site.Params.social "name" "Friendica") 0 }}
<section class="share-card outlined-card">
  <h3>Share this</h3>
  <div class="share-buttons-row">
    <a href="https://bsky.app/intent/compose?text={{ .Title | urlquery }}%20{{ .Permalink | urlquery }}{{ if $bluesky }}%20via%20{{ $bluesky.handle | urlquery }}{{ end }}" 
       target="_blank" rel="noopener noreferrer" class="share-btn" aria-label="Share on BlueSky">
       {{ partial "icons/bluesky.svg" . }}
    </a>
    <a href="https://www.facebook.com/sharer/sharer.php?u={{ .Permalink | urlquery }}" 
       target="_blank" rel="noopener noreferrer" class="share-btn" aria-label="Share on Facebook">
       {{ partial "icons/facebook.svg" . }}
    </a>
    <button class="share-btn fediverse-btn" data-network="friendica" 
            {{ if $friendica }}data-handle="{{ $friendica.handle }}"{{ end }} aria-label="Share on Friendica" aria-haspopup="dialog">
       {{ partial "icons/friendica.svg" . }}
    </button>
    <button class="share-btn fediverse-btn" data-network="mastodon" 
            {{ if $mastodon }}data-handle="{{ $mastodon.handle }}"{{ end }} aria-label="Share on Mastodon" aria-haspopup="dialog">
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
EOF

# File: themes/Accessible-MD/layouts/partials/ui/chip.html
cat <<'EOF' > "themes/Accessible-MD/layouts/partials/ui/chip.html"
{{ $type := .Type }}
{{ $iconName := .Type }}
{{ $vibe := "Icon" }}
{{ $label := .Type | humanize }}

{{/* 1. Override Type for Special Pages */}}
{{ if eq .Layout "guestbook" }}
  {{ $iconName = "guestbook" }}
{{ end }}
{{ if eq .Layout "contact" }}
  {{ $iconName = "contact" }}
{{ end }}
{{ if eq .Layout "search" }}
  {{ $iconName = "search" }}
{{ end }}
{{ if eq .Title "About" }}
  {{ $iconName = "about" }}
{{ end }}

{{/* 2. Map Icons to Vibe Descriptors */}}
{{ if eq $iconName "status" }}{{ $vibe = "Status" }}{{ end }}
{{ if eq $iconName "replies" }}{{ $vibe = "Reply" }}{{ end }}
{{ if eq $iconName "reposts" }}{{ $vibe = "Repost" }}{{ end }}
{{ if eq $iconName "likes" }}{{ $vibe = "Like" }}{{ end }}
{{ if eq $iconName "bookmarks" }}{{ $vibe = "Bookmark" }}{{ end }}
{{ if eq $iconName "rsvps" }}{{ $vibe = "RSVP" }}{{ end }}
{{ if eq $iconName "articles" }}{{ $vibe = "Article" }}{{ end }}
{{ if eq $iconName "photos" }}{{ $vibe = "Photo" }}{{ end }}
{{ if eq $iconName "pages" }}{{ $vibe = "Page" }}{{ end }}
{{ if eq $iconName "categories" }}{{ $vibe = "Category" }}{{ end }}
{{ if eq $iconName "tags" }}{{ $vibe = "Tag" }}{{ end }}
{{ if eq $iconName "guestbook" }}{{ $vibe = "Book" }}{{ end }}
{{ if eq $iconName "contact" }}{{ $vibe = "Envelope" }}{{ end }}
{{ if eq $iconName "search" }}{{ $vibe = "Magnifier" }}{{ end }}
{{ if eq $iconName "about" }}{{ $vibe = "Info" }}{{ end }}

{{ if eq $iconName "styleguide" }}{{ $vibe = "Design" }}{{ end }}
<div class="chip chip-icon-only">
  <span class="chip-icon" role="img" aria-label="{{ $vibe }}">
    {{ partial (printf "icons/%s.svg" $iconName) . }}
  </span>
</div>
EOF

# File: themes/Accessible-MD/layouts/partials/ui/social-link.html
cat <<'EOF' > "themes/Accessible-MD/layouts/partials/ui/social-link.html"
<li>
  <a href="{{ .url }}" rel="{{ .rel }}" class="u-url social-link" style="text-decoration: none;">
    {{/* Icon Block: aria-hidden="true" ensures this is invisible to screen readers */}}
    {{ if .icon }}
      <span class="brand-icon" aria-hidden="true" style="color: var(--md-sys-color-primary); display: flex; align-items: center;">
        {{ partial (printf "icons/%s.svg" .icon) . }}
      </span>
    {{ end }}

    <span class="brand-name" style="font-weight: 600; color: var(--md-sys-color-primary);">{{ .name }}</span>
    
    {{/* Handle */}}
    <span class="brand-handle" style="color: var(--md-sys-color-on-surface); opacity: 0.8; margin-left: 4px;">{{ .handle }}</span>
  </a>
</li>
EOF

# File: themes/Accessible-MD/layouts/partials/webmentions-card.html
cat <<'EOF' > "themes/Accessible-MD/layouts/partials/webmentions-card.html"
{{/* Universal Webmentions Component 
  Usage: partial "webmentions-card.html" (dict "context" . "target" .Permalink "title" "..." "description" "...")
*/}}
{{ $context := .context }}
{{ $target := .target | default $context.Permalink }}
{{ $title := .title | default "Webmentions" }}
{{ $desc := .description | default "Have your say. Write a post on your own site and link to this URL to appear here!" }}
{{ $extraClasses := .extraClasses | default "" }}
{{ $headingID := "webmentions-heading" }}

<section id="webmentions" class="webmentions-container outlined-card {{ $extraClasses }}" data-target="{{ $target }}" aria-labelledby="{{ $headingID }}">
  <div class="webmention-header">
    <h2 id="{{ $headingID }}">{{ $title }}</h2>
    
    {{/* Copy URL Pill */}}
    <div class="webmention-copy-field">
      <span class="url-text">{{ $target }}</span>
      <button class="copy-btn icon-btn" data-clipboard-text="{{ $target }}" aria-label="Copy URL">
        {{ partial "icons/content_copy.svg" $context }}
      </button>
    </div>
  </div>
  
  <div class="webmention-explainer">
    <p>{{ $desc | safeHTML }}</p>
  </div>

  <div id="webmentions-list"><p>Loading...</p></div>
</section>
EOF

# File: themes/Accessible-MD/layouts/partials/syndication.html
cat <<'EOF' > "themes/Accessible-MD/layouts/partials/syndication.html"
{{/* Universal Syndication Component */}}
{{/* Usage: partial "syndication.html" . */}}

{{ if .Params.syndication }}
<div class="syndication-container">
  <span class="syndication-label">Also on:</span>
  <div class="syndication-chips">
    {{ range .Params.syndication }}
      {{ $synURL := . }}
      {{ $match := false }}
      {{ $data := dict }}
      
      {{/* LOOKUP: Match URL to Social Config for Icons */}}
      {{ range $.Site.Params.social }}
         {{ if in $synURL .url }}
           {{ $match = true }}
           {{ $data = . }}
         {{ end }}
      {{ end }}

      <a href="{{ $synURL }}" class="chip u-syndication" rel="syndication">
        {{ if $match }}
           {{/* Icon Block: Silent for screen readers */}}
           {{ if $data.icon }}
             <span class="chip-icon" aria-hidden="true" style="color: var(--md-sys-color-primary);">
               {{ partial (printf "icons/%s.svg" $data.icon) . }}
             </span>
           {{ end }}
           <span class="chip-label">{{ $data.name }}</span>
        {{ else }}
           {{/* Fallback for unknown sites: Extract Domain */}}
           <span class="chip-label">{{ replaceRE "^https?://([^/]+).*" "$1" $synURL }}</span>
        {{ end }}
      </a>
    {{ end }}
  </div>
</div>
{{ end }}
EOF

# File: themes/Accessible-MD/layouts/shortcodes/gallery.html
cat <<'EOF' > "themes/Accessible-MD/layouts/shortcodes/gallery.html"
{{ $match := .Get "match" | default "gallery/*" }}
{{ $images := .Page.Resources.Match $match }}

{{ if $images }}
<div class="md-gallery-grid">
  {{ range $images }}
    {{ $thumb := .Fill "600x600 Center webp" }}
    
    {{/* ACCESSIBILITY LOGIC: */}}
    {{/* 1. Check 'alt' in params. 2. Check 'title'. 3. Fallback to Name. */}}
    {{ $altText := .Params.alt | default .Title | default .Name }}
    
    <a href="{{ .RelPermalink }}" class="gallery-item" target="_blank" aria-label="View full size: {{ $altText }}">
      {{/* MICROFORMAT: u-photo class added */}}
      <img 
        class="u-photo"
        src="{{ $thumb.RelPermalink }}" 
        alt="{{ $altText }}" 
        width="{{ $thumb.Width }}" 
        height="{{ $thumb.Height }}"
        loading="lazy"
      >
    </a>
  {{ end }}
</div>
{{ else }}
  <p class="error">No images found for gallery match: {{ $match }}</p>
{{ end }}
EOF

# File: themes/Accessible-MD/layouts/shortcodes/mastodon.html
cat <<'EOF' > "themes/Accessible-MD/layouts/shortcodes/mastodon.html"
{{ $host := .Get "host" }}
{{ $id := .Get "id" }}

{{ if and $host $id }}
  {{ $apiURL := printf "https://%s/api/v1/statuses/%s" $host $id }}
  
  {{/* Fetch Data */}}
  {{ $data := dict }}
  {{ $response := resources.GetRemote $apiURL }}
  
  {{ if $response }}
    {{ if eq $response.StatusCode 200 }}
      {{ $data = $response.Content | transform.Unmarshal }}
    {{ else }}
      <div class="mastodon-card error outlined-card">
        <p><strong>Error:</strong> Could not fetch Mastodon post (Status {{ $response.StatusCode }}).</p>
        <p><a href="https://{{ $host }}/@{{ $id }}">View Original on {{ $host }}</a></p>
      </div>
    {{ end }}
  {{ else }}
    <div class="mastodon-card error outlined-card">
      <p><strong>Error:</strong> Unable to reach Mastodon instance ({{ $host }}).</p>
    </div>
  {{ end }}

  {{ if $data }}
    <article class="mastodon-card outlined-card" lang="{{ $data.language | default "en" }}">
      
      {{/* HEADER */}}
      <header class="mastodon-header">
        <div class="mastodon-author">
          {{ $avatar := resources.GetRemote $data.account.avatar }}
          {{ if $avatar }}
             {{ if $avatar.Err }}
               <div class="u-photo-placeholder">?</div>
             {{ else }}
               <img src="{{ $avatar.RelPermalink }}" alt="" class="u-photo" width="48" height="48" loading="lazy">
             {{ end }}
          {{ else }}
             <div class="u-photo-placeholder">?</div>
          {{ end }}
          
          <div class="author-meta">
            <a href="{{ $data.account.url }}" class="p-name u-url" target="_blank" rel="noopener noreferrer">
              <strong>{{ $data.account.display_name | default $data.account.username }}</strong>
            </a>
            <span class="p-nickname">@{{ $data.account.username }}@{{ $host }}</span>
          </div>
        </div>
        
        <div class="mastodon-logo" aria-label="Mastodon Post">
          {{ partial "icons/mastodon.svg" . }}
        </div>
      </header>

      {{/* BODY */}}
      <div class="e-content">
        {{ $data.content | safeHTML }}
      </div>

      {{/* MEDIA: Handles Images AND Videos now */}}
      {{ if $data.media_attachments }}
      <div class="mastodon-media">
        {{ range $data.media_attachments }}
          {{/* LOGIC: Determine Source & Type */}}
          {{ $src := "" }}
          {{ $isVideo := false }}
          
          {{ if eq .type "image" }}
             {{ $src = .url }}
          {{ else if or (eq .type "video") (eq .type "gifv") }}
             {{ $src = .preview_url }} {{/* Use thumbnail for static site */}}
             {{ $isVideo = true }}
          {{ end }}

          {{ if $src }}
            {{ $imgRes := resources.GetRemote $src }}
            {{ if $imgRes }}
              {{ if not $imgRes.Err }}
                <div class="media-item">
                  {{/* VISUAL: u-photo (Preview) */}}
                  <img src="{{ $imgRes.RelPermalink }}" class="u-photo" alt="{{ .description | default "Media attachment" }}" loading="lazy">
                  
                  {{/* DATA: u-video (Hidden Link to original file) */}}
                  {{ if $isVideo }}
                    <a href="{{ .url }}" class="u-video" style="display:none;" aria-hidden="true">Watch Video</a>
                    {{/* Optional: Overlay icon to indicate video */}}
                    <div class="play-overlay" style="position:absolute; inset:0; display:flex; align-items:center; justify-content:center; pointer-events:none;">
                       <span style="background:rgba(0,0,0,0.5); color:white; padding:8px; border-radius:50%;">▶</span>
                    </div>
                  {{ end }}
                </div>
              {{ end }}
            {{ end }}
          {{ end }}
        {{ end }}
      </div>
      {{ end }}

      {{/* FOOTER */}}
      <footer class="mastodon-footer">
        <time class="dt-published" datetime="{{ $data.created_at }}">
          {{ dateFormat "Jan 02, 2006" $data.created_at }}
        </time>
        <div class="mastodon-stats">
          <span>↩ {{ $data.replies_count }}</span>
          <span>↻ {{ $data.reblogs_count }}</span>
          <span>♥ {{ $data.favourites_count }}</span>
        </div>
        <a href="{{ $data.url }}" class="button-small" target="_blank" rel="noopener noreferrer">View Original</a>
      </footer>
    </article>
  {{ end }}

{{ else }}
  <p class="error"><strong>Mastodon Shortcode Error:</strong> Missing 'host' or 'id' parameter.</p>
{{ end }}
EOF

# File: themes/Accessible-MD/layouts/shortcodes/youtube.html
cat <<'EOF' > "themes/Accessible-MD/layouts/shortcodes/youtube.html"
{{ $id := .Get 0 }}
{{ $title := .Get 1 | default "Play Video" }}

<div class="youtube-lite outlined-card" 
     data-id="{{ $id }}" 
     role="button" 
     tabindex="0" 
     aria-label="{{ $title }}"
     title="{{ $title }}">
  
  {{/* VISUAL: u-photo */}}
  <img src="https://img.youtube.com/vi/{{ $id }}/maxresdefault.jpg" 
       class="u-photo"
       alt="Video Thumbnail" 
       loading="lazy">
  
  {{/* DATA: u-video (Hidden) */}}
  <a href="https://www.youtube.com/watch?v={{ $id }}" class="u-video" style="display:none;" aria-hidden="true">Watch on YouTube</a>
  
  <div class="play-button" aria-hidden="true"></div>
</div>
EOF

# File: themes/Accessible-MD/layouts/pages/contact.html
cat <<'EOF' > "themes/Accessible-MD/layouts/pages/contact.html"
{{ define "main" }}
<section class="contact-page outlined-card h-entry">
  <div style="display: none;">
     <div class="p-author h-card">
       <a href="{{ .Site.BaseURL }}" class="u-url p-name">{{ .Site.Params.author.name }}</a>
       <img src="{{ .Site.Params.author.photo | absURL }}" class="u-photo" alt="{{ .Site.Params.author.name }}">
     </div>
     <a href="{{ .Permalink }}" class="u-url">Permalink</a>
     <time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">{{ .Date }}</time>
     {{ range .Params.tags }}<span class="p-category">{{ . }}</span>{{ end }}
  </div>

  <header class="page-header">
    <div class="headline-row">
      {{ partial "ui/chip.html" . }}
      <h1 class="p-name">Contact Me</h1>
    </div>
    <p class="p-summary">{{ .Site.Params.contact.intro }}</p>
  </header>

  <div class="e-content">{{ .Content }}</div>

  {{ if .Params.tags }}
  <footer class="post-footer">
    <ul class="tags">
      {{ range .Params.tags }}
      <li>
        <a href="{{ "/tags/" | relLangURL }}{{ . | urlize }}" rel="tag">
          <span aria-hidden="true">#</span><span class="p-category">{{ . }}</span>
        </a>
      </li>
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

# File: themes/Accessible-MD/layouts/pages/guestbook.html
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
     <a href="{{ .Permalink }}" class="u-url">Permalink</a>
     <time class="dt-published" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" }}">{{ .Date }}</time>
     {{ range .Params.tags }}<span class="p-category">{{ . }}</span>{{ end }}
  </div>

  <div class="e-content">
    <p class="lead">{{ .Site.Params.webmentions.guestbookIntro }}</p>
    {{ .Content }}
  </div>

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

# File: themes/Accessible-MD/archetypes/default.md
cat <<'EOF' > "themes/Accessible-MD/archetypes/default.md"
+++
title = "{{ replace .Name "-" " " | title }}"
date = {{ .Date }}
# [Source: 126] Required for SEO and RSS feed freshness.
lastmod = {{ .Date }}
draft = true
# [Source: 127] Required for Homepage display.
summary = ""
# [Source: 128] Optional: Set to false to hide webmentions for this specific post.
show_webmentions = true

# [Image Engine]
# Attach alt text to images here to keep your Markdown clean.
# [[resources]]
#   src = "image.jpg"
#   name = "cover"
#   [resources.params]
#     alt = "Description of the image for screen readers"
+++
EOF

# File: themes/Accessible-MD/archetypes/articles.md
cat <<'EOF' > "themes/Accessible-MD/archetypes/articles.md"
+++
title = "{{ replace .Name "-" " " | title }}"
date = {{ .Date }}
lastmod = {{ .Date }}
draft = true
summary = ""
tags = []
syndication = []
show_webmentions = true

# [Image Engine]
# Attach alt text to images here to keep your Markdown clean.
# [[resources]]
#   src = "image.jpg"
#   name = "cover"
#   [resources.params]
#     alt = "Description of the image for screen readers"
+++

Write your article content here.
EOF

# File: themes/Accessible-MD/archetypes/photos.md
cat <<'EOF' > "themes/Accessible-MD/archetypes/photos.md"
+++
title = "{{ replace .Name "-" " " | title }}"
date = {{ .Date }}
lastmod = {{ .Date }}
draft = false
summary = ""
tags = []
syndication = []
show_webmentions = true

# [Image Engine]
# Attach alt text to images here to keep your Markdown clean.
# [[resources]]
#   src = "image.jpg"
#   name = "cover"
#   [resources.params]
#     alt = "Description of the image for screen readers"
+++

{{/* The image will be processed by the render hook */}}
![Description of the photo](image.jpg "Optional Caption")
EOF

# File: themes/Accessible-MD/archetypes/bookmarks.md
cat <<'EOF' > "themes/Accessible-MD/archetypes/bookmarks.md"
+++
title = "{{ replace .Name "-" " " | title }}"
date = {{ .Date }}
lastmod = {{ .Date }}
draft = false
summary = ""
# [Source: 133] Target URL is required for Bookmarks.
bookmark_of = ""
tags = []
syndication = []
show_webmentions = true
+++
EOF

# File: themes/Accessible-MD/archetypes/likes.md
cat <<'EOF' > "themes/Accessible-MD/archetypes/likes.md"
+++
title = "Like: {{ replace .Name "-" " " | title }}"
date = {{ .Date }}
lastmod = {{ .Date }}
draft = false
# [Source: 131] Target URL is required for Likes.
like_of = ""
tags = []
syndication = []
show_webmentions = true
+++
EOF

# File: themes/Accessible-MD/archetypes/replies.md
cat <<'EOF' > "themes/Accessible-MD/archetypes/replies.md"
+++
title = "Reply to {{ replace .Name "-" " " | title }}"
date = {{ .Date }}
lastmod = {{ .Date }}
draft = false
summary = ""
# [Source: 130] Target URL is required for Replies.
reply_to = "" 
tags = []
syndication = []
show_webmentions = true
+++
EOF

# File: themes/Accessible-MD/archetypes/reposts.md
cat <<'EOF' > "themes/Accessible-MD/archetypes/reposts.md"
+++
title = "Repost: {{ replace .Name "-" " " | title }}"
date = {{ .Date }}
lastmod = {{ .Date }}
draft = false
# [Source: 132] Target URL is required for Reposts.
repost_of = ""
tags = []
syndication = []
show_webmentions = true
+++
EOF

# File: themes/Accessible-MD/archetypes/rsvps.md
cat <<'EOF' > "themes/Accessible-MD/archetypes/rsvps.md"
+++
title = "RSVP: {{ replace .Name "-" " " | title }}"
date = {{ .Date }}
lastmod = {{ .Date }}
draft = false
summary = ""
# [Source: 130] Target URL (the event you are replying to).
reply_to = ""
# [Source: 134] RSVP Status: "yes", "no", or "maybe".
rsvp = "yes"
tags = []
syndication = []
show_webmentions = true
+++
EOF

# File: themes/Accessible-MD/archetypes/status.md
cat <<'EOF' > "themes/Accessible-MD/archetypes/status.md"
+++
title = "{{ replace .Name "-" " " | title }}"
date = {{ .Date }}
lastmod = {{ .Date }}
draft = false
# [Source: 90] If summary is missing, theme will truncate first 500 chars.
summary = ""
tags = []
syndication = []
show_webmentions = true

# [Image Engine]
# Attach alt text to images here to keep your Markdown clean.
# [[resources]]
#   src = "image.jpg"
#   name = "cover"
#   [resources.params]
#     alt = "Description of the image for screen readers"
+++
EOF

# File: content/pages/about/index.md
cat <<'EOF' > "content/pages/about/index.md"
---
title: "About"
date: 2025-11-22T19:10:40-0800
lastmod: 2025-11-26T01:35:00-08:00
summary: "A little bit about me."
show_webmentions: false
tags: ["About"]
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
EOF

# File: content/pages/accessibility/index.md
cat <<'EOF' > "content/pages/accessibility/index.md"
---
title: "Accessibility"
date: 2025-11-26T03:30:00-08:00
layout: "page"
summary: "My commitment to an open, usable web."
show_webmentions: false
tags: ["A11Y", "Accessibility"]
---

## **The Philosophy**
Let’s be real: I’m blind. I use a screen reader every single day. I know exactly how frustrating it is when a website is nothing but a soup of unlabelled buttons and low-contrast text.

When I built **Greg's Place**, accessibility wasn't an afterthought or a compliance checklist—it was the foundation. My goal is simple: this site should work perfectly for everyone, regardless of how you browse the web. Whether you’re using NVDA, VoiceOver, a braille display, or just really cranked-up text magnification, you are welcome here.

## **The Standards**
I target **WCAG 2.2 Level AA** compliance. To achieve this, I’ve made some specific design choices:
* **Semantic HTML:** Everything is built with proper heading structures (`h1`–`h6`) and landmarks so you can navigate by rotor or shortcut keys without getting a headache.
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
EOF

# File: content/pages/contact/index.md
cat <<'EOF' > "content/pages/contact/index.md"
---
title: "Contact"
layout: "contact"
date: 2025-11-22T23:40:00-08:00
summary: "A contact form where visitors can get in touch with the author"
---
EOF

# File: content/pages/guestbook/index.md
cat <<'EOF' > "content/pages/guestbook/index.md"
---
title: "Guestbook"
layout: "guestbook"
date: 2025-11-22T23:35:00-08:00
summary: "A place to collect webmentions from around the IndieWeb that are  not tied to a particular post or page"
syndication: []
---
EOF

# File: content/pages/search/index.md
cat <<'EOF' > "content/pages/search/index.md"
---
title: "Search"
date: 2025-11-22T19:10:40-0800
layout: "search"
summary: "A page where visitors can search this website"
---
EOF

# File: content/articles/_index.md
cat <<'EOF' > "content/articles/_index.md"
---
title: "Articles"
description: "Long-form thoughts and essays."
sort_by: "date"
sort_order: "desc"
---

Welcome to my long-form writing. Here you'll find essays, stories, and deep dives that need a bit more space than a quick note. Grab a cup of coffee and settle in.
EOF

# File: content/photos/_index.md
cat <<'EOF' > "content/photos/_index.md"
---
title: "Photos"
description: "Visual moments and snapshots."
sort_by: "date"
sort_order: "desc"
---

Welcome to the visual side of Greg's Place. Here you'll find snapshots, textures, and moments I've collected along the way. Some are connected to stories, while others just stand on their own as a brief pause in the stream.
EOF

# File: content/bookmarks/_index.md
cat <<'EOF' > "content/bookmarks/_index.md"
---
title: "Bookmarks"
description: "Links saved for later reference."
sort_by: "date"
sort_order: "desc"
---

My personal library of links. These are articles, tools, and sites I’ve saved for future reference. Feel free to browse through my reading list.
EOF

# File: content/likes/_index.md
cat <<'EOF' > "content/likes/_index.md"
---
title: "Likes"
description: "Content I appreciated."
sort_by: "date"
sort_order: "desc"
---

A digital nod of appreciation. This is a collection of content I’ve "liked" from around the web—think of it as a public log of things that made me smile or think.
EOF

# File: content/replies/_index.md
cat <<'EOF' > "content/replies/_index.md"
---
title: "Replies"
description: "Conversations and responses across the web."
sort_by: "date"
sort_order: "desc"
---

The web is all about conversation. This page collects my responses to posts from other people around the internet. It’s the other half of the dialogue.
EOF

# File: content/reposts/_index.md
cat <<'EOF' > "content/reposts/_index.md"
---
title: "Reposts"
description: "Things I found worth sharing."
sort_by: "date"
sort_order: "desc"
---

Sharing is caring. These are posts from other creators that I found valuable, funny, or important enough to boost on my own site.
EOF

# File: content/rsvps/_index.md
cat <<'EOF' > "content/rsvps/_index.md"
---
title: "RSVPs"
description: "Events I am attending or tracking."
sort_by: "date"
sort_order: "desc"
---

My social calendar. This tracks public events I’ve responded to, whether I'm attending in person, watching online, or just interested.
EOF

# File: content/status/_index.md
cat <<'EOF' > "content/status/_index.md"
---
title: "Status Updates"
description: "Quick notes and life updates."
sort_by: "date"
sort_order: "desc"
---

These are my "micro-posts"—similar to tweets. Expect quick life updates, random thoughts, and behind-the-scenes moments. Short, sweet, and to the point.
EOF


echo "Master Setup Complete. 'Greg's Place' is fully restored."
