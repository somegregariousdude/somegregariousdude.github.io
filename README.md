# Greg's Place

An IndieWeb-focused, accessible static site built with Hugo.

## 1. Project Overview
This project is a static site designed with a focus on **Accessibility (WCAG 2.2 AA)** and **IndieWeb** principles. It uses the custom **"Accessible-MD"** theme, which implements Material Design 3 concepts using zero-JS styling and "Outlined Cards" for high contrast.

### Key Design Features
* **Inline Headers:** Category chips (using semantic icons) are aligned inline with post titles.
* **Privacy First:**
    * Media embeds use "Static Facades" (click-to-load or build-time fetch) to prevent third-party tracking.
    * Social Sharing uses "Intent URLs" and local modals (no third-party tracking scripts).
    * Fonts are loaded via Google Fonts (Intentional Design Choice).
* **Discovery:** Full support for Open Graph, Twitter Cards, and Full-Content RSS feeds.
* **Utility Pages:** Guestbook, Contact, search and a formal **Accessibility Statement** (`/accessibility/`).
* **Stability:** Social links are text-only or locally cached SVGs to prevent build failures from external icon APIs.

## 2. Cheat Sheet (Script Usage)

### Content Creation
Use the `new_post.sh` script to generate content.
**Usage:** `./new_post.sh [type] "[optional title]"`

| Type | Title | Folder Strategy | Notes |
| :--- | :--- | :--- | :--- |
| **articles** | **Required** | Slug (e.g., `/my-post/`) | Long-form essays. |
| **bookmarks** | **Required** | Slug (e.g., `/cool-tool/`) | Saved links. Requires `bookmark_of` URL. |
| **status** | Optional | Timestamp* | Quick notes. |
| **replies** | Optional | Timestamp* | Responses. Requires `reply_to` URL. |
| **reposts** | Optional | Timestamp* | Shares. Requires `repost_of` URL. |
| **likes** | Optional | Timestamp* | Appreciations. Requires `like_of` URL. |
| **rsvps** | Optional | Timestamp* | Events. Requires `rsvp` status & `reply_to`. |

***Quirk (Timestamp Fallback):** For optional types, if you omit the title, the script automatically creates a timestamp-based directory.

### Working with Images
This site uses an advanced image engine that automatically optimizes files.

**1. Single Images**
Just use standard Markdown. The system will automatically generate responsive WebP versions and styled captions.
```markdown
![Alt text](my-photo.jpg "This caption appears below the image")
```

**2. Galleries**
To display a grid of images, use the gallery shortcode.
**Step A: Map Metadata** (In your post's front matter)
```toml
[[resources]]
  src = "images/photo1.jpg"
  [resources.params]
    alt = "A detailed description for screen readers"
```
**Step B: Insert Shortcode**
```markdown
{{< gallery match="images/*" >}}
```

### Accessible Data Tables
Data tables must include a **Caption**. Use the attribute syntax on the line immediately following the table:
```markdown
| Date | Event |
| :--- | :--- |
| Nov 24 | Meetup |
{caption="Upcoming Events"}
```

## 3. Shortcode Reference

### YouTube (Lite Facade)
Embeds a static thumbnail.
```go
{{< youtube "VIDEO_ID" "Descriptive Title" >}}
```

### Mastodon (Static Facade)
Fetches the post content at **build time** and renders it as static HTML.
```go
{{< mastodon host="mastodon.social" id="123456789" >}}
```

## 4. Installation (Reproduction)
To reproduce this environment on a fresh machine, run the `setup_project.sh` script.

## 5. Deployment
This site deploys via **GitHub Actions** to GitHub Pages.
* **Trigger:** Push to `main`.
* **Process:** Icon Generation -> Hugo Build (Minified) -> Pagefind Indexing -> Deploy.
* **Domain:** `simplygregario.us` (CNAME is stored in `themes/Accessible-MD/static/`).

## 6. License
* **Codebase:** MIT License (See `LICENSE` file).
* **Content:** [Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)](http://creativecommons.org/licenses/by-sa/4.0/).
