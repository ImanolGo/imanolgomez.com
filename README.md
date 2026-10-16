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

Zola 0.23 removed shortcodes. Reusable markup lives in `templates/components.html` as
[Tera components](https://keats.github.io/tera/#components), and they can be called from Markdown as
well as from templates.

### A new project
1. Create a folder `content/projects/<slug>/` (the folder name is the URL).
2. Copy `docs/templates/project.md` to `content/projects/<slug>/index.md` and fill in the front matter.
   Keep `template = "projects/page.html"`, and give the page a `date` and a `weight`.
3. Put `cover.jpg` (and any other images/videos) in the same folder, and set `cover` + `cover_alt`.
4. Set `featured = true` to show it in "Selected work" on the home page (lower `weight` = shown first).

No template has to be edited: the project shows up on `/projects/`, on `/tags/<tag>/` and on the home
page by itself. Leaving `cover` or `cover_alt` out renders a visible TODO instead of a broken card.

### Images and video (always use the components)
Paths are relative to the `content/` directory, so from a project bundle they start with `projects/<slug>/`.

```md
{{ <figure src="projects/<slug>/stage.jpg" alt="Smart lighting rig above a festival stage" caption="Primavera Sound" wide={true} /> }}

{% <gallery> %}
projects/<slug>/detail-1.jpg | LED strips sewn into a jacket
projects/<slug>/detail-2.jpg | Close-up of the driver board | Optional caption
{% </gallery> %}

{{ <video src="projects/<slug>/loop.mp4" poster="projects/<slug>/loop.jpg" alt="Light installation reacting to visitors" autoplay={true} /> }}

{% <callout kind="note"> %}
Markdown works inside a callout.
{% </callout> %}
```

Non-string arguments need braces (`wide={true}`, not `wide=true`). An empty or missing `alt` fails the
build, and so does a `gallery` line without `| alt`. Originals can be large JPGs: `figure` emits
AVIF + WebP `srcset`s at 640/960/1440/1920 px, plus a same-format fallback. Keep videos under ~5 MB
(H.264 MP4, short, muted loops); `autoplay={true}` adds a few lines of JS that pause the clip under
`prefers-reduced-motion`.

### A new job
Add a role to `data/experience.toml` — newest org first; consecutive `[[org.roles]]` entries under an `[[org]]` are grouped into one timeline entry. The home page timeline and the CV page update automatically.

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
