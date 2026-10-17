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

`alibi` is a murder-mystery game with an unusual cast: **every suspect is an LLM
agent**. It is also the piece of my own work that best shows how I think about agentic
systems — the game is almost incidental to the engineering.

The suspects are LangGraph state machines running a
**retrieve → think → act → remember** loop, with long-term memory in
PostgreSQL/pgvector. The player interrogates them; each character has its own secret,
its own incentive to lie, and code-enforced limits on what it is allowed to reveal.

## The problem

Agent demos are easy; agent *products* are not. Three problems get in the way, and all
three are evaluation problems before they are prompting problems:

1. **Grounding.** A character that contradicts itself two turns apart breaks the
   illusion instantly, and a naive prompt makes that likely.
2. **Information control.** A suspect must not leak the solution, and this cannot be
   left to the prompt — the model will happily comply with a clever player.
3. **Knowing whether it works.** "It feels better" is not a measure. Accuracy, safety,
   latency and cost all need to be numbers, on every commit.

## What I did

- Modelled each suspect as a **LangGraph state machine**, with RAG memory in
  PostgreSQL/pgvector and **code-enforced access control** over sensitive
  information — the model is never the last line of defence.
- Exposed the application as an **MCP server**, so any MCP client can call its tools,
  with structured outputs (Pydantic) and validation and repair loops.
- Built a FastAPI + HTMX web interface, deployed with Docker Compose.
- Built an **evaluation framework** around it: an automated tool-using agent that plays
  the game, plus an LLM judge, running a 20-round evaluation with **CI quality gates**
  on accuracy, safety, cost and agreement with a human labeller.
- Fine-tuned a **DistilBERT** classifier and exported it to ONNX as a cheap local judge.
- Instrumented every agent step and LLM call with **OpenTelemetry** in Arize Phoenix,
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
