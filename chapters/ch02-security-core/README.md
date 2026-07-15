# Chapter 2: Security Core — CompTIA Security+ Prep
## Days 19–33 | August 1–14, 2026
## 🎯 Target: Pass CompTIA Security+ SY0-701 by August 14

> **Why Security+ first?** It's the most recognized entry-level security cert in Canada. Government agencies (CSE, CSIS, DND) require it. Banks love it. It validates your security vocabulary to every recruiter. Most importantly — studying for it fills the gaps in foundational security knowledge that your ML/software background left open.

---

## The Exam Blueprint (SY0-701)

| Domain | Weight | Your Starting Level |
|--------|--------|-------------------|
| 1.0 General Security Concepts | 12% | Medium |
| 2.0 Threats, Vulnerabilities & Mitigations | 22% | Low-Medium |
| 3.0 Security Architecture | 18% | Medium (cloud background) |
| 4.0 Security Operations | 28% | Low-Medium |
| 5.0 Security Program Management | 20% | Low |

**Passing score:** 750/900
**Exam cost:** ~$380 CAD (Pearson VUE)
**Format:** 90 questions (multiple choice + performance-based), 90 minutes

---

## WEEK 1 of Chapter 2 (Days 19–25 | Aug 1–7)

### Primary Study Resource
**Udemy: "CompTIA Security+ (SY0-701) Complete Course"** by Jason Dion or Mike Chapple
- Buy during a sale: ~$15 CAD
- Watch at 1.25x speed for review material, 1.0x for new concepts

### Daily Schedule for Ch02

Each day follows this structure:
- **Morning (07:00–09:00):** Study new domain — read + watch videos
- **Labs (09:15–11:15):** TryHackMe rooms matching today's domain
- **Afternoon (13:00–15:00):** Practice questions (50 questions minimum)
- **Project (15:15–17:15):** Apply today's learning to your own systems
- **Evening (19:00–20:30):** Flashcard review (use Anki — free)

---

### Day 19 — Domain 1: Cryptography + PKI
**Study:**
- Symmetric vs Asymmetric encryption (AES, RSA, ECC)
- Hashing (SHA-256, MD5 — why MD5 is broken)
- Digital signatures, certificates, PKI hierarchy
- TLS handshake — draw it on paper from memory

**TryHackMe:**
- [ ] Room: "Cryptography for Complete Beginners"
- [ ] Room: "Hashing — Crypto 101"

**Apply to your work:**
- Review PracticeCLB's HTTPS configuration
- Check certificate expiry and cipher suites:
  ```bash
  openssl s_client -connect practiceclb.com:443
  # Look for: protocol version, cipher suite, certificate chain
  ```

**Flashcards to create (Anki):**
- What is the difference between symmetric and asymmetric encryption?
- What makes SHA-256 different from MD5?
- What is a Certificate Authority?
- What happens during a TLS handshake?

---

### Day 20 — Domain 1: Access Control + Identity
**Study:**
- Authentication factors (something you know/have/are)
- MFA, SSO, SAML, OAuth, OpenID Connect
- Zero Trust Architecture
- Role-Based Access Control (RBAC) vs Attribute-Based (ABAC)

**TryHackMe:**
- [ ] Room: "Active Directory Basics"
- [ ] Room: "Authentication Bypass"

**Apply:**
- Audit Mediqrate's and PracticeCLB's auth systems against what you just learned
- Document: `portfolio/auth-security-audit-notes.md`

---

### Day 21 — Domain 2: Threat Landscape
**Study:**
- Threat actors: Nation-state, hacktivist, insider, cybercriminal
- Attack vectors: Phishing, social engineering, supply chain
- Malware types: Ransomware, rootkit, RAT, worm, trojan
- CVE, CVSS scoring system
- Threat intelligence feeds

**TryHackMe:**
- [ ] Room: "Threat Intelligence Tools"
- [ ] Room: "MITRE ATT&CK" (learn this framework — parallel to ATLAS for AI)

**Note:** MITRE ATT&CK (traditional IT) + MITRE ATLAS (AI systems) = your complete picture

---

### Day 22 — Domain 2: Vulnerabilities + Social Engineering
**Study:**
- OWASP Top 10 (web) — you've seen these, now memorize them
- Buffer overflow, SQL injection, XSS, CSRF, SSRF
- Phishing variants: Spear phishing, vishing, smishing, whaling
- How to conduct a phishing simulation

**Practice Questions:** Do 75 questions on domains 1–2 (Dion practice tests)
**Target:** Score 75%+ before moving on

---

### Day 23 — Domain 3: Network Security Architecture
**Study:**
- Firewalls: Stateful vs stateless, WAF, NGFW
- VPNs: Site-to-site, remote access, IPSec, SSL/TLS VPN
- Network segmentation, DMZ, VLANs
- IDS vs IPS (detection vs prevention)
- Proxy servers, load balancers

**TryHackMe:**
- [ ] Room: "Network Security"
- [ ] Room: "Firewalls"

---

### Day 24 — Domain 3: Cloud Security Architecture
**Study (this should feel familiar from your startup days):**
- Shared responsibility model (your MOST important concept for cloud security)
- Cloud security controls: CASB, CSPM, CWPP
- Virtualization security, hypervisor vulnerabilities
- Serverless security (Lambda function risks)
- Container security (Docker, Kubernetes)

**Apply:**
- Map your Mediqrate + PracticeCLB infrastructure against the shared responsibility model
- Identify: what YOU are responsible for vs what Vercel/Supabase/Cloudflare covers
- Document any gaps: `portfolio/cloud-responsibility-matrix.md`

---

