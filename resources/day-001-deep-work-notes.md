# Day 1 Deep Work Notes — July 17, 2026

## NIST AI RMF — supplementary study
Watched:
- https://www.youtube.com/watch?v=0oeD2Wf25wY
- https://www.youtube.com/watch?v=uIC2xJK9wzA
- https://www.youtube.com/watch?v=En7LZtULkco

Reference docs saved: `resources/Day-1/docs/AI_RMF_Playbook.pdf`, `resources/Day-1/docs/NIST.AI.100-1.pdf`

Detailed intro notes kept in personal notebook (not digitized).

## Hands-on recon — dirb
Practiced `dirb` (directory/hidden-page enumeration) in a lab setting on an unauthorized-bank-transfer exercise room, then applied the same tool against **practiceclb.com** (own production site — authorized, first-party asset).

Findings saved: `resources/Day-1/hackthebox/practiceclb.com_scan_report.txt`

Key result: 63 paths found via `common.txt` wordlist. Public pages (200): `/about`, `/dashboard`, `/demo`, `/legal`, `/lessons`, `/login`, `/partners`, `/pricing`, `/progress`, `/register`, `/resources`, `/settings`, `/sitemap.xml`, `/robots.txt`. All `/admin*` variants returned 307 (redirect, not exposed). No 200 admin panel found — good sign, but worth a follow-up scan with a larger wordlist before the Aug 1 public launch.

## Screenshot
`resources/Day-1/Screenshot from 2026-07-17 19-44-52.png` — saved as evidence of the day's session (garak/tooling or scan run).
