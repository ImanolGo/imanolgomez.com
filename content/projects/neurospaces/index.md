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
cover = ""
cover_alt = ""
stack = ["Python", "3D audio", "fMRI"]
links = []
+++

## Context

Where my career starts. During a Master's in Sound and Music Computing at Universitat
Pompeu Fabra, and for a few years afterwards, I worked on **sonification**: using sound
rather than colour to make scientific data legible. The subject was brain data — fMRI
volumes — and the output was *Neurospaces*, a musical composition in 3D audio, plus the
tooling that produced it.

Two peer-reviewed publications came out of it:

- *Three dimensional sonification of fMRI brain data in the musical composition
  Neurospaces* — CIM14, Berlin, December 2014.
- *Exploring 3D audio for brain sonification* — ICAD, June 2012.

## The problem

The premise of sonification is that the ear is better than the eye at some things —
spotting change over time, hearing a pattern in a dense signal. Getting that to work
means making design decisions that are more like composition than like charts: which
dimension of the data becomes pitch, which becomes position, what the listener's
expectation does to their reading of the result. Get it wrong and you have made a
very elaborate alarm, not a tool.

Doing it in 3D audio raises the stakes: spatialization is expensive, the perceptual
cues for elevation are weak, and the source data is large.

## What I did

- Built the visualization and sonification tooling for fMRI volumes
  (`BrainSonification`), which was used for both the composition and the performance.
- Designed the mapping from brain data to a 3D-audio space, and composed *Neurospaces*
  around it.
- Wrote my Master's thesis application (`fMRI-Sonification`) exploring the same idea,
  and continued with `Human-Brain-Mapping`.
- Co-authored and presented the two papers.

## Outcome

TODO(imanol): anything about performances, citations or how the piece was received.

## Stack & notes

Python · 3D audio · fMRI.

Related repositories: `BrainSonification`, `fMRI-Sonification`, `Human-Brain-Mapping`.
