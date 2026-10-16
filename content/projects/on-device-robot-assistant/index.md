+++
title = "A fully on-device AI robot assistant"
template = "projects/page.html"
description = "Voice and vision on an NVIDIA Jetson Orin Nano — nothing leaves the robot."
date = 2025-06-01
weight = 30
[taxonomies]
tags = ["edge-ai", "computer-vision", "llm-agents"]
[extra]
period = "2025 – present"
org = "Personal project"
location = ""
role = "Personal project"
featured = true
confidential = false
cover = ""
cover_alt = ""
stack = ["Python", "ROS 2", "TensorRT", "DeepStream", "Whisper", "YOLO", "llama.cpp"]
links = []
+++

TODO(imanol): add a photo or a short video of the robot; the card and this page are
waiting for it.

## Context

A personal project, and the most current proof of what I do for a living: a robot
assistant that runs **entirely on device** on an NVIDIA Jetson Orin Nano. No cloud
calls, no API keys, no audio or video leaving the machine. Built as two related
pieces — `local-ai-robot-assistant` and, later, `rover-assistant` for a Jetson-based
rover.

## The problem

Every mainstream voice assistant is a thin client: the interesting work happens in
someone else's datacentre. That is a non-starter for private spaces, for anything
regulated, and for anywhere the network is unreliable — and the latency of a round
trip is felt on every turn.

The hard part is not calling a model. It is getting a wake word, speech recognition,
object detection, depth estimation and a vision-language model to coexist on a
single ~10 W module inside a thermal and memory budget, and keeping the whole loop
responsive.

## What I did

- Wake word detection and Whisper speech-to-text, running locally.
- YOLO object detection and depth estimation for spatial awareness.
- A Moondream vision-language model answering questions about what the camera sees.
- Converted the models to **TensorRT FP16** engines and built a **DeepStream** camera
  pipeline to keep the vision path off the CPU.
- Served the VLM through **llama.cpp / Ollama** rather than a framework, for control
  over memory and batching.

## Outcome

The vision path answers in **~37 ms**, and the language model generates at roughly
**30 tokens/s** — a conversational loop with no network in it at all.

TODO(imanol): what you would add next, and anything the robot got right or wrong in
practice.

## Stack & notes

Python · ROS 2 · TensorRT · DeepStream · Whisper · YOLO · llama.cpp.

Related repositories: `local-ai-robot-assistant` and `rover-assistant`.
