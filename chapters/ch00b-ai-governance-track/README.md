# Chapter 00B: AI Governance Track (Track A)
## Runs PARALLEL to Ch01–Ch03 | Weeks 1–6 | Jul 16 – Sep 1, 2026
## 🎯 Target: Apply for Track A roles confidently by September 1, 2026

> **This chapter runs in two daily slots:
- **Warm-up slot (11:30–12:30):** Governance reading, AIGP content, Anki flashcards
- **Portfolio slot (20:00–21:15):** Writing governance documents, audit reports, LinkedIn posts

Your **Deep Work slots (13:30–18:30)** remain for Track B (security fundamentals).**
> By the end of Week 6 you will have: AIGP certification in progress, a published AI governance framework analysis, a documented AI risk assessment of your own products, and a vocabulary that makes you immediately credible to Risk, Compliance, and Legal teams at Canadian banks, consulting firms, and government agencies.

---

> **Startup block (10:30–11:30) runs every morning in parallel.**
> This chapter uses the **warm-up slot (11:30–12:30)** and
> **portfolio slot (20:00–21:15)** each day — NOT the deep work blocks
> (those stay for Track B). Check Ch09 for today's startup task.


## Why You're ALREADY Qualified for Track A (Read This First)

Stop underselling yourself. Here is what Track A employers actually want vs. what you have:

| What They Ask For | What You Have |
|-------------------|---------------|
| "Understanding of AI/ML systems" | 9 published papers on adversarial ML + 2 production AI apps |
| "Experience with AI risk" | Built and secured PHI-handling AI systems (PIPEDA compliance) |
| "Familiarity with AI frameworks" | Your research cites NIST-adjacent statistical methods |
| "Data privacy knowledge" | Implemented AES-256-GCM PHI encryption for Mediqrate |
| "Ability to assess AI failures" | Your literal M.A.Sc. thesis was on anomaly detection |
| "Communication skills" | IEEE publications + conference presentations |
| "3 years experience" | Field is 2–3 years old. Nobody has 5 years. |

The gap is vocabulary, not substance. This chapter closes the vocabulary gap in 6 weeks.

---

## THE TRACK A JOB LANDSCAPE IN CANADA

### Role Types (with real examples from live postings)

**AI Risk Analyst** (Banks: RBC, TD, CIBC, Scotiabank)
- What they do: Assess AI models before deployment, maintain AI risk registers, review third-party AI vendor risks
- What they pay: CAD $95K–$140K
- What they need from you: NIST AI RMF knowledge, model risk management basics, your ML background
- Time to apply: Week 7

**Responsible AI Specialist** (Tech companies: Shopify, D2L, OpenText)
- What they do: Build and run responsible AI programs, conduct bias/fairness testing, write AI policies
- What they pay: CAD $110K–$160K
- What they need: AI ethics frameworks, technical understanding of how models fail, communication skills
- Time to apply: Week 7

**AI Governance Lead** (Consulting: Deloitte, KPMG, PwC, IBM)
- What they do: Help clients build AI governance programs, assess compliance with regulations
- What they pay: CAD $120K–$180K
- What they need: EU AI Act, NIST AI RMF, ISO 42001, client-facing skills
- Time to apply: Week 8 (needs slightly more framework depth)

**AI Compliance Analyst** (Regulated industries: insurance, pharma, telecom)
- What they do: Ensure AI deployments comply with PIPEDA, OSFI guidelines, sector regulations
- What they pay: CAD $90K–$130K
- What they need: Regulatory knowledge + technical enough to read model cards
- Time to apply: Week 7

**AI Policy Advisor** (Federal government: Treasury Board, NRC, ISED, CSE)
- What they do: Develop government AI policies, assess AI procurement proposals
- What they pay: CAD $85K–$130K (government scale)
- What they need: Policy writing + AI technical knowledge + Canadian gov context
- Time to apply: Week 9 (government hiring is slow — apply early)

---

## WEEK 1 (Jul 16–21): Foundation Frameworks

### 🎓 AIGP Content Study (Exam DEFERRED — see README)

> **The $799 USD AIGP exam is deferred until after your first paycheck.**
> Study ALL the content now — it directly prepares you for Track A interviews
> and portfolio work. Just do not pay the exam fee yet.
> When income arrives, buying AIGP gives you a 13% salary premium on your
> second role negotiation. It is not wasted — it is timed correctly.

