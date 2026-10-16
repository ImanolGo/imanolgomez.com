+++
title = "Light & interactive installations"
template = "projects/page.html"
description = "Facades, kinetic light and computer-vision pieces for museums, brands and events."
date = 2014-07-01
weight = 60
[taxonomies]
tags = ["installations", "lighting", "computer-vision"]
[extra]
period = "2011 – 2018"
org = "Freelance & Ars Electronica"
location = "Berlin & international"
role = "Creative technologist"
featured = true
confidential = false
cover = ""
cover_alt = ""
stack = ["C++", "Python", "OpenGL", "OpenCV", "DMX", "openFrameworks"]
links = []
+++

TODO(imanol): add photos of the installations — they are the whole point of this page.

## Context

The installations in this list span two stretches: **Ars Electronica** in Linz
(2011 – 2014), where I built interactive computer-vision pieces as a Creative
Engineer, and my freelance years in Berlin (2014 – 2018), delivering projects for
brands, museums and events.

Some of the pieces: **Stella Rinascente** (Rome, 2017), a Christmas facade
installation for Rinascente's flagship store by Studio Waldemeyer with Slamp;
**Journey of Colour**, where a camera reads an object's colour palette and projects it
onto a light sculpture; **TheOther**, a particle-projection piece on emerging
cosmology theories shown at the Havana Biennial 2015; and **re.show**, a
dance-theatre premiere for the kontrastmoment agency's 15th anniversary. Alongside
these I built LED-mapping tools for the designer Moritz Waldemeyer
(`LedMapper`, `WinchesLightPainting`) and software for Ingo Maurer's Light + Building
2018 installation.

## The problem

Installations are delivered once and then run unattended for weeks, in a room with
visitors who will touch, lean on and unplug everything. The software has to survive
that without a technician: recover from a crashed camera, calibrate for the actual
light in the room, and keep running on hardware that was specified before anyone knew
what the piece would be.

Commissioning is also where the real work hides. The brief is a mood board; the
installation is a large physical object that has to be mapped, aligned and tuned in
minutes before the doors open.

## What I did

- Built the interactive and computer-vision software (C++, Python, OpenGL, OpenCV) and
  the hardware that drove it.
- Developed production software for **permanent exhibitions**, where "restart it" is
  not an option.
- Wrote the LED-mapping and calibration tooling that mapped 3D models onto physical
  light objects and exported them to the lighting hardware.
- Was lead developer of **GeoPulse**, a spatial-data visualization platform at Ars
  Electronica Center.
- Handled delivery end to end, from an ambiguous brief to a tuned, running piece.

## Outcome

TODO(imanol): which pieces ran longest or reached the most visitors, and any client you
are happy to name beyond the ones in docs/PROFILE.md.

## Stack & notes

C++ · Python · OpenGL · OpenCV · openFrameworks · DMX.

Related repositories: `LaRinascente`, `TheJourneyOfColor`, `LedMapper`,
`IngoLedMapper`, `IngoLightAndBuilding`, `WinchesLightPainting`, `CoralSoul`,
`TheOther`, `Equalizer`, `ofxDmx4All`.
