+++
title = "Light-emitting wearables"
template = "projects/page.html"
description = "Driver firmware and visuals for LED wearables and fashion-tech pieces, from the driver board to the runway."
date = 2015-01-01
weight = 50
[taxonomies]
tags = ["wearables", "lighting", "embedded"]
[extra]
period = "Jan 2016 – Dec 2018"
org = "ElektroCouture"
location = "Berlin"
role = "Software Engineer – Wearable Technology"
featured = true
confidential = false
cover = ""
cover_alt = ""
stack = ["microcontrollers", "embedded systems", "C++"]
links = []
+++

TODO(imanol): add photos of the pieces — FireFly, Nuit Blanche, Marlene or the Norma
dresses.

## Context

A contract on and off between 2016 and 2018 with **ElektroCouture**, the Berlin
fashion-tech studio, working on light-emitting garments: LED wearables that have to be
worn, washed around, danced in and photographed on a stage. I led design and
development of the wearable products and was the main developer of the driver
firmware.

The pieces ran from a two-year stretch of shows and commissions — **FireFly**, **Nuit
Blanche** and **Marlene** among them — through to **Norma** at the Greek National
Opera in 2019, and long-exposure light-painting fashion photography with the designer
Anja Dragan.

## The problem

Wearable electronics are unforgiving in a way that stage equipment is not. The power
budget is a small battery, the enclosure is fabric, the user moves unpredictably, and
a single dropped frame is visible on a camera. The driver firmware has to drive many
LEDs at a stable refresh rate while staying cool and close to the size of a coin.

Then there is the workflow problem: designers iterate visually, in a studio, hours
before a show.

## What I did

- Led design and development of the wearable products themselves, hardware and
  firmware together.
- Wrote and maintained the **wearable driver firmware** — LED driving, sensor input and
  the animation pipeline.
- Worked alongside designers and textile technologists on pieces that had to survive
  being worn, including the Forster Rohner LED textile work behind **Marlene**.
- Mentored on fashion-tech projects and workshops.

## Outcome

TODO(imanol): which pieces shipped or were shown where, and anything you can say about
audience numbers or clients.

## Stack & notes

Microcontrollers · embedded systems · C++.

Related repositories: `NUIT-BLANCHE`, `MarleneGlows`, `NormaLedDresses`,
`LightPainting`, `SymaLine`.
