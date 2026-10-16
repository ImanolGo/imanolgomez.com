+++
title = "AI deployment for automated driving"
template = "projects/page.html"
description = "Optimizing, integrating and deploying AI models on automotive embedded hardware."
date = 2023-04-01
weight = 10
[taxonomies]
tags = ["edge-ai", "automotive"]
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
been working there full-time as part of the **Automated Driving Alliance** between
CARIAD and Bosch, building an ADAS software platform for Volkswagen Group vehicles on
Qualcomm SoCs. All of that is public information.

My own line of work has run in one direction throughout: getting models onto the
accelerator and keeping them fast enough, small enough and predictable enough for a
vehicle. Within CARIAD I moved through AI RTE (the abstraction layer for integrating
models into different runtime environments, plus an SDK for conversion, quantization,
optimization and pruning), then AI Sensor Fusion, AI Occupancy (3D occupancy networks
for spatial perception) and AI Prediction (models forecasting traffic-agent behaviour).

## The problem

Deployment, not research, is the bottleneck. A model that performs well on a workstation
still has to fit a fixed memory and power budget, hit a latency target every frame, and
survive automotive process requirements — and it has to be reproducible across several
platforms rather than tuned by hand once.

TODO(imanol): the specific constraint you are allowed to describe — target latency,
memory budget or platform count. Not in docs/PROFILE.md, so not guessed here.

## What I did

As **Head of AI Deployment** (October 2025 – present) I lead the AI Deployment team:

- Optimizing, integrating and deploying AI models on embedded hardware.
- Driving tooling and automation for scalable, multi-platform deployment.
- Ensuring on-target performance (latency, power, memory) and compliance with
  automotive standards.

Earlier, as Senior ML Software Engineer, I integrated and optimized prediction,
occupancy and sensor-fusion models for Qualcomm AI accelerators.

## Outcome

TODO(imanol): team size, scope (number of models or platforms) and any outcome you are
allowed to share.

## Stack & notes

Python · Qualcomm NPU · ISO 26262 · embedded systems · automotive standards.
