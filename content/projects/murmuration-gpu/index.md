+++
title = "Starlings at dusk on the GPU"
template = "projects/page.html"
description = "A research-inspired starling flock in Rust and wgpu, moving a terminal simulation into GPU compute shaders."
date = 2026-02-01
weight = 80
[taxonomies]
tags = ["gpu", "real-time"]
[extra]
period = "2026"
org = "Personal project"
location = ""
role = "Personal project"
featured = false
confidential = false
cover = "cover.jpg"
cover_alt = "A simulated flock of starlings folding above reeds against a procedural evening sky"
stack = ["Rust", "wgpu", "WGSL"]
links = [{ label = "GitHub", url = "https://github.com/ImanolGo/murmuration-gpu" }]
+++

## Context

I started with [murmuration](@/projects/tui-experiments/index.md), a starling flock
drawn in a terminal. This version moves the simulation to GPU compute shaders in
Rust and wgpu, with individual birds banking against a procedural dusk sky.

I had worked on the show software for [Murmur](@/projects/murmur-world-tour/index.md)
years earlier. This personal project returns to flocking through a different medium.

{{ <video src="projects/murmuration-gpu/evening.mp4" poster="projects/murmuration-gpu/evening.jpg" alt="A simulated starling flock gathering above reeds and descending at dusk while a falcon hunts" caption="An offline time-lapse: one simulated evening minute in about eight seconds, with 8,000 birds and a falcon. It does not show real-time playback speed." /> }}

## The problem

A naive neighbour search has a quadratic cost. Moving the whole flock between CPU
and GPU each frame adds transfer overhead too. I wanted to keep neighbour searches,
state updates and rendering on one GPU, while retaining a CPU reference to check
the model's behaviour.

The flock follows local rules inspired by StarDisplay and starling field studies:
adaptive neighbour attention, banked flight and attraction towards the roost.
The resulting motion is still a work in progress, especially the complex folding
seen in reference footage.

## What I did

- Moved the neighbour search onto a sorted uniform grid in GPU memory.
- Shared the bird-state buffer between compute and rendering, avoiding a full
  flock readback during interactive playback.
- Rendered birds at different levels of detail, with wingbeats, banking and
  accumulated darkness where their silhouettes overlap.
- Compared GPU and CPU flock statistics, with headless analysis and profiling tools.

## Outcome

The interactive default is 8,000 birds. A 15-second windowed startup measurement
recorded 59.11 FPS on a GTX 1650 Max-Q at 1268×1380, using Vulkan and seed 1.
That is one measured configuration, not a guarantee for every flock or scene.

Million-bird counts are available for profiling and offline rendering, but they do
not run in real time on that GPU. This is a research-inspired visual simulation,
not a validated predictor of wild flock behaviour.

## Stack & notes

Rust · wgpu · WGSL.

Related repositories: `murmuration-gpu`, `murmuration`, `cuda-particles`, `murmuration-kernels` (the same flock in CUDA, cuTile, cuda-oxide and wgpu, [profiled with Nsight](@/projects/murmuration-kernels/index.md)).
