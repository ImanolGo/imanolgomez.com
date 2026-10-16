+++
title = "Work"
# Zola 0.23 only looks for templates/section.html and templates/page.html by
# default; a per-directory template has to be named in the front matter.
template = "projects/section.html"
description = "Selected projects: embedded firmware, real-time graphics and edge AI in production."
# Sorted by `weight` so `section.pages` is already in "Selected work" order for the
# home page (Zola does not expose `page.weight` to templates). The Work page itself
# re-sorts by date so it reads newest first.
sort_by = "weight"
+++

Projects from roughly fifteen years of getting compute — firmware, real-time graphics
and now neural networks — to run reliably on constrained hardware in production.
