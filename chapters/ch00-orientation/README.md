# Chapter 0: Orientation & Environment Setup
## Days 1–3 | July 15–17, 2026

> **Goal:** Fully configured environment, all accounts created, first tools run.
> Zero friction from Day 4 onward.

---

## Your Schedule Reminder (New — Night Person Edition)

```
9:30 AM–10:30 AM   Wake up + coffee + read today's plan
10:30 AM–11:30 AM   🚀 STARTUP BLOCK (Mediqrate + PracticeCLB testing)
11:30 AM–12:30 PM   🟡 WARM-UP — Track A (governance reading, Anki)
12:30 PM–1:30 PM   🍽️ LUNCH (full hour, no screens — you cook)
1:30 PM–4:00 PM   🔴 DEEP WORK 1 — Track B (labs, tools, coding)
4:00 PM–4:15 PM   ☀️ BREAK (walk outside)
4:15 PM–6:30 PM   🔴 DEEP WORK 2 — Track B or Track A heavy work
6:30 PM–7:30 PM   🍽️ DINNER (full hour, no screens — you cook)
7:30 PM–8:00 PM   🌿 RESET (walk, music)
8:00 PM–9:15 PM   🟡 PORTFOLIO + CONTENT (LinkedIn, writing, job research)
9:15 PM–10:30 PM   🎬 KARPATHY VIDEOS (2 per evening — free on YouTube)
10:45 PM–11:00 PM   📝 EVENING CHECK-IN (Claude Code → updates files → commits)
```

---

## Mindset Check (Read This Once)

You have 9 published IEEE papers on adversarial ML. You built two production AI systems. You implemented PIPEDA-compliant PHI encryption. The gap between where you are and "AI Security Engineer" is a vocabulary gap and a tooling gap — not a knowledge gap. That's a 5-month problem. This chapter is Days 1–3 of solving it.

---

## Day 1 — July 15 (Today)

### 🚀 Startup Block (10:30 AM–11:30 AM)
- [ ] Open PracticeCLB as a fresh user — go through the full exam flow
- [ ] Note the first 3 things that feel broken or confusing
- [ ] Open Mediqrate — go through onboarding as a new user
- [ ] Log any bugs in `resources/startup-launch-tracker.md`

### 🟡 Warm-up / Track A (11:30 AM–12:30 PM)
- [ ] Read the master README.md top to bottom
- [ ] Read this file (Ch00) completely
- [ ] Read chapters/ch00b-ai-governance-track/README.md introduction
- [ ] Watch one YouTube video: search "AI red teaming explained 2026" (~15 min)

### 🔴 Deep Work 1 — Environment Setup (1:30 PM–4:00 PM)
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

### ☀️ Break (4:00 PM–4:15 PM) — Walk outside

### 🔴 Deep Work 2 — Environment Setup Continued (4:15 PM–6:30 PM)
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
```

### 🍽️ Dinner (6:30 PM–7:30 PM)

### 🟡 Portfolio/Content (8:00 PM–9:15 PM)
- [ ] Create `resources/nist-ai-rmf-notes.md` — write headings for all 4 functions
- [ ] Create `resources/eu-ai-act-risk-tiers.md` — write the 4 risk tiers with examples
- [ ] Read: https://mlsecops.com — introduction article

### 🎬 Karpathy (9:15 PM–10:30 PM)
- [ ] Watch Video 1: "The spelled-out intro to neural networks and backpropagation"
- [ ] Watch Video 2: "The spelled-out intro to language modeling: building makemore"
- [ ] Mark both ✅ in resources/karpathy-watch-log.md with one security insight

### 📝 Evening check-in (10:45 PM)
Send "Evening check-in. Ready." to Claude Code.

---

## Day 2 — July 16

### 🚀 Startup Block (10:30 AM–11:30 AM)
- [ ] PracticeCLB: fix or document the highest-severity bug from yesterday
- [ ] Mediqrate: test the Vita AI chat flow end-to-end
- [ ] Update bug log in `resources/startup-launch-tracker.md`

### 🟡 Warm-up / Track A (11:30 AM–12:30 PM)
**MITRE ATLAS — This is your bible. Learn it today.**
- [ ] Go to: https://atlas.mitre.org
- [ ] Read the "About" section completely
- [ ] Browse ALL tactics in the left sidebar — for each one write 1 sentence in your own words
- [ ] Save to: `resources/mitre-atlas-notes.md`

### 🔴 Deep Work 1 (1:30 PM–4:00 PM): First garak Scan
```bash
# Activate environment
source ~/security-env/bin/activate

