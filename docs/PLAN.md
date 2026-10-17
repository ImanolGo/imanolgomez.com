# Build plan — imanolgomez.com

Work through the phases in order. Each phase ends with acceptance criteria; don't start the next
phase until they pass. Follow the rules in `/AGENTS.md` throughout.

---

## 0. Design brief (read first)

**Feel:** minimal, modern, calm, editorial. Confident typography, precise alignment and room to breathe —
not a template, not a "dev portfolio" with gradients and particle effects. The visuals are Imanol's
real project photos (light installations, wearables, stages); projects without imagery get an intentional
typographic treatment, not decorative stock artwork or a large missing-image box.

**Story the site tells (one line, used on the home page and in meta):**
> Technical lead & AI engineer. I turn ambitious ideas into reliable software.

The home page pairs this broad positioning with concrete experience in AI, medical devices
and creative technology. Use the factual current job title in experience and structured data,
not as the umbrella headline. See `docs/PROFILE.md` for the canonical copy.

**Typography**
- Body: system UI sans stack (`system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif`). No webfont download by default.
- Metadata (dates, roles, tags, stack): `ui-monospace, "SF Mono", "JetBrains Mono", Menlo, Consolas, monospace`, small and muted. This is the one "engineer" flourish.
- Fluid sizes with `clamp()`. Body ≈ 17–18 px, line-height 1.6. Headings same family, weight 600–650, slight negative letter-spacing, tight line-height.
- Prose measure: max ~68ch.

**Layout**
- Prose width `--measure: 42rem`; projects use `--wide: 64rem`. At desktop widths the home hero
  and experience section use two columns; mobile reading order remains linear.
- The hero leads with identity and a short statement, then **View work / Download CV**. Social links
  are secondary. A compact strip makes experience and the current role visible at a glance.
- Header: name (links home) on the left, nav on the right: **Work · About · CV** (+ **Writing** only once it has a published post). No hamburger menu — these fit on a 360 px screen.
- Footer: email, LinkedIn, GitHub, © year, and links to Impressum/Privacy (Phase 9).
- Generous vertical rhythm from a spacing scale (`--space-1` … `--space-8`).

