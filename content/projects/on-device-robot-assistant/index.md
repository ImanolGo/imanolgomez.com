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

This personal robot assistant runs entirely on an NVIDIA Jetson Orin Nano. It needs
no cloud calls or API keys, and audio and video stay on the machine. I built it as
two related projects: `local-ai-robot-assistant` and, later, `rover-assistant` for a
Jetson-based rover.

## The problem

Sending audio and video to a cloud service adds network latency and privacy
concerns, particularly in private spaces and regulated settings. It also makes the
assistant depend on a reliable connection.

Running locally means fitting wake word detection, speech recognition, object
detection, depth estimation and a vision-language model onto a single ~10 W module.
They have to share limited memory and stay within the thermal budget while keeping
the conversation responsive.

## What I did

- Wake word detection and Whisper speech-to-text, running locally.
- YOLO object detection and depth estimation for spatial awareness.
- A Moondream vision-language model answering questions about what the camera sees.
- Converted the models to TensorRT FP16 engines and built a DeepStream camera
  pipeline to keep the vision path off the CPU.
- Served the VLM through llama.cpp / Ollama, with control
  over memory and batching.

## Outcome

The vision path answers in **~37 ms**, and the language model generates at roughly
**30 tokens/s**. Both run locally, without network requests.

TODO(imanol): what you would add next, and anything the robot got right or wrong in
practice.

## Stack & notes

Python · ROS 2 · TensorRT · DeepStream · Whisper · YOLO · llama.cpp.

Related repositories: `local-ai-robot-assistant` and `rover-assistant`.
