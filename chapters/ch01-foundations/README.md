# Chapter 1: Technical Foundations
## Days 4–18 | July 18 – August 1, 2026

> **Goal:** Solid enough Python, Linux, networking, and API security to not get stuck during security labs. You already know Python — this is a focused refresh toward *security use cases*.


> **Daily startup block (10:30 AM–11:30 AM) runs throughout this chapter.**
> Every morning: test Mediqrate + PracticeCLB, fix bugs, advance launch tasks.
> This is non-negotiable — it runs in parallel with all study chapters.
>
> **Your daily schedule during this chapter:**
> ```
> 10:30 AM–11:30 AM  🚀 Startup (Mediqrate + PracticeCLB)
> 11:30 AM–12:30 PM  🟡 Warm-up: Track A governance reading / Anki
> 12:30 PM–1:30 PM  🍽️ Lunch
> 1:30 PM–4:00 PM  🔴 Deep Work 1: this chapter's content
> 4:00 PM–4:15 PM  ☀️ Break
> 4:15 PM–6:30 PM  🔴 Deep Work 2: labs / practice / tools
> 6:30 PM–7:30 PM  🍽️ Dinner
> 7:30 PM–8:00 PM  🌿 Reset
> 8:00 PM–9:15 PM  🟡 Portfolio + LinkedIn + job research
> 9:15 PM–10:30 PM  🎬 Karpathy videos (2/evening until series done ~Day 8)
> 10:45 PM–11:00 PM  📝 Evening check-in → Claude commits
> ```


---

## What's New in This Chapter vs. Earlier Versions

**API Security added as a dedicated section (Days 13–14).** Live job postings for AI Security Engineer consistently list OAuth 2.0, JWT attacks, and API fuzzing as required skills. This was underrepresented before — it's fixed here.

---

## WEEK 1 (Days 4–10 | Jul 18–24)

### Days 4–7: Python for Security

#### Day 4 — Python Security Scripts
Write these 4 scripts from scratch. Save to `chapters/ch01-foundations/python-scripts/`.

```python
# Script 1: port_scanner.py
import socket
def scan_ports(host, start, end):
    open_ports = []
    for port in range(start, end + 1):
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(0.5)
        if sock.connect_ex((host, port)) == 0:
            open_ports.append(port)
        sock.close()
    return open_ports
print(scan_ports("127.0.0.1", 1, 1024))

# Script 2: http_security_header_checker.py
import requests
SECURITY_HEADERS = [
    "Strict-Transport-Security", "X-Content-Type-Options",
    "X-Frame-Options", "Content-Security-Policy", "Referrer-Policy"
]
def check_headers(url):
    resp = requests.get(url, timeout=5)
    missing = [h for h in SECURITY_HEADERS if h not in resp.headers]
    return {"missing": missing, "all_headers": dict(resp.headers)}
# Test on your own sites:
print(check_headers("https://practiceclb.com"))
print(check_headers("https://mediqrate.com"))

# Script 3: secret_scanner.py
import os, re
PATTERNS = {
    'API Key':    r'[Aa][Pp][Ii][-_]?[Kk][Ee][Yy]\s*[=:]\s*["\']?([A-Za-z0-9\-_]{20,})',
    'AWS Key':    r'AKIA[0-9A-Z]{16}',
    'Private Key':r'-----BEGIN (RSA |EC )?PRIVATE KEY-----',
    'Password':   r'[Pp][Aa][Ss][Ss][Ww][Oo][Rr][Dd]\s*[=:]\s*["\']?([^\s"\']{8,})'
}
def scan_dir(path):
    for root, _, files in os.walk(path):
        for f in files:
            if f.endswith(('.py','.js','.env','.yml','.yaml','.json','.ts')):
                content = open(os.path.join(root, f), errors='ignore').read()
                for name, pattern in PATTERNS.items():
                    if re.search(pattern, content):
                        print(f"⚠️  {name} in {os.path.join(root, f)}")

# Script 4: jwt_analyzer.py
import base64, json
def decode_jwt(token):
    parts = token.split('.')
    def decode_part(p):
        p += '=' * (4 - len(p) % 4)
        return json.loads(base64.urlsafe_b64decode(p))
    header = decode_part(parts[0])
    payload = decode_part(parts[1])
    alg = header.get('alg', 'unknown')
    issues = []
    if alg in ['none', 'HS256']:
        issues.append(f"Weak algorithm: {alg}")
    if 'exp' not in payload:
        issues.append("No expiration claim")
    return {"header": header, "payload": payload, "issues": issues}
```

