# Chapter 0: Orientation & Environment Setup
## Days 1–2 | July 16–17, 2026
## (July 15 was lost — Day 1 content merged with original Day 2; original Day 3 content becomes Day 2. Ch01 still starts on schedule July 18.)

> **Goal:** Fully configured environment, all accounts created, first tools run.
> Zero friction from Day 4 onward.

---

## Your Schedule Reminder (New — Night Person Edition)

```
09:30–10:30   Wake up + coffee + read today's plan
10:30–11:30   🚀 STARTUP BLOCK (Mediqrate + PracticeCLB testing)
11:30–12:30   🟡 WARM-UP — Track A (governance reading, Anki)
12:30–13:30   🍽️ LUNCH (full hour, no screens — you cook)
13:30–16:00   🔴 DEEP WORK 1 — Track B (labs, tools, coding)
16:00–16:15   ☀️ BREAK (walk outside)
16:15–18:30   🔴 DEEP WORK 2 — Track B or Track A heavy work
18:30–19:30   🍽️ DINNER (full hour, no screens — you cook)
19:30–20:00   🌿 RESET (walk, music)
20:00–21:15   🟡 PORTFOLIO + CONTENT (LinkedIn, writing, job research)
21:15–22:30   🎬 KARPATHY VIDEOS (2 per evening — free on YouTube)
22:45–23:00   📝 EVENING CHECK-IN (Claude Code → updates files → commits)
```

---

## Mindset Check (Read This Once)

You have 9 published IEEE papers on adversarial ML. You built two production AI systems. You implemented PIPEDA-compliant PHI encryption. The gap between where you are and "AI Security Engineer" is a vocabulary gap and a tooling gap — not a knowledge gap. That's a 5-month problem. This chapter is Days 1–3 of solving it.

---

## Day 1 — July 16 (Today)
*(Merged: original Day 1 environment setup + original Day 2 governance/garak/DeepLearning.AI content)*

### 🚀 Startup Block (10:30–11:30)
- [ ] Open PracticeCLB as a fresh user — go through the full exam flow
- [ ] Note the first 3 things that feel broken or confusing
- [ ] Open Mediqrate — go through onboarding as a new user
- [ ] Log any bugs in `resources/startup-launch-tracker.md`

### 🟡 Warm-up / Track A (11:30–12:30)
- [ ] Read the master README.md top to bottom
- [ ] Read this file (Ch00) completely
- [ ] Read chapters/ch00b-ai-governance-track/README.md introduction
- [ ] Watch one YouTube video: search "AI red teaming explained 2026" (~15 min)

### 🔴 Deep Work 1 — Environment Setup (13:30–16:00)
**Install everything below. Do not skip anything.**

```bash
# 1. Python 3.11+ — check: python3 --version

# 2. VS Code extensions to install:
#    Python (Microsoft), GitLens, Jupyter, GitHub Copilot (free trial)

# 3. Git setup
git config --global user.name "Yogesh Pawar"
git config --global user.email "yogeshpawar223@gmail.com"

# 4. Create Python virtual environment
python3 -m venv ~/security-env
source ~/security-env/bin/activate   # Mac/Linux
# security-env\Scripts\activate       # Windows

# 5. Install core security tools
pip install garak
pip install adversarial-robustness-toolbox
pip install requests rich click python-dotenv
pip install jupyter notebook
pip install openai anthropic
pip install chromadb sentence-transformers
```

### ☀️ Break (16:00–16:15) — Walk outside