**Colour**
- Light: off-white background, near-black text, one muted grey for metadata, one accent.
- Dark: near-black background (not pure #000), off-white text. Photos of light work look great on dark.
- One accent colour used sparingly (links on hover, focus ring, active nav). Suggest a cool cyan/teal as a nod to light work — must pass AA contrast in both themes.
- Theme follows `prefers-color-scheme`; a small toggle (≤ 1 KB inline JS) can override and remembers the choice in `localStorage` (wrapped in try/catch). Avoid a flash of the wrong theme: set the attribute in an inline script in `<head>`.

**Motion:** essentially none. Subtle hover/underline transitions ≤ 150 ms, disabled under `prefers-reduced-motion`.

**Components**
- *Project card:* optional real cover image (3:2, object-fit cover), organisation, title, summary,
  period/tags and a reading affordance. Without a cover, use a text-only layout; confidential cards
  never show media. Whole card is one link. Grid: 1 column on mobile, 2 columns ≥ 48rem, with the
  first selected project spanning both columns. An even final entry also spans both to close the grid.
- *Case-study header:* title, one-sentence summary, a compact meta list (Role, Organisation, Period, Stack, Links).
- *Figure:* responsive image, optional caption in muted small text; optional `wide` break-out.
- *Callout:* bordered note box (used for the confidentiality notice).
- *Timeline (experience):* year range in mono on the left, role + org + one line on the right; collapses to stacked on mobile.

---

## Phase 1 — Bootstrap

1. `zola init` (or create files by hand) with the directory layout from `AGENTS.md`.
2. `config.toml`:
   - `base_url = "https://imanolgomez.com"`, `title`, `description` (the one-liner), `default_language = "en"`.
   - `compile_sass = true`, `minify_html = true`, `build_search_index = false`.
   - Feeds enabled for the writing section only (check the key names for the installed Zola version).
   - `taxonomies = [{ name = "tags" }]`.
   - `[extra]`: `author`, `email` (`TODO(imanol)`: which address to publish), `linkedin = "https://www.linkedin.com/in/imanolgo/"`, `github = "https://github.com/ImanolGo"`, `show_writing = false`, `hero_canvas = false`.
3. `.gitignore`: `public/`, `.DS_Store`, `wasm/target/`.
4. Minimal `templates/base.html` with `<html lang>`, meta viewport, CSS link, skip-to-content link, header/nav, `<main id="main">`, footer.

**Accept:** `zola serve` shows an empty styled shell; `zola build` succeeds.

## Phase 2 — Design system & base templates

1. `sass/_tokens.scss`: colour tokens for light + dark (under `prefers-color-scheme` and `[data-theme]`), type scale, spacing scale, `--measure`, `--wide`, radius, focus ring.
2. `_base.scss`: modern reset, typography, links (underline with offset), focus-visible, selection colour, `img, video { max-width: 100%; height: auto; }`.
3. `_layout.scss`: container, prose width, break-out utility, header/footer, card grid.
4. `_components.scss`: card, meta row, figure, gallery grid, callout, timeline, tag list, prev/next nav.
5. `_print.scss`: hide nav/footer, black on white, show link URLs after links in the CV, avoid page breaks inside timeline items.
6. Theme toggle (inline, tiny) — optional but nice.
7. `templates/404.html`.

**Accept:** a scratch page using every component looks right in both themes at 360/768/1280 px; CSS output ≤ 15 KB.

## Phase 3 — Content model, shortcodes, data

1. **Project front matter** (document it in `docs/templates/project.md`):
   ```toml
   +++
   title = "Real-time lighting platform"
   description = "One sentence used on cards and in meta tags."
   date = 2017-01-01          # start date; used for sorting (newest first)
   weight = 30                # order in "Selected work" (lower = first)
   draft = false
   [taxonomies]
   tags = ["embedded", "lighting", "real-time"]
   [extra]
   period = "2017 – 2020"
   org = "ProtoPixel"
   role = "Software Engineer, Real-Time Hardware"
   featured = true            # show on home page
   confidential = false       # true = no media, show confidentiality note
   cover = "cover.jpg"        # file inside this page bundle
   cover_alt = "Describe the image"
   stack = ["C", "Python", "OpenGL"]
   links = [{ label = "Case study", url = "https://…" }]
   +++
   ```
   Body sections, in this order (headings optional to omit): **Context · The problem · What I did · Outcome · Stack & notes**. Short paragraphs; 300–700 words.
2. **Shortcodes** (all `throw()` if a required arg is missing):
   - `figure(src, alt, caption="", wide=false, eager=false)` — uses `resize_image` to emit a `srcset` at widths 640/960/1440/1920 (skip widths larger than the original), WebP (AVIF if the installed Zola supports it, with fallback), explicit `width`/`height` from `get_image_metadata`, `loading="lazy"` + `decoding="async"` unless `eager`.
   - `gallery()` — body is one `file | alt` per line; renders a responsive grid of `figure`s.
   - `video(src, poster, alt, caption="", autoplay=false)` — `<video playsinline preload="none" poster=…>`; if `autoplay`, also `muted loop autoplay` and a few lines of JS that pause it under `prefers-reduced-motion`. Always provides width/height.
   - `callout(kind="note")` — body is Markdown.
3. **Data files** (`data/experience.toml`, `education.toml`, `publications.toml`) filled from `docs/PROFILE.md`. Experience entries: `org`, `role`, `start`, `end` (or `"present"`), `location`, `summary` (one line), `highlights` (array), optional `project` (slug linking to a case study). Group consecutive roles at the same org.
4. **Templates:** `projects/section.html` (card grid, newest first, with tag filter links to taxonomy pages — no JS), `projects/page.html` (case-study header, cover, body, confidentiality callout if flagged, prev/next), taxonomy templates for tags.

**Accept:** adding a new folder under `content/projects/` with an `index.md` and a `cover.jpg` makes it appear on /projects/ (and on the home page if `featured = true`) without touching any template. Missing `alt` fails the build.

## Phase 4 — Pages

1. **Home (`/`)**
   - `h1`: Imanol Gómez. Below it, the one-liner, then 2–3 sentences of intro (`TODO(imanol)` draft from PROFILE).
   - Primary links: "See selected work", "Download CV (PDF)", LinkedIn, GitHub, email.
   - **Selected work:** featured projects ordered by `weight`, max 6.
   - **Experience:** compact timeline from `data/experience.toml` (latest 5 orgs) + link to the full CV.
2. **Work (`/projects/`)**: all projects, tag filter.
3. **Project pages**: initial set (create bundles; leave media as `TODO(imanol): add photos` where not available):
   | slug | title (working) | featured | notes |
   |---|---|---|---|
   | `ai-deployment-cariad` | AI deployment for automated driving | ✓ (weight 10) | `confidential = true`. Public context only: Automated Driving Alliance (CARIAD + Bosch), Qualcomm SoCs. Role/scope from PROFILE. |
   | `on-device-robot-assistant` | A fully on-device AI robot assistant | ✓ (20) | Repos `local-ai-robot-assistant` + `rover-assistant`: voice + vision on a Jetson Orin Nano, no cloud. Public and recent — the best *showable* proof of edge-AI skills. Needs a photo/video of the robot (`TODO(imanol)`). |
   | `edge-ai-medical-nela` | Edge AI for remote patient monitoring | ✓ (30) | NELA cough monitoring, AI on MCUs, production firmware. |
   | `realtime-lighting-protopixel` | Real-time smart lighting | ✓ (40) | Firmware + GPU generative content; Primavera Sound smart stage, club & creative-space projects. Link repos `VideoPixels`, `UdpPixels`, `ProtoPixelSyphon`. |
   | `wearables` | Light-emitting wearables | ✓ (50) | ElektroCouture (FireFly, Nuit Blanche, Marlene/MarleneGlows), *Norma* LED dresses (Greek National Opera), light-painting fashion with Anja Dragan; driver firmware. |
   | `installations` | Light & interactive installations | ✓ (60) | Stella Rinascente (`LaRinascente`), Journey of Colour (`TheJourneyOfColor`), LED mapping tools for Moritz Waldemeyer (`LedMapper`, `WinchesLightPainting`), Ingo Maurer Light + Building 2018, TheOther (Havana Biennial 2015), re.show. |
   | `murmur-world-tour` | Multimedia software for a touring dance show | – | Aakash Odedra Company, *Murmur*; repos `MurmurRenderer`, `MurmurFloorTracking`; software operated on world tour. |
    | `murmuration-gpu` | Starlings at dusk on the GPU | – | Rust + wgpu GPU flock simulation; 8,000-bird interactive default. Large counts are for profiling and offline rendering. |
   | `alibi` | Alibi: LLM agents that lie | – | LangGraph, MCP tools, RAG memory, CI evals, fine-tuned lie detector. Shows current LLM/agent engineering. |
    | `emma-vlm` | EMMA-VLM: driving plans from vision models | – | OpenRouter vision models, nuImages/nuScenes and open-loop trajectory evaluation. Redirect the old `emma-claude` URL. |
    | `tui-experiments` | Experiments in the terminal | – | Rust/Ratatui: procquarium, overflight and murmuration. |
    | `visual-whispers` | Visual Whispers: picture telephone | – | Image generation and vision-language descriptions through changing personas. |
    | `cuda-particles` | CUDA particles: Particle Atlas | – | CUDA lessons and an interactive particle artwork. |
    | `adas-rust` | ADAS learning projects in Rust | – | Seven exercises ending in an integrated dashcam demo. |
   | `geopulse-ars-electronica` | GeoPulse & interactive exhibits | – | Ars Electronica Center, Linz. |
   | `neurospaces` | Neurospaces: sonifying fMRI data in 3D audio | – | Publications 2012 & 2014; repos `BrainSonification`, `fMRI-Sonification`. |

   Only name clients/brands that appear in `docs/PROFILE.md` without a "confirm" note.

3b. **Code & experiments** — a compact list (no images) at the bottom of `/projects/`, rendered from `data/repos.toml` (`name`, `url`, `year`, `lang`, `blurb`, `group`). Groups: *Edge AI & systems*, *GPU & creative code*, *Lighting & hardware tools*, *Research & music tech*, *Teaching*. Seed it from the "GitHub repositories" section of PROFILE (skip the "Do not feature" list). Each entry is one line: mono year + lang, linked name, blurb. Adding a repo = adding 5 lines of TOML.
4. **About (`/about/`)**: longer narrative (the arc from music technology and creative engineering to edge AI leadership), what he's interested in, how he works. `TODO(imanol)` for personal voice; draft from PROFILE only.
5. **CV (`/cv/`)**: full experience, education, publications, languages, skills — all from `data/`. Prominent "Download PDF" link to `static/cv/imanol-gomez-cv.pdf` (`TODO(imanol)`: provide PDF). Must print cleanly to 1–2 A4 pages via `_print.scss`.
6. **Writing (`/writing/`)**: section scaffolded, `show_writing = false` until the first post exists; nav link appears automatically when there is at least one non-draft page.

**Accept:** all pages render, no broken links, every project page has a cover or a TODO, home page above the fold on a 390×844 phone shows name, one-liner, and the first CTA.

## Phase 5 — Metadata & SEO

1. `macros/head.html`: `<title>` pattern `Page — Imanol Gómez` (home: `Imanol Gómez — <one-liner short>`), meta description from `description`, canonical URL, Open Graph + Twitter card tags. `og:image` = the page cover resized to 1200 px wide; fallback `static/og-default.png` (simple typographic card, `TODO(imanol)` to approve).
2. JSON-LD `Person` on the home page: `name`, `jobTitle` (from PROFILE), `url`, `sameAs` (LinkedIn, GitHub). `CreativeWork` on project pages is optional.
3. `robots.txt` (allow all, sitemap URL), sitemap (Zola built-in), `favicon.svg` (simple monogram "IG"), `apple-touch-icon.png`.
4. `<meta name="theme-color">` for both schemes.

**Accept:** opengraph.xyz (or similar) preview looks right for home and one project; Lighthouse SEO 100.

## Phase 6 — CI/CD

1. `.github/workflows/deploy.yml` — on push to `main` (+ manual dispatch): install pinned Zola → `zola build` → upload `public/` → deploy with the official Pages actions. Skeleton (verify current major versions of each action and the latest Zola release before pinning):
   ```yaml
   name: Deploy
   on:
     push: { branches: [main] }
     workflow_dispatch:
   permissions: { contents: read, pages: write, id-token: write }
   concurrency: { group: pages, cancel-in-progress: true }
   jobs:
     build:
       runs-on: ubuntu-latest
       env:
         ZOLA_VERSION: "X.Y.Z"   # pin to latest from github.com/getzola/zola/releases
       steps:
         - uses: actions/checkout@v4
         - name: Install Zola
           run: |
             curl -sL "https://github.com/getzola/zola/releases/download/v${ZOLA_VERSION}/zola-v${ZOLA_VERSION}-x86_64-unknown-linux-gnu.tar.gz" | tar xz
             sudo mv zola /usr/local/bin/
         - run: zola build
         - uses: actions/configure-pages@v5
         - uses: actions/upload-pages-artifact@v3
           with: { path: public }
     deploy:
       needs: build
       runs-on: ubuntu-latest
       environment:
         name: github-pages
         url: ${{ steps.deployment.outputs.page_url }}
       steps:
         - id: deployment
           uses: actions/deploy-pages@v4
   ```
2. `.github/workflows/check.yml` — on pull requests: `zola build`, `zola check`, fail if the built HTML contains `TODO(` (`grep -r "TODO(" public && exit 1 || true` inverted appropriately), optional link check with `lycheeverse/lychee-action`.
3. In repo **Settings → Pages**: Source = "GitHub Actions".

**Accept:** a push to `main` deploys; a PR with a TODO in content fails the check.

## Phase 7 — Domain (done by Imanol, agent writes instructions only)

1. **GitHub → Settings (account) → Pages → Add a verified domain** → `imanolgomez.com`; add the TXT record it shows at Namecheap. (Prevents domain takeover.)
2. **Namecheap → Domain List → imanolgomez.com → Advanced DNS:** delete the default parking records, then add:
   - `A` `@` → `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153`
   - `AAAA` `@` → `2606:50c0:8000::153`, `2606:50c0:8001::153`, `2606:50c0:8002::153`, `2606:50c0:8003::153`
   - `CNAME` `www` → `imanolgo.github.io.`
3. **Repo → Settings → Pages → Custom domain:** `imanolgomez.com`, then tick **Enforce HTTPS** once the certificate is issued (can take up to an hour or so).
4. Do **not** touch DNS for `steinergomez.com` (it carries Imanol's email).

**Accept:** `https://imanolgomez.com` and `https://www.imanolgomez.com` both load over HTTPS; `www` redirects to the apex.

## Phase 8 — QA pass

- Lighthouse mobile on home, /projects/, one project, /cv/: all 100 (or document why not).
- Keyboard-only navigation through every page; screen-reader spot check (VoiceOver/NVDA) of home + one project.
- JS disabled: everything readable.
- Print preview of /cv/.
- Network tab: no third-party requests.
- `zola check` clean; no `TODO(` in `public/`.

## Phase 9 — Optional: WebAssembly hero piece (only if Imanol asks)

Preferred idea: a small starling murmuration in the home hero, reusing the flocking code from the `murmuration-gpu` repo (Rust; render with WebGL2 or 2D canvas for the web build, a few thousand birds, not millions). It ties together the *Murmur* dance work, real-time GPU code and Rust. Fallback idea: a generative light field nodding to the LED work.
- Crate in `/wasm` (`wasm-bindgen`, `web-sys`; WebGL2 or 2D canvas). Built in CI (`wasm-pack build --target web --release`, or `cargo` + `wasm-bindgen-cli`), output copied to `static/wasm/` before `zola build`. Don't commit build artefacts.
- Enabled by `extra.hero_canvas = true`. The hero renders a static poster image first; a `type="module"` script loads the WASM only after `load` + `requestIdleCallback`, and only if the hero is visible, WebGL/WASM are supported, and `prefers-reduced-motion` is not set.
- Budget: ≤ 80 KB gzipped (WASM + glue JS). Must not affect LCP or CLS; pause when off-screen or tab hidden.
- Lighthouse must stay at 100.

## Phase 10 — Legal (Imanol to decide; agent scaffolds pages only)

- Operated from Germany, so check whether an **Impressum** (§ 5 DDG) is required for this site and whether a **Datenschutzerklärung** is needed. With no analytics, no cookies, no third-party embeds and self-hosted assets, the privacy page can be short. Note that the Impressum normally requires a postal address — consider a c/o or business address service rather than a home address. `TODO(imanol)`: confirm requirements (not legal advice).
- Scaffold `content/impressum.md` and `content/privacy.md` as drafts, linked from the footer, excluded from the sitemap.

---

## Maintenance (after launch)

- New project: copy `docs/templates/project.md` into `content/projects/<slug>/index.md`, add `cover.jpg`, push.
- New job: add an entry at the top of `data/experience.toml`.
- New post: add `content/writing/<slug>.md`; the Writing nav link appears automatically.
- Update the CV PDF in `static/cv/` whenever the CV changes.
