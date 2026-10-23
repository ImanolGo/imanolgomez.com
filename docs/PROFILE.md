# PROFILE.md — source of truth about Imanol

Agents: use only the facts in this file (and existing `content/`) when writing copy. Anything not
here is a `TODO(imanol)`. Do not add numbers, client names or internal details that aren't listed.
Private data (phone number, home address) is deliberately excluded and must never be published.

Sources: the four resume PDFs in `~/Downloads/resumes` (latest: 2026-10-16) and this file's
earlier revisions. When a resume contradicts this file, the newest resume wins; update this file.

Project updates below also use Imanol's October 2026 notes, the READMEs in `~/repos/`,
and media supplied in `~/Downloads/References/`. These are approved sources for this update.
Imanol confirmed that the supplied media may be published. Keep known credits; request missing
photographer credits before launch. Bentley, Hyundai and unidentified Studio Waldemeyer projects
remain excluded until their names and Imanol's role are confirmed. Imanol confirmed that the
CARIAD reference images come from CARIAD's public website and requested their use. The
public image `Cariad/luxoft-and-cariad-16-9.webp` is his preferred contextual cover, with
attribution to CARIAD and a link to Luxoft's announcement;
the case study remains confidential and shows no internal material.

## Identity

- **Name:** Imanol Gómez (he/him)
- **Location:** Berlin, Germany
- **Current title:** Head of AI Deployment @ CARIAD (Volkswagen Group software company)
- **Public email:** `imanol@steinergomez.com`
- **Links:** LinkedIn https://www.linkedin.com/in/imanolgo/ · GitHub https://github.com/ImanolGo
- **Interests (optional for About):** environment and animal welfare (vegan), sports and nutrition; causes: arts & culture, environment, health, science & technology, human rights, humanitarian relief.

## Positioning — site default

Lead with hands-on engineering and technical leadership. AI is a clear area of expertise;
real-time and embedded systems are the specialty; creative technology is the origin story and
shows range, not a competing identity.
Keep the first screen accessible to a non-specialist, with technical detail in the projects and CV.

**Professional headline:**
> Technical lead & AI engineer

**Home page tagline:**
> I turn ambitious ideas into reliable software.

**Site description (metadata):**
> Technical lead & AI engineer with 15+ years building production software, from AI systems
> and medical devices to real-time and embedded systems.

**Short bio:**
> Imanol Gómez is a technical lead and AI engineer based in Berlin. He has spent 15+ years
> building production software for automotive AI, medical devices and interactive
> installations. He is Head of AI Deployment at CARIAD, part of the Volkswagen Group,
> where he leads 12 engineers bringing AI models to automotive hardware. He works directly
> with customers and engineering teams, and has taught and run workshops. Outside work,
> he builds LLM agents, on-device robot assistants and real-time graphics.

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
- **Software engineering:** Python (production), C++, Rust, FastAPI, PostgreSQL, REST APIs, Docker, Docker Compose, GitHub Actions, CI/CD, testing, HTMX/Jinja, Linux (Ubuntu on Azure VMs), deb packaging.
- **Edge & embedded:** Qualcomm NPU / AI accelerators, NVIDIA Jetson Orin, ROS 2, embedded Linux, QNX, RTOS, firmware, MCUs, GLSL/OpenCL/CUDA.
- **Real-time & embedded (added 2026-10-21, stated by Imanol):** CARIAD deployments target QNX only. NELA: device firmware on an RTOS and MCUs. Bare-metal MCU firmware for most of the career: Ars Electronica and freelance work (ElektroCouture, Moritz Waldemeyer, ProtoPixel). Interactive and video applications running at 30 FPS or more on the GPU under a general-purpose OS (Linux); these are not hard real-time systems. MCU families worked with (stated by Imanol): Nordic nRF53 series, ESP32 series, STM32, Raspberry Pi Pico, and others. Use "real-time & embedded AI" as the specialty label.
- **LLM inference & serving (added 2026-10-22, from the public agents-per-gpu repo):** vLLM, SGLang, TensorRT-LLM (trtllm-serve), NVIDIA AIPerf, SLO-based capacity benchmarking (TTFT, ITL, step latency), prefix/KV-cache reuse, quantization (AWQ INT4, GPTQ INT8, TensorRT Model Optimizer), tool-calling evaluation, GPU cost per task.
- **GPU & parallel computing (added 2026-10-21, from the public murmuration-kernels repo):** CUDA C++, cuTile Rust (tile-based kernels, Tile IR), cuda-oxide (Rust to PTX), wgpu/WGSL compute; GPU profiling with Nsight Compute and Nsight Systems, compute-sanitizer, ptxas/cuobjdump; occupancy, register and instruction-count analysis; GPU event timing; CPU-oracle parity testing across backends. Learned CUDA in 2026; cuTile is an alpha-stage toolchain.
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

