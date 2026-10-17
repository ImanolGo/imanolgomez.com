# imanolgomez.com

Personal site and portfolio of [Imanol Gómez](https://imanolgomez.com), a technical lead
and AI engineer working across AI, embedded systems and creative technology. The site
gives a quick introduction to his work, with case studies and a CV for readers who
want more detail.

Built with [Zola](https://www.getzola.org/), Tera templates and SCSS. Zola is the only
build tool; there is no Node/npm setup or JavaScript framework. Pages remain readable
without JavaScript. A small script handles the theme toggle, and media is served
locally without third-party embeds, analytics or tracking. GitHub Actions deploys the
site to GitHub Pages at **https://imanolgomez.com**.

## Current status

The site has 16 project case studies, plus About and CV pages. The six projects in
the home page's Selected work section are AI deployment at CARIAD, Alibi, the
on-device robot assistant, ProtoPixel lighting, NELA and CUDA particles. Wearables
remains on Work. Other case studies include EMMA-VLM, Visual Whispers and the Rust
TUI experiments.

Project pages have covers and use click-to-play video where recordings are available.
The CARIAD page uses an approved public press image with attribution, while retaining
its confidentiality note. EMMA-VLM links to the renamed repository and redirects the
old project URL.

The latest recorded checks pass for builds, links, responsive layouts and light/dark
themes with JavaScript on and off. Production HTML has no TODO placeholders.
Lighthouse scores, field performance and a human screen-reader pass remain unverified;
the earlier CV print check produced three A4 pages against a one-to-two-page target.
See [the QA record](docs/QA.md) for the scope and results of each check.

Impressum and Privacy remain drafts. Missing media credits and a few content
clarifications still need Imanol's input. The CV lists two confirmed publications;
a third citation is unresolved. These questions are tracked in
[the content notes](docs/CONTENT.md), outside the generated site. Writing has no
published posts and is hidden from navigation. No optional WASM hero is implemented.

## Repository structure

```text
content/              Markdown pages and project bundles with their media
data/                 TOML data for experience, education, publications, skills,
                      languages and the repository list
templates/            Tera page templates, shared components and head metadata
sass/                 Design tokens, layout, component and print styles
static/               Files copied into the site, including the CV PDF and icons
docs/                 Profile facts, content notes, QA, deployment and build plan
.github/workflows/    Build checks and GitHub Pages deployment
config.toml           Site settings, taxonomies and metadata
AGENTS.md             Rules for coding agents
public/               Generated build output; ignored by git
```

## Run locally

Use Zola **0.23.6**, the version pinned in both workflows.

```sh
# install Zola: https://www.getzola.org/documentation/getting-started/installation/
zola serve     # http://127.0.0.1:1111, live reload
zola build     # output in ./public
zola check     # build + link check
```

## Checks and deployment

Run `zola build` and `zola check` before publishing. Also check that `public/` contains
no `TODO(` placeholders; draft pages are excluded from the normal build. For visual
changes, check 360, 768 and 1280 px widths in both themes, with JavaScript disabled
as well as enabled. The full acceptance criteria are in [AGENTS.md](AGENTS.md).

[The Check workflow](.github/workflows/check.yml) runs on pull requests and pushes to
branches other than `main`. It builds the site, checks links and rejects TODO
placeholders in the output. External link failures are configured as warnings;
some hosts are skipped because they block automated checks.

Pushing to `main` triggers [the Deploy workflow](.github/workflows/deploy.yml), which
builds and publishes to GitHub Pages. It does not currently run the separate link
check or placeholder gate, so run those locally before pushing directly to `main`.
Domain and repository setup are documented in [docs/DEPLOY.md](docs/DEPLOY.md).

## Adding content

### Home page positioning
`config.toml` holds the site-wide `description` (metadata) and `extra.short_description`
(professional headline, also used in the home page title and eyebrow). `content/_index.md`
holds the home page introduction and `extra.tagline`, the short statement below the name.
`extra.highlights` supplies the background-at-a-glance strip. Use `{ label, value }` pairs for
general facts, or `{ source = "current_role" }` to render the newest role from `data/experience.toml`
(its optional `team_size`, otherwise its title). All claims must come from `docs/PROFILE.md`.
Keep the introduction brief: the full story belongs on About.
Keep its front-matter `description` aligned with the site description. The actual current
job title stays in `config.toml` → `extra.job_title` for structured data and in the experience data.

Zola 0.23 removed shortcodes. Reusable markup lives in `templates/components.html` as
[Tera components](https://keats.github.io/tera/#components), and they can be called from Markdown as
well as from templates.

### A new project
1. Create a folder `content/projects/<slug>/` (the folder name is the URL).
2. Create `content/projects/<slug>/index.md` using the TOML front-matter example in
   [docs/templates/project.md](docs/templates/project.md), then write the Markdown body
   below its closing `+++`. That document contains instructions; do not copy the whole file.
   Keep `template = "projects/page.html"`, and give the page a `date` and a `weight`.
3. Put `cover.jpg` (and any other images/videos) in the same folder, and set `cover` + `cover_alt`.
4. Set `featured = true` to make it eligible for Selected work. The home page shows the
   first **six** featured projects ordered by `weight`, lowest first. To replace a
   selected project, disable its `featured` flag and give the replacement its weight.

`featured`, `cover`, `cover_alt` and the other project-specific fields belong under
`[extra]`. Work and previous/next navigation use `date`, newest first; `weight`
controls the home page selection. Use verified dates and facts from `docs/PROFILE.md`.

When renaming a project, add its old URL to a top-level `aliases` array. For example,
EMMA-VLM uses `aliases = ["/projects/emma-claude/"]` so existing links still work.

No template has to be edited: a published project appears on `/projects/` and on
`/tags/<tag>/` for its assigned tags. It also appears on the home page if selected
by the featured-project rules above. The first selected project gets the large lead treatment.
Cards without a `cover` use a deliberate text-only layout; a cover with missing or empty
`cover_alt` fails the build. Confidential cards hide covers by default. An approved public
press image can be shown with `cover_public = true`; add `cover_caption` with its source credit
and a source link in `links`. The confidentiality note stays visible. This exception applies
only to the cover, not to internal screenshots or galleries.
Non-confidential case studies without a cover render a TODO placeholder. Keep incomplete
pages as drafts rather than publishing placeholders. Optional outcomes or metrics can
stay in `docs/CONTENT.md` until they are confirmed; do not invent them to fill a section.

### Images and video (always use the components)
Paths are relative to the `content/` directory, so from a project bundle they start with `projects/<slug>/`.

```md
{{ <figure src="projects/<slug>/stage.jpg" alt="Smart lighting rig above a festival stage" caption="Primavera Sound" wide={true} /> }}

{% <gallery> %}
projects/<slug>/detail-1.jpg | LED strips sewn into a jacket
projects/<slug>/detail-2.jpg | Close-up of the driver board | Optional caption
{% </gallery> %}

{{ <video src="projects/<slug>/loop.mp4" poster="projects/<slug>/loop.jpg" alt="Light installation reacting to visitors" /> }}

{% <callout kind="note"> %}
Markdown works inside a callout.
{% </callout> %}
```

Non-string arguments need braces (`wide={true}`, not `wide=true`). An empty or missing `alt` fails the
build, and so does a `gallery` line without `| alt`. Originals can be large JPGs: `figure` emits
AVIF + WebP `srcset`s at 640/960/1440/1920 px without upscaling, plus a same-format fallback.
Keep videos under about 5 MB as H.264 MP4s; no file in git may exceed 10 MB.
The optional `autoplay={true}` variant is muted and looping, with a small script
that pauses it under `prefers-reduced-motion`.

Prefer click-to-play video for project recordings: leave `autoplay` unset. Use a
static cover and a poster with the same aspect ratio as the clip. Convert GIFs and
animated WebPs to H.264 MP4 before adding them, keeping the original playback timing.
Label offline captures, time-lapses, replay data and scripted screenshots in captions.
Media sources, credits still to collect and optional content gaps are tracked in
`docs/CONTENT.md`; they are not rendered on the site.

### A new job
Add a role to `data/experience.toml` — newest org first; consecutive `[[org.roles]]` entries under an `[[org]]` are grouped into one timeline entry. The home page timeline and the CV page update automatically.
An optional integer `team_size` on the newest role also powers the home page leadership highlight;
omit it to show the current role title instead. Only use an approved, publishable team size.

### A repository in "Code & experiments"
Add a `[[repo]]` block to `data/repos.toml` with `name`, `url`, `year`, `lang`, `blurb` and `group`. Groups are rendered in the order they first appear in the file, so a new group name is enough to add a section.

### CV skills and languages
`data/skills.toml` is a list of `[[group]]` entries (`name` + `items`); `data/languages.toml` is a list of `[[language]]` entries (`name` + `level`). Both render on `/cv/` only.

### Publishing the legal pages
`content/impressum.md` and `content/privacy.md` are `draft = true`, so they are not built and the footer does not link to them. Delete `draft = true` when the content is reviewed — the footer links appear on their own.

### A new post
Add `content/writing/<slug>.md` with a title and date. Set `extra.show_writing = true`
in `config.toml` when ready to expose the section. The Writing navigation link needs
both that flag and at least one non-draft post.

### Updating the CV PDF
Replace `static/cv/imanol-gomez-cv.pdf`.

## Project docs

- [AGENTS.md](AGENTS.md): coding-agent rules, performance budget and content restrictions.
- [docs/PROFILE.md](docs/PROFILE.md): verified facts used for site copy.
- [docs/CONTENT.md](docs/CONTENT.md): media sources, credits and outstanding content questions.
- [docs/QA.md](docs/QA.md): recorded checks, known deviations and unverified targets.
- [docs/DEPLOY.md](docs/DEPLOY.md): GitHub Pages and domain setup.
- [docs/PLAN.md](docs/PLAN.md): original phased build plan and design brief; use the
  content and QA notes for current status.
- [docs/templates/project.md](docs/templates/project.md): project front matter and media syntax.

## License

The intended code license is MIT. The repository still needs a standalone `LICENSE`
file containing the terms.

Original writing is © Imanol Gómez. Photos, videos and other supplied assets may
belong to their credited photographers, studios or companies, including CARIAD.
They are not covered by the intended code license. See [docs/CONTENT.md](docs/CONTENT.md)
and the page credits for sources; do not assume the media is licensed for reuse.
