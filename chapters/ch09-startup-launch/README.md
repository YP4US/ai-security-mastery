# Chapter 09: Startup Launch — Mediqrate + PracticeCLB
## Runs parallel to all chapters | July 15 – August 31, 2026
## Daily time: 10:30–11:30 (1 hour every morning, protected)

> This chapter exists because your startups are not a distraction from your
> career pivot — they ARE part of it. Every employer you interview with can
> download Mediqrate from Google Play. Every Track A hiring manager can
> use PracticeCLB to see what you built. They are live portfolio evidence
> no certification can replicate. They also generate revenue that extends
> your runway. Both matter.

---

## The Dual Purpose of Each App

### PracticeCLB (practiceclb.com)
**Career pivot value:**
- Demonstrates you built a production AI system with real users
- The AI scoring system is a direct example of AI governance challenges (bias, accuracy, hallucination)
- Your Mediqrate AI Risk Assessment portfolio piece references real systems — so does PracticeCLB
- Every Track A and Track B employer can visit the site and see it working

**Revenue potential:**
- Day-based pricing model (CAD) — lower barrier than monthly subscriptions
- Target: 10 paying users by September = ~$150–$250/month minimum
- Even $200/month CAD extends your 4-month runway by 3+ weeks

### Mediqrate (mediqrate.com)
**Career pivot value:**
- PIPEDA-compliant PHI handling is direct Track A evidence (healthcare AI governance)
- AES-256-GCM encryption + circuit-breaker architecture is direct Track B evidence
- The Mediqrate AI Security Audit (portfolio project in Ch07) requires the app to be live
- "I built and secured a healthcare AI app" is a more powerful sentence when the app is in the Play Store

**Revenue potential:**
- Freemium model with CAD $9.99/month subscription
- Even 3–5 paying users = $30–$50/month to start
- iOS launch (October) doubles the addressable market

---

## LAUNCH TARGETS

| App | Platform | Target Date | Status |
|-----|----------|-------------|--------|
| PracticeCLB | Web (already live) | **Aug 1: remove beta/testing restrictions** | Testing |
| Mediqrate | Android (Google Play) | **Aug 15: submitted and approved** | Testing |
| Mediqrate | iOS (App Store) | **Oct 1: submitted** | Deferred (needs Mac) |
| PracticeCLB | Desktop PWA | Already supported via Next.js | Test desktop experience |

---

## WEEK-BY-WEEK STARTUP SCHEDULE

### Weeks 1–2 (Jul 15–28): Testing Sprint

**Every morning 10:30–11:30:**

**PracticeCLB testing checklist:**
- [ ] Complete full exam flow as a real user (all sections, all question types)
- [ ] Test payment flow end-to-end (Stripe test mode → real mode)
- [ ] Test all subscription tiers and day-based access
- [ ] Test on mobile browsers (iOS Safari, Android Chrome) — it must work
- [ ] Test audio playback (ElevenLabs) on slow connections
- [ ] Test Deepgram STT on different microphones and accents
- [ ] Verify AI budget enforcement (try to exhaust it — does it fail gracefully?)
- [ ] Test the admin dashboard — content review, drill approval
- [ ] Check all 20 mock exam sections are properly timed
- [ ] Verify Stripe webhooks fire correctly for subscription changes

**Mediqrate testing checklist:**
- [ ] Full onboarding flow as new user
- [ ] All free features work without subscription
- [ ] Subscription purchase + restoration (RevenueCat test mode → production)
- [ ] Vita AI chat — PHI data encrypted before LLM context? Verify.
- [ ] Circuit breaker: does Haiku fallback work when Sonnet budget exceeded?
- [ ] ElevenLabs TTS: does it work in the app?
- [ ] Lab report scan flow — both paths (camera + upload)
- [ ] Data deletion: can a user delete all their data?
- [ ] Biometric lock: does it work on test devices?
- [ ] Push notifications: do they fire?

**Bug log format** — save to `chapters/ch09-startup-launch/bug-log.md`:
```
| Date | App | Severity | Description | Status |
| Jul 15 | PracticeCLB | HIGH | Stripe webhook not firing on cancellation | Open |
```

### Weeks 3–4 (Jul 29–Aug 11): Fix + Polish

**Every morning 10:30–11:30:**
- Work through bug log — fix HIGH severity items first
- Write App Store / Play Store listing copy
- Take screenshots for store listings (professional, not debug screenshots)
- Write Privacy Policy and Terms of Service for both apps (if not done)
- Set up basic analytics: how many users, what features, where they drop off

**PracticeCLB store listing:**
- [ ] App description written (use SEO keywords: CELPIP, Canadian immigration, exam prep)
- [ ] Screenshots: minimum 5, showing key features
- [ ] Feature graphic designed
- [ ] Privacy policy URL live

