+++
title = "Multimedia software for a touring dance show"
template = "projects/page.html"
description = "Rendering and floor tracking for Aakash Odedra's Murmur, operated live through a world tour."
date = 2014-09-01
weight = 90
[taxonomies]
tags = ["real-time", "computer-vision"]
[extra]
period = "Sep 2014 – Mar 2018"
org = "Aakash Odedra Company"
location = ""
role = "Software Engineer – Multimedia Dance Show"
featured = false
confidential = false
cover = ""
cover_alt = ""
stack = ["C++", "OpenGL", "floor tracking"]
links = []
+++

TODO(imanol): add tour photos or a still from the piece.

## Context

**Murmur** is a multimedia dance work by Aakash Odedra with the choreographer Lewis
Major. I wrote the show software and then travelled with it, operating it live on a
world tour between 2014 and 2018 — the same two pieces of code in a new theatre every
few weeks.

## The problem

Theatre is the least forgiving deployment target there is. There are no second takes,
no logs anyone will read mid-show, no way to tell the audience to wait while the
renderer restarts. The projection surface is a moving dancer, the stage is whatever
size the venue happens to have, and you get one technical rehearsal in the room to
make the mapping line up.

That means the software has to be calibratable fast, deterministic once calibrated,
and recoverable by a single person under time pressure, from a laptop, in a dark
theatre.

## What I did

- Wrote the multimedia rendering software for the piece (`MurmurRenderer`).
- Built the floor tracking (`MurmurFloorTracking`), so the visuals respond to where the
  performer actually is rather than following a fixed timeline.
- Set up and tuned the projection mapping at each venue, and drove the show live
  through the run.
- Kept the whole thing running on tour hardware for years.

## Outcome

TODO(imanol): how many cities or shows, and anything you want to say about how it went.

## Stack & notes

C++ · OpenGL · floor tracking.

Related repositories: `MurmurRenderer`, `MurmurFloorTracking`, `SpiritWorld`.
