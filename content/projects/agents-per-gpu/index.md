+++
title = "How many AI agents fit on one GPU?"
template = "projects/page.html"
description = "A benchmark of vLLM, SGLang and TensorRT-LLM on agent-shaped traffic: concurrent agents served within a latency SLO, and the cost per agent task."
date = 2026-10-20
weight = 40
[taxonomies]
tags = ["llm-agents", "gpu", "evaluation"]
[extra]
period = "Oct 2026"
org = "Open source"
location = ""
role = "Personal project"
featured = true
confidential = false
highlight = "Prefix caching took one A40 from 2–3 to 6 concurrent agents, at a third to two fifths of the cost per task"
cover = "cover.jpg"
cover_alt = "Chart of concurrent Qwen3-4B agent sessions one NVIDIA A40 serves within the interactive SLO, with prefix caching off and on: vLLM 2 to 6, SGLang 3 to 6, TensorRT-LLM 2 to 6, with the cost per agent task falling to about a third"
stack = ["Python", "vLLM", "SGLang", "TensorRT-LLM", "AIPerf"]
links = [
  { label = "Report", url = "https://github.com/ImanolGo/agents-per-gpu/blob/main/reports/REPORT.md" },
  { label = "GitHub", url = "https://github.com/ImanolGo/agents-per-gpu" },
]
+++

## Context

I build LLM agents, such as [Alibi](@/projects/alibi/index.md), and wanted to know
what serving them costs. An agent works in a loop: call a tool, read the result,
decide the next step. Every step resends the same long instructions and tool
schemas plus everything so far. Most serving benchmarks measure chat traffic, so
they don't answer the question an operator asks: how many agents can one GPU run
before they feel slow? This is a personal project, separate from my employer's work.

## The problem

Peak tokens per second says little about agents. What matters is how many
concurrent sessions stay within a latency budget, and what a finished task costs at
that load. Answering that fairly means the same workload and client for every
engine, repeated runs, and a check that a faster quantized model still calls its
tools correctly.

## What I did

- Wrote a seeded workload generator for agent sessions (a shared 2,000-token tool
  prefix, a growing context, short tool-call outputs), with chat traffic as the control.
- Wrote an async streaming load client and cross-checked it against NVIDIA AIPerf.
- Ran vLLM, SGLang and TensorRT-LLM one at a time on a rented NVIDIA A40 (48 GB),
  raising concurrency until the p95 latency SLO broke, three to six runs per level.
- Measured tool-calling accuracy on a fixed 200-case subset for every model variant,
  and quantized my own INT4-AWQ checkpoint with TensorRT Model Optimizer when
  TensorRT-LLM could not load the published one.
- Added a planner that sizes a deployment (GPUs and cost) from the measured capacity.

## Outcome

Prefix caching decided capacity. With it, all three engines served 6 concurrent
Qwen3-4B agents within the interactive SLO (p95 time to first token at most 1 s,
inter-token latency at most 50 ms), against 2 to 3 without it, and the cost per agent
task fell to between a third and two fifths.

A quantized bigger model also beat a smaller full-precision one: Qwen3-8B in
INT4-AWQ served 4 to 6 agents within an 8 s step budget, against 2 to 4 for
Qwen3-4B in BF16, at about the same tool-calling accuracy (91 to 92 %).

{{ <figure src="projects/agents-per-gpu/model-size.png" alt="Grouped bar chart of agents per A40 at an 8 second step budget by model and engine: Qwen3-4B BF16 serves 3, 4 and 2 agents on vLLM, SGLang and TensorRT-LLM; Qwen3-8B BF16 serves none; Qwen3-8B INT8 serves 2 and 2 and failed to load on TensorRT-LLM; Qwen3-8B INT4-AWQ serves 4, 6 and 4. Tool-calling accuracy is 91 to 93 percent throughout." caption="Agents per GPU at an 8 s step budget, with tool-calling accuracy." /> }}

This is one GPU, a synthetic workload, SLOs I chose and default engine settings,
measured on 21 and 22 October 2026, so it is a snapshot rather than a ranking of
the engines. The [report](https://github.com/ImanolGo/agents-per-gpu/blob/main/reports/REPORT.md)
lists the caveats and what I could not explain.

## Stack & notes

Python · vLLM · SGLang · TensorRT-LLM · TensorRT Model Optimizer · NVIDIA AIPerf ·
Qwen3 models.

Every number and graphic regenerates from the raw results in the
[repository](https://github.com/ImanolGo/agents-per-gpu).