### NELA by Carepath Technologies — Berlin · Aug 2020 – Apr 2023 (AI Software Engineer)

Title: Imanol asked (2026-10-23) to show only **AI Software Engineer**, keeping all the work below
(earlier copies said "AI Software Engineer → Senior IoT Engineer").

- Built **NELA Cough**, an AI-based tele-monitoring product for chronic-disease patients in a
  regulated healthcare environment (**IEC 60601**): AI model design and real-time deployment on
  edge devices and MCUs.
- Developed the **on-device symptom-monitoring system** (stated by Imanol, 2026-10-23): it removes
  speech and detects only coughs in a continuous audio recording, and processes ambient data
  (light level, room temperature, humidity, air quality).
- System context, **not developed by Imanol**: the coughs and ambient data were sent to the cloud
  for further processing: cough quality (productive or not), intensity and frequency, and a
  patient fingerprint to check that it was the patient coughing.
- Led the IoT system architecture end to end, from requirements to production, including the
  cloud IoT back end (**Azure IoT**) and device firmware; worked with external medical hardware
  suppliers through to series production.
- Supported customers and partners on integration and deployment issues; built demos and
  technical documentation.
- Outcome (stated by Imanol, 2026-10-22): by the time he left (Apr 2023), 250 devices had been
  produced and shipped to 50 patients for clinical trials.

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
- **Amazon office, Barcelona (completed 2020, commissioned by ProtoPixel; stated by Imanol 2026-10-22; start date not given):**
  Imanol built the main software for the entrance hall: it processes live data and API data from
  the area to run scenes and real-time generative visuals, keeping the hall always changing, and
  plugs into ProtoPixel's system so LED panels and LED strip lights play as one installation.
  Naming Amazon is OK (Imanol, 2026-10-22). ProtoPixel's public case study (fetched 2026-10-22,
  protopixel.io/builtwithprotopixel/showcases/protopixel-transforms-amazons-uk-headquarters; the
  slug says UK, the page says Barcelona, Spain, 2020): lights visualise urban and aerial traffic and
  weather data in real time; visitors interact via the ProtoPixel App and two floor fixtures;
  170 m of digital RGB LEDs, 5 ProtoPixel Controllers, ProtoPixel Mapping Tool. Design: Emotion
  Technologies. Photos: ProtoPixel (used with credit; Imanol is on good terms with ProtoPixel).
  Related repo: AmazonOffice (openFrameworks, Windows 10), one of the applications Imanol wrote for it.
  Case study on the site: `amazon-barcelona-lighting`.
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
- **murmuration-gpu** (Rust, 2026) — research-inspired starling-flock simulation with wgpu.
  The current interactive default is 8,000 birds. The README reports a 15-second windowed
  startup measurement of 59.11 FPS on a GTX 1650 Max-Q at 1268×1380, with seed 1.
  Million-bird counts are for profiling and offline rendering, not real-time playback on that GPU.
