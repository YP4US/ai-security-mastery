# Chapter 1: Technical Foundations
## Days 3–17 | July 17–31, 2026

> **Goal:** Be fluent enough in Python scripting, Linux CLI, and networking fundamentals to not get stuck during security labs. You already know Python — this is a focused refresh toward *security use cases*.

---

## Why This Chapter Matters

Security tools are built in Python. Security labs run on Linux. Security attacks travel over networks. Every single thing in Chapters 2–7 assumes you're comfortable here. This is not optional groundwork — it's the language you'll think in for the rest of the journey.

**The good news:** You have a CS degree + ML background. This chapter will feel fast. Aim to complete it in 12 days instead of 15 if you're moving quickly.

---

## WEEK 1 of Chapter 1 (Days 3–9 | Jul 17–23)

### Python for Security — Days 3–6

**Primary resource:** Python security labs on TryHackMe + your own scripts

#### Day 3 — Python Refresh for Security
```python
# Morning: Write these 5 scripts from scratch. No copy-paste.
# Save all to: chapters/ch01-foundations/python-scripts/

# Script 1: port_scanner.py
# Scan a range of ports on localhost, print which are open
import socket

def scan_ports(host, start, end):
    open_ports = []
    for port in range(start, end + 1):
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(0.5)
        result = sock.connect_ex((host, port))
        if result == 0:
            open_ports.append(port)
        sock.close()
    return open_ports

print(scan_ports("127.0.0.1", 1, 1024))

# Script 2: http_header_checker.py
# Fetch headers from a URL and flag missing security headers
import requests

SECURITY_HEADERS = [
    "Strict-Transport-Security",
    "X-Content-Type-Options",
    "X-Frame-Options",
    "Content-Security-Policy",
    "Referrer-Policy"
]

def check_headers(url):
    resp = requests.get(url, timeout=5)
    missing = [h for h in SECURITY_HEADERS if h not in resp.headers]
    return {"url": url, "missing": missing, "present": dict(resp.headers)}

print(check_headers("https://practiceclb.com"))  # test your own site!
```

#### Day 4 — TryHackMe: Linux Fundamentals
- [ ] TryHackMe → Pre-Security → **Linux Fundamentals Part 1** (complete fully)
- [ ] TryHackMe → Pre-Security → **Linux Fundamentals Part 2** (complete fully)
- Afternoon: practice ALL commands in your own terminal

#### Day 5 — TryHackMe: Networking
- [ ] TryHackMe → Pre-Security → **How the Web Works** (complete fully)
- [ ] TryHackMe → Pre-Security → **Network Fundamentals** (complete fully)
- Create: `resources/networking-cheatsheet.md` (TCP/IP, DNS, HTTP, HTTPS, ports)

#### Day 6 — Python Security Scripts (Advanced)
```python
# Script 3: jwt_decoder.py
# Decode a JWT token and check for weak algorithms
import base64, json

def decode_jwt(token):
    parts = token.split('.')
    # Decode header and payload (base64url)
    header = json.loads(base64.b64decode(parts[0] + '=='))
    payload = json.loads(base64.b64decode(parts[1] + '=='))
    alg = header.get('alg', 'unknown')
    if alg in ['none', 'HS256']:
        print(f"⚠️  Weak algorithm detected: {alg}")
    return header, payload

# Script 4: api_fuzzer.py
# Fuzz an API endpoint with common injection payloads
import requests

PAYLOADS = [
    "' OR '1'='1",
    "<script>alert(1)</script>",
    "{{7*7}}",
    "../../../../etc/passwd",
    "${7*7}",
    "UNION SELECT 1,2,3--"
]

def fuzz_endpoint(url, param):
    for payload in PAYLOADS:
        resp = requests.get(url, params={param: payload})
        if any(p in resp.text for p in ['error', 'exception', '49', 'root:']):
            print(f"POTENTIAL VULN with payload: {payload}")

# Script 5: env_secret_scanner.py
# Scan a directory for accidentally committed secrets
import os, re

PATTERNS = {
    'API Key': r'[Aa][Pp][Ii][-_]?[Kk][Ee][Yy]\s*[=:]\s*["\']?([A-Za-z0-9\-_]{20,})',
    'AWS Key': r'AKIA[0-9A-Z]{16}',
    'Private Key': r'-----BEGIN (RSA |EC )?PRIVATE KEY-----',
    'Password': r'[Pp][Aa][Ss][Ss][Ww][Oo][Rr][Dd]\s*[=:]\s*["\']?([^\s"\']{8,})'
}

def scan_dir(path):
    for root, _, files in os.walk(path):
        for f in files:
            if f.endswith(('.py', '.js', '.env', '.yml', '.yaml', '.json')):
                fp = os.path.join(root, f)
                content = open(fp, errors='ignore').read()
                for name, pattern in PATTERNS.items():
                    if re.search(pattern, content):
                        print(f"⚠️  {name} found in {fp}")
```

### Networking for Security — Days 7–9

#### Day 7 — TryHackMe: How the Internet Actually Works
- [ ] TryHackMe → **How Websites Work** room
- [ ] TryHackMe → **HTTP in Detail** room
- [ ] Practice: Use `curl -v https://practiceclb.com` and understand every line of output
- [ ] Learn: What is TLS/HTTPS handshake? Draw it out on paper.

