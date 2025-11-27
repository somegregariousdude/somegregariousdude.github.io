# Greg's Place

An IndieWeb-focused, accessible static site built with Hugo.

## 1. Key Features (v5.2)
* **Accessibility First (WCAG 2.2 AA):**
    * **Navigation Drawer:** Mobile menu traps focus, respects screen readers (Inert), and supports Escape key.
    * **Sticky Header:** Keeps navigation visible for low-vision users.
    * **Toast Notifications:** Accessible status updates (Live Regions).
* **Material Design 3 (Complete):**
    * **Distinct Themes:** 5 unique color palettes for both Light (Tinted) and Dark (Deep) modes.
    * **Elevation:** Sophisticated Surface Tones and Overlay system.
    * **Shape & Motion:** Pill-shaped inputs, weighted easing curves, and tactile State Layers.
* **Privacy:** Zero-tracking "Static Facades" for YouTube and social sharing.
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