### 🔴 Deep Work 2 — Environment Setup + First garak Scan (16:15–18:30)
```bash
# 6. Install Docker
# https://docs.docker.com/get-docker/

# 7. Install Ollama (run LLMs locally — FREE, no API cost)
# https://ollama.ai/download
ollama pull llama3.2:1b    # small model, ~600MB
# After download, test it:
ollama run llama3.2:1b "Hello, who are you?"

# 8. Create API accounts (free tiers):
# - OpenAI: platform.openai.com ($5 free credit)
# - Anthropic: console.anthropic.com ($5 free credit)
# - Hugging Face: huggingface.co (completely free)
# - AWS: aws.amazon.com/free (12 months free tier)

# 9. Create accounts on:
# - TryHackMe: tryhackme.com (free tier)
# - HackTheBox: hackthebox.com (free tier)
# - Gandalf AI: gandalf.lakera.ai (free — prompt injection practice)

# 10. Set up your .env file for API keys
cat > ~/security-env/.env << 'ENVEOF'
OPENAI_API_KEY=your_key_here
ANTHROPIC_API_KEY=your_key_here
HUGGINGFACE_TOKEN=your_token_here
AWS_ACCESS_KEY_ID=your_key_here
AWS_SECRET_ACCESS_KEY=your_key_here
ENVEOF

# 11. If time remains, run your first AI security scan:
ollama serve &
garak --model_type ollama --model_name llama3.2:1b --probes promptinject
garak --model_type ollama --model_name llama3.2:1b --probes encoding
garak --model_type ollama \
      --model_name llama3.2:1b \
      --probes promptinject,encoding \
      --report_prefix portfolio/day1-first-garak-scan
```
(If garak doesn't fit tonight, it carries to Day 2 — environment setup takes priority.)

### 🍽️ Dinner (18:30–19:30)

### 🟡 Portfolio/Content (20:00–21:15)
- [ ] Create `resources/nist-ai-rmf-notes.md` — write headings for all 4 functions
- [ ] Create `resources/eu-ai-act-risk-tiers.md` — write the 4 risk tiers with examples
- [ ] Read: https://mlsecops.com — introduction article

### 🎬 Karpathy (21:15–22:30)
- [ ] Watch Video 1: "The spelled-out intro to neural networks and backpropagation"
- [ ] Watch Video 2: "The spelled-out intro to language modeling: building makemore"
- [ ] Mark both ✅ in resources/karpathy-watch-log.md with one security insight

### 📝 Evening check-in (22:45)
Send "Evening check-in. Ready." to Claude Code.

---

## Day 2 — July 17
*(Merged: original Day 2 leftovers — MITRE ATLAS, DeepLearning.AI, garak if not done — + original Day 3 PyRIT/GitHub/LinkedIn/EU AI Act)*

### 🚀 Startup Block (10:30–11:30)
- [ ] PracticeCLB: fix or document the highest-severity bug from yesterday, then test payment flow (Stripe test mode)
- [ ] Mediqrate: test the Vita AI chat flow end-to-end + subscription purchase/restore (RevenueCat test mode)
- [ ] Update bug log in `resources/startup-launch-tracker.md`

### 🟡 Warm-up / Track A (11:30–12:30)
**MITRE ATLAS — This is your bible. Learn it today.**
- [ ] Go to: https://atlas.mitre.org
- [ ] Read the "About" section completely
- [ ] Browse ALL tactics in the left sidebar — for each one write 1 sentence in your own words
- [ ] Save to: `resources/mitre-atlas-notes.md`
- [ ] If time remains: read https://artificialintelligenceact.eu overview and update `resources/eu-ai-act-risk-tiers.md`

### 🔴 Deep Work 1 (13:30–16:00): garak (if not finished Day 1) + PyRIT Introduction
```bash
# If you didn't finish the garak scan yesterday, run it first:
source ~/security-env/bin/activate
ollama serve &
garak --model_type ollama --model_name llama3.2:1b --probes promptinject,encoding \
      --report_prefix portfolio/day2-first-garak-scan
cat portfolio/day2-first-garak-scan.jsonl | python3 -m json.tool | head -50

# Then install PyRIT (Microsoft's AI red teaming toolkit)
pip install pyrit

# Follow the quickstart at:
# https://github.com/Azure/PyRIT/blob/main/doc/quickstart.ipynb
jupyter notebook
# Create: portfolio/day2-pyrit-intro.ipynb
```

**Write in your daily log:**
1. What did garak actually test, and what did it find?
2. What do you not understand about the output yet?

### 🔴 Deep Work 2 (16:15–18:30): DeepLearning.AI Course + GitHub/LinkedIn Setup
- [ ] Go to: https://learn.deeplearning.ai/courses/red-teaming-llm-applications
- [ ] Complete ALL lessons (free, ~1 hour total)
- [ ] Save notes to: `resources/deeplearningai-redteaming-notes.md`
- [ ] Try Gandalf AI: https://gandalf.lakera.ai — attempt levels 1–7
- [ ] Push this repo to GitHub (follow SETUP.sh instructions)
- [ ] Verify CLAUDE.md loads in Claude Code: type "What project are you working on?"
- [ ] Update LinkedIn headline:
  `"AI Security & Governance Specialist | Adversarial ML Researcher (9 IEEE Papers) | Founder @ Mediqrate & PracticeCLB"`

### 🟡 Portfolio/Content (20:00–21:15)
- [ ] Write your first LinkedIn post (this is important — do not skip):

```
"Day 2 of my AI security journey. I just ran my first automated 
LLM vulnerability scan using garak against a local llama3.2 model.
Finding: [what you found]. As someone who published research on
adversarial ML before it was called 'AI red teaming,' this is
the same attack class I studied in 2020 — different model architecture.
#AISecurity #LLMSecurity #AIRedTeaming"
```
- [ ] Read Chapter 1 README completely (your next chapter)
- [ ] Read ch00b README Week 1 section
- [ ] Enroll in TryHackMe Pre-Security path (free)

### 🎬 Karpathy (21:15–22:30)
- [ ] Watch Video 3: "Building makemore Part 2: MLP"
- [ ] Watch Video 4: "Building makemore Part 3: Activations, Gradients, BatchNorm"
- [ ] Mark ✅ in karpathy-watch-log.md

---

## (Original Day 3 content — Videos 5 & 6 — now carries into Ch01 Day 1, July 18, as a light Karpathy catch-up)

## ✅ Chapter 0 Completion Checklist

**Environment:**
- [ ] Python + garak + PyRIT + ART all installed
- [ ] Ollama running with llama3.2:1b
- [ ] Docker installed
- [ ] API keys configured for OpenAI, Anthropic, HuggingFace
- [ ] GitHub repo live and CLAUDE.md loading correctly

**Accounts:**
- [ ] TryHackMe: Pre-Security path started
- [ ] HackTheBox: account created
- [ ] Gandalf AI: at least 5 levels completed

**First outputs:**
- [ ] garak scan: completed and documented in portfolio/
- [ ] PyRIT: quickstart notebook run
- [ ] MITRE ATLAS notes: created
- [ ] NIST AI RMF notes: 4 functions written
- [ ] EU AI Act risk tiers: cheatsheet created

**Public presence:**
- [ ] GitHub repo: public, CLAUDE.md in root
- [ ] LinkedIn: headline updated
- [ ] LinkedIn: first post published

**Karpathy:**
- [ ] Videos 1–6 watched, insights in karpathy-watch-log.md

**Startup:**
- [ ] PracticeCLB: first testing session done, bugs logged
- [ ] Mediqrate: first testing session done, bugs logged

**Karpathy Videos 5 & 6** ("Backprop Ninja" + "WaveNet") did not fit in the compressed 2-day Ch00 — watch them as a catch-up during Ch01 Day 4 evening, alongside that day's scheduled videos.

**When all complete → Chapter 1 (Days 4–18, starting July 18 on schedule)**