#### Day 5 — TryHackMe: Linux Fundamentals
- [ ] Pre-Security → **Linux Fundamentals Part 1** (complete)
- [ ] Pre-Security → **Linux Fundamentals Part 2** (complete)
- Practice all commands in your actual terminal

#### Day 6 — TryHackMe: Networking
- [ ] Pre-Security → **How the Web Works** (complete)
- [ ] Pre-Security → **Network Fundamentals** (complete)
- Create: `resources/networking-cheatsheet.md`

#### Day 7 — Burp Suite Introduction
```
Download: portswigger.net/burp (Community Edition — free)
Watch: "Burp Suite for Beginners" YouTube (~30 min)

Hands-on:
1. Set up Burp as HTTP proxy (port 8080)
2. Browse any http:// site through Burp
3. Intercept a request, modify a header, resend
4. Use Repeater to replay requests
5. Browse practiceclb.com through Burp — what do you see?
```

### Days 8–10: Web Security Fundamentals

#### Day 8 — PortSwigger: SQL Injection + XSS
- [ ] portswigger.net/web-security → SQL Injection: All apprentice labs
- [ ] portswigger.net/web-security → XSS: All apprentice labs
- **Why:** Prompt injection is conceptually identical to SQL injection — same attack class, different target. Understanding one deeply teaches the other.

#### Day 9 — PortSwigger: CSRF + Authentication
- [ ] PortSwigger → Authentication: apprentice labs 1–3
- [ ] PortSwigger → CSRF: labs 1–2
- [ ] TryHackMe → **OWASP Top 10** room (complete fully)

#### Day 10 — Tools: nmap + Wireshark
```bash
# Install nmap
brew install nmap          # Mac
sudo apt install nmap      # Ubuntu

# Legal scan targets (your own sites):
nmap -sV localhost
nmap -sV -p 80,443 practiceclb.com
nmap -A -T4 scanme.nmap.org    # official nmap legal test target

# Wireshark: capture traffic while browsing an http:// site
# Filter: http
# Find: GET requests, cookies in plaintext, response codes
```

---

## WEEK 2 (Days 11–18 | Jul 25 – Aug 1)

### Days 11–12: Advanced Web Security

#### Day 11 — SSRF + Insecure Deserialization
- [ ] PortSwigger → SSRF: labs 1–2
- [ ] Read theory on Insecure Deserialization (no labs needed yet)
- **Why:** SSRF is how cloud metadata endpoints get exploited (AWS IMDS attacks). Critical for AI pipeline security.

#### Day 12 — Docker Security
```bash
# Docker is used in MLOps pipelines you'll audit

# Run a deliberately vulnerable app safely:
docker run -d -p 80:80 webgoat/webgoat-8.0

# Basic Docker security checks:
docker inspect container_name | grep -i user    # running as root? bad
docker history image_name                       # look for secrets in layers

# Trivy: scan Docker images for CVEs
brew install aquasecurity/trivy/trivy    # Mac
trivy image python:3.11                  # scan Python base image
trivy image node:18                      # scan Node base image
```

---

### Days 13–14: API Security (NEW — Added Based on Live Job Requirements)

Live job postings for AI Security Engineer consistently require API security knowledge.
This section fills that gap.

#### Day 13 — API Security Fundamentals

**Read:** OWASP API Security Top 10 — https://owasp.org/www-project-api-security/
Spend 2 hours reading all 10 vulnerabilities with their examples.

**The 10 API risks to know cold:**

