# imanolgomez.com

Personal site and portfolio of Imanol Gómez — edge AI deployment, from real-time hardware to automotive AI accelerators.

Built with [Zola](https://www.getzola.org/) — static HTML, no JavaScript framework, no tracking. Deployed to GitHub Pages.

## Run locally

```sh
# install Zola: https://www.getzola.org/documentation/getting-started/installation/
zola serve     # http://127.0.0.1:1111, live reload
zola build     # output in ./public
zola check     # build + link check
```

Pushing to `main` deploys automatically via `.github/workflows/deploy.yml`.

## Adding content

### A new project
1. Create a folder `content/projects/<slug>/`.
2. Copy `docs/templates/project.md` to `content/projects/<slug>/index.md` and fill in the front matter.
3. Put `cover.jpg` (and any other images/videos) in the same folder.
4. Set `featured = true` and a `weight` to show it on the home page (lower weight = shown first).

### Images and video (always use the shortcodes)
```md
{{ figure(src="stage.jpg", alt="Smart lighting rig above a festival stage", caption="Primavera Sound", wide=true) }}

{% gallery() %}
detail-1.jpg | LED strips sewn into a jacket
detail-2.jpg | Close-up of the driver board
{% end %}

{{ video(src="loop.mp4", poster="loop.jpg", alt="Light installation reacting to visitors", autoplay=true) }}

{% callout(kind="note") %}
Details of this work are confidential; this page describes my role and the public context only.
{% end %}
```
Originals can be large JPGs; Zola generates resized WebP versions at build time. Keep videos under ~5 MB (H.264 MP4, short, muted loops).

### A new job
Add an entry at the top of `data/experience.toml`. The home page timeline and the CV page update automatically.

### A new post
Add `content/writing/<slug>.md`. The "Writing" link appears in the navigation once at least one post is published.

### Updating the CV PDF
Replace `static/cv/imanol-gomez-cv.pdf`.

## Project docs

- `AGENTS.md` — rules for coding agents (performance budget, privacy, content rules).
- `docs/PLAN.md` — phased build plan and design brief.
- `docs/PROFILE.md` — facts used for site copy.

## License

Code: MIT. Content (text, images, video): © Imanol Gómez, all rights reserved.
