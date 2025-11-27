# Greg's Place

An IndieWeb-focused, accessible static site built with Hugo.

## 1. Key Features (v5 Upgrades)
* **Accessibility First (WCAG 2.2 AA):**
    * **Navigation Drawer:** A fully accessible mobile menu that traps focus, respects screen readers (Inert), and supports the Escape key.
    * **Sticky Header:** Keeps navigation visible for low-vision users (with anchor scroll protection).
    * **High Contrast:** "Outlined Card" design system.
    * **Distinct Dark Modes:** 5 unique color themes that retain their identity in dark mode.
* **Privacy:** Zero-tracking "Static Facades" for YouTube and social sharing.
* **IndieWeb:** Native support for Webmentions, Microformats, and POSSE.

## 2. Cheat Sheet (Script Usage)

### Content Creation
Use the `new_post.sh` script to generate content.
**Usage:** `./new_post.sh [type] "[optional title]"`

| Type | Title | Folder Strategy | Notes |
| :--- | :--- | :--- | :--- |
| **articles** | **Required** | Slug (e.g., `/my-post/`) | Long-form essays. |
| **bookmarks** | **Required** | Slug (e.g., `/cool-tool/`) | Saved links. Requires `bookmark_of`. |
| **status** | Optional | Timestamp* | Quick notes. |
| **replies** | Optional | Timestamp* | Responses. Requires `reply_to`. |
| **reposts** | Optional | Timestamp* | Shares. Requires `repost_of`. |
| **likes** | Optional | Timestamp* | Appreciations. Requires `like_of`. |
| **rsvps** | Optional | Timestamp* | Events. Requires `rsvp` status. |

***Quirk:** If you omit the title for optional types, the script automatically creates a timestamp-based directory.

### Maintenance
* **Rebuild Setup Script:** `./maintenance/update_setup.sh`
    * Run this after modifying code to update the "Golden Master" `setup_project.sh`.
* **Generate Icons:** `./generate_icons.sh`
    * Fetches SVGs at build time (Privacy).

## 3. Shortcode Reference

### YouTube (Lite Facade)
Embeds a static thumbnail. Only loads the player on click (Privacy).
```go
{{< youtube "VIDEO_ID" "Descriptive Title" >}}
```

### Mastodon (Static Facade)
Fetches the post content at **build time** and renders it as static HTML.
```go
{{< mastodon host="mastodon.social" id="123456789" >}}
```

### Gallery
Renders a responsive grid of images from the page bundle.
```go
{{< gallery match="images/*" >}}
```

## 4. Installation (Reproduction)
To reproduce this environment on a fresh machine, run the `setup_project.sh` script.

## 5. Deployment
This site deploys via **GitHub Actions** to GitHub Pages.
* **Trigger:** Push to `main`.
* **Process:** Icon Generation -> Hugo Build (Minified) -> Pagefind Indexing -> Deploy.
* **Domain:** `simplygregario.us` (CNAME is stored in `themes/Accessible-MD/static/`).

## 6. License
* **Codebase:** MIT License.
* **Content:** [Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)](http://creativecommons.org/licenses/by-sa/4.0/).
