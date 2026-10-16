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
rendered with **wgpu**, running up to millions of birds in real time. There is a
terminal companion too — `murmuration`, a text-mode version modelled on the same
flocking research.

It is a deliberate callback: years ago I built the show software for *Murmur*, a dance
piece about exactly this — how a flock behaves as one body. This time the constraint
is not a theatre but the frame budget.

## The problem

A murmuration is a worst-case workload for the naive approach: every bird interacts
with its neighbours, so the cost is quadratic and the data has to cross the CPU/GPU
boundary every frame. Millions of agents at interactive frame rates only works if the
neighbour search, the state update and the draw call all stay resident on the GPU, and
if the memory layout is built for the access pattern rather than for the programmer's
convenience.

## What I did

- Wrote the flocking simulation in Rust, with the per-agent state and the neighbour
  search on the GPU.
- Rendered through **wgpu** (WGSL compute and render pipelines), so the same code path
  targets Vulkan, Metal and DX12.
- Kept simulation parameters tweakable at runtime, because the interesting part of
  flocking is the parameter space, not any single run.

## Outcome

TODO(imanol): the bird counts and frame rates you actually see, and whether you plan to
ship it as the site's hero animation (it is the candidate for Phase 9).

## Stack & notes

Rust · wgpu · WGSL.

Related repositories: `murmuration-gpu`, `murmuration`, `cuda-particles`.
