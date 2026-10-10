# Admission record — ultraflat-littlewood-rate

State: ADMITTED, version 0.1.0 (2026-10-10).
Current verdict: ADMITTED.
Standard: Jeff Kline's public research standard,
https://jeff-kline.github.io/posts/research-program/index.html

Admission is a release decision under that standard. It is not peer review or
a correctness certificate.

## Release record

| Item | Value |
|---|---|
| Tag | `v0.1.0` (annotated, tag object `2fd3c144b2551004ee049f88c76152147fda9e82`) |
| Tagged commit | `a1e996baaaf538c10daf66bf36564ca8c004ddb5` |
| GitHub Release | https://github.com/jeff-kline/ultraflat-littlewood-rate/releases/tag/v0.1.0 (2026-10-10 17:39 UTC) |
| Version DOI | https://doi.org/10.5281/zenodo.23286062 (Zenodo record 23286062) |
| Concept DOI | https://doi.org/10.5281/zenodo.23286061 |
| Archive route | Zenodo GitHub integration |
| Archived file | `jeff-kline/ultraflat-littlewood-rate-v0.1.0.zip`, 402657 bytes, SHA-256 `31da8c48dc3f66f106c6c53b4c67a7a90ac4ad082be081190dec6c3793a617ad`, MD5 `de7df84eaa6f0bdeb0260f54f9c48c47` (matches Zenodo's checksum) |
| Byte identity | the Zenodo file equals the GitHub API tag zipball, downloaded twice before the Release and pinned |
| Secondary check | `git archive v0.1.0` (zip, twice): SHA-256 `6b2cbd00e9ef87028abac8607444bd2c9efea91c25aae862ea6e8417851ab2b9`; deterministic, not expected to equal the provider zip |
| Zenodo metadata | title, creator (Kline, Jeffery), version `v0.1.0`, date 2026-10-10, license GPL-3.0, type software, repository link at `v0.1.0`: all checked |

The tagged snapshot keeps its prepublication "release candidate" wording; the
DOI was added only to this living repository.

## Action owners

| Action | Owner | Status |
|---|---|---|
| Local edits and tests | author, with AI assistance | done |
| Create GitHub repository and push | author's authorization | done 2026-10-10 (private, then public) |
| Tag v0.1.0 and GitHub Release | author's authorization (freeze bundle) | done 2026-10-10 |
| Enable the repository in Zenodo | author (Zenodo portal) | done 2026-10-10 |
| Living metadata with DOI | author's authorization (admission bundle) | done 2026-10-10 |
| Public-site listing | not authorized | not in scope for this admission |

## P1 — prior work and credit

| Check | Status | Note |
|---|---|---|
| Closest work | PASS | Kahane; Bombieri–Bourgain; Balister et al.; OpenAI preprints; Erdélyi; matching literature (Pippenger–Spencer, Alon–Yuster, Alon–Kim–Spencer, Kang–Kühn–Methuku–Osthus) |
| Original sources | PASS | metadata checked against Crossref and arXiv; Lovett–Meka Theorem 4 checked against arXiv v2 |
| Contribution type | PASS | explicit bound plus two arguments; construction credited to the OpenAI preprints; matching lemma not claimed to improve the literature |
| Novelty | PASS | bounded search named in Section 1.1 and README (arXiv through 2026-10-08, openai/math, web); no global claim |
| Residuals | PASS | listed below |

## A1 — claim and artifact consistency

| Check | Status | Note |
|---|---|---|
| Principal claim | PASS | proof audit: no gap, nothing refuted; Theorem 2.1 and Corollary 2.2 hold as stated |
| Scope | PASS | 0 < ε < 1, threshold, per-length signs, no computation, stated near the claim |
| Evidence | PASS | proof, cited external results (Lovett–Meka, Bertrand) and AI audits kept separate |
| Credit | PASS | construction credited to the OpenAI preprints |
| Public prose | PASS | README introduction mirrors the abstract; prose audit findings resolved |
| Metadata | PASS | title, author, version, date and DOI agree across paper, README, CITATION.cff and Zenodo |
| Adversarial check | PASS | four AI audits (the proof audit saved in audit/reports/) with findings and dispositions in audit/LEDGER.md; not peer review |

## R1 — release and stewardship

| Check | Status | Note |
|---|---|---|
| Reproduction | PASS | clean build from `git archive`; see VERIFICATION.md |
| Artifact integrity | PASS | MANIFEST.sha256 covers every tracked file except itself |
| Hygiene | PASS | no private paths, credentials or placeholders in tracked files |
| Stewardship | PASS | CORRECTIONS.md |
| Tag | PASS | `v0.1.0` → `a1e996b`, never moved |
| Archive | PASS | Zenodo file byte-identical to the pinned tag zipball |
| Citation | PASS | DOI resolves; README, CITATION.cff and paper carry the version DOI |
| Metadata | PASS | Zenodo record matches |

## Named residual risks

- The proofs were produced and checked by AI models. No human expert has
  reviewed them, and they have not been formally verified. The AI audits ran
  in fresh contexts but are not independent expert review.
- The Lovett–Meka partial-coloring theorem is cited, not re-proved.
- The novelty search was bounded: Google Scholar and Semantic Scholar were not
  queried, and Vu (2000) and Kostochka–Rödl (1998) were not read directly.
- No polynomial at the stated lengths has been computed.
- Zenodo records the version as `v0.1.0`; CITATION.cff uses `0.1.0`. This
  matches the project's previous release.
