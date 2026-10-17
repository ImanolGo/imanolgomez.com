+++
title = "Light & interactive installations"
template = "projects/page.html"
description = "Software and hardware for light installations, including work for Studio Waldemeyer and earlier museum exhibits."
date = 2014-07-01
weight = 70
[taxonomies]
tags = ["installations", "lighting", "computer-vision"]
[extra]
period = "2011 – 2018"
org = "Studio Waldemeyer / freelance"
location = "Berlin & international"
role = "Creative technologist"
featured = false
confidential = false
cover = "journey-of-colour.jpg"
cover_alt = "Journey of Colour light sculpture with coloured octagonal outlines, a camera and colour samples in front"
stack = ["C++", "Python", "OpenGL", "OpenCV", "DMX", "openFrameworks"]
links = []
+++

## Context

Most of my freelance light and interactive installation work was made for Studio
Waldemeyer, Moritz Waldemeyer's studio. I worked on the software, LED mapping and
hardware that brought the studio's designs into a working installation.

This page also includes independent projects from my freelance years. My earlier
museum work in Linz has its own [Ars Electronica case study](@/projects/geopulse-ars-electronica/index.md).

Some of the pieces: **Stella Rinascente** (Rome, 2017), a Christmas facade
installation for Rinascente's flagship store by Studio Waldemeyer with Slamp;
**Journey of Colour**, where a camera reads an object's colour palette and projects it
onto a light sculpture, also for Studio Waldemeyer; **TheOther**, a particle-projection piece on emerging
cosmology theories shown at the Havana Biennial 2015; and **re.show**, a
dance-theatre premiere for the kontrastmoment agency's 15th anniversary. Alongside
these I built LED-mapping tools for the designer Moritz Waldemeyer
(`LedMapper`, `WinchesLightPainting`) and software for Ingo Maurer's Light + Building
2018 installation.

{{ <video src="projects/installations/journey-of-colour.mp4" poster="projects/installations/journey-of-colour.jpg" alt="Journey of Colour translating the colours of objects in front of a camera into light around a wall of geometric shapes" caption="Journey of Colour, Studio Waldemeyer. A silent excerpt from the supplied project film." /> }}

## The problem

Installations may run unattended for weeks. Visitors can touch, lean on or unplug
equipment, so the software needs to recover from interruptions without a technician.
It also has to handle camera failures and calibrate for the room's lighting,
using hardware that may have been specified before the piece was fully defined.

A brief might start as a mood board. At the venue, the physical installation has
to be mapped, aligned and tuned, sometimes with only minutes before the doors open.

## What I did

- Built the interactive and computer-vision software (C++, Python, OpenGL, OpenCV) and
  the hardware that drove it.
- Developed production software for permanent exhibitions that needed to run
  without manual restarts.
- Wrote the LED-mapping and calibration tooling that mapped 3D models onto physical
  light objects and exported them to the lighting hardware.
- Handled delivery end to end, from an ambiguous brief to a tuned, running piece.

## Stack & notes

C++ · Python · OpenGL · OpenCV · openFrameworks · DMX.

Related repositories: `LaRinascente`, `TheJourneyOfColor`, `LedMapper`,
`IngoLedMapper`, `IngoLightAndBuilding`, `WinchesLightPainting`, `CoralSoul`,
`TheOther`, `Equalizer`, `ofxDmx4All`.
