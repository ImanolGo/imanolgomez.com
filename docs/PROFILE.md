# PROFILE.md — source of truth about Imanol

Agents: use only the facts in this file (and existing `content/`) when writing copy. Anything not
here is a `TODO(imanol)`. Do not add numbers, client names or internal details that aren't listed.
Private data (phone number, home address) is deliberately excluded and must never be published.

Sources: the four resume PDFs in `~/Downloads/resumes` (latest: 2026-10-16) and this file's
earlier revisions. When a resume contradicts this file, the newest resume wins; update this file.

## Identity

- **Name:** Imanol Gómez (he/him)
- **Location:** Berlin, Germany
- **Current title:** Head of AI Deployment @ CARIAD (Volkswagen Group software company)
- **Public email:** `imanol@steinergomez.com`
- **Links:** LinkedIn https://www.linkedin.com/in/imanolgo/ · GitHub https://github.com/ImanolGo
- **Interests (optional for About):** environment and animal welfare (vegan), sports and nutrition; causes: arts & culture, environment, health, science & technology, human rights, humanitarian relief.

## Positioning — site default

Lead with hands-on engineering and technical leadership. AI is a clear area of expertise;
embedded systems and creative technology demonstrate range rather than competing identities.
Keep the first screen accessible to a non-specialist, with technical detail in the projects and CV.

**Professional headline:**
> Technical lead & AI engineer

**Home page tagline:**
> I turn ambitious ideas into reliable software.

**Site description (metadata):**
> Technical lead & AI engineer with 15+ years building production software, from AI systems
> and medical devices to interactive installations.

**Short bio:**
> Imanol Gómez is a technical lead and AI engineer based in Berlin, with 15+ years building
> production software across automotive AI, medical devices and interactive installations.
> As Head of AI Deployment at CARIAD, part of the Volkswagen Group, he leads 12 engineers
> bringing AI models to automotive hardware. His background spans hands-on development,
> team leadership, customer collaboration and teaching. Outside work, he builds LLM agents,
> on-device robot assistants and real-time graphics.

Use **Head of AI Deployment** as the factual current role, not the umbrella identity.
Use **creative technologist** for the freelance work and creative background, not as the
only professional label. Do not imply that personal LLM projects are employer deployments,
or that all 15+ years were spent in AI or management.

**Core paragraph (from the latest resume, safe to reuse):**
Applied AI engineer and technical lead with 15+ years of building production software end to
end, in Python and C++. Designs and builds LLM-powered agentic workflows with RAG, vector
databases, tool calling, structured outputs and evaluation frameworks that measure accuracy,
safety, latency and cost. As Head of AI Deployment at CARIAD (Volkswagen Group), takes AI from
prototype to production under strict reliability and compliance requirements, working directly
with enterprise stakeholders (Volkswagen, Audi) and technology partners (Qualcomm, Samsung,
NVIDIA). Background in regulated industries: healthcare (IEC 60601) and automotive
(ISO 26262, ASPICE).

**Creative-technology paragraph (2026-09-28 resume, for the other half):**
Engineer, creative technologist and speaker with 15+ years building real-time software, from
GPU-driven media art, light and projection installations to production AI on automotive
hardware. Earlier, as a freelance creative technologist: taught at universities, ran workshops
and hackathons, and gave talks. In his own time builds local LLM and agentic systems on NVIDIA
Jetson with TensorRT and llama.cpp.

## Skills

- **LLM & agents:** LLM-powered agents, agentic workflows, multi-step agents with tool use, RAG, embeddings, vector databases (pgvector), LangGraph, MCP (Model Context Protocol), structured outputs (Pydantic), prompt engineering, LiteLLM, OpenRouter, frontier models.
- **Evaluation & observability:** evaluation frameworks, LLM-as-judge, automated eval gates in CI, accuracy/safety/latency/cost metrics, OpenTelemetry, Arize Phoenix, tracing, cost and token accounting.
- **Machine learning:** PyTorch, TensorFlow, fine-tuning (DistilBERT), ONNX, TensorRT, model optimization and deployment.
- **Software engineering:** Python (production), C++, Rust, FastAPI, PostgreSQL, REST APIs, Docker, Docker Compose, GitHub Actions, CI/CD, testing, HTMX/Jinja, Linux (Ubuntu on Azure VMs), snap packaging.
- **Edge & embedded:** Qualcomm NPU / AI accelerators, NVIDIA Jetson Orin, ROS 2, embedded Linux, QNX, RTOS, firmware, MCUs, GLSL/OpenCL/CUDA.
- **Regulated environments:** security, compliance and auditability; healthcare (IEC 60601); automotive safety (ISO 26262, ASPICE).
- **Creative technology:** OpenGL, openFrameworks (contributor), OpenCV/computer vision, DMX lighting hardware, LED systems, interactive installations, generative graphics.
- **Delivery & leadership:** team leadership (12 engineers), product ownership (SAFe PO/PM), enterprise stakeholder management, translating business needs into technical specifications, mentoring, talks, workshops, hackathons, university teaching.

