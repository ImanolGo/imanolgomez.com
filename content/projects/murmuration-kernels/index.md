+++
title = "One starling flock on the GPU, four ways"
template = "projects/page.html"
description = "The same flock step written in CUDA C++, cuda-oxide, wgpu and cuTile Rust, checked against a CPU reference and profiled with Nsight."
date = 2026-10-01
weight = 50
[taxonomies]
tags = ["gpu", "rust", "real-time"]
[extra]
period = "Oct 2026"
org = "Open source"
location = ""
role = "Personal project"
featured = true
confidential = false
cover = "cover.jpg"
cover_alt = "A simulated starling flock above the title One flock, four ways on the GPU, and a bar chart of neighbour-search time per step at 100,000 birds on an RTX 4000 Ada: CUDA C++ 1.24 ms, wgpu 1.54, cuda-oxide 1.64, cuTile Rust tuned 2.59, cuTile Rust defaults 5.57"
highlight = "Same flock, four GPU stacks, one CPU reference, Nsight profiles on two GPUs"
stack = ["CUDA C++", "cuTile Rust", "cuda-oxide", "wgpu", "Rust", "Nsight"]
links = [
  { label = "Article", url = "https://github.com/ImanolGo/murmuration-kernels/blob/main/docs/ARTICLE.md" },
  { label = "GitHub", url = "https://github.com/ImanolGo/murmuration-kernels" },
]
+++

## Context

After [my GPU flocking simulation](@/projects/murmuration-gpu/index.md) and
[the CUDA particle lessons](@/projects/cuda-particles/index.md), I wanted to learn
how far the newer GPU programming models go on a real workload. I took a reduced
starling-flock step and wrote it four times: CUDA C++, cuda-oxide (Rust compiled
to PTX), wgpu with WGSL, and cuTile Rust, NVIDIA's tile-based model. This is a
personal project, separate from my employer's work.

## The problem

Comparing frameworks on a toy kernel says little. The flock step has a spatial
hash grid (histogram, scan, scatter) and a neighbour-walk kernel that takes
96 to 98 percent of the time, so both regular and irregular memory access matter.
Four implementations are only comparable if they compute the same thing, and
cuTile is an alpha toolchain that I could not run on my laptop's GTX 1650.

## What I did

- Wrote a CPU reference in Rust and a shared binary exchange format, so every
  backend is checked against the same results at 1, 10, 30 and 100 steps.
- Timed with GPU events only, on my laptop and on a rented RTX 4000 Ada,
  with a scripted setup so the cloud runs are repeatable.
- Profiled with Nsight Compute and Nsight Systems, and read ptxas output,
  to explain differences in registers, occupancy and instruction counts.
- Tuned cuTile (tile size, occupancy hint) and cuda-oxide (launch bounds,
  unchecked indexing) so the comparison is not against untuned defaults.
- Wrote a [case study](https://github.com/ImanolGo/murmuration-kernels/blob/main/docs/ARTICLE.md)
  and reported what I found upstream: four issues and a documentation fix
  to NVIDIA's `cuda-rust` repository, plus reproductions on two existing issues.

## Outcome

On the RTX 4000 Ada at 100,000 birds, the neighbour search took 1.24 ms in CUDA,
1.54 ms in wgpu, 1.64 ms in cuda-oxide, 2.59 ms in tuned cuTile and 5.57 ms with
cuTile defaults. Nsight Compute showed cuTile's default kernel using 246 registers
per thread (48 once tuned) against 62 for CUDA. cuTile's regular passes, such as
integration and the scan, ran faster than my CUDA versions at one million birds.

This is one workload on two GPUs and an alpha cuTile revision, with tuning
applied to cuTile, so it is not a ranking of the frameworks. The article lists
what I could not explain, including why tuned cuTile still executes several
times the instructions of CUDA. My documentation fix to `cuda-rust` was open
for review when I wrote this.

## Stack & notes

CUDA C++ · cuTile Rust · cuda-oxide · wgpu / WGSL · Rust · Nsight Compute and
Systems · compute-sanitizer.

Code, results tables and raw Nsight reports are in the
[repository](https://github.com/ImanolGo/murmuration-kernels).
