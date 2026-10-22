+++
title = "CUDA particles: Particle Atlas"
template = "projects/page.html"
description = "Learning CUDA through six small lessons and an interactive particle artwork with glowing trails."
date = 2026-01-01
weight = 60
[taxonomies]
tags = ["gpu", "creative-code"]
[extra]
period = "2026"
org = "Open source"
role = "Personal project"
featured = false
confidential = false
cover = "cover.jpg"
cover_card = "card.jpg"
cover_alt = "Particle Atlas drawing a luminous spiral of cyan and amber particles against a dark background"
stack = ["CUDA", "C++", "OpenGL", "GLSL", "GLFW"]
links = [{ label = "GitHub", url = "https://github.com/ImanolGo/cuda-particles" }]
+++

## Learning through a visual project

I wanted to learn CUDA fundamentals and finish with something I could play with.
The repository starts with six small lessons and ends in Particle Atlas, an
interactive particle system that responds to the mouse.

The lessons work through kernels and thread indexing, device memory, shared memory
and synchronization, then timing and streams. The last one connects CUDA to OpenGL,
which becomes the basis of the artwork.

## Particle Atlas

The final project has three scenes. Orbit starts with spiral arms and differential
rotation. Aurora carries coloured bands through a moving field. Ink uses a curl
field to form rolling eddies. Moving the cursor stirs the particles; the mouse
buttons attract or repel them.

These are art-directed fields. They borrow visual ideas from galaxies, auroras and
ink without trying to be a gravity or fluid solver.

{{ <video src="projects/cuda-particles/particles.mp4" poster="projects/cuda-particles/particles.jpg" alt="Particle Atlas cycling through a spiral galaxy, flowing aurora bands and curling luminous ink" caption="Offline capture with 200,000 particles using the staged copy path. This recording is not a frame-rate benchmark." /> }}

## Keeping the work on the GPU

In the default path, CUDA writes particle positions and colours directly into
OpenGL vertex buffers. Rendering adds the particles to a persistent HDR framebuffer,
then applies bloom and tone mapping. The trails are part of that framebuffer's
history, so pausing also freezes the accumulated light.

Hybrid-GPU laptops can put CUDA and OpenGL on different devices. I kept an explicit
fallback that copies particle data through the CPU, with a label in the interface
so the slower path is visible. The supplied recording uses that fallback.

The learning examples stay small enough to inspect, while the final project adds
GPU regression checks and render smoke tests. The next question is how the cost
changes when particles start interacting with one another, as they do in my
[starling-flock simulation](@/projects/murmuration-gpu/index.md).