# Make sure Ollama is running
ollama serve &   # (or open Ollama app if it has a GUI)

# Run your first AI security scan — FREE, no API cost
garak --model_type ollama --model_name llama3.2:1b --probes promptinject
garak --model_type ollama --model_name llama3.2:1b --probes encoding

# Save the output:
garak --model_type ollama \
      --model_name llama3.2:1b \
      --probes promptinject,encoding \
      --report_prefix portfolio/day2-first-garak-scan

# After it runs, look at the results:
cat portfolio/day2-first-garak-scan.jsonl | python3 -m json.tool | head -50
```

**Write in your daily log:**
1. What did garak actually test?
2. What did it find?
3. What do you not understand about the output yet?

### 🔴 Deep Work 2 (4:15 PM–6:30 PM): DeepLearning.AI Course
- [ ] Go to: https://learn.deeplearning.ai/courses/red-teaming-llm-applications
- [ ] Complete ALL lessons (free, ~1 hour total)
- [ ] Save notes to: `resources/deeplearningai-redteaming-notes.md`
- [ ] Try Gandalf AI: https://gandalf.lakera.ai — attempt levels 1–7

### 🟡 Portfolio/Content (8:00 PM–9:15 PM)
- [ ] Write your first LinkedIn post (this is important — do not skip):

```
"Day 2 of my AI security journey. I just ran my first automated 
LLM vulnerability scan using garak against a local llama3.2 model.
Finding: [what you found]. As someone who published research on
adversarial ML before it was called 'AI red teaming,' this is
the same attack class I studied in 2020 — different model architecture.
#AISecurity #LLMSecurity #AIRedTeaming"
```

### 🎬 Karpathy (9:15 PM–10:30 PM)
- [ ] Watch Video 3: "Building makemore Part 2: MLP"
- [ ] Watch Video 4: "Building makemore Part 3: Activations, Gradients, BatchNorm"
- [ ] Mark ✅ in karpathy-watch-log.md

---

## Day 3 — July 17

### 🚀 Startup Block (10:30 AM–11:30 AM)
- [ ] PracticeCLB: test payment flow (Stripe test mode) — buy a plan as a user
- [ ] Mediqrate: test subscription purchase + restore (RevenueCat test mode)
- [ ] Document any issues

### 🟡 Warm-up / Track A (11:30 AM–12:30 PM)
- [ ] Read: https://artificialintelligenceact.eu — complete overview (~30 min)
- [ ] Update `resources/eu-ai-act-risk-tiers.md` with what you just learned

### 🔴 Deep Work 1 (1:30 PM–4:00 PM): PyRIT Introduction
```bash
# Install PyRIT (Microsoft's AI red teaming toolkit)
pip install pyrit

# Follow the quickstart at:
# https://github.com/Azure/PyRIT/blob/main/doc/quickstart.ipynb
# Run through the basic example in Jupyter:
jupyter notebook
# Create: portfolio/day3-pyrit-intro.ipynb
```

### 🔴 Deep Work 2 (4:15 PM–6:30 PM): GitHub + LinkedIn Setup
- [ ] Push this repo to GitHub (follow SETUP.sh instructions)
- [ ] Verify CLAUDE.md loads in Claude Code: type "What project are you working on?"
- [ ] Update LinkedIn headline:
  `"AI Security & Governance Specialist | Adversarial ML Researcher (9 IEEE Papers) | Founder @ Mediqrate & PracticeCLB"`

### 🟡 Portfolio/Content (8:00 PM–9:15 PM)
- [ ] Read Chapter 1 README completely (your next chapter)
- [ ] Read ch00b README Week 1 section
- [ ] Enroll in TryHackMe Pre-Security path (free)

### 🎬 Karpathy (9:15 PM–10:30 PM)
- [ ] Watch Video 5: "Building makemore Part 4: Becoming a Backprop Ninja"
- [ ] Watch Video 6: "Building makemore Part 5: WaveNet"
- [ ] Mark ✅ in karpathy-watch-log.md

---

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

**When all complete → Chapter 1 (Days 4–18)**