## Experience (grouped by org, newest first)

### CARIAD — Berlin · Oct 2025 – present (Head of AI Deployment); Apr 2023 – Oct 2025 (Senior ML Software Engineer)

CARIAD is the Volkswagen Group software company. Work is part of the **CARIAD–Bosch Automated
Driving Alliance**, a volume-production ADAS platform.

- **Head of AI Deployment — Oct 2025 – present.** Leads a team of **12 engineers** that takes AI
  models from research prototypes to production on the volume-production ADAS platform.
  Owns production reliability, performance and auditability under **ISO 26262 and ASPICE**:
  latency, memory and power targets, release quality and traceability. Works directly with
  enterprise stakeholders at Volkswagen Group brands (**Volkswagen, Audi**) and leads technical
  discussions with semiconductor partners **Qualcomm, Samsung and NVIDIA**. Drives shared
  tooling and automation so model teams deliver consistently across multiple platforms.
- **Senior ML Software Engineer — Apr 2023 – Oct 2025.** Technical Product Owner for the AI
  Runtime Environment: built a Python SDK for model conversion, quantization and optimization,
  plus a runtime abstraction layer used by engineering teams across the organization. Supported
  internal customer teams end to end, from scoping to production integration. Developed AI
  perception models (sensor fusion, 3D occupancy, behaviour prediction) and deployed them on
  Qualcomm AI accelerators under real-time constraints. Mentored engineers on model optimization
  and deployment. Daily work on Ubuntu VMs on Azure.
- Case study on the site: `ai-deployment-cariad` (confidential).

### NELA by Carepath Technologies — Berlin · Aug 2020 – Apr 2023 (AI Software Engineer → Senior IoT Engineer)

- Built **NELA Cough**, an AI-based tele-monitoring product for chronic-disease patients in a
  regulated healthcare environment (**IEC 60601**): AI model design and real-time deployment on
  edge devices and MCUs.
- Led the IoT system architecture end to end, from requirements to production, including the
  cloud IoT back end (**Azure IoT**) and device firmware; worked with external medical hardware
  suppliers through to series production.
- Supported customers and partners on integration and deployment issues; built demos and
  technical documentation.

### Self-employed — Berlin & international · Jun 2014 – Aug 2020 (Creative Technologist)

- Scoped and delivered client projects end to end, from ambiguous briefs to production:
  interactive installations, light and video projection, live performance software, fashion tech.
  Clients included **ProtoPixel, ElektroCouture and Moritz Waldemeyer**.
- **ProtoPixel (2017 – 2020):** firmware and software for real-time LED lighting products;
  delivered the main product software as a snap package for Ubuntu machines; technical evangelist.
- **ElektroCouture (2016 – 2018):** led design and development of wearable products; main
  developer of wearable driver firmware; fashion-tech mentor. Pieces: FireFly, Nuit Blanche, Marlene.
- Technical evangelist at ProtoPixel; gave talks and ran workshops and hackathons in **Porto,
  Barcelona, Berlin, Bangkok and Accra** (Porto Tech Hub, Factory Berlin, Goethe-Institut Bangkok,
  iSpace Accra, Universitat Pompeu Fabra, HfG Offenbach).
- Engineered and ran live the show software for the multimedia dance performance **Murmur**
  (Aakash Odedra Company) on its world tour.
- Case study on the site: `realtime-lighting-protopixel`.

### Ars Electronica Linz GmbH — Linz · Oct 2011 – Jul 2014 (Creative Engineer)

- Built interactive computer-vision installations (C++, Python, OpenGL, OpenCV).
- Lead developer of **GeoPulse**, a spatial-data visualization platform (Ars Electronica Center).
- Other: Techkriti 2012 "Brain Battle", MED-EL Audioversum exhibits.

## Projects (recent personal work)

- **alibi** (Python, 2026) — murder-mystery game where each suspect is an LLM agent; LangGraph
  state machines (retrieve → think → act → remember), RAG memory in PostgreSQL/pgvector with
  code-enforced access control, exposed as an MCP server; FastAPI + HTMX; Docker Compose.
  Evaluation: automated tool-using agent with LLM judge; **20-run evals with CI quality gates**
  (contradiction rate **2.9%**, cost **$0.03 per run**, **90%** agreement with a labeller);
  fine-tuned **DistilBERT → ONNX** beating the LLM-judge baseline on F1 (**0.33 vs 0.18**) at
  **40 ms vs 7.7 s** per prediction; OpenTelemetry tracing in Arize Phoenix with daily spend cap.
