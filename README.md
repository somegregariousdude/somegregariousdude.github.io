# Greg's Place (Hugo Project)

This is the source code for [Greg's Place](https://simplygregario.us).
Built with **Hugo Extended** and a custom **IndieWeb-focused theme**.

## 🚀 Quick Start

**Run Local Server:**
```bash
hugo server -D
```
*Access at:* `http://localhost:1313`

---

## ✍️ Content Cheatsheet

### 1. Longform Articles (Blog)
Standard blog posts with titles.
```bash
hugo new content posts/2025-MM-DD/my-title.md
```

### 2. Status Updates (Micro-posts)
Short, title-optional updates (like Mastodon/Twitter).
```bash
hugo new content notes/2025-MM-DD/status.md
```

### 3. IndieWeb Interactions (The Stream)
These command create specific "Kind" posts that appear in their own feeds.

**Reply:**
```bash
hugo new content notes/2025-MM-DD/reply.md --kind reply
# Edit front matter: set 'reply_to' URL
```

**Like:**
```bash
hugo new content notes/2025-MM-DD/like.md --kind like
# Edit front matter: set 'like_of' URL
```

**Repost:**
```bash
hugo new content notes/2025-MM-DD/repost.md --kind repost
# Edit front matter: set 'repost_of' URL
```

**Bookmark:**
```bash
hugo new content notes/2025-MM-DD/bookmark.md --kind bookmark
# Edit front matter: set 'bookmark_of' and 'title'
```

**RSVP (Events):**
```bash
hugo new content notes/2025-MM-DD/rsvp.md --kind rsvp
# Edit front matter: set 'rsvp' (yes/no/maybe) and 'reply_to'
```

---

## 🎥 Shortcodes

**Privacy-Aware YouTube Embed:**
Instead of standard iframes, use this shortcode. It loads a static image first (no tracking) and only loads the video player on click.

```html
{{< youtube id="VIDEO_ID" title="Description of Video" >}}
```
*Example:* `{{< youtube id="dQw4w9WgXcQ" title="Rick Astley" >}}`

---

## 🚢 Deployment

This site is hosted on **GitHub Pages** via **GitHub Actions**.

**To Deploy:**
Simply commit and push your changes to the `main` branch.

```bash
git add .
git commit -m "New content"
git push
```

The build process (Hugo + Pagefind Indexing) runs automatically.
*Check Status:* [GitHub Actions Tab](https://github.com/somegregariousdude/blog/actions)

---

## 🎨 Theming

**Switch Color Schemes:**
Edit `config/_default/params.toml`:
```toml
[theme]
  colorScheme = "sound"   # Options: "sound" (Default), "market" (Warm), "mountain" (Cool)
```