## AIGP Study Resources (All Free)
**Provider:** IAPP (International Association of Privacy Professionals)
**Cost:** ~$400 USD (~$550 CAD) for exam + study materials
**Exam format:** 90 questions, 2.5 hours, passing score 300/500
**Study time needed:** 25–30 hours total
**Register at:** https://iapp.org/certify/aigp/

> Start studying Day 1. Exam target: Week 6 (August 22).

**AIGP Study Resources (free):**
- IAPP AI Governance Center: iapp.org/resources/article/ai-governance-resources/
- IAPP free AI governance courses on their website
- "Annotated NIST AI RMF" PDF (free download from NIST)

---

### Day-by-Day: Week 1

#### Day 1 (Jul 16) — 11:30–12:30 (warm-up) + 20:00–21:15 (portfolio): The Three Pillars
**Afternoon (11:30–12:30): NIST AI RMF**

This is the most important framework for Canadian employers. Read it today.
URL: https://airc.nist.gov/RMF_Map

The four functions:
```
GOVERN → MAP → MEASURE → MANAGE

GOVERN: Policies, culture, accountability for AI risk
MAP:    Categorize AI risks, identify stakeholders  
MEASURE: Evaluate AI risks quantitatively
MANAGE: Prioritize and treat AI risks
```

Create: `resources/nist-ai-rmf-notes.md`

For each of the 6 categories under GOVERN, write:
1. What it means in plain English
2. One example of what this looks like at a Canadian bank

**Afternoon (20:00–21:00): EU AI Act Overview**

URL: https://artificialintelligenceact.eu/the-act/

Key concepts to understand:
- Risk tiers: Unacceptable Risk → High Risk → Limited Risk → Minimal Risk
- High-risk AI systems (Article 6 + Annex III) — this is where most enterprise AI falls
- Obligations for high-risk systems: conformity assessment, documentation, human oversight
- The August 2, 2026 enforcement deadline (already active)

Create: `resources/eu-ai-act-risk-tiers.md`

```markdown
## EU AI Act Risk Classification

### UNACCEPTABLE RISK (Banned)
- Social scoring by governments
- Real-time biometric surveillance in public
- Subliminal manipulation
- Examples: Chinese-style social credit

### HIGH RISK (Heavily regulated — YOUR focus)
- AI in hiring/recruitment decisions → you'll audit these
- AI in credit scoring/financial assessment → banks hire you for this
- AI in medical devices → Mediqrate is adjacent to this
- AI for critical infrastructure
- AI in law enforcement
- AI in education assessment

### LIMITED RISK (Transparency obligations only)
- Chatbots → must tell user they're talking to AI
- Deepfakes → must be labeled
- Examples: Most LLM-powered customer service bots

### MINIMAL RISK (No obligations)
- Spam filters, AI in video games
- Most B2B AI tools
```

**Project Work (21:00–21:15):**
Write your first LinkedIn post as an AI Governance professional:
> "The EU AI Act's High-Risk AI tier went into full enforcement on August 2, 2026. As someone who built PIPEDA-compliant AI health systems, here's what I think most companies are missing about their compliance obligations: [3 points]. #AIGovernance #ResponsibleAI #EUAIAct"

---

#### Day 2 (Jul 17) — 11:30–12:30 (warm-up) + 20:00–21:15 (portfolio): NIST AI RMF Deep Dive

**Read:** The full NIST AI RMF Core (Playbook): https://airc.nist.gov/Docs/2
Focus on: GOVERN 1.1, GOVERN 1.2, MAP 1.1, MEASURE 2.1

**Create:** `resources/ai-risk-register-template.md`

```markdown
# AI Risk Register Template
(Based on NIST AI RMF MAP function)

## AI System Profile
| Field | Value |
|-------|-------|
| System Name | |
| Business Purpose | |
| Decision Type | Automated / Human-in-loop / Advisory |
| Data Types Used | |
| Output Scope | |
| Affected Population | |

## Risk Assessment
| Risk ID | Risk Description | Likelihood (1-5) | Impact (1-5) | Risk Score | Controls | Owner |
|---------|-----------------|-----------------|--------------|------------|----------|-------|
| R001 | Biased outputs affecting protected groups | | | | | |
| R002 | Training data poisoning | | | | | |
| R003 | Prompt injection in user-facing LLM | | | | | |
| R004 | Model output relied on without human review | | | | | |
| R005 | Third-party model changes behavior | | | | | |

## Residual Risk
After controls: [ ] Acceptable [ ] Needs further treatment
```

