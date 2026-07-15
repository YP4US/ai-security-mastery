# 🌙 Evening Message — Copy and Send This Every Evening

Around 20:30, open Claude Code in VS Code (same `ai-security-mastery` folder) and send:

---

```
Evening check-in. Day [N] done. Please ask me your questions one at a time, 
then update all the files and commit.
```

---

## Even Simpler Version

```
Evening check-in. Ready.
```

---

## What Claude Will Do

Claude will ask you **6 questions, one at a time**. Answer each one before it asks the next.

### The 6 Questions You'll Be Asked

1. **"What did you study or practice in the morning Track B block?"**
   → Answer honestly. Even if it was less than planned.
   → Example: "Finished TryHackMe Linux Fundamentals 1. Watched the nmap tutorial. Set up garak but hit a Python version error."

2. **"What did you complete in the afternoon Track A block?"**
   → Example: "Read the full NIST AI RMF MAP function. Created my risk register template. Didn't finish the EU AI Act section."

3. **"Which Vizuara videos did you watch? Any key insight from them?"**
   → Example: "Watched videos 3 and 4 — tokenization basics and BPE. Key insight: BPE splits rare words into sub-tokens which is exactly why encoding bypass attacks on content filters work."

4. **"What did you NOT get to today, and what got in the way?"**
   → Be honest. This helps identify patterns. "Skipped the LinkedIn post — ran out of energy. No real blocker, just time."

5. **"Morale score: 1–10, and one sentence on why."**
   → Example: "7/10 — solid progress but I'm still slow with Linux commands and it's frustrating."

6. **"Any specific blockers or questions for tomorrow?"**
   → Example: "garak installation is broken — Python conflict. Need to fix that first thing."

---

## After You Answer All 6

Claude will automatically (without asking permission):
- Create your daily log file (`daily-logs/2026-MM-DD-day-NNN.md`)
- Update PROGRESS.md (day count, streak, completed items)
- Mark Vizuara videos as ✅ in the watch log
- Run `git add -A && git commit && git push`
- Show you tomorrow's preview in one sentence

---

## If It's Sunday Evening

After the regular 6 questions, Claude will also ask:
"Ready to do your weekly review?" 

Say yes and it will walk you through a quick weekly review and create the `weekly-reviews/week-NN.md` file automatically.

---

## The Commit You'll See

Every night's commit will look like:
```
Day 1 complete — environment setup done, NIST AI RMF notes started
Day 2 complete — first garak scan run, EU AI Act risk tiers learned
...
```

This is your proof of work. 140 commits = 140 days = a job offer.
