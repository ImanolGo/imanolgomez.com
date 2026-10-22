+++
title = "Visual Whispers: picture telephone"
template = "projects/page.html"
description = "An image model paints, a character describes what it sees, and that description becomes the next painting."
date = 2024-01-01
weight = 55
[taxonomies]
tags = ["generative-ai", "creative-code"]
[extra]
period = "Started 2024"
org = "Open source"
role = "Personal project"
featured = false
confidential = false
cover = "cover.jpg"
cover_alt = "Visual Whispers results: the prompt words foxes, sharing and Tokyo struck out, beside the first painting of two foxes under an umbrella and the final one of two dogs"
stack = ["Python", "TypeScript", "OpenRouter", "FLUX", "Replicate", "Server-Sent Events"]
links = [{ label = "GitHub", url = "https://github.com/ImanolGo/Visual-Whispers" }]
+++

## The idea

Visual Whispers was one of my first experiments combining LLMs and diffusion models
in an app. I used the game of telephone: each participant passes on their own
interpretation, and the story changes along the way.

Here, an image model paints your prompt. A vision model looks at the painting through
a character's eyes and describes it. The next painter receives only that description.
After a few rounds, you can see which details survived and what the models invented.

## Making it playable

You can keep one character throughout or let several take turns. A house cat notices
different things from a noir detective. An imagination control changes the
instructions and model temperature, and an optional setting lets the character's
interests influence the next painting prompt.

Each round streams onto the page: first the image, then the description. New words
are highlighted, and a small indicator tracks how many words from the original
prompt remain. It is a word-overlap measure, not a test of whether the meaning survived.

{{ <video src="projects/visual-whispers/round.mp4" poster="projects/visual-whispers/round.jpg" alt="A round of Visual Whispers revealing a painting followed by a streamed character description with highlighted words" caption="A recorded round from the app." /> }}

## Connecting the models

The current app uses OpenRouter for vision-language descriptions and image
generation, with an optional Replicate path for FLUX. The Python backend streams
progress to the TypeScript interface through Server-Sent Events and stores the
images so that exports do not depend on temporary provider URLs.

A chain can be saved as a GIF, a self-contained web page or a share link. The app also
has an offline demo with stand-in models for trying the interaction without an API key.

{{ <figure src="projects/visual-whispers/chain.jpg" alt="A completed five-round Visual Whispers chain with generated images and descriptions arranged down the page" caption="A chain that began with two foxes sharing an umbrella in Tokyo rain. The animals changed; the umbrella and rain remained." /> }}