**Apply to your work:** Fill in this template for PracticeCLB's AI scoring system. This becomes Portfolio Piece #1 for Track A.

---

#### Day 3 (Jul 16) — 11:30–12:30 (warm-up) + 20:00–21:15 (portfolio): Canadian AI Regulation

**Read these (in order, each ~30 min):**

1. Canada's AIDA (Artificial Intelligence and Data Act) companion document:
   https://ised-isde.canada.ca/site/advisory-council-artificial-intelligence/en/aida-companion-document

2. Government of Canada: Responsible Use of AI (Directive on Automated Decision-Making):
   https://www.canada.ca/en/government/system/digital-government/digital-government-innovations/responsible-use-ai.html

3. OSFI (Office of the Superintendent of Financial Institutions) on AI/ML:
   Search: "OSFI model risk management guidelines" — read the overview

**Create:** `resources/canadian-ai-regulation-cheatsheet.md`

```markdown
# Canadian AI Regulatory Landscape (Quick Reference)

## PIPEDA (Active)
- Personal Information Protection and Electronic Documents Act
- Applies to: All private sector organizations in Canada
- AI relevance: Any AI processing personal data must comply
- Key obligations: Consent, purpose limitation, accuracy, security
- Yogesh's experience: Implemented for Mediqrate PHI handling

## Bill C-27 / CPPA (Pending — watch for 2027)
- Consumer Privacy Protection Act
- Replaces PIPEDA with stronger rights
- AI-specific: Automated decision-making transparency requirements
- Impact: Companies must explain AI decisions to affected individuals

## AIDA (Artificial Intelligence and Data Act) (Pending)
- Part of Bill C-27
- Focus: High-impact AI systems (similar to EU AI Act risk tiers)
- Key obligations: Impact assessments, human oversight, transparency
- Status: Still moving through Parliament

## Directive on Automated Decision-Making (Federal government only)
- Applies to: Federal government AI systems
- 4 impact levels with increasing oversight requirements
- Why it matters: Government is a major employer in Ottawa

## OSFI Model Risk Management Guidelines (Financial sector)
- Applies to: Banks, insurance companies, federally regulated lenders
- SR 11-7 equivalent for Canada
- Key: Model validation, documentation, governance
- Why it matters: Banks are your #1 Track A employer in Canada

## EU AI Act (Affects Canadian companies exporting to EU)
- Enforcement started August 2, 2026
- Many Canadian companies (Shopify, D2L) have EU customers
- This creates immediate demand for AI compliance roles
```

---

## WEEK 2 (Jul 21–27): Frameworks in Practice

### Day 8 (Jul 21) — Track A afternoon: ISO/IEC 42001

ISO/IEC 42001 is the AI Management System standard — the "ISO 9001 for AI."

**Read:** ISO overview (free summary): https://www.iso.org/standard/81230.html
Search for: "ISO 42001 AI management system overview" — multiple free guides exist

