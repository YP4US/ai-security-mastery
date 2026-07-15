# Chapter 0: Orientation & Environment Setup
## Days 1–2 | July 15–16, 2026

> **Goal:** Have a fully configured development and security research environment ready to go. Zero friction from Day 3 onward.

---

## 🧠 Mindset Check Before You Start

Read this every time you feel stuck or want to give up:

**You have 9 published IEEE papers in adversarial ML. You literally wrote peer-reviewed research on attacking ML systems. Most people applying for AI red teaming jobs don't even know what a mixture model is. You are not starting from zero. You are translating existing expertise into a new vocabulary.**

The job market gap you're closing is not a knowledge gap. It's a tooling and positioning gap. That's a 3-month problem, not a 3-year problem.

---

## Day 1 — July 15 (Today)

> **Note:** Day 1 covers everything originally planned for the first two orientation days — full environment setup, first garak scan, MITRE ATLAS, and the DeepLearning.AI course — since the plan's start date moved from July 14 to July 15. Expect this day to run long; nothing was cut.

### Block 1 (08:30–10:30): Read & Plan
- [ ] Read the master README.md top to bottom (you just did this)
- [ ] Read this file completely
- [ ] Open PROGRESS.md and fill in your start date
- [ ] Watch: "What is AI Red Teaming?" (YouTube search: "AI red teaming explained 2026" — pick a video under 20 min)
- [ ] Watch: "DevSecOps vs MLSecOps vs AI Red Teaming" (search YouTube)

### Block 2 (10:45–12:45): Environment Setup Part 1
**Install these tools — every single one:**

```bash
# 1. Python 3.11+ (check: python3 --version)
# Already have it? Good. If not: https://python.org/downloads

# 2. VS Code
# https://code.visualstudio.com — install these extensions:
#   - Python (Microsoft)
#   - GitHub Copilot (free with GitHub Education or trial)
#   - GitLens
#   - Jupyter

# 3. Git setup
git config --global user.name "Yogesh Pawar"
git config --global user.email "yogeshpawar223@gmail.com"

# 4. Create your GitHub repo
# Go to github.com → New repository → "ai-security-mastery" → Private
# Then push this folder to it

# 5. Create Python virtual environment
python3 -m venv ~/security-env
source ~/security-env/bin/activate   # Mac/Linux
# security-env\Scripts\activate       # Windows

# 6. Install core security tools
pip install garak
pip install adversarial-robustness-toolbox
pip install promptfoo  # or: npm install -g promptfoo
pip install requests rich click python-dotenv
pip install jupyter notebook
pip install openai anthropic
```

### Block 3 (12:45–13:30): Vizuara Break
- [ ] Videos #1 + #2 (Series intro + LLM overview)

### Block 4 (14:30–16:30): Environment Setup Part 2
```bash
# 7. Install Docker (for containerized security labs)
# https://docs.docker.com/get-docker/

# 8. Set up Ollama (run LLMs locally — free, no API key needed)
# https://ollama.ai/download
# After install:
ollama pull llama3.2:1b    # small model for testing (600MB)
ollama pull mistral:7b     # better model for red teaming (4GB, needs 8GB RAM)

# 9. Create API accounts (free tiers)
# - OpenAI: platform.openai.com (get $5 free credit)
# - Anthropic: console.anthropic.com (get $5 free credit)
# - Hugging Face: huggingface.co (completely free)
# - AWS: aws.amazon.com/free (12 months free tier)

# 10. Set up .env file for API keys
cat > ~/security-env/.env << 'EOF'
OPENAI_API_KEY=your_key_here
ANTHROPIC_API_KEY=your_key_here
HUGGINGFACE_TOKEN=your_token_here
AWS_ACCESS_KEY_ID=your_key_here
AWS_SECRET_ACCESS_KEY=your_key_here
EOF
```

### Block 5 (16:45–18:00): Environment Setup Part 3
- [ ] Create account on TryHackMe.com (free tier to start)
- [ ] Complete your TryHackMe profile (real name, Ottawa location)
- [ ] Create account on HackTheBox.com (free)
- [ ] Create account on Gandalf AI: https://gandalf.lakera.ai (free prompt injection game)
- [ ] Bookmark ALL resources from master README
- [ ] Set up LinkedIn — update headline to: "AI/ML Security Researcher | Building @ Mediqrate & PracticeCLB | Adversarial ML | 9 IEEE Publications"

