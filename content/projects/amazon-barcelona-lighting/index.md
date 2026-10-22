+++
title = "Live-data lighting for Amazon's Barcelona office"
template = "projects/page.html"
description = "The main software for an entrance hall that turns live city traffic and weather data into real-time generative visuals on LED panels and light lines."
date = 2020-01-01
weight = 60
[taxonomies]
tags = ["lighting", "real-time"]
[extra]
period = "Completed 2020"
org = "ProtoPixel"
location = "Barcelona"
role = "Main software, commissioned by ProtoPixel"
featured = true
confidential = false
highlight = "Live traffic and weather data driving real-time visuals across 170 m of LEDs"
cover = "cover.jpg"
cover_alt = "An office entrance hall at night, with tilted LED panels showing flowing blue particle waves, joined by white light lines across the dark ceiling"
cover_caption = "Photo: ProtoPixel."
stack = ["C++", "openFrameworks", "ProtoPixel"]
links = [
  { label = "ProtoPixel case study", url = "https://www.protopixel.io/builtwithprotopixel/showcases/protopixel-transforms-amazons-uk-headquarters" },
  { label = "GitHub", url = "https://github.com/ImanolGo/AmazonOffice" },
]
+++

## Context

In 2020 ProtoPixel commissioned me to build the main software for the entrance
hall of Amazon's new office building in Barcelona. The space was designed by
Emotion Technologies and lit with ProtoPixel hardware. I had worked with
ProtoPixel on [real-time lighting products](@/projects/realtime-lighting-protopixel/index.md)
since 2017.

## The problem

The hall should never look the same twice, and it should reflect the city
outside. That meant reading live data, turning it into scenes and visuals in
real time, and keeping the hall changing. The visuals had to span
two kinds of fixture: large LED panels and the LED strip lines that run between
them across the walls and ceiling. Both needed to behave as one installation,
on top of ProtoPixel's existing control system.

## What I did

- Wrote the main software that runs the hall: it reads live data and API feeds
  from the area, then picks scenes and generates the visuals in real time.
- Built the generative visuals themselves, so the hall keeps changing with the
  data instead of looping fixed content.
- Plugged my system into ProtoPixel's, so the panels and the strip lights play
  as one continuous piece within the hall's design.

{{ <figure src="projects/amazon-barcelona-lighting/panels.jpg" alt="Large tilted LED panels showing a jellyfish drifting through violet haze, with white light lines framing them on the walls" caption="Generative visuals on the panels, framed by the LED light lines. Photo: ProtoPixel." /> }}

## Outcome

According to ProtoPixel's case study, the lights visualise urban and aerial
traffic and weather data in real time, and visitors can also interact through
the ProtoPixel app and two fixtures in the floor. The setup uses 170 metres of
digital RGB LEDs, driven by five ProtoPixel controllers and the ProtoPixel
Mapping Tool.

{{ <figure src="projects/amazon-barcelona-lighting/entrance.jpg" alt="The glass entrance of the office building at night, with the illuminated panels and blue light lines visible from the street" caption="The hall seen from the street. Photo: ProtoPixel." /> }}

## Stack & notes

C++ · openFrameworks · ProtoPixel controllers and Mapping Tool.

Design: Emotion Technologies. Photos: ProtoPixel. One of the applications I
wrote for the project is public as [`AmazonOffice`](https://github.com/ImanolGo/AmazonOffice).
