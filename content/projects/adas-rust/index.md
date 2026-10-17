+++
title = "ADAS learning projects in Rust"
template = "projects/page.html"
description = "Seven driver-assistance exercises, from lane detection to an integrated dashcam demo, implemented in Rust."
date = 2023-01-01
weight = 160
[taxonomies]
tags = ["rust", "automotive", "computer-vision"]
[extra]
period = "Started 2023"
org = "Open source"
role = "Personal learning project"
featured = false
confidential = false
cover = "cover.jpg"
cover_alt = "Dashcam frame with lane shading, object detections, a speed-limit sign and a rendered instrument cluster"
stack = ["Rust", "ONNX", "tract", "image", "imageproc", "ffmpeg"]
links = [{ label = "GitHub", url = "https://github.com/ImanolGo/ADAS-Projects-In-Rust" }]
+++

## Working through the systems

I used a set of ADAS course exercises to explore driver-assistance features in Rust.
The workspace builds up from lane detection to sign and speed-limit recognition,
object detection, traffic-light detection and an instrument cluster. A final activity
runs them together on a dashcam clip.

Inference uses ONNX models through tract, image processing uses Rust libraries,
and ffmpeg handles video input and output. The implementation runs without Python
or OpenCV.

{{ <video src="projects/adas-rust/drive.mp4" poster="projects/adas-rust/drive.jpg" alt="Integrated Rust ADAS demo showing road lanes, object boxes, sign recognition and an instrument cluster on dashcam footage" caption="The integrated learning demo. Sample road footage: Udacity, MIT licence." /> }}

## Handling uncertain detections

The sign classifier can be confidently wrong. The speed-limit tracker therefore
waits for agreement across frames and a clear lead over competing readings before
changing the displayed limit. Object and traffic-light detections have their own
false positives, documented in the repository.

This is a learning project using recorded footage, separate from my production
ADAS work. It does not demonstrate a validated driving system. For my experiments
with vision-language planning, see [EMMA-VLM](@/projects/emma-vlm/index.md).
