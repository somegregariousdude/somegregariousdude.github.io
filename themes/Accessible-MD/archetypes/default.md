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
+++
