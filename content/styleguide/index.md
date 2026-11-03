+++
title = "Style guide"
description = "Scratch page that exercises every component in the design system."
draft = true
+++

Scratch page for checking that every component renders correctly in both themes at
360, 768 and 1280 px. It is a draft, so it is never part of the published site.

## Project cards

<ul class="card-grid breakout">
<li class="card">
<a class="card__link" href="#">
<span class="card__cover card__cover--missing">
<span class="card__missing-note">no image yet</span>
<span class="placeholder">TODO(imanol): add cover.jpg</span>
</span>
<div class="card__body">
<h2 class="card__title">A card with no cover</h2>
<p class="card__desc">The placeholder box must keep the 3:2 slot so the grid does not jump.</p>
<p class="meta"><span>2026</span><span>Org</span><span>tag-one, tag-two</span></p>
</div>
</a>
</li>
<li class="card">
<a class="card__link" href="#">
<picture>
<source type="image/webp" srcset="{{ get_url(path='styleguide/cover.jpg') }}">
<img class="card__cover" src="{{ get_url(path='styleguide/cover.jpg') }}" width="900" height="600" alt="Neutral placeholder image" loading="lazy" decoding="async">
</picture>
<div class="card__body">
<h2 class="card__title">A card with a cover</h2>
<p class="card__desc">Whole card is one link, title turns accent on hover.</p>
<p class="meta"><span>2017 – 2020</span><span>ProtoPixel</span><span>embedded, lighting</span></p>
</div>
</a>
</li>
</ul>

## Meta row

<p class="meta"><span>Apr 2023 – present</span><span>CARIAD</span><span>edge AI, automotive, leadership</span></p>

## Case-study header

<header class="case-header">
<h2>Case-study heading</h2>
<p class="case-header__summary">One sentence summary, slightly larger and muted.</p>
<dl class="case-meta">
<div class="case-meta__row"><dt class="case-meta__label">Role</dt><dd>Head of AI Deployment</dd></div>
<div class="case-meta__row"><dt class="case-meta__label">Organisation</dt><dd>CARIAD</dd></div>
<div class="case-meta__row"><dt class="case-meta__label">Period</dt><dd>Apr 2023 – present · Berlin</dd></div>
<div class="case-meta__row"><dt class="case-meta__label">Stack</dt><dd>Python, Qualcomm NPU, ISO 26262</dd></div>
<div class="case-meta__row"><dt class="case-meta__label">Links</dt><dd><a href="#">Case study</a></dd></div>
</dl>
</header>

## Figure

{{ <figure src="styleguide/cover.jpg" alt="Neutral placeholder image" caption="A caption in muted small text." /> }}

## Figure, wide break-out

{{ <figure src="styleguide/cover.jpg" alt="Neutral placeholder image" caption="The same figure breaking out to the container width." wide={true} /> }}

## Gallery

{% <gallery> %}
styleguide/cover.jpg | Grid item one
styleguide/cover.jpg | Grid item two | With a caption
styleguide/cover.jpg | Grid item three
{% </gallery> %}

## Callout

{% <callout kind="note"> %}
**Note.** The body is parsed as Markdown, so *emphasis*, `code` and [links](#) work.
{% </callout> %}

{% <callout kind="warning"> %}
A second kind, for warnings.
{% </callout> %}

## Timeline

<ol class="timeline">
  <li class="timeline__group">
    <header class="timeline__head">
      <p class="timeline__period">Apr 2023 – present</p>
      <h3 class="timeline__org">CARIAD <span class="timeline__location">· Berlin</span></h3>
      <p class="timeline__note">Volkswagen Group software company</p>
    </header>
    <div class="timeline__role">
      <p class="timeline__role-title">Head of AI Deployment <span class="timeline__role-period">Oct 2025 – present</span></p>
      <p class="timeline__role-summary">Leads a team of 12 engineers that takes AI models from research to production.</p>
      <ul class="timeline__highlights">
        <li>Owns production reliability under ISO 26262 and ASPICE.</li>
        <li>Works with Volkswagen, Audi, Qualcomm, Samsung and NVIDIA.</li>
      </ul>
    </div>
    <div class="timeline__role">
      <p class="timeline__role-title">Senior ML Software Engineer <span class="timeline__role-period">Apr 2023 – Oct 2025</span></p>
      <p class="timeline__role-summary">Technical Product Owner for the AI Runtime Environment.</p>
    </div>
  </li>
  <li class="timeline__group">
    <header class="timeline__head">
      <p class="timeline__period">Aug 2020 – Apr 2023</p>
      <h3 class="timeline__org">NELA by Carepath Technologies <span class="timeline__location">· Berlin</span></h3>
    </header>
    <div class="timeline__role">
      <p class="timeline__role-title">AI Software Engineer</p>
      <p class="timeline__role-summary">Built NELA Cough in a regulated healthcare environment.</p>
    </div>
  </li>
</ol>

## Tag list

<ul class="tag-list">
  <li class="tag"><a href="#">embedded</a></li>
  <li class="tag"><a href="#">lighting</a></li>
  <li class="tag"><a href="#">real-time</a></li>
  <li class="tag"><a href="#" aria-current="page">edge-ai</a></li>
</ul>

## Prev / next

<nav class="prev-next" aria-label="Project">
  <a class="prev-next__link" href="#">
    <span class="prev-next__label">Previous</span>
    <span class="prev-next__title">Light-emitting wearables</span>
  </a>
  <a class="prev-next__link prev-next__next" href="#">
    <span class="prev-next__label">Next</span>
    <span class="prev-next__title">Edge AI for remote patient monitoring</span>
  </a>
</nav>
