# Proof and parameter audit

- **Lane:** proof and parameters (Theorem 2.1, Corollary 2.2, every lemma and proposition in `paper/main.tex`)
- **Auditor:** a fresh-context AI agent (Claude), working read-only. This is evidence about the process only. It is not independent expert review or peer review.
- **Pinned to:** commit `8b0767c`. All line numbers below refer to `git show 8b0767c:paper/main.tex`.
- **Repository moved during the audit:** HEAD advanced to `94ffc8a` (commits `3d1c314` and `94ffc8a`, which apply the prose and citation audit fixes). Those commits change only the abstract, the introduction, Section 1.1, Scope and the bibliography. Sections 2–8 are textually unchanged. In HEAD, every line number from Section 2 onward is **+12** (for example, Theorem 2.1 is at 124 here and 136 in HEAD). `git status --short --branch` printed `## main` (clean) both at the start and at the end.
- **Sources read:** the research-program standard; `paper/main.tex`; arXiv:1203.5747v2, page 3, which states Theorem 4 (read from the PDF page image); and, read-only, the OpenAI source TeX `shared/ultraflat/sections/{rounding,balanced,waves}.tex` and `shared/lower-envelope/sections/{rounding,packing}.tex`.
- **Computation:** one small foreground run through `~/.venvs/claude/bin/python -I` (numerical sanity checks listed in Section 4). No process was left running.

## 1. Verdict

**PASS on the mathematics, with two exposition fixes required (M1, M2).** These are exposition defects, not proof defects.

I re-derived every parameter identity, boundary case and explicit constant in Sections 2–8 and found no GAP and nothing REFUTED. Theorem 2.1 and Corollary 2.2 survive as stated. The constant 10^12 has a large margin: the paper's own chain gives N_* ≤ E3(1000 t²), with t ≤ 172 log(2/ε), so about 3·10^7 log²(2/ε) would already suffice.

## 2. Must-fix items (exposition)

**M1. Typo in a defined symbol, line 658.** The line reads `C_{m mom}=(24kL+18k^2)p^{-2k}`, which renders as "C_{mmom}". Lines 664, 749 and 752 use `C_{\rm mom}`, so the symbol is defined under one name and used under another.
*Disposition:* change the line to `C_{\rm mom}`.

**M2. Units in the C_R = 1024 derivation, lines 390–403.**
- The "row error at most 1+160√(μ log(80n/μ))" (line 399) is valid only when the error is measured in the coordinates p_j = (1−|Z_j|)/2. In those coordinates each stage moves p by ±2^{-h}, so 64·Σ2^{-h/2} ≤ 64·(5/2) = 160.
- "Passing to complex values costs 2√2" (line 400) is then 2 (from z = 1−2p) times √2 (from combining the real and imaginary rows). The OpenAI source states this split explicitly: "real and imaginary parts ... each bounded by twice".
- A reader who takes the row error in the z coordinates and 2√2 as the complex factor alone gets 4√2·(2+309X) ≈ 11.3 + 1749X. Since 1749 > 1024, the stated constant then appears to fail.
- With the units made explicit, 4√2·(1+160X) = 5.66 + 905X ≤ 1024(1+X), so the constant holds.
- The proof also omits the case 2^hμ > n of the monotonicity step. That case needs n log 80 ≤ 2^hμ log(80n/μ), which follows from μ ≤ n/2; the source includes it.

*Disposition:* add one clause saying the row errors are in the p coordinates, write 2√2 = 2·√2 with both reasons, and add the one-line 2^hμ > n case.

## 3. Item-by-item findings

**Theorem 2.1 and Corollary 2.2 (lines 124–148): PASS.**
- Inversion: with ε = 2exp(−10^{-6}√(log log log N)), we get 10^{12} log²(2/ε) = log log log N, so E3(·) = N exactly.
- The condition N ≥ E3(10^{12} log² 4) is equivalent to ε ≤ 1/2.

**Lemma 3.2, concentration (lines 175–200): PASS.**
- The Doob difference (Z−ξ)Δ satisfies |Δ| ≤ A, with conditional variance at most ξ(1−ξ)A².
- The bound j! ≥ 2·3^{j−2} gives the Bernstein moment generating function bound.
- The choice λ = u/(V+Au/3) satisfies λ < 3/A exactly when V > 0.

