# 🌙 Evening Message — Send This Every Evening (~22:45)

Open Claude Code in VS Code and send:

---

## Simple version
```
Evening check-in. Ready.
```

---

## The 7 Questions (one at a time — answer honestly)

**1.** "Startup block (10:30–11:30): what did you work on for Mediqrate or PracticeCLB?"
→ Example: "Fixed the RevenueCat production mode config. Subscription restore now works. Submitted Play Store data safety form."

**2.** "Warm-up (11:30–12:30): what Track A content did you cover?"
→ Example: "Read NIST AI RMF MAP function. Started risk register template for Mediqrate."

**3.** "Deep work (13:30–18:30): what did you complete on Track B?"
→ Example: "Finished TryHackMe Linux Fundamentals 1. Ran first garak scan against llama3.2:1b. 3 vulnerabilities found — logged to portfolio."

**4.** "Karpathy videos tonight: which ones? One security insight?"
→ Example: "Videos 3 and 4 — MLP and activations. Insight: the vanishing gradient problem is why deep models are hard to attack with gradient-based methods — relevant to ART adversarial examples."

**5.** "What didn't you get to today, and why?"
→ Example: "Skipped LinkedIn post — bug fix on PracticeCLB took 90 min longer than expected."

**6.** "Morale 1–10 and one sentence why?"
→ Example: "8/10 — productive day, the startup fix felt good, and the garak scan was eye-opening."

**7.** "Any blockers or questions for tomorrow?"
→ Example: "Play Store submission keeps rejecting the health data declaration — need to figure out the correct category."

---

## What Claude Does After Your Answers

Automatically (no asking permission needed):
- Creates `daily-logs/YYYY-MM-DD-day-NNN.md`
- Updates `PROGRESS.md` (day count, streak, milestones)
- Updates `resources/karpathy-watch-log.md`
- If Sunday or revenue mentioned: updates `resources/startup-launch-tracker.md`
- Runs: `git add -A && git commit -m "Day N complete — [your summary]" && git push origin main`
- Shows tomorrow's preview

## Sunday Extra
On Sunday evenings, Claude will also ask:
"Ready for your weekly review?"
→ Creates `weekly-reviews/week-NN.md` with your morale scores and key milestones
