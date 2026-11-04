+++
title = "Light software for the Bentley EXP 100 GT"
template = "projects/page.html"
description = "The software that drove, mapped and controlled the light on Bentley's centenary concept car, built for Studio Waldemeyer and synced with the show on command."
date = 2019-07-01
weight = 65
[taxonomies]
tags = ["lighting", "real-time"]
[extra]
period = "Jul 2019"
org = "Studio Waldemeyer"
role = "Light software, contracted by Studio Waldemeyer"
featured = false
confidential = false
highlight = "8,982 LED positions mapped in 3D across the car, inside and out"
cover = "cover.jpg"
cover_alt = "The Bentley EXP 100 GT concept car on a dark stage, its grille, wheels and body lines lit in turquoise, with red light lines on the wall behind"
cover_caption = "Photo: Studio Waldemeyer."
stack = ["C++", "openFrameworks", "GLSL", "OSC", "TCP/UDP", "ESP32", "Python"]
links = [
  { label = "Studio Waldemeyer project page", url = "https://www.waldemeyer.com/projects/bentley-exp-100-gt" },
  { label = "Video of the car (YouTube)", url = "https://www.youtube.com/watch?v=dAndN-vkaIY" },
  { label = "GitHub", url = "https://github.com/ImanolGo/Bentley" },
]
+++

## Context

Bentley built the EXP 100 GT concept car for its 100th anniversary, with light as a
new luxury material. Studio Waldemeyer designed and engineered all of its
illumination, from the matrix grille and the Flying B mascot, along the car's spine
and into the cabin. In July 2019 the studio contracted me to write the software
that drove that light. Many people worked on the car; my part was the light software.

## The problem

The LEDs are not on a flat screen: they follow the curved surfaces of a car, from
the grille and bonnet to the doors, seats, air vents and centre console. Content
had to look right on that shape, not on a grid. The car was also part of a show, so
the light had to change mode and mood on cue, driven by other software, and run
reliably in front of an audience.

## What I did

- Wrote the light-driving software, which sends pixel data over the network to the
  car's LED driver boards.
- Built a 3D mapping of the car: the position of every LED is loaded from the design
  data, so content is sampled from the shape of the car itself.
- Made the content: colour, image and video scenes, plus generative GLSL shaders such
  as noise, sparkles, breathing and clouds.
- Built the control and management app, with a live 3D preview of the car, scene
  and transition controls, and per-zone views.
- Added show sync: external show software triggers predefined animations, modes
  and moods on command, over OSC and a simple TCP command interface.
- Wrote the test tooling: ESP32 firmware that received the LED data over Wi-Fi, and a
  Python tool that turned the DXF drawings into KiCad circuit-board layouts.
- Prototyped gesture tracking, part of the concept for switching the car's modes
  with a gesture.

{{ <video src="projects/bentley-exp-100-gt/software.mp4" poster="projects/bentley-exp-100-gt/software.jpg" alt="Screen recording of the control app: a 3D point view of the car's LEDs lighting up in red, green and white patterns, with scene controls on the left and the 2D output on the right" caption="The control app, recorded while testing in June 2019, ahead of the July show: the car's LEDs in 3D, with scene controls and the output preview." /> }}

## Outcome

The software ran the light on the EXP 100 GT for Bentley's centenary. The 3D map in
the project covers 8,982 LED positions across 35 groups, from the grille to the cabin.
A [video of the full car](https://www.youtube.com/watch?v=dAndN-vkaIY) shows the
light in action.

## Stack & notes

C++ · openFrameworks · GLSL · OSC · TCP and UDP networking · ESP32 (Arduino) · Python with KiCad.

Lighting design and engineering: Studio Waldemeyer. Photo: Studio Waldemeyer. The
code is public as [`Bentley`](https://github.com/ImanolGo/Bentley). More of my work
with the studio is under [light and interactive installations](@/projects/installations/index.md).