**Mediqrate Play Store submission:**
- [ ] App description written
- [ ] Content rating questionnaire completed
- [ ] Target API level compliant (Android 13+)
- [ ] Screenshots: minimum 8, showing onboarding, tracking, AI chat
- [ ] Privacy policy URL live (required for health apps)
- [ ] Data safety form completed (this is critical — health data category)

### Weeks 5–7 (Aug 12–31): Launch + First Revenue

**PracticeCLB public launch (August 1):**
- Remove any "beta" labels or testing restrictions
- Post on Reddit: r/CELPIP, r/ImmigrantCanada, r/CanadaVisa
- Post on LinkedIn with your story (solo dev, AI-powered, built by someone going through the process)
- Reach out to 5 immigration consultants — offer free access in exchange for honest feedback
- Set up a simple email capture for people who aren't ready to pay yet

**Mediqrate launch (August 15):**
- Google Play listing live
- Post in r/androidapps, r/selfhosted, r/QuantifiedSelf
- LinkedIn post about building a PIPEDA-compliant health AI app

**Revenue tracking** — update `chapters/ch09-startup-launch/revenue-tracker.md` weekly:
```
| Week | PracticeCLB Users | PracticeCLB Revenue | Mediqrate Users | Mediqrate Revenue | Total |
| W1   | 0 | $0 | 0 | $0 | $0 |
```

### iOS Launch Prep (September – October)

**The Mac problem:** iOS builds require Xcode on a Mac.
Options (in order of cost):
1. **Borrow a Mac** from a friend for 2–3 days of testing + submission — free
2. **MacStadium / MacinCloud** — rent a cloud Mac for ~$25–$50 USD for the build
3. **EAS Build** (Expo's build service) — can build iOS without a local Mac (check current pricing, often has free tier for Expo apps)

**iOS App Store prep (start September 1, launch October 1):**
- [ ] Apple Developer account: $99 USD/year — budget for this in September
- [ ] Run Expo EAS build for iOS
- [ ] Test on iOS simulator first, then physical device if available
- [ ] App Store Connect submission: fill all metadata carefully
- [ ] Health app category: extra scrutiny from Apple reviewers — be thorough

---

## STARTUP AS PORTFOLIO EVIDENCE

Every week, document one thing you did on the startups that connects to your Track A or Track B narrative.

Examples:
- "Fixed a rate-limiting bypass on PracticeCLB's AI routes — connects to API4 (Unrestricted Resource Consumption) in OWASP API Security Top 10"
- "Mediqrate's PHI encryption passed testing — this is what I'll write up in the NIST AI RMF risk assessment"
- "Discovered that ElevenLabs API has no webhook for quota exhaustion — I built a circuit breaker as a mitigation — this is MLSecOps in production"

Save these to: `chapters/ch09-startup-launch/career-evidence-log.md`

These become talking points in every interview:

**Track A interview:** "I recently discovered that our third-party TTS provider had no quota exhaustion webhook — a gap in their API design that creates AI cost risk. I mitigated it with a circuit breaker pattern on our end. That's the kind of third-party AI vendor risk that organizations need someone like me to catch."

**Track B interview:** "While testing Mediqrate, I identified that our ElevenLabs integration had no rate limit on the client side — only on the server. An attacker with a valid session token could exhaust our daily TTS budget in minutes. I patched it. That's the kind of vulnerability a proper AI security audit catches."

---

## LAUNCH SUCCESS METRICS (Realistic)

**August 31 targets:**
- PracticeCLB: 20+ registered users, 3+ paying = ~$75–$150 CAD/month
- Mediqrate Android: Listed on Play Store, 50+ downloads, 2+ paying = ~$20–$40 CAD/month
- Combined: ~$95–$190 CAD/month = meaningful but not life-changing yet

**This matters because:**
- $190 CAD/month = $2,280/year = extends financial runway by 3–4 weeks
- More importantly: you have live products with real users to talk about in interviews
- Even 3 paying users proves product-market fit more than any number of test accounts

---

## ✅ Chapter 09 Completion Checklist

### PracticeCLB
- [ ] All HIGH severity bugs fixed
- [ ] Full payment flow tested end-to-end
- [ ] Public launch (remove beta restrictions)
- [ ] Reddit + LinkedIn posts published
- [ ] First 3 paying users

### Mediqrate Android
- [ ] All HIGH severity bugs fixed
- [ ] RevenueCat production mode configured
- [ ] Play Store data safety form complete
- [ ] Play Store submission approved
- [ ] First 1 paying user

### Mediqrate iOS
- [ ] Build method decided (EAS / Mac rental / borrowed Mac)
- [ ] Apple Developer account purchased (September)
- [ ] TestFlight build running
- [ ] App Store submission (target October 1)

### Portfolio Evidence
- [ ] Bug-to-security-finding log: 5+ entries
- [ ] Career evidence log: 5+ entries
- [ ] Revenue tracker: weekly updates running

**This chapter never fully closes — maintain the 10:30–11:30 startup block indefinitely.**
