+++
title = "I Built a Fort Knox for My Thoughts: The Over-Engineered History of 'Accessible-MD'"
date = 2025-11-30T14:00:00-08:00
lastmod = 2025-11-30T15:07:00-08:00
summary = "I told myself I’d just 'build a blog' when I started this. Two weeks (and one '80's rock playlist) later, I have a fully accessible, stylish digital home I can proudly call my own."
tags = ["WebDev", "Accessibility", "IndieWeb", "MaterialDesign", "Privacy"]
show_webmentions = true
syndication = []
+++

It started with a simple, dangerous thought: *"I just want a place to write about burgers and 80s sci-fi."*

In a normal world, I would have installed WordPress, picked a template, and been writing about *RoboCop* by lunch. But this is not a normal world, and I am apparently not a normal developer.

Instead of writing content, I spent the last two weeks building a military-grade, WCAG 2.2 AA compliant fortress using nothing but raw HTML, SCSS, vanilla JavaScript and [Hugo](https://gohugo.io), while using the help of Google's Gemini 3 Pro to smooth over the rough patches — all while blasting AC/DC at a volume that probably concerned my neighbors.

Welcome to **Accessible-MD**. It’s over-engineered. It’s obsessive. And it has a Lighthouse score that embarrasses billion-dollar tech companies.

Here is why I built it, and why I haven’t slept in three days.

## The "Anti-Modern" Manifesto

The modern web is a disaster. You click a link, and before you can read a single word, you are assaulted by a newsletter popup, a GDPR cookie banner, an autoplaying video, and a request to know your location.

I wanted the opposite. I wanted a site that respected you.

That meant making some hard choices. You will notice there is no "Accept Cookies" banner here. That isn't because I'm breaking the law; it's because **I don't use cookies**. I don't want your data. I barely know what to do with my own data.

If you come across a YouTube video on this site, you aren't actually connecting to YouTube. You're looking at a "Static Facade"—a lightweight image that *looks* like a player. Google doesn't get a single byte of your information until you explicitly click "Play." It’s privacy by design, or maybe privacy by paranoia. Either way, it’s fast.

## Not Google, but uniquely Greg.

I admit it: I have a vanity streak. I wanted the site to look good. But I didn't want a sterile, corporate interface. I wanted the code equivalent of a Hair Metal power ballad—technical, shredded, and unapologetic.

I settled on **Material Design 3** because I like my interfaces to have rules. But I hijacked their logic to serve my whims. I coded late into the night, fueled by music from *Guns N' Roses*, building five distinct themes that reflect *my* moods:

* **Sound:** The default "Ice Blue" (cool, calm, collected).
* **Market:** A warm "Espresso" theme (usually active when I'm hungry).
* **Mountain:** Slate and Cyan. Inspired by Mt. Rainier.
* **Forest:** Deep Green (reminding me of the outside world, or maybe *Welcome to the Jungle*).
* **Sunset:** A Lavender/Pink vibe that I secretly use the most.

The best part? There is no heavy JavaScript library powering this. It’s all done with **CSS `color-mix`**. I make your browser do the math. It’s native, it’s instant, and it lets me feel like a wizard.

## The Blind Spot (Pun Intended)

Here is the thing: **I’m blind.**

You would assume that makes me the perfect accessibility architect. And in some ways, it does. I built this site to sing for screen readers. The heading structures are impeccable. I can navigate this place with my eyes closed (literally).

But accessibility is a spectrum, and even I have blind spots.

When I ran Google Lighthouse, it yelled at me. *"Touch targets are too small."* *"Contrast is too low."*

I realized I had optimized the site perfectly for *my* ears, but while I was busy air-drumming to Def Leppard, I had neglected *your* eyes and *your* thumbs. I was relying on a screen reader that doesn't care about button size, forgetting that people on mobile phones actually need to touch things.

So, I went to war against my own bias. I spent an afternoon engineering invisible hit-boxes around every link, ensuring they meet the **48-pixel** minimum. I fixed color contrasts I will never see, just so you can read them comfortably.

I didn't just build this site for me. I built it for the clumsy, the low-vision, and the fat-thumbed. I call this "democratizing clicking."

## Steal My Code (Please)

This digital fortress is open source. Seriously. I didn't write a 500-line maintenance script just for my health.

Go to my [GitHub repo](https://github.com/somegregariousdude/somegregariousdude.github.io). **Snarf the code.** Kick the tires. Stress-test the theme switcher until it breaks. And when you inevitably find a bug that I missed because I was too busy rocking out to *Motley Crue*, let me know. Better yet, fix it and send a Pull Request.

The whole thing is released under the **MIT License**, which means you can take it, break it, remix it, or use it to build your own fortress. I might be a perfectionist, but I believe in sharing the tools.

## Why It Matters

Is this site over-built? Yes. Did I need to write a `setup_project.sh` script that can rebuild the entire infrastructure from scratch in 10 seconds? Probably not.

But in a world of AI slop and ad-bloat, I wanted to build a handmade corner of the internet. A place that loads instantly, respects your privacy, and works for everyone—regardless of how they browse the web.

It might be a digital fortress, but the drawbridge is down. Come on in. The music is loud, the code is clean, and the pie is waiting.

*(Now, if you’ll excuse me, I have a date with some leftover turkey, stuffing, green bean casserole & sweet potato pie.)*