| # | Risk | Quick Example |
|---|------|--------------|
| API1 | Broken Object Level Authorization (BOLA) | `/api/users/123/data` — change 123 to 124, get someone else's data |
| API2 | Broken Authentication | No rate limiting on login endpoint |
| API3 | Broken Object Property Level Authorization | User can update admin fields |
| API4 | Unrestricted Resource Consumption | No rate limiting on AI inference endpoint |
| API5 | Broken Function Level Authorization | Regular user calls `/api/admin/users` |
| API6 | Unrestricted Access to Sensitive Business Flows | Scraping all AI model outputs |
| API7 | Server-Side Request Forgery (SSRF) | AI tool calls attacker-controlled URL |
| API8 | Security Misconfiguration | Debug endpoints left enabled in production |
| API9 | Improper Inventory Management | Old API version still accessible |
| API10 | Unsafe Consumption of APIs | Trusting third-party API output without validation |

**Why this matters for AI Security:**
API4 (unrestricted resource consumption) is exactly what your AI budget enforcement system in PracticeCLB prevents. API7 (SSRF) is how an AI agent with tool-use can be hijacked to call attacker URLs. You've already implemented defenses for these in production — you just need the vocabulary to talk about it.

#### Day 14 — OAuth 2.0 + JWT Security (Critical for AI API Roles)

```python
# JWT Security Lab — save to chapters/ch01-foundations/python-scripts/jwt_security_lab.py

import base64, json, hmac, hashlib, time

# --- ATTACK 1: Algorithm Confusion (alg:none) ---
# Some JWT libraries trust the algorithm specified in the header
# An attacker can change alg to "none" and remove the signature

def create_forged_jwt(payload: dict) -> str:
    """Create a JWT with alg:none — valid signature omitted"""
    header = base64.urlsafe_b64encode(
        json.dumps({"alg": "none", "typ": "JWT"}).encode()
    ).rstrip(b'=').decode()
    
    body = base64.urlsafe_b64encode(
        json.dumps(payload).encode()
    ).rstrip(b'=').decode()
    
    # No signature — just an empty string after the dot
    return f"{header}.{body}."

# --- ATTACK 2: Weak Secret Brute Force ---
def check_weak_secrets(token: str, wordlist: list) -> str | None:
    """Try common secrets against an HS256 JWT"""
    parts = token.split('.')
    message = f"{parts[0]}.{parts[1]}".encode()
    original_sig = base64.urlsafe_b64decode(parts[2] + '==')
    
    for secret in wordlist:
        test_sig = hmac.new(secret.encode(), message, hashlib.sha256).digest()
        if test_sig == original_sig:
            return secret
    return None

# Test with common weak secrets:
COMMON_SECRETS = ["secret", "password", "123456", "jwt_secret", "admin", 
                  "development", "test", "key", "mysecret", "supersecret"]

# --- ATTACK 3: Expired Token Acceptance ---
def check_expiry_enforcement(decoded_payload: dict) -> bool:
    """Check if token validation actually enforces expiry"""
    exp = decoded_payload.get('exp', None)
    if exp is None:
        print("⚠️  No expiration claim — token never expires!")
        return False
    if exp < time.time():
        print(f"⚠️  Token expired {int(time.time() - exp)}s ago — does server reject it?")
        return False
    return True

# --- DEFENSE: Secure JWT validation checklist ---
SECURE_JWT_CHECKLIST = [
    "Algorithm explicitly whitelisted (not taken from token header)",
    "Expiration (exp) claim validated on every request",
    "Issued-at (iat) claim not in the future",
    "Audience (aud) claim validated if multi-service system",
    "Signature verified before payload is trusted",
    "Secrets are at least 256 bits for HS256",
    "RS256 preferred over HS256 for microservices"
]

# Apply to your own apps:
# Check PracticeCLB's Supabase JWT configuration
# Check Mediqrate's auth token handling
```

**OAuth 2.0 vulnerabilities to understand:**
- Open redirect in redirect_uri parameter
- CSRF on the authorization endpoint
- Token leakage in referrer headers
- State parameter not validated (CSRF)
- Implicit flow access token leakage

