# Chapter 3: Cloud Security — AWS Deep Dive
## Days 34–43 | August 15–24, 2026
## 🎯 Target: Pass AWS Solutions Architect Associate (SAA-C03) by August 24

> **Why AWS SAA?** It's the #1 requested cloud cert in Canadian job postings. It proves you can think about cloud architecture — which means you can also *attack* cloud architecture. Every AI system you'll red-team runs on cloud infrastructure.


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

## AWS SAA-C03 Exam Blueprint

| Domain | Weight |
|--------|--------|
| Design Secure Architectures | 30% |
| Design Resilient Architectures | 26% |
| Design High-Performing Architectures | 24% |
| Design Cost-Optimized Architectures | 20% |

**Passing score:** 720/1000 | **Cost:** ~$165 CAD | **Time:** 130 min, 65 questions

---

## Days 34–38: AWS Core Services (Security Focus)

### Primary Resource
**Udemy: "AWS Certified Solutions Architect — Associate" by Stephane Maarek** (~$15)
- The single best SAA course available. Follow it exactly.

### Day 34 — IAM: Identity is Everything
**Study:**
- IAM Users, Groups, Roles, Policies
- Principle of Least Privilege (memorize this phrase)
- IAM Policy JSON structure (read and write basic policies)
- Service Control Policies (SCPs) in AWS Organizations
- AWS Security Token Service (STS)

```json
// Example minimal IAM policy — understand every line:
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Action": ["s3:GetObject", "s3:PutObject"],
    "Resource": "arn:aws:s3:::my-bucket/*",
    "Condition": {
      "IpAddress": {"aws:SourceIp": "203.0.113.0/24"}
    }
  }]
}
```

**Hands-on (AWS Free Tier):**
```bash
# Install AWS CLI
pip install awscli
aws configure  # enter your access key, secret, region: ca-central-1

# Create an IAM user with least privilege
aws iam create-user --user-name security-test-user
aws iam create-policy --policy-name ReadS3Only --policy-document file://policy.json
aws iam attach-user-policy --user-name security-test-user --policy-arn arn:...

# Find over-privileged users (security audit technique)
aws iam get-account-authorization-details | python3 -c "
import json, sys
data = json.load(sys.stdin)
for user in data['UserDetailList']:
    policies = [p['PolicyName'] for p in user.get('AttachedManagedPolicies', [])]
    if 'AdministratorAccess' in policies:
        print(f'OVER-PRIVILEGED: {user[\"UserName\"]}')
"
```

### Day 35 — VPC + Network Security
**Study:**
- VPC: subnets, route tables, internet gateways
- Security Groups vs NACLs (stateful vs stateless)
- VPC Flow Logs (gold for security monitoring)
- VPC Endpoints (keeping traffic private)
- AWS WAF + Shield

**Hands-on:**
- Create a VPC with public + private subnets
- Configure a Security Group that allows only HTTPS inbound
- Enable VPC Flow Logs and examine them

### Day 36 — S3 Security + Encryption
**Study:**
- S3 bucket policies vs IAM policies (when to use which)
- Block Public Access settings (why they matter)
- S3 encryption: SSE-S3, SSE-KMS, SSE-C
- S3 Object Lock (immutability for compliance)
- CloudTrail: audit log for all AWS API calls

**Security red team perspective:**
```bash
# Common S3 misconfiguration checks (legal only on YOUR buckets):
aws s3api get-bucket-acl --bucket your-bucket-name
aws s3api get-bucket-policy --bucket your-bucket-name
aws s3api get-public-access-block --bucket your-bucket-name

# These are the exact checks AI security tools run against ML model storage
```

### Day 37 — Compute Security: EC2 + Lambda
**Study:**
- EC2 instance roles (never hardcode credentials)
- Systems Manager (SSM) — access instances without SSH keys
- Lambda security: execution roles, VPC configuration, env var encryption
- Container security: ECS task roles, ECR image scanning

**Hands-on:**
- Deploy a Lambda function with a properly scoped execution role
- Enable ECR image scanning on your container registry

### Day 38 — AWS Security Services
**Study (all of these show up in AI security job interviews):**
- **AWS GuardDuty**: ML-based threat detection — irony: AI securing AI
- **AWS Macie**: ML-based sensitive data discovery in S3 (PHI, PII)
- **AWS Security Hub**: unified security findings dashboard
- **AWS Config**: resource compliance monitoring
- **AWS Inspector**: vulnerability scanning for EC2/containers

---

## Days 39–42: Practice + Advanced Topics

### Day 39 — Hands-On Lab Day
```bash
# Build this architecture from scratch:
# Internet → ALB → EC2 in private subnet → RDS in private subnet
# With: Security Groups, encrypted storage, CloudTrail enabled

# Use CloudFormation (Infrastructure as Code):
# Create a basic template and deploy it
aws cloudformation create-stack \
  --stack-name security-lab \
  --template-body file://secure-vpc.yml \
  --capabilities CAPABILITY_IAM
```

### Day 40 — Practice Exam Day
- [ ] Full 65-question practice exam (Maarek course practice tests)
- [ ] Target: 72%+
- [ ] Watch: Tutorials Dojo explanations for wrong answers
- [ ] Add weak topics to Anki

### Day 41 — Cloud Security Attack Techniques (Red Team Perspective)
**This is what bridges AWS knowledge to your AI red teaming role:**

```python
# Common cloud misconfiguration attacks (on your own accounts ONLY):

# 1. IMDS (Instance Metadata Service) exploitation
# In an EC2 instance, this URL returns the instance's IAM credentials:
# http://169.254.169.254/latest/meta-data/iam/security-credentials/
# Red teamers use this when they have SSRF on a web app running on EC2

# 2. Overly permissive S3 buckets
# Many ML datasets and models are stored in S3
# A misconfigured bucket can expose training data, model weights, API keys

# 3. Lambda environment variable leakage
# Developers often put API keys in Lambda env vars unencrypted
# If an attacker can invoke Lambda or access CloudFormation, they get the keys

# 4. Container registry misconfigs
# ECR images without scanning can contain vulnerable packages
# Pulling a malicious base image can poison the entire ML pipeline
```

### Day 42 — AWS Well-Architected Framework: Security Pillar
- Read the security pillar whitepaper (free on AWS): https://docs.aws.amazon.com/wellarchitected/
- This is what enterprise architects think about — speaking this language in interviews is powerful
- Create: `resources/aws-security-pillar-notes.md`

### Day 43 — EXAM DAY 🎯
- Same strategy as Security+ exam day
- Register at Pearson VUE Ottawa
- After passing: update LinkedIn, resume, GitHub

---

## ✅ Chapter 3 Checklist
- [ ] Maarek AWS SAA course: 100% complete
- [ ] VPC built with public/private subnets hands-on
- [ ] IAM policies written and tested
- [ ] S3 security configured on real bucket
- [ ] GuardDuty enabled on free tier account
- [ ] 3 full practice exams at 75%+ score
- [ ] **AWS SAA-C03 exam PASSED** ✅
