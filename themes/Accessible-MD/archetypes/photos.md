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
