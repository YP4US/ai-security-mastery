# Chapter 6: MLSecOps — Securing the ML Pipeline
## Days 72–85 | September 22 – October 5, 2026

> **Goal:** Understand how to secure the entire ML development lifecycle — from data collection to production inference. This makes you valuable to teams building AI, not just attacking it.


> **Daily startup block (10:30–11:30) runs throughout this chapter.**
> Every morning: test Mediqrate + PracticeCLB, fix bugs, advance launch tasks.
> This is non-negotiable — it runs in parallel with all study chapters.
>
> **Your daily schedule during this chapter:**
> ```
> 10:30–11:30  🚀 Startup (Mediqrate + PracticeCLB)
> 11:30–12:30  🟡 Warm-up: Track A governance reading / Anki
> 12:30–13:30  🍽️ Lunch
> 13:30–16:00  🔴 Deep Work 1: this chapter's content
> 16:00–16:15  ☀️ Break
> 16:15–18:30  🔴 Deep Work 2: labs / practice / tools
> 18:30–19:30  🍽️ Dinner
> 19:30–20:00  🌿 Reset
> 20:00–21:15  🟡 Portfolio + LinkedIn + job research
> 21:15–22:30  🎬 Karpathy videos (2/evening until series done ~Day 8)
> 22:45–23:00  📝 Evening check-in → Claude commits
> ```


---

## The MLSecOps Pipeline (and Where to Attack Each Stage)

```
DATA COLLECTION → DATA PROCESSING → MODEL TRAINING → MODEL EVALUATION
     ↓                  ↓                 ↓                  ↓
[Poisoning]      [PII leakage]    [Supply chain]    [Backdoor testing]

MODEL REGISTRY → MODEL SERVING → MONITORING → INCIDENT RESPONSE
     ↓                ↓               ↓               ↓
[Model theft]   [API attacks]   [Evasion detect]  [Response plan]
```

---

## Days 72–75: Securing the Data Pipeline

### Day 72 — Data Security + Privacy
```python
# Detect PII in training datasets — this is real MLSecOps work
import re
from presidio_analyzer import AnalyzerEngine

analyzer = AnalyzerEngine()

# Scan training data for PII
def scan_for_pii(text):
    results = analyzer.analyze(text=text, language='en')
    findings = []
    for result in results:
        findings.append({
            "entity_type": result.entity_type,
            "start": result.start,
            "end": result.end,
            "score": result.score,
            "text": text[result.start:result.end]
        })
    return findings

# Test with sample training data
sample_data = [
    "My name is John Smith and my SSN is 123-45-6789",
    "Contact me at john@company.com or 416-555-0123",
    "The patient's health record ID is MRN12345"
]

for text in sample_data:
    pii = scan_for_pii(text)
    if pii:
        print(f"⚠️ PII found: {pii}")

# Save tool to: portfolio/pii-scanner/
```

### Day 73 — Data Poisoning Defense
```python
# Implement data validation pipeline to catch poisoned samples

import numpy as np
from scipy import stats

def detect_poisoned_samples(dataset, labels, contamination=0.05):
    """
    Statistical outlier detection for training data
    Based on your research in anomaly detection!
    """
    # Feature extraction (simplified)
    text_lengths = [len(str(d)) for d in dataset]
    
    # Z-score outlier detection (from your statistics background)
    z_scores = np.abs(stats.zscore(text_lengths))
    outliers = np.where(z_scores > 3)[0]
    
    # Flag for human review
    suspicious = []
    for idx in outliers:
        suspicious.append({
            "index": idx,
            "sample": dataset[idx][:100],
            "label": labels[idx],
            "z_score": z_scores[idx],
            "reason": "Statistical outlier — review for poisoning"
        })
    
    return suspicious

# This is DIRECTLY your anomaly detection research applied to MLSecOps
```

