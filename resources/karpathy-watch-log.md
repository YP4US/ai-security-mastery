# Karpathy "Neural Networks: Zero to Hero" — Watch Log
# Replaces Vizuara (some videos were members-only — do NOT pay)
# 2 videos per evening during 21:00–22:30 slot

## Series Links (ALL FREE)
- Full series index: https://karpathy.ai/zero-to-hero.html
- YouTube channel: https://youtube.com/@AndrejKarpathy
- Free code companion: https://github.com/rasbt/LLMs-from-scratch
- nanoGPT (code from GPT video): https://github.com/karpathy/nanoGPT

## For each video: watch it, then write 1 sentence answering:
## "What does this mechanism mean for AI security or governance?"

| # | Title | Watch Date | Security/Governance Insight |
|---|-------|-----------|----------------------------|
| 1 | The spelled-out intro to neural networks and backpropagation: building micrograd | ⬜ | |
| 2 | The spelled-out intro to language modeling: building makemore | ⬜ | |
| 3 | Building makemore Part 2: MLP | ⬜ | |
| 4 | Building makemore Part 3: Activations & Gradients, BatchNorm | ⬜ | |
| 5 | Building makemore Part 4: Becoming a Backprop Ninja | ⬜ | |
| 6 | Building makemore Part 5: WaveNet | ⬜ | |
| 7 | Let's build GPT: from scratch, in code, spelled out ⭐ KEY VIDEO | ⬜ | |
| 8 | Let's build the GPT Tokenizer ⭐ KEY VIDEO | ⬜ | |

## Watch Order Recommendation
If time is short, videos 7 and 8 are the most directly relevant to AI security:
- Video 7: How the transformer actually works → why prompt injection is possible
- Video 8: How tokenization works → why encoding bypass attacks succeed

## Key Concepts to Note as You Watch

### Backpropagation (Videos 1–2)
→ Security relevance: Gradient-based adversarial attacks (FGSM, PGD) use backprop to
  find perturbations. Your published research on adversarial ML used the same math.

### Attention Mechanism (Video 7)
→ Security relevance: Attention is how a model "decides" which context to follow.
  Prompt injection succeeds by making injected text receive higher attention weight
  than the system prompt. Understanding this explains WHY attacks work.

### Tokenization (Video 8)
→ Security relevance: Content filters that work on keywords fail against tokenization-
  aware adversaries who split words across token boundaries. E.g., "jailbreak" → 
  ["jail","break"] — each token is "innocent" but the concept gets through.

## Series Complete Date: Target ~July 22 (Day 8)

## Key Insights After Completing Series
(Fill this section after watching all 8 videos)

1.
2.
3.
4.
5.
