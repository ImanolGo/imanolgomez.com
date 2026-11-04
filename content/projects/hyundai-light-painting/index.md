+++
title = "Light painting a surface that never existed"
template = "projects/page.html"
description = "Software that turned an imagined 3D surface into winch motion and LED patterns, so a long-exposure photo above Hyundai's Le Fil Rouge concept car could reveal it."
date = 2018-03-01
weight = 66
[taxonomies]
tags = ["lighting", "installations"]
[extra]
period = "Mar 2018"
org = "Studio Waldemeyer"
role = "Motion and light software, for Studio Waldemeyer"
featured = false
confidential = false
highlight = "Six DMX winches and a 432-LED bar painting each surface in a single exposure"
cover = "cover.jpg"
cover_alt = "Hyundai's Le Fil Rouge concept car in a dark studio, under a floating light-painted surface in red, pink, turquoise and white"
cover_caption = "Photo: Studio Waldemeyer."
stack = ["C++", "openFrameworks", "DMX", "ESP32", "UDP"]
links = [
  { label = "Studio Waldemeyer project page", url = "https://www.waldemeyer.com/projects/hyundai" },
  { label = "GitHub", url = "https://github.com/ImanolGo/WinchesLightPainting" },
]
+++

## Context

Wallpaper* commissioned Studio Waldemeyer to celebrate Hyundai's concept car Le Fil
Rouge. The studio built a large light-painting machine for a photoshoot: a flexible
RGB LED bar hung from six computer-controlled winches above the car. I wrote the
software that drove it, finishing in March 2018. The shoot ran as a Wallpaper*
Bespoke feature on the car.

## The problem

The surfaces in the photos never existed. Each one only appears in a long-exposure
photograph, built up from the trail of a moving bar of light. So the software had to
work backwards: from an imagined 3D surface above the car to what the bar should do
over time. The DMX winches moved the bar vertically and horizontally, and could bend
it from the middle, left and right independently. Every frame of that motion needed
the right LED pattern, and nobody could see the result until the exposure finished.

## What I did

- Wrote the software that translates the 3D surface into motion: winch positions
  for each frame, driving the winches over DMX.
- Generated the LED pattern for each frame, so the colour lands in the right place
  on the surface as the bar moves.
- Created the colour patterns themselves, from gradients to abstract textures.
- Built the playback: a timeline that runs the predefined motion and the LED
  pattern in sync, so one run paints one surface.
- Wrote a separate calibration app for the winches.
- Wrote the ESP32 firmware on the bar, which receives each frame over Wi-Fi (UDP)
  and drives its 432 WS2812B LEDs.

{{ <figure src="projects/hyundai-light-painting/wave.jpg" alt="A white light-painted surface with rippling stripes sweeping over the front of Hyundai's Le Fil Rouge concept car in a dark studio" caption="A single long exposure: the bar's path becomes the surface. Photo: Studio Waldemeyer." /> }}

## Outcome

In the Wallpaper* feature, Moritz Waldemeyer put it simply: "The LED line creates a
surface and draws it into the air." The photoshoot produced the surfaces shown here,
each painted in light by one programmed run of the bar above the car. Studio Waldemeyer describes the results as
exceeding its own expectations and impressing the client.

## Stack & notes

C++ · openFrameworks · DMX winch control · ESP32 firmware (FastLED) receiving UDP over Wi-Fi.

Concept, design and the machine: Studio Waldemeyer. Photos: Studio Waldemeyer. The
code is public as [`WinchesLightPainting`](https://github.com/ImanolGo/WinchesLightPainting).
More of my work with the studio: the [Bentley EXP 100 GT](@/projects/bentley-exp-100-gt/index.md)
and other [light and interactive installations](@/projects/installations/index.md).
