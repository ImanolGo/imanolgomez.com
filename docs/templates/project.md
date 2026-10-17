# Project page template

Copy this file to `content/projects/<slug>/index.md`, drop a `cover.jpg` next to it, and the
project appears on `/projects/` (and on the home page when `featured = true`). No template edits
are ever needed.

The slug is the directory name; use kebab-case and keep it stable, because it is the URL.

```toml
+++
title = "Real-time smart lighting"          # shown as the card and page heading
template = "projects/page.html"              # required: Zola 0.23 has no per-directory auto lookup
description = "One sentence used on cards and in meta tags."
date = 2017-01-01                            # start date; /projects/ and prev/next go newest first
weight = 40                                  # curated order of "Selected work" (lower = first)
draft = false

[taxonomies]
tags = ["embedded", "lighting", "real-time"] # drives /tags/ and the filter links

[extra]
period = "Jan 2017 – Aug 2020"               # free text, shown in the meta row
org = "ProtoPixel"
location = ""                                # optional
role = "Software Engineer – Real-Time Hardware"
featured = true                              # show in "Selected work" on the home page
confidential = false                         # true = hide media by default, retain confidentiality note
cover = "cover.jpg"                          # filename inside this page bundle
cover_alt = "Describe the image"             # required when cover is set; empty alt fails the build
cover_public = false                         # true only for an explicitly approved public press cover
cover_caption = ""                           # required source credit for a public cover on confidential work
stack = ["Python", "Embedded C", "OpenGL"]
links = [{ label = "Live site", url = "https://example.com" }]
+++
```

## Rules

- **`template = "projects/page.html"`** is required. Zola 0.23 no longer derives a template from the
  directory name, so every project page has to name it.
- **`title`, `description`, `date`, `weight`** are required. `/projects/` lists newest `date` first
  and the previous/next links walk that same list. `weight` is the curated order (lower = first) used
  by "Selected work" on the home page — and because Zola does not expose `page.weight` to templates,
  the section itself is sorted by weight and the Work page re-sorts by date.
- **`cover`** is a filename inside the bundle, e.g. `cover.jpg`. `cover_alt` must be meaningful —
  a missing `alt` fails the build. Without a cover, cards use a text-only layout; case-study pages
  still flag the missing photograph with a TODO. The first featured project gets the lead layout.
- **`confidential = true`** hides media by default and shows a confidentiality note. Use it for
  current-employer work: describe only what is public plus your own role and scope. An explicitly
  approved public press cover may use `cover_public = true`, with meaningful `cover_alt`, a source
  credit in `cover_caption` and a source link in `links`. This does not permit internal media or galleries.
- **`tags`** must be lowercase kebab-case. Every tag gets a page under `/tags/<tag>/` automatically.
- **`weight`** only affects the home page order. On `/projects/` the order is by `date`, newest first.
- Everything must come from `docs/PROFILE.md`. Where something is missing, write
  `TODO(imanol): <what is needed>` — never invent facts, clients, numbers or dates.

## Body

Five sections, in this order. Headings are optional to omit, but keep the order. Aim for 300–700
words: a hiring manager should be able to skim it in a minute.

1. **Context** — where and when, the organisation, your role.
2. **The problem** — what was actually hard. Constraints, not adjectives.
3. **What I did** — your part, concrete and first-person. A short list reads better than prose.
4. **Outcome** — what shipped and what it changed. Real numbers only, and only ones you may publish.
5. **Stack & notes** — technologies, and links to related repos or writing.

## Images, galleries and video

Images always go through the `figure` component so they are resized, sized and lazy-loaded. Paths are
relative to the `content/` directory, so from a bundle it is `projects/<slug>/file.jpg`.

```md
{{ <figure src="projects/<slug>/cover.jpg" alt="What the photo shows" caption="Optional caption" /> }}
```

Optional arguments: `wide={true}` breaks out to the container width, `eager={true}` disables lazy
loading (use it for the one image above the fold).

```md
{% <gallery> %}
projects/<slug>/stage-01.jpg | The stage at night
projects/<slug>/stage-02.jpg | Close-up of the fixtures | With an optional caption
{% </gallery> %}
```

One `path | alt` per line; a third field is the caption. Every line needs alt text.

```md
{{ <video src="projects/<slug>/clip.mp4" poster="projects/<slug>/poster.jpg" alt="What happens in the clip" caption="Optional caption" /> }}
```

Add `autoplay={true}` for a silent looping clip; that variant also pauses itself when the visitor has
`prefers-reduced-motion` set. Prefer linking out to an external video over embedding one.

Callouts are for notes and warnings:

```md
{% <callout kind="note"> %}
Markdown works here.
{% </callout> %}
```

See `README.md` → "Adding content" for the same syntax in one place.
