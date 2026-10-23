+++
title = "Edge AI for remote patient monitoring"
template = "projects/page.html"
description = "NELA Cough: AI tele-monitoring for chronic-disease patients, from requirements to series production."
date = 2020-08-01
weight = 15
[taxonomies]
tags = ["edge-ai", "medical", "embedded"]
[extra]
period = "Aug 2020 – Apr 2023"
org = "NELA by Carepath Technologies"
location = "Berlin"
role = "AI Software Engineer"
featured = true
confidential = false
highlight = "250 devices produced and shipped to 50 patients for clinical trials"
cover = "cover.jpg"
cover_alt = "NELA Cough monitoring device, a small rounded white unit on a pale background"
stack = ["Python", "TensorFlow", "Azure IoT", "RTOS", "embedded systems", "IEC 60601"]
links = []
+++

## Context

I spent almost three years at NELA (Carepath Technologies GmbH) as an AI Software
Engineer, building NELA Cough, a system for tele-monitoring and self-management of
patients with chronic diseases. I worked on the product from the first model to
production hardware used by patients.

A small device in the patient's room records audio continuously. On the device,
speech is removed and only coughs are kept, together with ambient readings: light
level, room temperature, humidity and air quality. The coughs and ambient data then
go to the cloud, where the system rates each cough's quality (productive or not),
intensity and frequency, and uses the patient's cough fingerprint to check that it
was the patient coughing.

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

- Developed the on-device symptom-monitoring system: it removes speech and detects
  only coughs in a continuous audio recording, and processes the ambient data
  (light, temperature, humidity and air quality).
- Led development of AI models for medical applications, and their real-time
  deployment on edge devices and MCUs.
- Owned the IoT system architecture end to end: requirements, hardware and software
  design, and firmware, from prototype to series production.
- Built the cloud back end on Azure IoT, and production firmware for the devices.
- Worked directly with customers, partners and external medical hardware suppliers on
  integration and deployment issues, and wrote the demos and technical documentation
  to support that work.

## Outcome

By the time I left in April 2023, we had produced 250 devices and shipped them to
50 patients for clinical trials.

## Stack & notes

Python · TensorFlow · Azure IoT · embedded systems · RTOS · IEC 60601.

The cloud-side cough analysis (quality, intensity, frequency and the patient
fingerprint) was built by others in the team; my part was the device and the system around it.
