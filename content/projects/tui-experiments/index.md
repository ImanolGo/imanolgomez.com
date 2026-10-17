+++
title = "Experiments in the terminal"
template = "projects/page.html"
description = "An aquarium of processes, a sky of passing aircraft and a flock at dusk, built in Rust with Ratatui."
date = 2026-01-01
weight = 130
[taxonomies]
tags = ["rust", "tui", "creative-code"]
[extra]
period = "2026"
org = "Open source"
role = "Personal projects"
featured = false
confidential = false
cover = "cover.jpg"
cover_alt = "Procquarium terminal aquarium with fish labelled by process name and a selected process's memory and CPU details"
stack = ["Rust", "Ratatui", "terminal graphics"]
links = [{ label = "procquarium", url = "https://github.com/ImanolGo/procquarium" }, { label = "overflight", url = "https://github.com/ImanolGo/overflight" }, { label = "murmuration", url = "https://github.com/ImanolGo/murmuration" }]
+++

## Why the terminal?

[Awesome TUI](https://github.com/rothgar/awesome-tuis) got me interested in applications
that treat the console as a craft. I liked their keyboard-first interaction and the
care they put into using a small amount of screen space without demanding attention.

I wanted to see what modern terminal emulators, including GPU-accelerated ones,
could make possible. Rust was the language I wanted to learn more deeply, and
[Ratatui](https://ratatui.rs/) gave me a way to build the interfaces and draw directly
into terminal cells. The applications themselves render text and braille characters;
GPU acceleration belongs to the emulator, not their simulation code.

## Procquarium

Running processes become an aquarium. Memory determines a fish's size, CPU usage
sets its swimming speed, and child processes follow their parent. New jobs hatch;
finished ones drift to the surface.

I wanted the movement to carry information. You can select a fish to inspect its
process, search by name, or hide the instruments and leave the tank in a spare pane.
Changing a process's priority or sending it a signal requires explicit opt-in.

{{ <video src="projects/tui-experiments/procquarium.mp4" poster="projects/tui-experiments/procquarium.jpg" alt="Terminal aquarium with swimming process fish, parent-child links and a process detail panel" caption="Procquarium. This clip replays a recorded process session." /> }}

## Overflight

Overflight answers a small question: what was that plane overhead? Nearby aircraft
move across a sky chart with callsigns and trails. You can inspect a flight or switch
to a view looking towards the horizon. At night, the stars and celestial positions
are computed for the observer's location and time.

The live application uses aircraft feeds and estimates positions between updates.
It also has an offline demo, shown here. Coverage varies, so it is for curiosity,
not navigation or safety decisions.

{{ <video src="projects/tui-experiments/overflight.mp4" poster="projects/tui-experiments/overflight.jpg" alt="Overflight terminal sky chart changing between overhead and horizon views with labelled aircraft" caption="Overflight's offline demo uses recorded aircraft traffic." /> }}

## Murmuration

Murmuration draws a three-dimensional starling flock in braille against an evening
sky. Each bird follows local rules inspired by flocking research. An optional falcon
provokes escape responses, and an evening cycle brings the flock down towards its roost.

It is an ambient simulation with no score or objective. The model is still evolving
and is not a validated account of wild flocks. I later moved the simulation into
GPU compute shaders for [murmuration-gpu](@/projects/murmuration-gpu/index.md).

{{ <video src="projects/tui-experiments/murmuration.mp4" poster="projects/tui-experiments/murmuration.jpg" alt="Thousands of braille-rendered starlings banking and changing shape against a dusk-coloured terminal background" caption="A recording of the live terminal simulation, with 4,000 birds and an autonomous falcon." /> }}
