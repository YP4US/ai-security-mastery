#!/bin/bash
# Run this ONCE on Day 1 to initialize your repo

echo "🛡️  AI Security Mastery — Initial Setup"
echo "========================================"

# 1. Initialize git
git init
git add .
git commit -m "🚀 Day 0: Initialize AI Security Mastery repo"

echo ""
echo "✅ Git initialized locally"
echo ""
echo "Now do this:"
echo "1. Go to github.com → New Repository"
echo "2. Name it: ai-security-mastery"
echo "3. Set to PUBLIC (this is your portfolio)"
echo "4. DO NOT initialize with README (you already have one)"
echo "5. Copy the repo URL, then run:"
echo ""
echo "   git remote add origin https://github.com/YOUR_USERNAME/ai-security-mastery.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "6. Your repo is now live. Share the URL on LinkedIn."
echo ""
echo "Daily commit command (run every evening):"
echo "   git add . && git commit -m 'Day X complete — [what you did]' && git push"
echo ""
echo "🎯 Good luck. You've got this."
