# Claude Code Setup Guide
## Get the daily tracking agent running in 15 minutes

---

## Step 1: Install Claude Code in VS Code

1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X)
3. Search: **"Claude Code"**
4. Install the Anthropic extension
5. Sign in with your Anthropic account (claude.ai login)

Alternatively, install Claude Code desktop app from: https://claude.ai/download

---

## Step 2: Open This Repo in VS Code

```bash
# If you haven't already cloned the repo:
git clone https://github.com/YOUR_USERNAME/ai-security-mastery.git
cd ai-security-mastery

# Open in VS Code:
code .
```

**Critical:** Always open VS Code with the `ai-security-mastery` folder as your workspace root. Claude Code reads CLAUDE.md from your working directory — if you open a parent folder, it won't find the file.

---

## Step 3: Verify Claude Code Reads CLAUDE.md

Open Claude Code panel (usually Ctrl+Shift+P → "Claude Code: Open") and type:

```
What project are you working on?
```

Claude should respond with something like: "I'm helping Yogesh Pawar with his AI Security Mastery study plan..." — this confirms CLAUDE.md is loaded.

If it gives a generic response, check that:
- You're in the `ai-security-mastery` directory (not a parent)
- CLAUDE.md exists in the root (run: `ls CLAUDE.md`)
- You can also run `/memory` in Claude Code to see which files are loaded

---

## Step 4: Set Up Git Remote (One-Time)

```bash
# Create repo on GitHub: github.com → New Repository → ai-security-mastery → Public
# Then:
git remote add origin https://github.com/YOUR_USERNAME/ai-security-mastery.git
git branch -M main
git push -u origin main
```

After this, Claude Code can push commits automatically during evening check-ins.

---

## Step 5: Test the Morning Briefing

Send this to Claude Code:

```
Good morning. Day briefing please.
```

You should get a full structured briefing. If you don't, paste this more explicit version:

```
Read PROGRESS.md, read chapters/ch00-orientation/README.md, 
read resources/vizuara-watch-log.md, then give me my Day 1 briefing 
using the format in CLAUDE.md.
```

---

## Step 6: Daily Routine From Now On

| Time | Action |
|------|--------|
| 6:30 AM | Open VS Code → Claude Code → send morning message from MORNING_MESSAGE.md |
| 7:00 AM–8:30 PM | Study according to the briefing |
| 8:30 PM | Send evening message from EVENING_MESSAGE.md |
| 9:00 PM | Done — Claude handles the git commit |

---

## Troubleshooting

**"Claude doesn't seem to know about my progress"**
→ Run `/memory` in Claude Code to see what's loaded
→ Make sure CLAUDE.md is in the root of the folder you opened
→ Try closing and reopening VS Code

**"Claude can't push to GitHub"**
→ Make sure you've run `git remote add origin ...` (Step 4)
→ Check: `git remote -v` should show your GitHub URL
→ You may need to configure git credentials: `git config --global credential.helper store`

**"The commit says 'nothing to commit'"**
→ This means no files changed today — that shouldn't happen if you filled the daily log
→ Ask Claude Code: "Can you check what files have changed today and commit them?"

**"I want to restart a day"**
→ Just delete the daily log file for that day and run the evening check-in again

---

## Optional: Add a VS Code Task for Quick Access

Add this to `.vscode/tasks.json` (create the file if it doesn't exist):

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Morning Briefing",
      "type": "shell",
      "command": "echo 'Good morning. Day briefing please.' | pbcopy && echo 'Copied to clipboard! Paste into Claude Code.'",
      "group": "build",
      "presentation": {
        "echo": true,
        "panel": "shared"
      }
    }
  ]
}
```

---

## What CLAUDE.md Does (Technical Note)

<cite index="33-1">CLAUDE.md files are markdown files that give Claude persistent instructions for a project. Claude reads them at the start of every session.</cite> This means every time you open Claude Code in this folder, it automatically knows:

- Who you are (Yogesh, your background, your two startups)
- What you're studying (dual-track plan, all chapters)
- What to do in the morning (produce briefing)
- What to do in the evening (ask 6 questions, update files, commit)
- How to format everything

You never have to explain this again. The file does it for you.
