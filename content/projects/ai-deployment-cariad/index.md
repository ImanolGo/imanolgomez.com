+++
title = "AI deployment for automated driving"
template = "projects/page.html"
description = "Optimizing, integrating and deploying AI models on automotive embedded hardware."
date = 2023-04-01
weight = 20
[taxonomies]
tags = ["edge-ai", "automotive", "embedded"]
[extra]
period = "Apr 2023 – present"
org = "CARIAD"
location = "Berlin"
role = "Senior ML Software Engineer → Head of AI Deployment"
featured = true
confidential = true
stack = ["Python", "Qualcomm NPU", "ISO 26262", "embedded systems", "automotive standards"]
links = []
+++

This page is deliberately short. It states only what is public plus my own role and
scope, and it shows no internal material.

## Context

CARIAD is the Volkswagen Group software company, in Berlin. Since April 2023 I have
worked there full-time as part of the **Automated Driving Alliance** between CARIAD and
Bosch, building an ADAS software platform for Volkswagen Group vehicles on Qualcomm SoCs.
All of that is public information.

## The problem

Deployment, not research, is the bottleneck. A model that performs well on a workstation
still has to fit a fixed memory and power budget, hit a latency target every frame, and
survive automotive process requirements — ISO 26262 functional safety and ASPICE — and it
has to be reproducible across several platforms rather than tuned by hand once.

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
Environment — a Python SDK for model conversion, quantization and optimization, plus a
runtime abstraction layer — and integrated and deployed prediction, occupancy and
sensor-fusion models on Qualcomm AI accelerators.

## Outcome

TODO(imanol): any outcome you are allowed to share beyond the above (platforms shipped,
latency or model-count figures).

## Stack & notes

Python · Qualcomm NPU · ISO 26262 · ASPICE · embedded systems · automotive standards.
