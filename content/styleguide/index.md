+++
title = "Style guide"
description = "Scratch page that exercises every component in the design system."
draft = true
+++

Scratch page for checking that every component renders correctly in both
themes at 360, 768 and 1280 px. It is a draft, so it is never part of the
published site.

## Project cards

<ul class="card-grid breakout">
  <li class="card">
    <a class="card__link" href="#">
      <img class="card__cover" src="cover.jpg" alt="Neutral grey placeholder image" width="1600" height="1067">
      <h3 class="card__title">Real-time smart lighting</h3>
      <p class="card__desc">One-line description of the project goes here.</p>
      <p class="meta"><span>2017 – 2020</span><span>ProtoPixel</span><span>embedded, lighting</span></p>
    </a>
  </li>
  <li class="card">
    <a class="card__link" href="#">
      <img class="card__cover" src="cover.jpg" alt="Neutral grey placeholder image" width="1600" height="1067">
      <h3 class="card__title">AI deployment for automated driving</h3>
      <p class="card__desc">A second card, to check the two-column grid.</p>
      <p class="meta"><span>Apr 2023 – present</span><span>CARIAD</span><span>edge AI, automotive</span></p>
    </a>
  </li>
</ul>

## Meta row

<p class="meta"><span>Apr 2023 – present</span><span>CARIAD</span><span>edge AI, automotive, leadership</span></p>

## Figure

<figure>
  <img src="cover.jpg" alt="Neutral grey placeholder image" width="1600" height="1067">
  <figcaption>A caption in muted small text.</figcaption>
</figure>

## Figure, wide break-out

<figure class="breakout">
  <img src="cover.jpg" alt="Neutral grey placeholder image" width="1600" height="1067">
  <figcaption>The same figure breaking out to the container width.</figcaption>
</figure>

## Gallery

<div class="gallery">
  <figure>
    <img src="cover.jpg" alt="Neutral grey placeholder image" width="1600" height="1067">
    <figcaption>Grid item one.</figcaption>
  </figure>
  <figure>
    <img src="cover.jpg" alt="Neutral grey placeholder image" width="1600" height="1067">
    <figcaption>Grid item two.</figcaption>
  </figure>
  <figure>
    <img src="cover.jpg" alt="Neutral grey placeholder image" width="1600" height="1067">
    <figcaption>Grid item three.</figcaption>
  </figure>
</div>

## Callout

<aside class="callout">
<p>Details of this work are confidential; this page describes my role and the public context only.</p>
</aside>

## Timeline

<ol class="timeline">
  <li class="timeline__item">
    <p class="timeline__period">Apr 2023 – present</p>
    <div>
      <h3 class="timeline__role">Head of AI Deployment</h3>
      <p class="timeline__org">CARIAD</p>
      <p class="timeline__summary">Leads the AI Deployment team to optimize, integrate and deploy AI models on embedded hardware.</p>
      <div class="timeline__highlights">
        <p>Drives tooling and automation for scalable, multi-platform deployment.</p>
      </div>
    </div>
  </li>
  <li class="timeline__item">
    <p class="timeline__period">Jan 2017 – Aug 2020</p>
    <div>
      <h3 class="timeline__role">Software Engineer – Real-Time Hardware</h3>
      <p class="timeline__org">ProtoPixel</p>
      <p class="timeline__summary">Firmware for real-time smart lighting hardware products.</p>
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
