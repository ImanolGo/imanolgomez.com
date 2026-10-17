+++
title = "Alibi: LLM agents that lie"
template = "projects/page.html"
description = "A murder-mystery game where every suspect is an LLM agent — with RAG memory, tool use and eval gates in CI."
date = 2026-01-01
weight = 20
[taxonomies]
tags = ["llm-agents", "evaluation"]
[extra]
period = "2026"
org = "Open source"
location = ""
role = "Personal project"
featured = true
confidential = false
cover = ""
cover_alt = ""
stack = ["Python", "LangGraph", "pgvector", "MCP", "FastAPI", "LiteLLM", "OpenTelemetry"]
links = [{ label = "GitHub", url = "https://github.com/ImanolGo/alibi" }]
+++

TODO(imanol): add a screenshot of the game or of the evaluation dashboard.

## Context

In `alibi`, every suspect is an LLM agent. I use the murder-mystery game to work on
agent memory, tool use and evaluation.

The suspects are LangGraph state machines running a
retrieve → think → act → remember loop, with long-term memory in
PostgreSQL/pgvector. The player interrogates them; each character has its own secret,
its own incentive to lie, and code-enforced limits on what it is allowed to reveal.

## The problem

The characters need to stay consistent across turns and keep their secrets when a
player tries to extract them. Prompt instructions alone are not enough to control
what they reveal.

I needed evaluations that could catch contradictions and information leaks, and
measure accuracy, safety, latency and cost on every commit. That also gave me a way
to check whether a prompt change actually improved the game.

## What I did

- Modelled each suspect as a LangGraph state machine, with RAG memory in
  PostgreSQL/pgvector. Code enforces access to sensitive information independently
  of the model's instructions.
- Exposed the application as an MCP server, so any MCP client can call its tools,
  with structured outputs (Pydantic) and validation and repair loops.
- Built a FastAPI + HTMX web interface, deployed with Docker Compose.
- Built an evaluation framework around it: an automated tool-using agent that plays
  the game, plus an LLM judge, running a 20-round evaluation with CI quality gates
  on accuracy, safety, cost and agreement with a human labeller.
- Fine-tuned a DistilBERT classifier and exported it to ONNX as a cheap local judge.
- Instrumented every agent step and LLM call with OpenTelemetry in Arize Phoenix,
  with token, cost and latency accounting and a daily spend cap.

## Outcome

- **2.9%** contradiction rate across the evaluation runs.
- **$0.03** per run, with a spend cap.
- **90%** agreement between the automated judge and a human labeller.
- The fine-tuned DistilBERT beat the LLM-judge baseline on F1 (**0.33 vs 0.18**) at
  **40 ms** per prediction instead of **7.7 s**.

## Stack & notes

Python · LangGraph · pgvector · MCP · FastAPI · HTMX · LiteLLM · OpenTelemetry ·
Arize Phoenix · Docker Compose · ONNX.
