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
world tour between 2014 and 2018. I used the same two pieces of code in a new theatre
every few weeks.

## The problem

The software had to run throughout a performance without stopping to inspect logs
or restart the renderer. There were no second takes. The projection surface was
a moving dancer, and stage sizes varied between venues. I had one technical
rehearsal in each room to get the mapping aligned.

Calibration had to be quick and the results repeatable. If something went wrong,
I had to be able to recover it alone from a laptop in a dark theatre, under time
pressure.

## What I did

- Wrote the multimedia rendering software for the piece (`MurmurRenderer`).
- Built the floor tracking (`MurmurFloorTracking`), so the visuals respond to the
  performer's position instead of following a fixed timeline.
- Set up and tuned the projection mapping at each venue, and drove the show live
  through the run.
- Kept the whole thing running on tour hardware for years.

## Outcome

TODO(imanol): how many cities or shows, and anything you want to say about how it went.

## Stack & notes

C++ · OpenGL · floor tracking.

Related repositories: `MurmurRenderer`, `MurmurFloorTracking`, `SpiritWorld`.