**Theorem 3.1, matching (lines 161–354): PASS.** I checked each of the following:
- the four terms of Q_* against their uses: a_0 ≤ 1/(16E_0); κ ≤ 1/(640r²LE_0); DS ≥ 1; and the union bound;
- θT_0 ≤ 5L, which gives D_t ≥ DS and ρ_t ≥ 1/2;
- m_e bounds with r(r−1)c/2, from (r−1)c + C(r−1,2)c;
- the mean bound, (1+5rθ)a + 5r²θκ ≤ (1+8rθ)a + 8r²θκ;
- A = rc and V ≤ 2nθrc²;
- B_0, which equals 32θr²/(s²p^{2k}S²) exactly: the factors combine to (8/η)^{100r};
- 8r/(sp^kS) ≤ B_0;
- the recurrence: E_0(a_0 + 40r²Lκ + 5Ls/θ) ≤ 1/16 + 1/16 + 5/256;
- survival e^{−3θ/4} per round, which gives n(η/8)^3 survivors in expectation and probability at most η²/256 for the survivor failure;
- waste at most 4nrθ² per round, so 20ηn/2048 in total and probability below 1/32 for the waste failure;
- the three failure probabilities sum to less than one;
- with W = 2^{20}r/(pη): T_0 ≤ W^5, B_0 ≤ W^{102r+7}, and the four Q_* terms are at most W^{328r}, W^{51r+3}, W^{11r−1} and W^{204r+28}.

**Lemma 4.1, rounding (lines 362–406): PASS, subject to M2.**
- *Lovett–Meka statement:* arXiv:1203.5747v2 Theorem 4 (page 3) allows arbitrary vectors v_j ∈ R^n, a starting point x_0 ∈ [−1,1]^n, thresholds with Σexp(−c_j²/16) ≤ n/16, and "δ>0 a small approximation parameter". With probability at least 0.1 it outputs x with |⟨x−x_0, v_j⟩| ≤ c_j‖v_j‖_2 and |x_i| ≥ 1−δ for at least n/2 indices. Line 377 represents this correctly.
- *"Taking the tolerance to zero by compactness" is justified.* The theorem holds for every sufficiently small δ. Take δ_k → 0. There are finitely many index sets of size ⌈u/2⌉, so one set recurs; pass to a convergent subsequence in the cube. All constraints are closed, so the limit fixes that set to exact signs and keeps the discrepancy bounds.
- *Thresholds:* c = 4√(log(16R/u)) gives a threshold sum of exactly u/16, and each restricted row has ‖v‖_2 ≤ √u.
- *Constants:* L_0 + h log 2 ≤ L_0(1+h/4) because L_0 ≥ log 16. The series equals 4.24, below 7. Also L_0 ≤ 4 log(2R/s), so the complete-coloring constant is 56 ≤ 64.
- *Grid to circle:* (1−πe/20)^{-1} = 1.745 < 2, which matches the Cauchy-estimate argument in the source.

**Lemma 4.2, saturation (lines 419–444): PASS.**
- The identity H_0(x+uc/2)²/u = A − xc holds.
- D_0² − (A² − x²c²) = (1−u)c⁴/4 holds.
- (A + D_0)/2 = 1 − c²/4. Jensen then gives √(7/8), and the iteration uses H_0² ≤ H_0.
- Numerically, the worst ratio on a grid was 0.93422, below √(7/8) = 0.93541.

**Proposition 4.3, auxiliary envelope (lines 446–616): PASS.**
- Denominator recursion k_j = 2k_{j−1} + 2 = 2^{j+1} − 2.
- Coordinate degree bound |s_i| ≤ 2^{d−i}, and |S| ≤ K because 2^{m+1} + 1 ≤ 3·2^m.
- Each frequency's last nonzero coordinate is ±1, so distinct sign pairs are nonparallel.
- d ≥ 2 log(1/δ)/log(8/7) gives (7/8)^{d/2} ≤ δ.
- Leading-digit domination holds because H_0/(B_1−1) < 1/2.
- Grid choice of W_j^0: (D−1)D^{d−2} < D^{d−1}, with ‖W_j^0‖_∞ ≤ dH_0K and 1 ≤ |s_ℓ·W_j^0| ≤ P_0.
- The relative perturbation is at most τH_0 = δ/(4K), and (1 ± δ/(4K))^{K/2} lies in [1−δ, 1+δ].
- β_* bound holds.
- Every spreading condition reduces to a = T|β| ≥ R_0. I checked the components of R_0 (1/h_0, (1+2πM_2)/q_0, E_1/q_0, (4C_R/α)²+1, 4K/δ) together with M_2 = 1 + 2K_3/h_0³ and E_1 with 4(ah_0)^{1−j} tail sums.
- The three error terms are at most α/4, α/128 and α/4. For the middle term, x_0√(2(log 80 + 4 log(1/x_0))) = 0.101 < 1/2 at x_0 = 1/64, and the expression decreases as x_0 decreases.
- The defect is at most 2q_0, because 1 − (1−2q_0)/(1+q_0)² ≤ 4q_0. The tail and normalization errors are at most q_0 + q_0. The telescoping estimate gives δ/8·(1+α)^{K/2} < δ.
- The ratio bounds for |c_a|²/w_a and Σ w_a, and every bound in eq. (aux-envelope), follow.
- The construction matches the OpenAI source `balanced.tex` step for step, in the same order of choices (δ, p_d, γ, W, τ, α, g, T).

