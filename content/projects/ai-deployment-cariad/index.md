+++
title = "AI deployment for automated driving"
template = "projects/page.html"
description = "Optimizing, integrating and deploying AI models on automotive embedded hardware."
date = 2023-04-01
weight = 10
[taxonomies]
tags = ["edge-ai", "automotive", "embedded"]
[extra]
period = "Apr 2023 – present"
org = "CARIAD"
location = "Berlin"
role = "Senior ML Software Engineer → Head of AI Deployment"
featured = true
highlight = "AI models from research prototypes to production on a volume-production ADAS platform."
confidential = true
cover = "cover.jpg"
cover_alt = "Overhead view of a car at a road junction with green sensor rings extending towards pedestrians"
cover_public = true
cover_caption = "Image: CARIAD, published with Luxoft's CARIAD announcement. Public illustration used for context."
stack = ["Python", "Qualcomm NPU", "ISO 26262", "embedded systems", "automotive standards"]
links = [{ label = "CARIAD–Bosch announcement", url = "https://cariad.technology/de/en/news/stories/bosch-cariad-partnership-automated-driving.html" }, { label = "Image source (Luxoft)", url = "https://www.luxoft.com/pr/vws-cariad-taps-luxoft-for-futureoriented-incar-software-solutions" }]
+++

## Context

CARIAD is the Volkswagen Group software company, in Berlin. Since April 2023 I have
worked there full-time as part of the **Automated Driving Alliance** between CARIAD and
Bosch, building an ADAS software platform for Volkswagen Group vehicles on Qualcomm SoCs.

## The problem

A model that performs well on a workstation still has to fit a fixed memory and
power budget on automotive hardware, and meet a latency target every frame.
Deployment also has to meet ISO 26262 functional safety and ASPICE process
requirements, with reproducible results across several platforms.

## What I did

As **Head of AI Deployment** (October 2025 – present) I lead a team of **12 engineers**
that takes AI models from research prototypes to production on the volume-production ADAS
platform:

- Optimize, integrate and deploy AI models on embedded automotive hardware.
- Own production reliability, performance and auditability: latency, memory and power
  targets, release quality and traceability, under ISO 26262 and ASPICE.
- Work directly with enterprise stakeholders at Volkswagen Group brands (Volkswagen, Audi)
  on requirements, priorities and delivery.
- Lead technical discussions with semiconductor partners Qualcomm, Samsung and NVIDIA on
  integration and performance.
- Drive shared tooling and automation so model teams deliver consistently across multiple
  platforms.

Earlier, as Senior ML Software Engineer, I was Technical Product Owner for the AI Runtime
Environment. I built a Python SDK for model conversion, quantization and optimization,
plus a runtime abstraction layer. I also integrated and deployed prediction, occupancy
and sensor-fusion models on Qualcomm AI accelerators.

## Stack & notes

Python · Qualcomm NPU · ISO 26262 · ASPICE · embedded systems · automotive standards.
