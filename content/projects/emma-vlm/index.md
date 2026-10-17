+++
title = "EMMA-VLM: driving plans from vision models"
template = "projects/page.html"
description = "An EMMA-style driving planner with interchangeable vision models and trajectory evaluation against recorded driving data."
date = 2024-11-01
weight = 100
aliases = ["/projects/emma-claude/"]
[taxonomies]
tags = ["edge-ai", "automotive", "llm-agents"]
[extra]
period = "Started 2024"
org = "Open source"
location = ""
role = "Personal project"
featured = false
confidential = false
cover = "cover.jpg"
cover_alt = "EMMA-VLM road-camera view beside a bird's-eye trajectory plot and the model's driving explanation"
stack = ["Python", "OpenRouter", "vision-language models", "nuImages", "nuScenes"]
links = [{ label = "GitHub", url = "https://github.com/ImanolGo/emma-vlm" }, { label = "EMMA paper", url = "https://arxiv.org/abs/2410.23262" }]
+++

## Context

I started this project with Claude to explore the EMMA paper, *End-to-End Multimodal
Model for Autonomous Driving*. I have since reworked it as EMMA-VLM, so I can compare
vision-language models through OpenRouter using the same inputs and evaluation.

The model receives a front-camera image, the vehicle's recent motion and a routing
command. It describes the scene, identifies critical objects and makes a driving
decision, then predicts a three-second trajectory.

## The problem

A plausible explanation of a road scene does not tell me whether the predicted path
is useful. I wanted to compare those predictions with recorded driving data and a
simple constant-velocity baseline. The baseline helps test whether the model adds
anything beyond continuing the vehicle's current motion.

## What I did

- Built a configurable prediction pipeline with structured model outputs and
  interchangeable vision models through OpenRouter.
- Added loaders for nuImages and nuScenes, expressing motion in the vehicle's
  coordinate frame at the camera key frame.
- Visualized predicted and recorded trajectories in the camera view and from above.
- Evaluated trajectory error at one, two and three seconds, average and final
  displacement error, and smoothness. The same run measures the baseline, with
  breakdowns by routing command, plus model latency and cost.

## Scope

This is a personal, open-loop research experiment, separate from my work at CARIAD.
It predicts paths from recorded samples; it does not control a vehicle. I am not
claiming validated driving capability or an improvement over the baseline.

For a different approach to the same domain, see my
[ADAS learning projects in Rust](@/projects/adas-rust/index.md).