- **murmuration-kernels** (Rust/CUDA, Oct 2026) — the same reduced starling-flock step written four
  ways: CUDA C++, cuda-oxide, wgpu/WGSL and cuTile Rust, each checked against a CPU oracle through
  a shared binary exchange format. Public repo
  github.com/ImanolGo/murmuration-kernels; write-up in docs/ARTICLE.md, "The same starling flock on
  the GPU, four ways". Measured on a GTX 1650 Max-Q (own laptop) and a rented RTX 4000 Ada.
  Neighbour-search (`decide`) time per step at 100,000 birds on the RTX 4000 Ada: CUDA 1.24 ms,
  wgpu 1.54, cuda-oxide 1.64, cuTile tuned 2.59, cuTile defaults 5.57. Nsight Compute showed cuTile
  defaults at 246 registers per thread (48 when tuned) against 62 for CUDA, and about 4.8x CUDA's
  instructions even when tuned (the cause is a hypothesis, not established). cuTile's regular passes
  (integrate, scan) ran faster than CUDA at 1M birds. Caveats to keep: one workload, two GPUs, an
  alpha cuTile revision, tuning applied to cuTile; not a general ranking of the frameworks.
  Upstream (NVIDIA/cuda-rust, as ImanolGo, 2026-10-21): reported four issues (#1594 to #1597), added
  repros to two existing ones (#1470, #1378) and opened docs PR #1599 (open, not merged at writing).
  Personal project, not employer work.
- **agents-per-gpu** (Python, Oct 2026) — benchmark of LLM serving engines on agent-shaped traffic:
  how many concurrent AI agents one GPU serves within a latency SLO, and the cost per agent task.
  vLLM 0.32.0, SGLang 0.5.9 and TensorRT-LLM 1.2.1 on one rented whole NVIDIA A40 (48 GB), measured
  2026-10-21/22. Own async streaming load client (`apg`), cross-checked against NVIDIA AIPerf; seeded
  agent workload (shared 2,000-token tool prefix, growing context) with a chat control; capacity =
  highest concurrency before the first SLO failure, worst of 3 to 6 runs. Results (Qwen3-4B BF16, agent,
  `interactive` SLO p95 TTFT <= 1 s, ITL <= 50 ms): prefix caching takes capacity from 2/3/2 to 6/6/6
  (vLLM/SGLang/TensorRT-LLM) and cuts cost per task to a third to two fifths (0.0018/0.0013/0.0018 to
  0.0006/0.0005/0.0006 USD at a 0.535 USD/h rental offer). At an 8 s step SLO: SGLang 4, vLLM 3,
  TensorRT-LLM 2. Qwen3-8B INT4-AWQ serves 4/6/4 agents at the 8 s step SLO vs 3/4/2 for 4B BF16, at
  91.0 to 92.0 % tool-calling accuracy on a 200-case BFCL-style subset (4B BF16: 91.0 %); 8B BF16 cannot
  meet it. Quantized an INT4-AWQ checkpoint with TensorRT Model Optimizer when TensorRT-LLM could not
  load the published one. Caveats: one GPU, synthetic workload, own SLOs, default engine settings.
  Public repo github.com/ImanolGo/agents-per-gpu; analysis in reports/REPORT.md. Personal project.
- **EMMA-VLM** (Python, started 2024) — renamed and reworked from `emma-claude`.
  An EMMA-style driving planner using vision models through OpenRouter. Inputs: front-camera
  image, recent ego motion and routing command. Outputs: scene description, critical objects,
  driving decision and a three-second trajectory. Supports nuImages and nuScenes, comparing
  trajectory error and smoothness with a constant-velocity baseline, plus latency and cost.
  An open-loop research experiment, separate from CARIAD work; no validated driving capability
  or improvement over the baseline is claimed.
- **TUI experiments** (Rust, 2026) — `procquarium`, `overflight` and `murmuration`, built with
  Ratatui. Inspired by Awesome TUI and an interest in keyboard-native applications that respect
  attention. Imanol wanted to explore modern terminals, including GPU-accelerated emulators.
  These applications draw terminal cells; do not imply their simulations run on the GPU.
  `procquarium` maps memory to fish size and CPU usage to swimming speed; process-changing
  actions require explicit opt-in. `overflight` visualizes aircraft overhead and a computed
  night sky; its supplied demo uses recorded traffic. `murmuration` draws a research-inspired
  three-dimensional flock in braille, with an optional falcon; it is not a validated animal model.
- **Visual Whispers** (Python/TypeScript, started 2024) — one of Imanol's first experiments
  combining LLMs and diffusion models in an interactive app. An image model paints a prompt,
  a vision model describes it through a chosen persona, and that description becomes the next
  image prompt. The app streams rounds, tracks surviving original words and exports chains.
  The current README documents OpenRouter and optional Replicate/FLUX image generation.
- **CUDA particles / Particle Atlas** (CUDA/C++, 2026) — a personal route through CUDA
  fundamentals: six small lessons, then an interactive particle artwork. CUDA/OpenGL interop,
  HDR trails and bloom; Orbit, Aurora and Ink scenes. The supplied recording uses 200,000
  particles and the explicit staged GPU-to-CPU-to-OpenGL fallback. It is an offline capture,
  not a frame-rate benchmark or a physical fluid/gravity simulation.
- **ADAS Projects in Rust** (started 2023) — seven learning activities ending in an integrated
  dashcam demo: lanes, signs, speed limits, objects, traffic lights and an instrument cluster.
  Rust with tract/ONNX, image/imageproc and ffmpeg; sample road footage from Udacity (MIT).
  A learning project, separate from production ADAS work.

### Studio and media credits

- Most freelance light and interactive installations were made for **Studio Waldemeyer**,
  Moritz Waldemeyer's studio. Credit the studio for the design work and Imanol for his software,
  mapping and hardware contribution. Confirmed work includes Stella Rinascente, Journey of
  Colour, LED mapping tools and DMX-controlled winch light painting. Do not attribute every
  installation or Ars Electronica project to the studio.
- The supplied fashion photo `Photo-by-Andreas-Waldschuetz-2-for-ElektroCouture-600x900.webp`
  credits **Andreas Waldschuetz**, for ElektroCouture. Other photo credits still need confirmation.
- The supplied Alibi screenshots use a test case with scripted answers, as its README states.
- A rover hardware photo is available in `rover-assistant/assets/images/jetson-rover-ai-assistant.jpg`.
  The rover is a later project; do not attach the older ROS 2/Moondream latency numbers to it.

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
on the site if Imanol confirms it's OK — `TODO(imanol)`. Amazon: confirmed OK (2026-10-22).

### Recent personal work (2023–2026) — edge AI, GPU, Rust
- **local-ai-robot-assistant** (Python, 2025–26) — private, autonomous AI robot assistant running fully on an NVIDIA Jetson Orin Nano.
- **rover-assistant** (Python, 2026) — voice and vision assistant for a Jetson Orin Nano rover, fully on-device, no cloud.
- **emma-vlm** (Python, started 2024) — EMMA-style multimodal driving planner with interchangeable vision models through OpenRouter and open-loop trajectory evaluation.
- **ADAS-Projects-In-Rust** (Rust, 2023) — ADAS feature implementations in Rust, for performance and safety.
- **pico-deployment-demo** (CMake, 2023) — no description; `TODO(imanol)`: what it is (deployment on Raspberry Pi Pico?).
- **alibi** (Python, 2026) — murder-mystery game where each suspect is an LLM agent; LangGraph, MCP tools, RAG memory, CI evals, and a fine-tuned lie detector.
- **murmuration-gpu** (Rust, 2026) — GPU starling-flock simulation with wgpu; 8,000-bird interactive default, with larger counts for profiling and offline rendering.
- **agents-per-gpu** (Python, 2026) — how many concurrent AI agents one GPU serves within a latency SLO, on vLLM, SGLang and TensorRT-LLM.
- **murmuration-kernels** (Rust/CUDA, 2026) — one starling-flock step in CUDA C++, cuda-oxide, wgpu and cuTile Rust, with Nsight profiling and an article.
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
Forks (adobe.github.com, Arduino), dotfiles, myscripts, MailChecker, c-unit-test, c-actions-test, advent-of-code-2024, open-sauced-goals, Sculpteo (empty), ImanolGo (profile README), and client repos without descriptions (Bentley, TelekomAnimations, AudioOnsetImagesApp, PNC, Jukebox, WearableEK) unless Imanol adds context. AmazonOffice now has context (see ProtoPixel above) and is linked from its case study.