- **local-ai-robot-assistant** (Python, 2025–26) — fully on-device, privacy-first robot assistant
  on NVIDIA Jetson Orin Nano (ROS 2): wake word, Whisper speech-to-text, YOLO object detection,
  depth estimation, Moondream vision-language model. TensorRT FP16 engines, DeepStream camera
  pipeline; VLM served via llama.cpp/Ollama at **~37 ms vision latency, ~30 tokens/s**.
- **rover-assistant** (Python, 2026) — voice and vision assistant for a Jetson Orin Nano rover,
  fully on-device, no cloud.
- **murmuration-gpu** (Rust, 2026) — GPU starling-flock simulation with wgpu, up to millions of
  birds in real time. Phase 9 hero candidate.

## Education

- **Universitat Pompeu Fabra, Barcelona** — Master's Degree, Sound and Music Computing
  (2009–2011). Focus: computational modeling, perception, cognition, interactive systems.
- **Universidad Autónoma de Madrid** — Master's Degree, Telecommunication Engineering
  (2003–2009). Specialization: Multimedia Signal Processing, Electronic Systems. Erasmus year at
  **TU Berlin** (2007–2008). Research student at **Fraunhofer HHI**, Image Processing Department
  (2008–2009): forward error correction for video compression.

## Publications

- *Three dimensional sonification of fMRI brain data in the musical composition Neurospaces* — Proceedings of the 9th Conference on Interdisciplinary Musicology (CIM14), Berlin, Dec 2014. (With co-authors.)
- *Exploring 3D audio for brain sonification* — International Conference on Auditory Display (ICAD), Jun 2012. (With co-authors.)
- Third publication — `TODO(imanol)`.

## Certifications

- AZ-220 Microsoft Azure IoT Developer (Nov 2022)
- Certified SAFe 6 Product Owner/Product Manager (Oct 2023)

## Languages

- Spanish — native
- English — professional proficiency
- German — professional proficiency

## GitHub repositories (github.com/ImanolGo)

Descriptions below are taken from the repos' own descriptions. Many older repos have no README;
before linking a repo from the site, check it has one (`TODO(imanol)` if not). Repos that name a
client or brand (Jimmy Choo, Bentley, Amazon, Telekom, Instagram/ThePowerHouse) may only be named
on the site if Imanol confirms it's OK — `TODO(imanol)`.

### Recent personal work (2023–2026) — edge AI, GPU, Rust
- **local-ai-robot-assistant** (Python, 2025–26) — private, autonomous AI robot assistant running fully on an NVIDIA Jetson Orin Nano.
- **rover-assistant** (Python, 2026) — voice and vision assistant for a Jetson Orin Nano rover, fully on-device, no cloud.
- **emma-claude** (Python, 2024, ★13) — implementation of EMMA (End-to-End Multimodal Model for Autonomous Driving) using the Claude API, based on the EMMA paper.
- **ADAS-Projects-In-Rust** (Rust, 2023) — ADAS feature implementations in Rust, for performance and safety.
- **pico-deployment-demo** (CMake, 2023) — no description; `TODO(imanol)`: what it is (deployment on Raspberry Pi Pico?).
- **alibi** (Python, 2026) — murder-mystery game where each suspect is an LLM agent; LangGraph, MCP tools, RAG memory, CI evals, and a fine-tuned lie detector.
- **murmuration-gpu** (Rust, 2026) — GPU starling-flock simulation rendering up to millions of birds in real time with wgpu.
- **murmuration** (Rust, 2026) — terminal starling-flock simulation modelled on murmuration research.
- **cuda-particles** (CUDA, 2026) — step-by-step CUDA course for creative coders, ending in an interactive GPU particle system.
- **overflight** (Rust, 2026) — terminal app showing planes overhead as a live sky from real-time data.
- **procquarium** (Rust, 2026) — terminal aquarium showing running processes as fish.
- **Visual-Whispers** (TypeScript, 2024) — AI art "telephone": images described and re-imagined through different personas.

