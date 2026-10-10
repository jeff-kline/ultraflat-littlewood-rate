# Admission record — ultraflat-littlewood-rate

State: CANDIDATE, version 0.1.0 (frozen 2026-10-10). Verdict: NOT YET ADMITTED.
No tag, archive or DOI yet.
Standard: Jeff Kline's public research standard,
https://jeff-kline.github.io/posts/research-program/index.html

## Action owners

| Action | Owner | Status |
|---|---|---|
| Local edits and tests | author, with AI assistance | done for the candidate |
| Create GitHub repository and push | requires the author's authorization (freeze bundle) | not started |
| Tag v0.1.0 and GitHub Release | requires the author's authorization (freeze bundle) | not started |
| Enable the repository in Zenodo | author (Zenodo portal) | not started |
| Public-site listing and living metadata | requires the author's authorization (admission bundle) | not started |

Archive route: Zenodo GitHub integration. The DOI is minted only after the
GitHub Release, so the candidate carries no DOI and CITATION.cff has no
release date.

## P1 — prior work and credit

| Check | Status | Note |
|---|---|---|
| Closest work | PASS | Kahane; Bombieri–Bourgain; Balister et al.; OpenAI preprints; Erdélyi; matching literature (Pippenger–Spencer, Alon–Yuster, Alon–Kim–Spencer, Kang–Kühn–Methuku–Osthus) |
| Original sources | PASS | metadata checked against Crossref and arXiv; Lovett–Meka Theorem 4 checked against arXiv v2 |
| Contribution type | PASS | explicit bound plus two arguments; construction credited to the OpenAI preprints; matching lemma not claimed to improve the literature |
| Novelty | PASS | bounded search named in Section 1.1 and README (arXiv through 2026-10-08, openai/math, web); no global claim |
| Residuals | PASS | Google Scholar and Semantic Scholar not queried; Vu 2000 and Kostochka–Rödl not read directly |

## A1 — claim and artifact consistency

| Check | Status | Note |
|---|---|---|
| Principal claim | PASS | proof audit: no gap, nothing refuted; Theorem 2.1 and Corollary 2.2 hold as stated |
| Scope | PASS | 0 < ε < 1, threshold, per-length signs, no computation, stated near the claim |
| Evidence | PASS | proof, cited external results (Lovett–Meka, Bertrand) and AI audits kept separate |
| Credit | PASS | construction credited to the OpenAI preprints |
| Public prose | PASS | README introduction mirrors the abstract; prose audit findings resolved |
| Metadata | PASS | title, author, version and date agree across paper, README and CITATION.cff |
| Adversarial check | PASS | four AI audits (the proof audit saved in audit/reports/) with findings and dispositions in audit/LEDGER.md; not peer review |

## R1 — release and stewardship

| Check | Status | Note |
|---|---|---|
| Reproduction | PASS | clean build from `git archive` of the candidate; see VERIFICATION.md |
| Artifact integrity | PASS | MANIFEST.sha256 covers every tracked file except itself |
| Hygiene | PASS | no private paths, credentials or placeholders in tracked files |
| Stewardship | PASS | CORRECTIONS.md |
| Tag | PENDING | after authorization |
| Archive | PENDING | Zenodo GitHub integration |
| Citation | PENDING | DOI after archive |
| Metadata | PENDING | Zenodo record check after archive |

Verdict: NOT YET ADMITTED. Admission is a release decision, not peer review or
a correctness certificate.
