#!/bin/bash
# ==============================================================================
# SCRIPT: integrate_indiekit.sh
# PURPOSE: Configure Hugo to advertise the new IndieKit server.
# CONTEXT: Adds 'micropub' endpoint to params.toml and updates documentation.
# ==============================================================================

echo "Integrating IndieKit..."

# 1. Update params.toml (The Configuration)
# We are adding the micropub endpoint right under the IndieAuth ones.
TARGET="config/_default/params.toml"

if grep -q "authorization_endpoint" "$TARGET"; then
    # Use sed to insert the micropub line after token_endpoint
    sed -i '/token_endpoint =/a micropub = "https://indiekit.simplygregario.us/micropub"' "$TARGET"
    echo "✓ Added Micropub Endpoint to params.toml"
else
    echo "X Error: Could not find IndieAuth block in params.toml"
fi

# 2. Update project_context.txt (The Documentation)
# We are appending the new architecture details.
DOC_TARGET="project_context.txt"

cat <<'EOF' >> "$DOC_TARGET"

---

## HYBRID ARCHITECTURE (STATIC + DYNAMIC)

* **Hosting:** GitHub Pages (Static Content).
* **Identity:** IndieAuth.com (RelMeAuth via GitHub/Mastodon).
* **Publishing Backend:** IndieKit (Node.js on DigitalOcean).
    * **URL:** `https://indiekit.simplygregario.us`
    * **Role:** Receives Micropub requests -> Commits Markdown to GitHub.
    * **Database:** MongoDB Atlas (Stores media metadata & syndication targets).
EOF
echo "✓ Updated Project Context with Hybrid Architecture."

echo "Integration complete. Run ./update_setup.sh to finalize."