### Day 25 — Review Day 1 + Practice Exam
- [ ] Complete a full 90-question practice exam (Dion or ExamCompass)
- [ ] Target: 70%+ (if below 65%, revisit weaker domains)
- [ ] Create a list of every question you got wrong — study those topics only
- [ ] Review flashcards (Anki, spaced repetition)

---

## WEEK 2 of Chapter 2 (Days 26–33 | Aug 8–14)

### Day 26 — Domain 4: Security Operations — Monitoring
**Study:**
- SIEM: what it is, how it works (Splunk, Microsoft Sentinel)
- Log management, log retention
- SOAR (Security Orchestration, Automation, Response)
- SOC tiers (Tier 1 analyst → Tier 3 threat hunter)

**TryHackMe:**
- [ ] Room: "Splunk: Basics"
- [ ] Room: "Investigating with Splunk"

**Relevance to AI Red Teaming:**
- SIEM is how defenders catch your attacks
- Understanding it makes you a better attacker AND makes you valuable as an AI security engineer who bridges both worlds

---

### Day 27 — Domain 4: Incident Response
**Study:**
- IR lifecycle: Preparation → Identification → Containment → Eradication → Recovery → Lessons Learned
- NIST SP 800-61 (Incident Handling Guide) — read the executive summary
- Digital forensics: Chain of custody, evidence preservation
- Memory forensics, disk forensics

**TryHackMe:**
- [ ] Room: "Intro to IR and Forensics"

---

### Day 28 — Domain 4: Vulnerability Management
**Study:**
- Vulnerability scanning vs penetration testing (critical difference)
- Tools: Nessus, OpenVAS, Qualys
- CVSS scoring: Critical (9.0–10.0), High, Medium, Low
- Patch management lifecycle
- Zero-day vs disclosed vulnerability

**Hands-on:**
```bash
# OpenVAS (free vulnerability scanner)
# Install on Kali Linux or Docker:
docker run -d -p 9392:9392 mikesplain/openvas

# Nmap scripting engine for vulnerability scanning:
nmap --script vuln scanme.nmap.org
nmap -sV --script=banner localhost
```

---

### Day 29 — Domain 5: Security Program Management
**Study:**
- Risk management: Risk appetite, risk tolerance, residual risk
- Security frameworks: NIST CSF, ISO 27001, SOC 2
- Data classification: Public, Internal, Confidential, Restricted
- Privacy regulations: PIPEDA (Canadian), GDPR, HIPAA
- Business continuity vs Disaster recovery

**Key Canadian context:**
- PIPEDA is Canada's main privacy law (you're already compliant with it for Mediqrate)
- Bill C-27 / CPPA (Canada's new AI regulation) — read the overview
- This knowledge makes you credible to Canadian employers immediately

---

### Day 30 — Domain 5: Governance, Ethics, Compliance
**Study:**
- Security policies, standards, procedures, guidelines (hierarchy)
- Data retention policies
- Third-party vendor risk management
- AI-specific regulations: EU AI Act (global impact), Canada's AIDA

**Create:** `resources/canadian-ai-regulation-cheatsheet.md`
- PIPEDA requirements for AI systems
- Bill C-27 key provisions
- How EU AI Act affects Canadian companies

---

### Day 31 — Full Practice Exam + Review
- [ ] Take TWO full 90-question practice exams (back to back)
- [ ] Target: 80%+ on both
- [ ] Review every wrong answer — understand WHY, not just WHAT
- [ ] Go back and review any domain below 75%

---

### Day 32 — Performance-Based Questions (PBQ) Practice
Security+ has "Performance Based Questions" — drag-and-drop, simulation tasks.

**Practice:**
- [ ] Professor Messer's PBQ practice (free on YouTube)
- [ ] ExamCompass performance-based question simulations
- Common PBQ types: firewall rule configuration, network diagram analysis, log analysis

---

### Day 33 — EXAM DAY 🎯
**The night before:**
- No new studying after 20:00
- Review your flashcards for 30 min
- Sleep 8 hours (seriously — this matters more than cramming)

**Exam day:**
- Light breakfast, water
- Arrive 30 min early to testing center (Pearson VUE in Ottawa)
- Read questions carefully — eliminate 2 wrong answers first
- Flag unsure questions and come back
- Performance-based questions: do them last if time is short

**Post-exam:**
- Pass: Add to LinkedIn IMMEDIATELY. Update resume. Celebrate (you earned it).
- Fail: Check score report for weak domains. Schedule retake in 14 days.

---

## 📚 Chapter 2 Resources

### Primary
- Udemy: CompTIA Security+ (SY0-701) — Jason Dion or Mike Chapple (~$15)
- Professor Messer's Free Security+ Course: professormesser.com (free)
- ExamCompass Practice Tests: examcompass.com (free, 3,000+ questions)

### TryHackMe Rooms for This Chapter
- Phishing Room
- MITRE Room
- Splunk Basics
- Network Security
- Hashing — Crypto 101
- Authentication Bypass
- Threat Intelligence Tools

### Books (optional but great)
- "CompTIA Security+ Study Guide" — Mike Chapple & David Seidl (8th Ed)

---

## ✅ Chapter 2 Completion Checklist

- [ ] Completed Security+ video course (Udemy)
- [ ] 500+ practice questions done
- [ ] Score 80%+ on practice exams consistently
- [ ] All TryHackMe rooms for this chapter completed
- [ ] Anki deck: 200+ flashcards created and reviewed
- [ ] Canadian privacy law cheatsheet created
- [ ] Cloud responsibility matrix for your apps documented
- [ ] **CompTIA Security+ exam PASSED** ✅

**When complete → move to Chapter 3**
