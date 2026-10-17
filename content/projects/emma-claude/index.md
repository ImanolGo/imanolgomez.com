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

This is an open-source implementation of EMMA (*End-to-End Multimodal Model for Autonomous
Driving*), built on the Claude API. The paper's premise is that a single multimodal
model can consume raw sensor data and produce driving outputs directly, without the
usual stack of separate perception, prediction and planning modules. The repository
reproduces that idea with a general-purpose frontier model instead of a bespoke one.

## The problem

My production ADAS work involves taking research models onto hardware accelerators.
This personal project let me study end-to-end driving without a car programme's
delivery schedule: what inputs the model needs, what instructions it needs, and
where the approach fails.

## What I did

- Implemented the EMMA pipeline against the Claude API, following the paper.
- Structured the multimodal prompt around driving inputs and outputs, and worked
  through its failure modes.

## Outcome

TODO(imanol): what you found — where this approach holds up and where it does not.

## Stack & notes

Python · Claude API.

Related repository: `emma-claude`, and `ADAS-Projects-In-Rust` for the systems side of
the same domain.