### Day 74 — Model Supply Chain Security
```python
# Secure model loading — prevent pickle injection
from safetensors import safe_open
import hashlib

def secure_model_load(model_path: str, expected_sha256: str):
    """
    Load a model file only if its hash matches the expected value.
    This prevents tampered models from being loaded.
    """
    # Verify hash
    with open(model_path, 'rb') as f:
        actual_hash = hashlib.sha256(f.read()).hexdigest()
    
    if actual_hash != expected_sha256:
        raise SecurityError(f"Model hash mismatch! Expected {expected_sha256}, got {actual_hash}")
    
    # Use safetensors format (no arbitrary code execution)
    with safe_open(model_path, framework="pt") as f:
        model_state = {key: f.get_tensor(key) for key in f.keys()}
    
    return model_state

# Also check model provenance on HuggingFace:
from huggingface_hub import model_info

def verify_model_provenance(model_id: str):
    info = model_info(model_id)
    return {
        "author": info.author,
        "downloads": info.downloads,
        "likes": info.likes,
        "last_modified": info.lastModified,
        "tags": info.tags,
        "has_security_scan": any("security" in t for t in (info.tags or []))
    }
```

### Day 75 — MLflow Security Hardening
```python
# MLflow is the most common MLOps platform — learn to secure it

# Vulnerabilities to test (on your own MLflow instance):
# 1. Unauthenticated access to model registry
# 2. Path traversal in artifact download
# 3. Malicious model artifact injection

# Start a local MLflow server (for testing)
# mlflow server --host 0.0.0.0 --port 5000 (INSECURE default)
# mlflow server --host 127.0.0.1 --port 5000 (SECURE — localhost only)

# Secure MLflow deployment checklist:
MLFLOW_SECURITY_CHECKLIST = [
    "Authentication enabled (--auth-config-path)",
    "HTTPS configured",
    "Network access restricted to authorized IPs only",
    "Artifact store access controlled via IAM",
    "Audit logging enabled",
    "Model signing implemented",
    "Dependency scanning on saved models"
]
```

---

## Days 76–79: Runtime Security + Monitoring

### Day 76 — Inference API Security
```python
# Secure an AI inference endpoint
from fastapi import FastAPI, Depends, HTTPException, Request
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
import time
from collections import defaultdict

app = FastAPI()
security = HTTPBearer()

# Rate limiting (important for AI services — cost and DDoS protection)
request_counts = defaultdict(list)

def rate_limit(request: Request, max_requests: int = 10, window_seconds: int = 60):
    client_ip = request.client.host
    now = time.time()
    
    # Clean old requests
    request_counts[client_ip] = [
        t for t in request_counts[client_ip] 
        if now - t < window_seconds
    ]
    
    if len(request_counts[client_ip]) >= max_requests:
        raise HTTPException(status_code=429, detail="Rate limit exceeded")
    
    request_counts[client_ip].append(now)

# Input validation for AI endpoints
def validate_ai_input(text: str, max_length: int = 4000):
    """Validate and sanitize AI inputs"""
    if len(text) > max_length:
        raise HTTPException(400, "Input too long — possible prompt stuffing attack")
    
    # Check for known injection patterns
    injection_indicators = [
        "ignore previous",
        "system prompt",
        "jailbreak",
        "you are now",
        "disregard all"
    ]
    
    text_lower = text.lower()
    for indicator in injection_indicators:
        if indicator in text_lower:
            # Log the attempt but don't block (log for analysis)
            print(f"⚠️ Possible injection attempt detected: {indicator}")
    
    return text

@app.post("/ai/chat")
async def secure_chat(
    request: Request,
    credentials: HTTPAuthorizationCredentials = Depends(security)
):
    # Rate limiting
    rate_limit(request)
    
    # Auth check
    if credentials.credentials != "valid-api-key":
        raise HTTPException(401, "Invalid credentials")
    
    body = await request.json()
    user_input = validate_ai_input(body.get("message", ""))
    
    # Process...
    return {"response": "Processed securely"}
```

### Day 77 — Guardrails Implementation
```python
# Implement guardrails using Nemo Guardrails (NVIDIA, open source)
# pip install nemoguardrails

# Alternative: build your own
class AIGuardrail:
    def __init__(self):
        self.blocked_patterns = [
            r"system\s+prompt",
            r"ignore\s+(previous|all)",
            r"jailbreak",
            r"\bDAN\b",
        ]
        self.sensitive_output_patterns = [
            r"\b\d{3}-\d{2}-\d{4}\b",  # SSN
            r"\b[A-Z]{2}\d{6}\b",       # Passport number
            r"password\s*[:=]\s*\S+",    # Passwords
        ]
    
    def check_input(self, text: str) -> dict:
        import re
        violations = []
        for pattern in self.blocked_patterns:
            if re.search(pattern, text, re.IGNORECASE):
                violations.append(pattern)
        return {"safe": len(violations) == 0, "violations": violations}
    
    def check_output(self, text: str) -> dict:
        import re
        violations = []
        for pattern in self.sensitive_output_patterns:
            matches = re.findall(pattern, text, re.IGNORECASE)
            if matches:
                violations.extend(matches)
        return {"safe": len(violations) == 0, "sensitive_data_found": violations}
```

