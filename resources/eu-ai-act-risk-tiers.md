# EU AI Act — Risk Classification Notes

**Source:** https://artificialintelligenceact.eu/the-act/
**Date:** Day 2 — July 18, 2026

## UNACCEPTABLE RISK (Banned)
1. Social scoring of individuals
2. Untargeted scraping of facial images from the internet or CCTV footage to create facial recognition databases

## HIGH RISK (heavily regulated — the tier I'll audit professionally)
1. Biometric identification & categorization
2. Employment & HR

## LIMITED RISK
Systems that aren't banned or heavily regulated, but must meet a transparency obligation — the user must be told they're interacting with AI or that content is AI-generated/manipulated. Examples: chatbots (must disclose they're AI) and deepfakes (must be labeled).

## MINIMAL RISK
No obligations. Most productivity AI tools — spam filters, content recommendation engines, AI writing assistance, AI-powered search.

---

## Applying this to my own products

**Does PracticeCLB's AI scoring system count as HIGH RISK?**
Yes. Per Annex III, AI systems used for educational and vocational training are classified as high-risk. PracticeCLB is AI-powered CELPIP exam prep for Canadian immigration — users make real decisions (immigration applications) based on their practice results, so it falls under the education/vocational-training high-risk category.

**Does Mediqrate's Vita AI chat count as HIGH RISK?**
Judgment call, leaning toward Limited Risk in the strict legal sense — flagged for further review. Vita AI avoids giving medical advice or diagnosis, and Annex III's healthcare-adjacent high-risk category is mainly about AI functioning as/within a medical device or making/influencing diagnosis and treatment decisions. A wellness/tracking chatbot that explicitly stays out of diagnosis is more defensibly Limited Risk (transparency obligation: disclose it's AI) rather than High Risk. That said, given it processes sensitive health data (nutrition, reports, activity), treating it cautiously as if High Risk isn't unreasonable from a compliance-posture standpoint — the deciding factor is the system's *function*, not just the sensitivity of data it touches. Worth revisiting with a proper NIST AI RMF / EU AI Act mapping exercise later in the Track A portfolio work.
