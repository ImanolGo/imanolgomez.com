+++
title = "Edge AI for remote patient monitoring"
template = "projects/page.html"
description = "NELA Cough: AI tele-monitoring for chronic-disease patients, from requirements to series production."
date = 2020-08-01
weight = 40
[taxonomies]
tags = ["edge-ai", "medical", "embedded"]
[extra]
period = "Aug 2020 – Apr 2023"
org = "NELA by Carepath Technologies"
location = "Berlin"
role = "AI Software Engineer → Senior IoT Engineer"
featured = true
confidential = false
cover = ""
cover_alt = ""
stack = ["Python", "TensorFlow", "Azure IoT", "RTOS", "embedded systems", "IEC 60601"]
links = []
+++

TODO(imanol): add a photo of the device or a product shot — nothing public exists in
docs/PROFILE.md.

## Context

Almost three years at NELA (Carepath Technologies GmbH), building **NELA Cough**: a
system for tele-monitoring and self-management of patients with chronic diseases.
I joined as an AI Software Engineer and left as Senior IoT Engineer, which means I
saw it from the first model to production hardware in the hands of patients.

This is a **regulated medical device** environment: IEC 60601, traceability, and
clinical stakeholders who have to be able to defend every decision.

## The problem

The product has to detect and characterise a cough from a device in a patient's home.
That puts the interesting constraint on the wrong side of the network: the audio
cannot be shipped to a server continuously, the MCU has limited compute, and the
model has to behave predictably on a device that is never going to be debugged by
its owner.

Add a perpetual tension — clinical requirements arriving as prose, hardware suppliers
changing their timelines, and a device that eventually has to pass certification.

## What I did

- Led development of AI models for medical applications, and their **real-time
  deployment on edge devices and MCUs**.
- Owned the IoT system architecture end to end: requirements, hardware and software
  design, and firmware, from prototype to series production.
- Built out the cloud side on **Azure IoT**, and production firmware for the devices.
- Worked directly with customers, partners and external medical hardware suppliers on
  integration and deployment issues, and wrote the demos and technical documentation
  that let them get unstuck.

## Outcome

TODO(imanol): what you are allowed to share about accuracy, device numbers or clinical
outcomes.

## Stack & notes

Python · TensorFlow · Azure IoT · embedded systems · RTOS · IEC 60601.
