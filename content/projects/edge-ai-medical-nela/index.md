+++
title = "Edge AI for remote patient monitoring"
template = "projects/page.html"
description = "NELA Cough: AI tele-monitoring for chronic-disease patients, from requirements to series production."
date = 2020-08-01
weight = 50
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

I spent almost three years at NELA (Carepath Technologies GmbH), building NELA Cough,
a system for tele-monitoring and self-management of patients with chronic diseases.
I joined as an AI Software Engineer and left as Senior IoT Engineer, working on the
product from the first model to production hardware used by patients.

The work involved IEC 60601 requirements, traceability and clinical stakeholders
in a regulated medical device environment.

## The problem

The product has to detect and characterise a cough from a device in a patient's home.
The audio cannot be sent continuously to a server, so the model has to run
predictably within the MCU's limited compute budget. Patients cannot be expected
to debug it.

Clinical requirements arrived as prose, and hardware suppliers' timelines could
change. The device also had to meet certification requirements.

## What I did

- Led development of AI models for medical applications, and their real-time
  deployment on edge devices and MCUs.
- Owned the IoT system architecture end to end: requirements, hardware and software
  design, and firmware, from prototype to series production.
- Built the cloud back end on Azure IoT, and production firmware for the devices.
- Worked directly with customers, partners and external medical hardware suppliers on
  integration and deployment issues, and wrote the demos and technical documentation
  to support that work.

## Outcome

TODO(imanol): what you are allowed to share about accuracy, device numbers or clinical
outcomes.

## Stack & notes

Python · TensorFlow · Azure IoT · embedded systems · RTOS · IEC 60601.