**TryHackMe room (if available):** Search "OAuth" in TryHackMe
**PortSwigger:** OAuth authentication labs (apprentice level)

---

### Days 15–18: Linux Security + Review

#### Day 15 — Linux Security Commands
```bash
# File permissions and ownership
ls -la /etc/shadow          # should be 640 or 000
chmod 600 sensitive_file
chown user:group file

# Running processes and network
ps aux | grep -v "root"
netstat -tulnp              # or: ss -tulnp
lsof -i :8080               # what's using port 8080?

# Log analysis (critical for security work)
tail -f /var/log/auth.log
grep "Failed password" /var/log/auth.log | tail -20
journalctl -u ssh --since "2 hours ago"

# File integrity
sha256sum important_file.py
find /tmp -perm -4000 2>/dev/null    # SUID files (privilege escalation vector)
find / -writable -type f 2>/dev/null | grep -v proc  # world-writable files

# Environment variable security (critical for AI apps)
env | grep -i "key\|secret\|token\|password"   # never should show in production
```

#### Day 16 — Privilege Escalation Concepts
- [ ] TryHackMe → **Linux Privilege Escalation** room
- Learn: sudo misconfigs, SUID binaries, cron job exploitation, PATH hijacking
- Why: AI services often run with overprivileged service accounts — you'll find these in audits

#### Day 17 — Chapter 1 Review + API Security Audit of Your Own Apps

**Self-audit exercise:**
Spend this full day auditing PracticeCLB's API endpoints using what you've learned.

```bash
# Test for common issues on your own API:
# 1. Missing auth
curl https://practiceclb.com/api/admin/users   # should 401

# 2. IDOR (change user ID in URL)
curl -H "Authorization: Bearer YOUR_TOKEN" \
  https://practiceclb.com/api/users/OTHER_USER_ID

# 3. Rate limiting
for i in {1..20}; do
  curl -X POST https://practiceclb.com/api/auth/login \
    -d '{"email":"test@test.com","password":"wrong"}'
done
# Should start returning 429 after ~5 attempts

# 4. Security headers
curl -I https://practiceclb.com | grep -E "Strict|X-Frame|Content-Security|X-Content"
```

Document findings in: `portfolio/practiceclb-api-security-audit.md`
This is real portfolio work on a real system.

#### Day 18 — Full Review Day
- [ ] Review all Python scripts — explain every line without looking at notes
- [ ] TryHackMe Pre-Security path: 100% complete
- [ ] Review networking cheatsheet
- [ ] Review API Security OWASP Top 10 from memory
- [ ] `resources/ch01-summary.md` — write key things learned
- [ ] Git commit everything

---

## 📚 Chapter 1 Resources

### TryHackMe Rooms (complete in order)
1. Pre-Security Path (all rooms)
2. Linux Fundamentals 1, 2, 3
3. OWASP Top 10
4. Linux Privilege Escalation
5. HTTP in Detail
6. Introductory Networking

### PortSwigger Web Security Academy (free)
- SQL Injection: all apprentice
- XSS: all apprentice
- Authentication: apprentice 1–3
- CSRF: 1–2
- SSRF: 1–2
- OAuth: apprentice labs

---

## ✅ Chapter 1 Completion Checklist

**Python Security:**
- [ ] 4 security scripts written from scratch
- [ ] JWT analysis script: built and tested
- [ ] Secret scanner: run against your own repos

**Web Security:**
- [ ] PortSwigger: 15+ apprentice labs complete
- [ ] TryHackMe: Pre-Security 100% complete
- [ ] Burp Suite: configured and used

**API Security (NEW):**
- [ ] OWASP API Security Top 10: can explain each from memory
- [ ] OAuth 2.0 vulnerabilities: understand the 5 main attack types
- [ ] JWT security: understand alg:none, weak secrets, expiry bypass
- [ ] PracticeCLB API audit: documented in portfolio

**Tools:**
- [ ] nmap: used against your own sites
- [ ] Wireshark: captured and analyzed traffic
- [ ] Docker + Trivy: scanned an image
- [ ] Burp Suite: intercepted and modified a real request

**When all complete → Chapter 2**
