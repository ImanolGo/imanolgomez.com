# AGENTS.md — rules for coding agents working on this repo

This is the personal site and portfolio of **Imanol Gómez**, served at **https://imanolgomez.com**.
Its job: let a recruiter or hiring manager understand in under 60 seconds who Imanol is, what he has
built, and why it matters — then let them go deeper into case studies if they want.

Read this file fully before making changes. The build plan lives in `docs/PLAN.md`; facts about
Imanol live in `docs/PROFILE.md`.

> Using Claude Code? Create a `CLAUDE.md` containing the single line `@AGENTS.md` so these rules load automatically.

---

## Stack

- **Zola** (static site generator, single Rust binary). Templates in Tera, content in Markdown + TOML front matter, styles in SCSS compiled by Zola.
- **No Node / npm / bundlers.** Zero runtime dependencies. The only build tool is the `zola` binary (plus the Rust toolchain for the optional WASM piece in Phase 8).
- **Hosting:** GitHub Pages via GitHub Actions. Custom domain `imanolgomez.com`.

Always check the docs for the **installed** Zola version (`zola --version`, https://www.getzola.org/documentation/) before using config keys or template functions — some names changed between releases (e.g. feed settings, syntax-highlighting config). Do not guess.

## Commands

```sh
zola serve          # local dev with live reload at http://127.0.0.1:1111
zola build          # production build into ./public
zola check          # build + check internal/external links
```

## Non-negotiable rules

1. **Static first.** Every page must render fully and be readable with JavaScript disabled. JS is only allowed for progressive enhancement (theme toggle, the optional Phase 8 canvas). No JS framework, ever.
2. **Performance budget** (per page, excluding content images/video):
   - HTML + CSS ≤ 50 KB uncompressed; one CSS file; no render-blocking JS.
   - Lighthouse (mobile): Performance, Accessibility, Best Practices, SEO all **100**.
   - LCP < 1.5 s on a mid-range phone; CLS = 0 (all images/videos have width/height).
3. **No third-party requests at runtime.** No CDNs, no Google Fonts, no analytics, no YouTube/Vimeo iframes, no social widgets. Fonts are system fonts or self-hosted files in `static/fonts/`. (Reason: speed, and GDPR — the site is operated from Germany.) For external videos, link out with a poster image instead of embedding.
4. **Never invent content.** No made-up facts, dates, clients, metrics, quotes, or job titles. Use only `docs/PROFILE.md` and existing `content/`. Where something is missing, write a visible placeholder: `TODO(imanol): <what is needed>`. The production build must not ship with TODOs (see Phase 7 check).
5. **Confidentiality.** Current-employer work (CARIAD) may only describe what is publicly known plus Imanol's own role and scope as he states it. No internal project names, architectures, numbers, or screenshots unless they are in `docs/PROFILE.md`. Pages with `extra.confidential = true` render no media gallery and show a short confidentiality note.
6. **Accessibility.** Semantic HTML (landmarks, one `h1` per page, ordered headings), visible focus styles, colour contrast ≥ WCAG AA, `prefers-reduced-motion` respected, every image has meaningful `alt` (the image shortcodes must fail the build via Tera `throw()` if `alt` is missing).
7. **Images and video always go through shortcodes** (`figure`, `gallery`, `video`) so they get resized, sized, and lazy-loaded. Never put a raw `<img>` or Markdown image for content.
8. **Design tokens only.** Colours, spacing, type sizes, radii come from CSS custom properties defined in `sass/_tokens.scss`. No hard-coded colour values elsewhere.
9. **Content is data.** Experience, education and publications live in `data/*.toml` and are rendered by templates, so the home page and CV page never drift apart. Adding a project or a job must never require editing a template.
10. **Repository hygiene.** No files > 10 MB in git. Compress video before committing (target ≤ 5 MB, H.264 MP4, plus WebM if smaller). Never commit anything about the job search itself (target companies, salary, notes about leaving the current employer) — this repo is public.

## Directory layout (target)

```
.
├── AGENTS.md
├── README.md
├── config.toml
├── content/
│   ├── _index.md               # home page text
│   ├── about.md
│   ├── cv.md                   # renders data/*.toml
│   ├── projects/
│   │   ├── _index.md
│   │   └── <slug>/             # one page bundle per project
│   │       ├── index.md
│   │       └── cover.jpg, *.jpg, *.mp4
│   └── writing/                # optional notes/blog; hidden from nav while empty
│       └── _index.md
├── data/
│   ├── experience.toml
│   ├── education.toml
│   └── publications.toml
├── docs/
│   ├── PLAN.md
│   ├── PROFILE.md
│   └── templates/project.md    # copy-paste template for new projects
├── sass/
│   ├── main.scss
│   ├── _tokens.scss
│   ├── _base.scss
│   ├── _layout.scss
│   ├── _components.scss
│   └── _print.scss
├── static/
│   ├── fonts/                  # only if a self-hosted font is used
│   ├── favicon.svg
│   └── cv/imanol-gomez-cv.pdf  # provided by Imanol
├── templates/
│   ├── base.html
│   ├── index.html
│   ├── page.html
│   ├── section.html
│   ├── projects/{section,page}.html
│   ├── cv.html
│   ├── 404.html
│   ├── macros/{head,cards,meta}.html
│   └── shortcodes/{figure,gallery,video,callout}.html
├── wasm/                       # optional, Phase 8 only
└── .github/workflows/{deploy,check}.yml
```

## Definition of done (every change)

- `zola build` and `zola check` pass with no warnings.
- Page works with JS disabled and in both light and dark mode.
- Checked at 360 px, 768 px and 1280 px widths; no horizontal scroll.
- No new third-party requests (check the browser network tab).
- If you added a content field or shortcode, document it in `README.md` → "Adding content".
- Small, focused commits with Conventional Commit messages (`feat:`, `fix:`, `content:`, `style:`, `ci:`, `docs:`).

## When unsure

Prefer less: fewer features, fewer colours, fewer words. Ask Imanol (leave a `TODO(imanol)`) rather than guessing about content. Ask before adding any dependency, script, or external service.
