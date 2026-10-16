# QA pass

Phase 8 of `docs/PLAN.md`. Everything below was run against the built site
(`zola build` and `zola build --drafts`), on 2026-10-16, with Chromium
154.0.8037.97. Re-run after any change; the commands are short enough to be worth
it.

## How to reproduce

```sh
# Production build + link check
zola build && zola check

# Draft build served locally for the browser checks
zola build --drafts --base-url http://127.0.0.1:8099 -o /tmp/site
python3 -m http.server 8099 --bind 127.0.0.1 --directory /tmp/site
```

Chromium's headless window refuses to go below ~500 px wide, so narrow viewports
were measured inside an `<iframe>` of an exact width, with the theme forced via
`iframe.contentDocument.documentElement.dataset.theme`. The one that bites: the
`load` event does not fire reliably in `--dump-dom` when an iframe is involved —
poll with `setInterval` instead.

## Results

| Check | Result |
|---|---|
| `zola build` | passes, no warnings |
| `zola check` | passes; internal links fatal, external links warn |
| Horizontal overflow, 320/360/768/1280 px × light/dark × 12 pages | 96 combinations, **0 problems** |
| HTML + CSS weight, largest page | 39.8 KB uncompressed (`/projects/`), budget 50 KB |
| CSS | 15.8 KB uncompressed / 3.7 KB gzip, one file — see the note below |
| Third-party requests | **none** — all 141 subresource references are same-origin |
| Inline JS | 753 B on every page (theme toggle, `hidden` without JS); home adds a JSON-LD block |
| JS disabled | every page readable, theme follows `prefers-color-scheme`, toggle stays hidden |
| Images | all 12 `<img>` carry `alt` and explicit `width`/`height` (CLS 0) |
| Headings | exactly one `h1` per page, no level skipped |
| Landmarks | `header` / `main` / `footer` / labelled `nav` + working skip link on every page |
| Focus | single `:focus-visible` outline rule; no `outline: none` anywhere |
| Tap targets | all 21 interactive elements ≥ 32×32 CSS px (WCAG 2.2 SC 2.5.8) |
| Colour contrast | all 14 pairs pass WCAG AA in both themes, incl. focus ring ≥ 3:1 |
| Print, `/cv/` | 3 A4 pages, black on white, no header/footer/buttons, no breaks inside entries |
| Metadata | unique `<title>` on every page, meta description, canonical, OG + Twitter cards |
| Structured data | home page JSON-LD parses as `Person` |
| Placeholders | **25 distinct** `TODO(imanol)` messages, 76 occurrences in the build — see below |

## Not done here, and why

**Lighthouse.** There is no Node/npm on this machine, so Lighthouse could not be
run; the "all four categories = 100" acceptance criterion in `AGENTS.md` is
**unverified**. The audits that normally drive those scores were checked by hand
instead: document title and meta description on every page (SEO), `html[lang]` and
a viewport meta, one `h1` and ordered headings plus landmarks and alt text
(Accessibility), no console errors by construction since there is almost no
JavaScript, no third-party requests, HTTPS-safe relative URLs, and no
render-blocking resources (one stylesheet, no fonts, no scripts before paint).
The remaining unknown is Performance, which needs a real LCP/TBT measurement.

**Keyboard and screen-reader pass.** The structural checks above substitute for
neither a real Tab-through on every page nor a screen-reader spot check
(VoiceOver/NVDA) of the home page and one project page. Both need a human with
working ears and hands.

**`TODO(` in the production build.** 25 distinct placeholders, 76 occurrences in
the built HTML (they repeat across the card grids, tag pages and the home page).
Most are one of three kinds: a photo or video to shoot (all twelve project pages),
an outcome or detail only Imanol can publish (the case-study "Outcome" and
"problem" sections), and scaffolding for content that does not exist yet (the third
publication, the first Writing post). `check.yml` fails once it runs, which is the
intended gate — do not relax it, finish the content.

**Project imagery.** One project, `realtime-lighting-protopixel`, has a locally
generated grey placeholder cover so the card grid is not entirely empty. The other
eleven render the "no image yet" state. Every project page carries its own photo
TODO.

## Deviation from the plan

**CSS is 15.8 KB, over the 15 KB figure in Phase 2.** That number is a design-system
milestone, not the site budget — `AGENTS.md` asks for HTML + CSS ≤ 50 KB per page,
and the largest page is 39.8 KB. Every class in the stylesheet is used somewhere in
the build (checked mechanically) and unused views of it have been removed, so the
only way further down is to drop design decisions rather than to clean up. Gzipped
it is 3.7 KB. If 15 KB must hold, the honest options are dropping the mono section
labels or the card treatment — say the word.

**The CV prints to 3 A4 pages, not the 1–2 in Phase 8.** The content is what it is:
four organisations with multiple roles each, plus skills, education, languages and
publications. Dropping the highlight bullets in print still produced 3 pages (the
bulk is role titles and summaries), and shrinking type further would push it below
readable. The canonical recruiter artefact is the 3-page resume PDF linked from the
page, and the printed sheet is clean — no chrome, no breaks inside an entry — so
this is documented rather than forced.