#### Day 8 — Tools: Wireshark + nmap
```bash
# Install Wireshark (GUI packet analyzer)
# https://wireshark.org/download

# Install nmap (network scanner)
# Mac: brew install nmap
# Ubuntu: sudo apt install nmap

# Practice:
nmap -sV localhost                    # scan your own machine
nmap -sV -p 80,443 practiceclb.com   # scan your own site
nmap -A -T4 scanme.nmap.org          # legal nmap test target

# In Wireshark:
# Capture traffic while browsing http:// (not https) site
# Filter: http
# Find: GET requests, responses, cookies in plaintext
```

#### Day 9 — Burp Suite Introduction
```
Download Burp Suite Community (free): https://portswigger.net/burp
Watch: "Burp Suite for Beginners" (YouTube, ~30 min)

Practice:
1. Set up Burp as HTTP proxy
2. Browse a site through Burp
3. Intercept a request
4. Modify a header and resend
5. Use Repeater to replay requests
```

---

## WEEK 2 of Chapter 1 (Days 10–17 | Jul 24–31)

### Web Security Fundamentals — Days 10–14

#### Day 10–11 — PortSwigger Web Security Academy (FREE)
Go to: https://portswigger.net/web-security

Complete these labs IN ORDER:
- [ ] SQL Injection: All apprentice labs
- [ ] Cross-Site Scripting (XSS): All apprentice labs
- [ ] CSRF: Lab 1–2
- [ ] Insecure Deserialization: Read the theory

> **Why?** Web attack fundamentals are the foundation of *all* red teaming. LLM prompt injection is conceptually identical to SQL injection — same attack class, different target.

#### Day 12 — Authentication Attacks
- [ ] PortSwigger: Authentication labs (apprentice level)
- [ ] Learn: JWT attacks, OAuth vulnerabilities, session fixation
- [ ] TryHackMe: **OWASP Top 10** room (complete fully)

#### Day 13 — API Security
- [ ] Read: OWASP API Security Top 10 (https://owasp.org/www-project-api-security/)
- [ ] Practice: Use Postman + Burp to test your OWN PracticeCLB API endpoints
  - Test for: missing auth, rate limiting bypass, IDOR vulnerabilities
- [ ] Document findings in: `portfolio/practiceclb-api-security-notes.md`

#### Day 14 — Review + Practice Day
- [ ] Complete any incomplete PortSwigger labs
- [ ] TryHackMe: **Introductory Networking** room
- [ ] Write `resources/security-glossary.md` (define 50 security terms in YOUR words)

### Linux Security — Days 15–17

#### Day 15 — Linux for Security
```bash
# These commands must become muscle memory:
# File permissions
ls -la
chmod 600 ~/.ssh/id_rsa
chown user:group file

# Process and network
ps aux | grep suspicious
netstat -tulnp
ss -tulnp
lsof -i :8080

# Log analysis (crucial for blue team awareness)
tail -f /var/log/syslog
grep "Failed password" /var/log/auth.log
journalctl -u ssh --since "1 hour ago"

# File hashing (integrity checking)
sha256sum file.py
md5sum file.py

# Find SUID binaries (privilege escalation)
find / -perm -4000 2>/dev/null
```

#### Day 16 — Docker Security
```bash
# Docker is used in security labs AND MLOps pipelines you'll be auditing

# Run a vulnerable app safely in Docker
docker run -d -p 80:80 webgoat/webgoat-8.0   # deliberately vulnerable app

# Basic Docker security checks:
docker inspect container_name | grep -i user
docker history image_name                    # check layers for secrets
docker run --read-only alpine sh             # read-only filesystem

# Trivy: scan Docker images for vulnerabilities (key DevSecOps tool)
pip install trivy  # or: brew install aquasecurity/trivy/trivy
trivy image python:3.11                     # scan Python base image
trivy image --severity HIGH,CRITICAL node:18
```

#### Day 17 — Chapter 1 Review Day
- [ ] Review all Python scripts — can you explain every line?
- [ ] Complete TryHackMe Pre-Security path (all sections)
- [ ] Review networking cheatsheet
- [ ] TryHackMe: earn at minimum **"Beginner"** rank
- [ ] Write `resources/ch01-summary.md` — key things learned
- [ ] **Git commit everything. Push to GitHub.**

---

## 📚 Chapter 1 Resources

### TryHackMe Rooms to Complete (in order)
1. Pre-Security Path (all rooms) — Free
2. Linux Fundamentals 1, 2, 3 — Free
3. How Websites Work — Free
4. HTTP in Detail — Free
5. OWASP Top 10 — Free
6. Introductory Networking — Free

### YouTube Videos (watch during lunch or evenings)
- "Networking Fundamentals" — Professor Messer (free, complete series)
- "Python for Hackers" — TCM Security (YouTube)
- "Burp Suite Tutorial for Beginners" — HackerSploit

### Books (read as PDF — both free online)
- "The Web Application Hacker's Handbook" (Chapter 1–3 only)
- "Black Hat Python" by Justin Seitz (Chapter 1–4 only now)

---

## ✅ Chapter 1 Completion Checklist

- [ ] 5 Python security scripts written from scratch
- [ ] TryHackMe Pre-Security path: 100% complete
- [ ] PortSwigger: 10+ apprentice labs complete
- [ ] Burp Suite: configured and used on a real target
- [ ] nmap: run against your own sites/localhost
- [ ] Wireshark: captured and analyzed real traffic
- [ ] Docker: pulled, run, and scanned an image with Trivy
- [ ] TryHackMe rank: at minimum "Beginner"
- [ ] Security glossary: 50 terms defined
- [ ] All code pushed to GitHub

**When all complete → move to Chapter 2**
