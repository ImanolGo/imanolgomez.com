+++
title = "Neurospaces: sonifying fMRI data in 3D audio"
template = "projects/page.html"
description = "Turning brain activity into a 3D-audio composition — two peer-reviewed publications and the tools behind them."
date = 2012-06-01
weight = 120
[taxonomies]
tags = ["research"]
[extra]
period = "2011 – 2014"
org = "Universitat Pompeu Fabra & others"
location = "Barcelona"
role = "Researcher"
featured = false
confidential = false
cover = "cover.jpg"
cover_alt = "Brain sonification software showing fMRI slices, a three-dimensional brain view and a signal plot"
stack = ["Python", "3D audio", "fMRI"]
links = []
+++

## Context

During my Master's in Sound and Music Computing at Universitat Pompeu Fabra, and
for a few years afterwards, I worked on sonification: using sound rather than
colour to represent scientific data. I worked with fMRI brain volumes to produce
*Neurospaces*, a musical composition in 3D audio, and the tools behind it.

Two peer-reviewed publications came out of it:

- *Three dimensional sonification of fMRI brain data in the musical composition
  Neurospaces* — CIM14, Berlin, December 2014.
- *Exploring 3D audio for brain sonification* — ICAD, June 2012.

## The problem

Sound can make changes over time and patterns in dense signals easier to notice.
The mapping determines what a listener can hear: which data dimension controls
pitch, which controls position, and how expectations affect their interpretation.
A poor mapping can leave the data difficult to understand despite an elaborate
audio treatment.

In 3D audio, spatialization adds computational cost. Perceptual cues for elevation
are weak, and the source fMRI data is large.

## What I did

- Built the visualization and sonification tooling for fMRI volumes
  (`BrainSonification`), which was used for both the composition and the performance.
- Designed the mapping from brain data to a 3D-audio space, and composed *Neurospaces*
  around it.
- Wrote my Master's thesis application (`fMRI-Sonification`) exploring the same idea,
  and continued with `Human-Brain-Mapping`.
- Co-authored and presented the two papers.

## Stack & notes

{{ <figure src="projects/neurospaces/brain.jpg" alt="Three-dimensional brain visualization with many marked points across its surface" caption="A view from the brain visualization and sonification work." /> }}

Python · 3D audio · fMRI.

Related repositories: `BrainSonification`, `fMRI-Sonification`, `Human-Brain-Mapping`.