Key structure:
- Clause 4: Context (what AI systems exist, who's affected)
- Clause 6: Planning (AI risk and opportunity assessment)
- Clause 8: Operation (AI system lifecycle controls)
- Clause 9: Evaluation (AI performance monitoring)
- Clause 10: Improvement (corrective action for AI incidents)

Create: `resources/iso-42001-notes.md`

### Day 9 (Jul 22): Bias and Fairness in AI

This is one of the most frequently discussed topics in Track A interviews.

**Study:**
- Types of bias: Selection bias, measurement bias, historical bias, representation bias
- Fairness metrics: Demographic parity, equalized odds, individual fairness
- Real case studies: Amazon's hiring algorithm (2018), COMPAS recidivism tool, healthcare resource allocation algorithm

**Hands-on:**
```python
# Implement a simple fairness audit in Python
# Save to: portfolio/fairness-audit/demo.py

import pandas as pd
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import confusion_matrix
import numpy as np

# Generate synthetic loan approval dataset
np.random.seed(42)
n = 1000
data = pd.DataFrame({
    'income': np.random.normal(50000, 15000, n),
    'credit_score': np.random.normal(700, 50, n),
    'protected_group': np.random.choice([0, 1], n, p=[0.7, 0.3]),  # 0=majority, 1=minority
    'approved': np.random.choice([0, 1], n, p=[0.4, 0.6])
})

# Add unfair bias: minority group is less likely to be approved regardless of qualifications
data.loc[data['protected_group'] == 1, 'approved'] *= 0.7
data['approved'] = (data['approved'] > 0.5).astype(int)

# Train model
X = data[['income', 'credit_score', 'protected_group']]
y = data['approved']
model = LogisticRegression()
model.fit(X, y)
predictions = model.predict(X)

# Fairness audit: demographic parity
for group in [0, 1]:
    mask = data['protected_group'] == group
    approval_rate = predictions[mask].mean()
    print(f"Group {group} approval rate: {approval_rate:.2%}")

# Document: Is the difference > 20%? That's a common fairness threshold.
# What would you recommend to fix this?
```

### Days 10–14: Complete AIGP Study Guide Chapters 1–5

**AIGP Exam Domain Coverage:**
| Domain | Weight | Study Days |
|--------|--------|-----------|
| AI Governance Fundamentals | 25% | Days 10–11 |
| AI Risk Management | 25% | Days 12–13 |
| AI Ethics and Bias | 20% | Day 14 |
| AI Regulations and Standards | 20% | Week 3 |
| AI Governance Implementation | 10% | Week 4 |

---

## WEEK 3 (Jul 28 – Aug 3): Applied AI Risk Assessment

### The Signature Portfolio Piece for Track A

**Project: "AI Risk Assessment of Mediqrate's Vita AI" — Using NIST AI RMF**

This is a real assessment of a real system you built. It's your strongest Track A portfolio asset because:
- It shows you can apply NIST AI RMF to a production system
- It demonstrates PIPEDA compliance awareness
- It shows you understand both the technical and governance sides
- Employers can verify it's real (the app exists)

**Structure:**
```
mediqrate-ai-risk-assessment/
├── executive-summary.md       (1 page — for non-technical readers)
├── system-profile.md          (what Vita AI is, what data it processes)
├── risk-register.md           (using your template from Day 2)
├── nist-rmf-mapping.md        (map each control to Mediqrate's implementation)
├── findings.md                (3–5 findings with recommendations)
└── remediation-roadmap.md     (prioritized fixes with effort/impact)
```

**Days 15–17 (Jul 28–30):** Write the assessment
**Day 18 (Jul 31):** Review and polish
**Day 19 (Aug 1):** Publish on GitHub + LinkedIn post

LinkedIn framing:
> "I built Mediqrate, a PIPEDA-compliant AI health app. Then I put on my AI Governance hat and formally assessed it against the NIST AI Risk Management Framework. Here's what I found — and what most AI companies get wrong about responsible AI in healthcare: [link]. #ResponsibleAI #AIGovernance #NISTRMF"

---

## WEEK 4 (Aug 4–10): EU AI Act Deep Dive + AIGP Domains 4–5

### Day 22 (Aug 4): EU AI Act — Technical Requirements for High-Risk AI

For high-risk AI systems, the EU AI Act requires:

```markdown
## Technical Documentation Requirements (Article 11)
- [ ] Description of intended purpose
- [ ] System architecture and design
- [ ] Training data documentation
- [ ] Validation and testing methodology
- [ ] Performance metrics (including on diverse groups)
- [ ] Known limitations and foreseeable risks
- [ ] Human oversight mechanisms

## Conformity Assessment (Article 43)
- Self-assessment for most high-risk AI
- Third-party audit for highest-risk categories (biometrics, critical infrastructure)
- Technical file must be maintained for 10 years

## Post-Market Monitoring (Article 72)
- Ongoing performance monitoring
- Incident reporting to market surveillance authority
- Serious incident reporting within 15 days
```

**Exercise:** For PracticeCLB's AI scoring system — write a mock EU AI Act technical file. Even though CELPIP prep is "limited risk," practicing the format is what matters.

Save to: `portfolio/eu-ai-act-mock-technical-file.md`

### Day 23 (Aug 5): Model Cards + Transparency Artifacts

Model cards are the industry standard for AI documentation. Every Track A employer expects you to know these.

**Read:** "Model Cards for Model Reporting" — Mitchell et al. (Google, 2018)
URL: https://arxiv.org/abs/1810.03993

**Create a model card for Mediqrate's AI system:**
```markdown
# Model Card: Vita AI Health Assistant

## Model Details
- Model type: LLM (Anthropic Claude Haiku via API)
- Intended use: Personal health tracking assistant
- Primary users: Canadian residents managing health data
- Languages: English

## Intended Use
- Primary use: Answer health questions, help log health metrics
- Out-of-scope: Medical diagnosis, emergency advice, prescription recommendations

## Performance
- Factual accuracy: Not independently validated
- Response latency: <2s average
- Availability: 99.5% (Anthropic API uptime)

## Data
- Input: User health queries and logged metrics (encrypted in transit)
- Training data: Not applicable (uses pre-trained model via API)
- Personal data: Processed under PIPEDA consent framework

## Risks and Limitations
- Hallucination risk: Model may generate inaccurate health information
- Bias: May reflect biases in training data
- Overreliance: Users should not use as substitute for medical professional

## Mitigation
- Clear disclaimers shown to users
- Emergency situations redirected to 911/crisis lines
- No diagnostic claims made in UI copy
- PHI encrypted client-side before LLM context

## Human Oversight
- All AI interactions logged for quality review
- User feedback mechanism available
- Medical content reviewed by [advisor] annually
```

### Days 24–28 (Aug 6–10): AIGP Study + Practice Questions

**Daily target:** 50 AIGP practice questions
**Resource:** IAPP practice exams + community questions

Key topics to master this week:
- AI incident response procedures
- Vendor AI risk assessment
- AI system documentation requirements
- Explainability requirements (GDPR Article 22, EU AI Act Art. 13)
- Human oversight mechanisms

---

## WEEK 5 (Aug 11–17): Interview Prep for Track A

### Day 29 (Aug 11): The Track A Interview Script

**Round 1 typical questions (and your exact answers):**

**Q: "What is the NIST AI Risk Management Framework?"**
> "The NIST AI RMF is a voluntary framework published in January 2023 that organizes AI risk management into four functions: Govern, Map, Measure, and Manage. Govern sets the organizational accountability structures. Map identifies and categorizes risks in context. Measure evaluates those risks quantitatively. Manage prioritizes and treats them. I've applied it directly to Mediqrate's AI pipeline — I can share the assessment if useful."

**Q: "How would you assess an AI vendor we're considering?"**
> "I'd use a third-party AI risk assessment framework with four areas: technical documentation — do they provide model cards, training data provenance, performance across demographic groups? Regulatory compliance — PIPEDA, EU AI Act if applicable, OSFI guidelines for financial data. Security posture — prompt injection protections, data handling practices, incident response SLA. And contractual obligations — what happens if the model behaves unexpectedly, what's the SLA, who owns the incident."

**Q: "What's the difference between AI safety and AI security?"**
> "AI safety focuses on ensuring AI systems behave as intended — avoiding harmful outputs, hallucinations, bias, overreliance. AI security focuses on protecting AI systems from adversarial actors — prompt injection, model theft, data poisoning, supply chain attacks. They overlap significantly: a successfully injected prompt is both a security failure and a safety failure. In practice, good AI governance programs address both, which is why my background in adversarial ML maps onto both disciplines."

**Q: "Walk me through how you'd build an AI governance program from scratch."**
> "I'd structure it in four phases aligned to NIST AI RMF. First, inventory: catalogue all AI systems, classify them by risk tier using EU AI Act criteria or similar. Second, assess: for each high-risk system, conduct a risk assessment — bias testing, security review, privacy impact assessment. Third, govern: establish policies, accountability structures, a review committee, an incident response plan. Fourth, monitor: implement ongoing performance tracking, drift detection, and a mechanism for employees to raise AI concerns. I'd deliver this through a risk register, model cards for each system, and quarterly reporting to the board."

### Days 30–35 (Aug 12–17): Industry-Specific Track A Prep

**Day 30: Financial Services (Banks)**
- Read: OSFI's "Model Risk Management" supervisory guidance
- Study: SR 11-7 (US model risk management — widely referenced in Canada too)
- Key vocabulary: Model validation, back-testing, champion/challenger models, model inventory

**Day 31: Healthcare AI (Mediqrate experience)**
- Read: Health Canada's AI in healthcare guidance
- Study: FDA's SaMD (Software as Medical Device) framework
- Your advantage: You built a healthcare AI app under PIPEDA

**Day 32: Government AI (Ottawa advantage)**
- Read: GC Digital Standards + Responsible AI guidelines (canada.ca)
- Study: Algorithmic Impact Assessment tool (Government of Canada)
- Key: AIA tiers 1–4 mirror EU AI Act risk tiers

**Day 33–35: Consulting Track A**
- Study: Deloitte and KPMG published AI governance whitepapers (freely available)
- These firms hire "AI Governance Consultants" — they want people who can advise clients
- Your edge: Real case study (Mediqrate + PracticeCLB audits)

---

## WEEK 6 (Aug 18–22): Final Prep + AIGP Exam

### Day 36–40: Full Mock Exams + Interview Prep (Exam Deferred)

**Days 36–38:** Complete 3 full 90-question AIGP practice exams. Target: 80%+
These are free practice questions — do not pay for the real exam yet.

**Day 39:** Review all wrong answers. Focus on regulations domain.
Create your Track A interview script from `resources/master-cheatsheet.md`.

**Day 40: Track A Application Prep 🎯**
- Polish your 3 Track A resume versions
- Write cover letter templates for Risk Analyst, Responsible AI, and Governance Lead
- Finalize your portfolio GitHub — all 5 pieces must be published
- Update LinkedIn headline + pin portfolio pieces as Featured
- **September 1 is 10 days away — you're ready**

> 💡 **AIGP Exam Timing:** Once you land a Track A role and receive your first paycheck,
> buy the AIGP exam ($799 USD). You'll pass easily since you've studied all the content.
> It then boosts your salary negotiation for your next role (13% premium per IAPP data).

---

## THE TRACK A APPLICATION PACKAGE (Ready Sep 1)

By the end of Week 6, you will have assembled:

### Documents Ready to Send
1. **Resume Version A** (Track A focus) — emphasize governance, research, production AI
2. **AIGP certification** (or "passed, certificate pending")
3. **Cover letter template** for each role type (Risk Analyst, Responsible AI, Governance Lead)

### Portfolio (link in every application)
1. `Mediqrate AI Risk Assessment` — NIST AI RMF applied to real system
2. `EU AI Act Mock Technical File` — PracticeCLB scoring system
3. `Canadian AI Regulation Cheatsheet` — shows regulatory awareness
4. `Bias Fairness Audit Demo` — Python code on GitHub
5. `Model Card: Vita AI` — demonstrates documentation skills
6. `AI Risk Register Template` — shows you can hit the ground running

### LinkedIn (visible before Sep 1)
- 6+ posts about AI governance topics
- AIGP certification listed
- Headline updated: "AI Governance & Security Specialist | AIGP | Adversarial ML Researcher | Founder"

---

## TRACK A RESUME POSITIONING

**For AI Risk Analyst (Banks):**
```
Summary line: "AI risk specialist with published research in adversarial ML, 
M.A.Sc. in Information Systems Security, and hands-on experience implementing 
PIPEDA-compliant AI systems. AIGP certified."

Top skills to list: NIST AI RMF · PIPEDA · EU AI Act · Model Risk Management 
· AI Risk Assessment · Prompt Injection Risks · PHI Data Handling
```

**For Responsible AI Specialist:**
```
Summary line: "Responsible AI practitioner with academic research background 
in AI failure modes, production experience securing ML systems, and 
governance expertise across EU AI Act, NIST AI RMF, and Canadian PIPEDA."

Top skills: AI Ethics · Bias/Fairness Testing · Model Documentation 
· Responsible AI Frameworks · Stakeholder Communication · Policy Development
```

---

## ✅ Chapter 00B Completion Checklist (by Aug 22)

### Frameworks Mastered
- [ ] NIST AI RMF: Can explain all 4 functions + subcomponents from memory
- [ ] EU AI Act: Can classify any AI system into risk tier + explain obligations
- [ ] ISO/IEC 42001: Understand the management system structure
- [ ] PIPEDA: Can apply to AI data processing scenarios
- [ ] AIDA/CPPA: Know current status and key provisions
- [ ] OSFI Model Risk: Know SR 11-7 equivalent in Canadian context
- [ ] Directive on Automated Decision-Making: Know the 4 impact tiers

### Portfolio Complete
- [ ] Mediqrate AI Risk Assessment (NIST AI RMF): Published on GitHub
- [ ] EU AI Act Technical File (mock): Complete
- [ ] Model Card for Vita AI: Published
- [ ] Bias Fairness Audit code: On GitHub
- [ ] Canadian AI Regulation Cheatsheet: In `resources/`

### Certification
- [ ] AIGP: Exam passed ✅ (or passed + certificate pending)

### LinkedIn
- [ ] 6+ posts on AI governance topics published
- [ ] Profile headline updated with AIGP
- [ ] Track A portfolio pieces pinned as Featured

### Interview Prep
- [ ] 4 Track A interview scripts practiced out loud
- [ ] 5 target companies researched in depth
- [ ] Cover letter template for each role type written

**When all complete → Begin Track A applications September 1 with confidence.**