**Proposition 5.1, signed packing (lines 630–787): PASS.**
- Slot slack: L_i − 2w_iL ≥ M_0Δ/r − 1 − r ≥ 3M_0Δ/(4r), which gives 8η.
- Auxiliary bounds: L ≤ 64r²/δ, η ≥ δ/(32r), and η ≤ 1/32.
- Chunk count K_c ≤ 3√q/2.
- Bad-event probability (1 + 4LK_c + 2R)/q ≤ (6L+3)/√q.
- Fiber bounds: F_1 = k(6L+3k) and F_2 = 2k(6L+6k), the latter from 2k evaluations and C(2k,2) pairs. Then F_2 + 2p^kF_1 ≤ (18kL+15k²)/√q ≤ (24kL+18k²)/√q.
- Chebyshev gives the C_mom q^{−1/4} bound, and the expected number of deletions is below q^{7/8}.
- Degrees q^{b−1}Z, codegrees q^{b−2}, and a_0 = (1+p^{−k})q^{−1/8} match the hypotheses of Theorem 3.1. The exponent 2^{20}r² ≥ 328r.
- The deficit (1+8L)q^{−1/8} < η.
- Inset: L_i/q − w_i/H ≥ 6ηL_i/((1−2η)q).
- The OpenAI source (`packing.tex`) has the same structure. Its qualitative "for all sufficiently large q" is replaced here by explicit thresholds and an explicit separation of 6η/q.

**Lemma 6.1, stationary phase (lines 794–858): PASS.**
- The phase is exactly quadratic in y = (t−u)√A.
- |∂^k A| ≤ B for k ≤ 5, which needs φ ∈ C^7.
- The recurrence for a_k divides by 2b rather than 2√b, which is valid and conservative because b ≤ 1.
- y' = d(φ'(t)−φ'(u))/y lies in [b/√B, B/√b], and both y' and 1/y' are at most B/b.
- The R_k, V_{0,k} and V_{a,k} recurrences correctly bound (r d/dt)^a(fr).
- The quadratic Fourier error is π N^{−1}∫ξ²|ĝ|, and ∫ξ²|ĝ| ≤ (2/3)‖g‖_1 + 2(2π)^{−4}‖g^{(4)}‖_1.
- The nonstationary bound is ℓ(F_1/(bh) + F_0B/(b²h²))/(2π).

**Section 6.1, main waves (lines 860–928): PASS.**
- ψ' = X and ψ'' = −1/(λχ²).
- The stationary main term is c_aGχ e(−kt* + NλQ), and summing over a gives Gχ F(kθ_h + NvQ_h).
- ∫_{J_h}χ² ≥ (1−5δ/16)/H.
- The Fresnel partial integrals are at most 1.34 on every interval (computed), below the stated 3.
- The endpoint pieces cost at most 24H|A|σ = δ in total.
- This matches the OpenAI source `waves.tex`.

**Section 6.2, gap separation 1/(768M²) (lines 930–1013): PASS.**
- Each forbidden window has length 1/(384M²), which is less than the candidate spacing 1/(256M²), so it contains at most one candidate.
- There are at most 4M² (endpoint, value) pairs and 4M² + 1 candidates, so one candidate survives.
- The largest shift is 1/64, so the intervals stay inside (1/4, 3/4).
- ρ = 1/(32(M+1)) < s_g/2.
- Σ|Λ|^{−1/2} ≤ 2M·δ/(400M).
- The middle curvature is at least 1/(4L_g), and L_g ≤ 3.5δ.
- 1 + 5δ + 192√(3.5δ) < 1 + 500√δ.

**Section 6.3, tail (lines 1015–1044): PASS.**
- |Nφ' − k| ≥ c(N+|k|) for both k < 0 and k ≥ N.
- The first boundary terms cancel.
- A_p and A_p' match the second-integration expressions.
- Σ(N+|k|)^{−2} ≤ 2/N.

