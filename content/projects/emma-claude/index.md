+++
title = "EMMA end-to-end driving model with Claude"
template = "projects/page.html"
description = "An implementation of the EMMA paper — end-to-end multimodal driving — using the Claude API."
date = 2024-11-01
weight = 100
[taxonomies]
tags = ["edge-ai", "automotive", "llm-agents"]
[extra]
period = "2024"
org = "Open source"
location = ""
role = "Personal project"
featured = false
confidential = false
cover = ""
cover_alt = ""
stack = ["Python", "Claude API"]
links = [{ label = "GitHub", url = "https://github.com/ImanolGo/emma-claude" }]
+++

## Context

An open-source implementation of **EMMA** — *End-to-End Multimodal Model for Autonomous
Driving* — built on the Claude API. The paper's premise is that a single multimodal
model can consume raw sensor data and produce driving outputs directly, without the
usual stack of separate perception, prediction and planning modules. The repository
reproduces that idea with a general-purpose frontier model instead of a bespoke one.

## The problem

Working on production ADAS, I spend a lot of time between two worlds: the research
papers that assume a datacentre, and the accelerators that have to run the result. This
project was a way to sit on the research side deliberately — to work through what
"end-to-end" actually means for driving, what the model needs to be told, and where the
approach strains — without the schedule of a car programme attached.

## What I did

- Implemented the EMMA pipeline against the Claude API, following the paper.
- Structured the multimodal prompt around driving inputs and outputs, and worked
  through the failure modes the paper glosses over.

## Outcome

TODO(imanol): what you found — where this approach holds up and where it does not.

## Stack & notes

Python · Claude API.

Related repository: `emma-claude`, and `ADAS-Projects-In-Rust` for the systems side of
the same domain.