### Lighting, LEDs & installations (2015–2019)
- **LedMapper** (C++, ★3) — custom software for Moritz Waldemeyer mapping LEDs on 3D objects and exporting them.
- **IngoLedMapper**, **IngoLightAndBuilding** (C++, 2018) — LED mapping from 3D models to ProtoPixel, and software for Ingo Maurer's Light + Building 2018 installation. `TODO(imanol)`: confirm spelling/name usage.
- **LaRinascente** (C++, 2017) — Christmas light experience on the facade of La Rinascente, Rome (= Stella Rinascente).
- **TheJourneyOfColor** (C++, 2018) — installation where a camera reads an object's colour palette and shows it on a light sculpture (= Journey of Colour).
- **WinchesLightPainting** (C++, 2018) — long-exposure light painting with DMX-controlled winches, with Moritz Waldemeyer.
- **ofxDmx4All** (C++, ★3) — DMX4All wrapper for openFrameworks. Author of this addon.
- **VideoPixels** (C++) — records pixel-mapped video to SD for playback on a Teensy SD player. **UdpPixels** — streams video pixel data over UDP.
- **ParticleLamp** (C++) — lamp with Teensy, accelerometers and an LED matrix.
- **CoralSoul** (C++) — 3D-mapped generative visuals projected onto volcanic rock.
- **Equalizer** (JS) — light installation representing tax inequality.
- **Jimmy-Choo-Shop-Window** (C++) — interaction, visuals and motor control for shop windows (client name: confirm).
- **TheOther** (C++, 2015) — indoor particle-projection installation on emerging cosmology theories, Havana Biennial 2015.
- **Hearing-View** (C++) — sound-art installation.
- Also: ProtoPixelSyphon, SubtitlesSyphon, VideoLedMapper, HaloLight, LedVase, BacterialDisplay, WindowTree, CalmTechnology.

### Wearables & fashion tech (2015–2019)
- **NUIT-BLANCHE** (C++, 2017) — lighting and interaction with ElektroCouture and designer Anja Dragan, Fashion Tech Berlin 2017.
- **MarleneGlows** (C++, 2017) — visualization/export for Forster Rohner LED textile technology (= Marlene).
- **NormaLedDresses** (2019) — LED dress visuals for the opera *Norma* at the Greek National Opera.
- **LightPainting** (C++, 2018–19) — long-exposure light-painting fashion photography with Anja Dragan.
- **SymaLine** (Max) — fashion-tech collection where sound frequencies drive each outfit's visuals.
- **CapacitiveSensingDress**, **LedNecklace** (with ElektroCouture), **LedCostume** (Burning Man), **CityOfSound** (wearable LEDs controlled by SMS), **CirqueDuSoleilDress**, **InstagramDress** / **ProtoPixelDress** (ThePowerHouse; confirm names).

### Stage & performance
- **MurmurRenderer**, **MurmurFloorTracking** (C++, 2016) — rendering and floor tracking for Aakash Odedra Company's *Murmur*. (Also a later **Murmur** repo, 2022.)
- **SpiritWorld** (C++, 2018) — contemporary dance performance.

### Research, music tech & hacks (2011–2014)
- **BrainSonification** (Python, ★7) — fMRI visualization and sonification tool used for a 3D-audio composition and performance.
- **fMRI-Sonification** (2011) — Master's thesis app exploring the brain through visualization and sonification.
- **Human-Brain-Mapping** (Python, 2014).
- **GaitSensing** (Arduino, 2013) + **GaitSensingVideoRenderer** — code supporting a PhD project; renders video from sensed footsteps.
- **MHD-barcelona-2011** (★9) — "Drop'Em Dub", Music Hack Day Barcelona 2011 (Sónar). **MHD-Barcelona-2014**.
- **Slime-Mold** (C, 2012), **MushroomAutomator** (Python, 2014), **QUINL** (Java), **OneColor** (Java app).

### Teaching & workshops
- **GenerativeArtWorkshop** (Processing), **PervasiveMediaWorkshop** (HfG Offenbach, Nov 2015), **WearableTechnology_FashionHD** (Fashion Hack Day 2016, FabLab Berlin), **FutureFashionWorkshopBangkok** (Goethe-Institut Bangkok, 2016), **SoundInteractionWorkshop** (Pure Data, 2017), **IoTWorkshop2019** (iSpace, Accra, Jan 2019).

### Open source
- Contributor to **openFrameworks** (C++); author of **ofxDmx4All**. **80+ public repositories** on GitHub, mostly C/C++ and Python on real hardware.

### Do not feature
Forks (adobe.github.com, Arduino), dotfiles, myscripts, MailChecker, c-unit-test, c-actions-test, advent-of-code-2024, open-sauced-goals, Sculpteo (empty), ImanolGo (profile README), and client repos without descriptions (AmazonOffice, Bentley, TelekomAnimations, AudioOnsetImagesApp, PNC, Jukebox, WearableEK) unless Imanol adds context.