### Day 78 — AI Incident Response Plan
Create: `portfolio/ai-incident-response-playbook.md`

```markdown
# AI Security Incident Response Playbook

## Incident Classification

| Severity | Definition | Response Time | Examples |
|----------|-----------|---------------|---------|
| P0 Critical | AI system actively causing harm or leaking data | 1 hour | Model outputting PII, Admin bypass achieved |
| P1 High | Active exploitation attempt, service degraded | 4 hours | Sustained injection attacks, rate limit bypass |
| P2 Medium | Vulnerability confirmed, not yet exploited | 24 hours | Prompt injection possible, jailbreak found |
| P3 Low | Suspicious behavior, needs investigation | 72 hours | Unusual query patterns, minor policy violation |

## Response Steps

### P0/P1 Response:
1. CONTAIN: Rate-limit or take AI endpoint offline if actively exploited
2. ASSESS: Preserve logs, capture attack prompts, document model responses
3. NOTIFY: Security team, legal (if PII involved), leadership
4. ERADICATE: Patch vulnerability, update guardrails, rotate keys
5. RECOVER: Staged re-enablement with enhanced monitoring
6. REVIEW: Post-incident analysis within 5 business days
```

### Day 79 — CAISP Certification Prep Starts
**Certified AI Security Professional (Practical DevSecOps)**
- Cost: ~$500 USD
- URL: https://www.practical-devsecops.com/certified-ai-security-professional/
- Format: Browser-based labs (hands-on, not multiple choice!)
- This cert is the most respected specifically for AI security in the industry

Start the prep course and complete the first 3 modules.

---

## Days 80–83: End-to-End MLSecOps Audit

### Days 80–81 — Audit PracticeCLB's AI Pipeline
This is real work on a real system you built. Document it as a professional audit.

**Audit checklist:**
```markdown
## PracticeCLB AI Pipeline Security Audit

### Data Security
- [ ] Training data: contains any PII? → Run presidio scan
- [ ] API keys: hardcoded anywhere? → Run secret scanner
- [ ] Prompt templates: injection-safe? → Test all prompts

### Model Security
- [ ] Models used: provenance verified? (Gemini, Claude)
- [ ] Model outputs: validated before returning to user?
- [ ] Scoring prompts: can they be manipulated by user input?

### Infrastructure
- [ ] AI budget enforcement: can it be bypassed?
- [ ] Rate limiting: tested with burst traffic?
- [ ] Auth on AI routes: all routes protected?

### Monitoring
- [ ] Unusual query patterns: logged?
- [ ] AI cost anomalies: alerted?
- [ ] Failed auth attempts: tracked?
```

### Days 82–83 — Audit Mediqrate's AI Pipeline
Same audit structure applied to Mediqrate's Vita AI system.

This creates **two real security audits on real systems** — which is exactly what hiring managers want to see.

### Days 84–85 — CAISP Exam Prep + Documentation
- [ ] Complete CAISP prep modules 4–6
- [ ] Package both audit reports as PDFs: `portfolio/`
- [ ] Write LinkedIn post about the audits (sanitize sensitive findings)
- [ ] Update resume with CAISP "in progress"

---

## ✅ Chapter 6 Checklist
- [ ] PII scanner built and run on a dataset
- [ ] Data poisoning detection script written
- [ ] Secure model loading implemented
- [ ] MLflow: security checklist complete
- [ ] Secure FastAPI AI endpoint with guardrails built
- [ ] AI incident response playbook written
- [ ] PracticeCLB AI audit: complete with report
- [ ] Mediqrate AI audit: complete with report
- [ ] CAISP: at least 6 modules complete
- [ ] LinkedIn post about audit work: published

**When complete → Chapter 7 (Projects!)**