### Block 6 (18:00–19:00): Reading
- [ ] Read: https://mlsecops.com/what-is-mlsecops (20 min)
- [ ] Read: OWASP LLM Top 10 overview (just the names + 1-line descriptions for now): https://owasp.org/www-project-top-10-for-large-language-model-applications/

### Block 7 (19:30–20:30): Framework Deep Read
**MITRE ATLAS — This is your bible. Learn it cold.**
- [ ] Go to: https://atlas.mitre.org
- [ ] Read the "About" section completely
- [ ] Browse ALL tactics (left sidebar): Initial Access, ML Model Access, Execution, Persistence, etc.
- [ ] For each tactic, read 2–3 technique descriptions
- [ ] Create a new file: `resources/mitre-atlas-notes.md` — write a 1-sentence summary of each tactic in your own words

### Block 8 (20:30–22:00): First garak Run + DeepLearning.AI Course
```bash
# Activate your environment
source ~/security-env/bin/activate

# Test garak against a local Ollama model (free — no API cost)
# First make sure ollama is running: ollama serve
garak --model_type ollama --model_name llama3.2:1b --probes encoding
garak --model_type ollama --model_name llama3.2:1b --probes promptinject

# Save the output report
# garak creates a report file — find it and save to portfolio/day1-first-garak-run/
```

**Observation journal** — after running garak, write in your daily log:
1. What did garak actually test?
2. What vulnerabilities did it find (if any)?
3. What do you not understand yet about the output?

- [ ] Go to: https://learn.deeplearning.ai/courses/red-teaming-llm-applications
- [ ] Complete ALL lessons (free, ~1 hour total)
- [ ] Take notes in `resources/deeplearning-ai-notes.md`
- [ ] Try: https://gandalf.lakera.ai — attempt all 7 levels, note your techniques
- [ ] Watch YouTube: "Prompt Injection Explained" by Johann Rehberger (search: "Rehberger prompt injection")
- [ ] Start reading: NIST AI Risk Management Framework overview (https://airc.nist.gov)
- [ ] Write Day 1 log + git commit

---

## Day 2 — July 16

### Morning Block (08:30–10:30): The Big Picture Read
Today is strategic — you're learning how everything connects.

- [ ] Read: https://www.practical-devsecops.com/ai-red-teaming-beginners-guide/ (complete article)
- [ ] Read: https://dualitytech.com/blog/shifting-from-devsecops-to-mlsecops/ (complete)
- [ ] Create `resources/field-map.md` — draw (in text/ASCII) how DevSecOps → MLSecOps → AI Red Teaming relate to each other

### Lab Block (10:45–12:45): PyRIT Introduction
```bash
# Install PyRIT (Microsoft's AI red teaming toolkit)
pip install pyrit

# Follow the quickstart:
# https://github.com/Azure/PyRIT/blob/main/doc/quickstart.ipynb
# Run through the basic example in Jupyter notebook
jupyter notebook
# Create: portfolio/day2-pyrit-intro.ipynb
```

### Afternoon Block (14:30–18:45): LinkedIn Content + GitHub
- [ ] Write your first LinkedIn post (100–150 words):
  *"I'm publicly committing to mastering AI security over the next 110 days. I have 9 published papers in adversarial ML and today I ran my first LLM red-teaming scan using garak. Day 1 findings: [what you found]. Following this daily. #AISecurity #RedTeaming #MLSecOps"*
- [ ] Push your repo to GitHub (make it public — it's your portfolio)
- [ ] Add a good README to your GitHub profile repo

### Evening Block (20:30–22:00): Week 1 Prep
- [ ] Read Ch01 README (your next chapter) completely
- [ ] Enroll in TryHackMe Pre-Security path (free)
- [ ] Write Day 2 log + **weekly review for Week 1 setup**

---

## ✅ Chapter 0 Completion Checklist

- [ ] VS Code + extensions installed
- [ ] Python environment set up with garak, PyRIT, ART
- [ ] Ollama running locally with at least one model
- [ ] API keys for OpenAI, Anthropic, HuggingFace configured
- [ ] TryHackMe account created + Pre-Security path started
- [ ] HackTheBox account created
- [ ] Gandalf AI — at least 5 levels completed
- [ ] First garak scan completed and documented
- [ ] First LinkedIn post published
- [ ] GitHub repo live and public
- [ ] MITRE ATLAS notes created
- [ ] DeepLearning.AI red teaming course completed

**When all boxes are checked → move to Chapter 1**
