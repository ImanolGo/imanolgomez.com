+++
title = "Drop'Em Dub: playing dubstep in the air"
template = "projects/page.html"
description = "A 24-hour hack at Music Hack Day, Sónar 2011, for two players: a Kinect tracks their hands, and their movements play the bass and the beat without touching anything."
date = 2011-06-17
weight = 170
[taxonomies]
tags = ["computer-vision", "creative-code"]
[extra]
period = "Jun 2011"
org = "Music Hack Day at Sónar"
location = "Barcelona"
role = "Creator"
featured = false
confidential = false
cover = "cover.jpg"
cover_alt = "The Kinect depth view of two people with their tracked hands marked as coloured dots, in a window on top of an Ableton Live session"
cover_caption = "A frame from the project video."
stack = ["Processing", "Kinect", "SimpleOpenNI", "OSC", "Max/MSP", "MIDI", "Ableton Live"]
links = [
  { label = "About the event", url = "https://hipermedula.org/2011/06/music-hack-day-en-el-festival-sonar-pro/" },
  { label = "Video (YouTube)", url = "https://www.youtube.com/watch?v=IC3nC8ZmeoA" },
  { label = "GitHub", url = "https://github.com/ImanolGo/MHD-barcelona-2011" },
]
+++

## Context

I made Drop'Em Dub at Music Hack Day at the Sónar festival in Barcelona, on 16 and 17
June 2011. Sónar PRO and the Music Technology Group at Universitat Pompeu Fabra ran the
event at the CCCB, and developers had 24 hours to build something. I was doing my
Master's in Sound and Music Computing at UPF at the time. It is one of my first
projects from Barcelona, and a small tribute to the Theremin, the first electronic
instrument played without physical contact.

## The problem

The idea was to play an instrument in the air, using only your bare hands and the
movements of your body. It had to work for two people at once, and still be fun to
play even though the controls behind it are quite technical.

## What I did

- Used a Kinect and skeleton tracking (SimpleOpenNI, in Processing) to follow each
  player's hands, with visual feedback on screen.
- Mapped one player to a wobble bass: one hand sets the pitch, the other sets the
  LFO and the filter cutoff.
- Mapped the other player to the rhythm: choosing which sample to trigger and how
  it is filtered.
- Sent the data as OSC to Max/MSP, which passed it as MIDI to Ableton Live for the
  sound.

## Outcome

A working two-person instrument, shown in the
[project video](https://www.youtube.com/watch?v=IC3nC8ZmeoA). The source is public on
[GitHub](https://github.com/ImanolGo/MHD-barcelona-2011).

## Stack & notes

Processing · Kinect · SimpleOpenNI · OSC · Max/MSP · MIDI · Ableton Live.

Thanks to Andres Bucci, Jorge Garcia, Panos Papiotis and the rest of the SMC crew.
