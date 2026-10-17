+++
title = "Millions of starlings in real time"
template = "projects/page.html"
description = "A GPU flock simulation in Rust and wgpu — the technical echo of the Murmur commission."
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
cover = ""
cover_alt = ""
stack = ["Rust", "wgpu", "WGSL"]
links = []
+++

TODO(imanol): a still or a short screen recording of the flock — a screenshot of a
simulation does not do it justice.

## Context

A personal project: `murmuration-gpu`, a starling-flock simulation written in Rust and
rendered with wgpu, running up to millions of birds in real time. There is a
terminal companion too: `murmuration`, a text-mode version modelled on the same
flocking research.

Years ago I built the show software for *Murmur*, a dance piece about how a flock
behaves as one body. This project returns to that subject through a simulation,
with the number of birds limited by the frame budget.

## The problem

A naive neighbour search has a quadratic cost. Moving simulation data between the
CPU and GPU every frame adds transfer overhead. To simulate millions of birds at
interactive frame rates, I kept the neighbour search, state updates and rendering
on the GPU, with a memory layout suited to those access patterns.

## What I did

- Wrote the flocking simulation in Rust, with the per-agent state and the neighbour
  search on the GPU.
- Rendered through wgpu (WGSL compute and render pipelines), so the same code path
  targets Vulkan, Metal and DX12.
- Kept simulation parameters tweakable at runtime to explore how they change the
  flock's behaviour.

## Outcome

TODO(imanol): the bird counts and frame rates you actually see, and whether you plan to
ship it as the site's hero animation (it is the candidate for Phase 9).

## Stack & notes

Rust · wgpu · WGSL.

Related repositories: `murmuration-gpu`, `murmuration`, `cuda-particles`.
