#!/bin/bash
# ==============================================================================
# SCRIPT: maintenance/update_setup.sh
# PURPOSE: Regenerate the root 'setup_project.sh' from the current filesystem.
# USE CASE: Run this after modifying SCSS, JS, or Configs to ensure the
#           "Master Restore Script" is always up to date.
# ==============================================================================

# Define the Output File
OUTPUT_FILE="setup_project.sh"

echo "--- Regenerating $OUTPUT_FILE from current codebase ---"

# 1. Write the Script Header
cat <<'HEADER' > "$OUTPUT_FILE"
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
HEADER

# 2. Helper Function: Embed File Content
# This reads a file and wraps it in a 'cat' command for the setup script.
embed_file() {
    local filepath="$1"
    if [ -f "$filepath" ]; then
        echo "Embedding: $filepath"
        echo "# File: $filepath" >> "$OUTPUT_FILE"
        echo "cat <<'EOF' > \"$filepath\"" >> "$OUTPUT_FILE"
        cat "$filepath" >> "$OUTPUT_FILE"
        echo "EOF" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
    else
        echo "Warning: $filepath not found (Skipping)"
    fi
}

# ==============================================================================
# 3. MANIFEST (List of files to capture)
# ==============================================================================

# --- Root Configs & Metadata ---
embed_file "config/_default/hugo.toml"
embed_file "config/_default/params.toml"
embed_file "config/_default/menus.toml"
embed_file "config/_default/markup.toml"
embed_file "package.json"
embed_file "package-lock.json"
embed_file ".gitignore"
embed_file "CNAME"
embed_file "LICENSE"
embed_file "README.md"
embed_file "project_context.txt"

# --- Scripts & Automation ---
embed_file "new_post.sh"
embed_file "generate_icons.sh"
embed_file "debug_server.sh"
embed_file ".github/workflows/hugo.yml"

# --- Theme Assets (Styles & Scripts) ---
embed_file "themes/Accessible-MD/assets/scss/_base.scss"
embed_file "themes/Accessible-MD/assets/scss/_components.scss"
embed_file "themes/Accessible-MD/assets/scss/_images.scss"
embed_file "themes/Accessible-MD/assets/scss/_layout.scss"
embed_file "themes/Accessible-MD/assets/scss/_mastodon.scss"
embed_file "themes/Accessible-MD/assets/scss/_share.scss"
embed_file "themes/Accessible-MD/assets/scss/_typography.scss"
embed_file "themes/Accessible-MD/assets/scss/_variables.scss"
embed_file "themes/Accessible-MD/assets/scss/_youtube.scss"
embed_file "themes/Accessible-MD/assets/scss/main.scss"
embed_file "themes/Accessible-MD/assets/scss/_elevation.scss"
embed_file "themes/Accessible-MD/assets/scss/_state_layer.scss"
embed_file "themes/Accessible-MD/assets/scss/_forms.scss"
embed_file "themes/Accessible-MD/assets/scss/_content_types.scss"
embed_file "themes/Accessible-MD/assets/scss/_utility_pages.scss"

embed_file "themes/Accessible-MD/assets/js/copy-code.js"
embed_file "themes/Accessible-MD/assets/js/menu.js"
embed_file "themes/Accessible-MD/assets/js/share.js"
embed_file "themes/Accessible-MD/assets/js/webmentions.js"
embed_file "themes/Accessible-MD/assets/js/youtube-lite.js"

# --- Theme Layouts (HTML) ---
embed_file "themes/Accessible-MD/layouts/index.html"
embed_file "themes/Accessible-MD/layouts/index.json"
embed_file "themes/Accessible-MD/layouts/404.html"
embed_file "themes/Accessible-MD/layouts/_default/baseof.html"
embed_file "themes/Accessible-MD/layouts/_default/list.html"
embed_file "themes/Accessible-MD/layouts/_default/list.json"
embed_file "themes/Accessible-MD/layouts/_default/single.html"
embed_file "themes/Accessible-MD/layouts/photos/single.html"
embed_file "themes/Accessible-MD/layouts/_default/rss.xml"
embed_file "themes/Accessible-MD/layouts/_default/search.html"

# Render Hooks
embed_file "themes/Accessible-MD/layouts/_default/_markup/render-codeblock.html"
embed_file "themes/Accessible-MD/layouts/_default/_markup/render-image.html"
embed_file "themes/Accessible-MD/layouts/_default/_markup/render-table.html"

# Partials
embed_file "themes/Accessible-MD/layouts/partials/head.html"
embed_file "themes/Accessible-MD/layouts/partials/header.html"
embed_file "themes/Accessible-MD/layouts/partials/footer.html"
embed_file "themes/Accessible-MD/layouts/partials/social-meta.html"
embed_file "themes/Accessible-MD/layouts/partials/share-buttons.html"
embed_file "themes/Accessible-MD/layouts/partials/ui/chip.html"
embed_file "themes/Accessible-MD/layouts/partials/ui/social-link.html"
embed_file "themes/Accessible-MD/layouts/partials/webmentions-card.html"
embed_file "themes/Accessible-MD/layouts/partials/syndication.html"

# Shortcodes
embed_file "themes/Accessible-MD/layouts/shortcodes/gallery.html"
embed_file "themes/Accessible-MD/layouts/shortcodes/mastodon.html"
embed_file "themes/Accessible-MD/layouts/shortcodes/youtube.html"

# Page Layouts
embed_file "themes/Accessible-MD/layouts/pages/contact.html"
embed_file "themes/Accessible-MD/layouts/pages/guestbook.html"

# --- Archetypes (Content Templates) ---
embed_file "themes/Accessible-MD/archetypes/default.md"
embed_file "themes/Accessible-MD/archetypes/articles.md"
embed_file "themes/Accessible-MD/archetypes/photos.md"
embed_file "themes/Accessible-MD/archetypes/bookmarks.md"
embed_file "themes/Accessible-MD/archetypes/likes.md"
embed_file "themes/Accessible-MD/archetypes/replies.md"
embed_file "themes/Accessible-MD/archetypes/reposts.md"
embed_file "themes/Accessible-MD/archetypes/rsvps.md"
embed_file "themes/Accessible-MD/archetypes/status.md"

# --- Core Content Pages (Scaffolding) ---
# We only capture the utility pages to ensure the site structure exists.
embed_file "content/pages/about/index.md"
embed_file "content/pages/accessibility/index.md"
embed_file "content/pages/contact/index.md"
embed_file "content/pages/guestbook/index.md"
embed_file "content/pages/search/index.md"

# --- Section Headers (_index.md) ---
embed_file "content/articles/_index.md"
embed_file "content/photos/_index.md"
embed_file "content/bookmarks/_index.md"
embed_file "content/likes/_index.md"
embed_file "content/replies/_index.md"
embed_file "content/reposts/_index.md"
embed_file "content/rsvps/_index.md"
embed_file "content/status/_index.md"

# ==============================================================================
# 4. FOOTER
# ==============================================================================
cat <<'FOOTER' >> "$OUTPUT_FILE"

echo "Master Setup Complete. 'Greg's Place' is fully restored."
FOOTER

chmod +x "$OUTPUT_FILE"
echo "✓ $OUTPUT_FILE has been successfully updated."