**Section 7, threshold assembly (lines 1046–1242): PASS.**
- The envelope comparisons hold: r ≤ R̄, L ≤ L̄, p ≥ p̄, η ≥ η̄, A_0 ≤ m̄!Ū^{m̄}, and C_mom ≤ C̄.
- Bertrand's postulate gives ⌈Q̄⌉ < q ≤ q̄.
- I checked every Z-power bound in eq. (basic-Z), together with the χ and G derivative bounds and T^{(j)} ≤ Z^{21}.
- J_n ≤ Z^{64n²}: Σm_i i² ≤ n² − 2 for k ≥ 2, leaving 97 units of slack.
- B = Z^{2500} (from J_6 ≤ Z^{2304}), F_j ≤ Z^{1043}, and h^{−1} ≤ Z^{12}.
- The doubling chain for a_k reaches Z^{80031} at most, R_4 ≤ Z^{412512}, and C_M ≤ Z^{2504005}.
- K_tail ≤ Z^{5015+}.
- Projection: μ/N ≤ 501√δ.
- Rounding: 22.4√(2m) ≤ 32m, so 32C_R m2^{−m} ≤ 2^{15}/x = ε/32. Also (2C_R/ε)² ≤ δ^{−1} ≤ N gives C_R/√N ≤ ε/2. The total is at most 3ε/32 + ε/2 < ε.

**Section 8, triple exponential (lines 1244–1303): PASS.**
- d ≤ 15.0t + 1 ≤ 16t.
- log K ≤ 88.7t² + 17.6t ≤ 110t².
- log P_0 ≤ 150t², log G_0 ≤ 250t², log τ^{−1} ≤ 130t², log α^{−1} ≤ 170t², and log R_0 ≤ 2740t².
- log β_*^{−1} is dominated by 150t²e^{110t²}.
- log R̄ ≤ e^{311t²}.
- log C̄ and the log of the matching term are both about exp(2e^{312t²}), which is at most exp(e^{600t²}).
- log log log N_* ≤ 600t² + o(1) ≤ 1000t².
- t ≤ 164 log 2 + 8 log(1/ε) ≤ 172 log(2/ε), and 1000·172² = 29,584,000 < 10^{12}.

## 4. Numerical checks (small foreground run)

| Quantity | Paper's bound | Computed |
|---|---|---|
| Kernel normalizing constant C | < 4 | 2.252 |
| ‖κ_0'‖_1 | ≤ 64 | 1.66 |
| ‖κ_0'''‖_1 | ≤ 2^{26} | 131 |
| Pointwise third-derivative bound C·\|g'''/g\|(1−x²)^6 (exact, via sympy) | ≤ 560 | max 18 |
| Coefficient sums of ζ through ζ^{(6)} | < 2^{50} | 1.56·10^{10} ≈ 2^{33.9} |
| Lovett–Meka series | < 7 | 4.24 |
| Σ_{h≥1} 2^{−h/2} | < 5/2 | 2.414 |
| Saturation ratio (grid maximum) | ≤ √(7/8) = 0.9354 | 0.9342 |

## 5. Optional findings

**O1. Line 377: compactness argument.** Add the one-sentence argument from Section 3 (finitely many index sets, closed constraints).
*Disposition:* optional.

**O2. Overloaded symbols.** Several symbols carry two or more meanings:
- Y_k: Lemma 6.1 versus Section 7.3;
- a_0, a_k: Theorem 3.1 versus Lemma 6.1;
- D: reference degree, number of representatives, D_0, D_k;
- q: prime, q_0, q_δ;
- T: spreading parameter versus T_{a,h};
- L: several meanings;
- K: K, K_c, K_tail;
- d: dimension versus sgn φ''.

*Disposition:* rename where cheap, or add a notation note.

**O3. Line 877: χ_h is defined only in words.** State it explicitly: χ_h = σ + (1−σ)ζ((d_x − 2e_0)/e_0), and similarly G_h = ζ((d_x − e_0/2)/(e_0/2)).

**O4. Line 133: P_N in Corollary 2.2.** The symbol is not introduced in the corollary itself.
*Disposition:* write "a polynomial P_N".

**O5. The constant 10^{12} is very loose.** The paper's own arithmetic supports about 3·10^7.
*Disposition:* optionally add a remark. This is not a defect.

**O6. Process note: the ledger and the pinned commit differ.** The ledger rows for the claim and citation lanes record fixes as "Fixed", but those fixes are in `94ffc8a`, not in `8b0767c`. The freeze record should name which commit this proof audit covers. Its findings carry over to HEAD with the +12 line offset, because Sections 2–8 are unchanged.

## 6. Scope limits

- I did not re-prove the Lovett–Meka theorem; I checked only its statement. I did not re-prove Bertrand's postulate.
- The quantitative steps are checked by hand re-derivation and small numerical checks, not by formal verification.
- Agreement between this audit and the other AI audits is evidence about the process, not independent validation.
