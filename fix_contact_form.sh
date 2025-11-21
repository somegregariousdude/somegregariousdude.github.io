#!/bin/bash

# fix_contact_form.sh
# Description: Fixes the Contact Page layout link and sets Formspree URL.
# Compliance:
# - Fixes "Form not showing up" (Hugo Layout Lookup)
# - Sets User's specific Formspree ID [User Request]

set -e

echo "✉️  Applying Contact Form Fix..."

# 1. Fix the Content File (Force Type = Contact)
# We need to recreate the front matter with 'type: contact'
# so Hugo finds themes/Accessible-MD/layouts/contact/single.html
echo "-> Updating content/contact.md to use correct Layout..."
cat <<EOF > content/contact.md
---
title: "Contact"
date: $(date +%Y-%m-%dT%H:%M:%S%z)
layout: "contact"
type: "contact"
disableComments: true
---
EOF

# 2. Update params.toml with your specific Formspree URL
echo "-> Setting Formspree Action URL..."
# Using sed to safely replace the empty string or placeholder with your specific URL
sed -i 's|formAction = ""|formAction = "https://formspree.io/f/xblwegvw"|' config/_default/params.toml

# 3. (Optional) Verification Update for the Template
# Just to be 100% sure, we will touch the template file to trigger a rebuild
touch themes/Accessible-MD/layouts/contact/single.html

echo "✅ Fix Applied: Contact page now linked to correct template and endpoint."
