# An explicit rate for ultraflat real Littlewood polynomials

Jeffery Kline

**Version 0.1.0 — release candidate.** No DOI exists yet. Admission under the
project's [public research standard](https://jeff-kline.github.io/posts/research-program/index.html)
is a release decision, not peer review or a correctness certificate.

The paper is [paper/main.pdf](paper/main.pdf); its source is
[paper/main.tex](paper/main.tex).

## Introduction

A real Littlewood polynomial of length N is a polynomial
`ε₀ + ε₁z + ⋯ + ε_{N−1}z^{N−1}` whose coefficients are all +1 or −1. On the
unit circle its modulus has mean square N, so √N is its natural size.

OpenAI's preprint
[*Ultraflat real Littlewood polynomials*](https://github.com/openai/math/tree/main/preprints/Ultraflat-real-Littlewood-polynomials-October-5-2026)
(October 5, 2026) proved that for every ε > 0 and every sufficiently large N
there is such a polynomial whose modulus lies between (1 − ε)√N and
(1 + ε)√N at every point of the unit circle. Its proof gives no value for
"sufficiently large".

This paper gives one: every length

`N ≥ exp(exp(exp(10¹² · log²(2/ε))))`

works. Equivalently, for every large N the error can be taken to be

`ε = 2 exp(−10⁻⁶ · √(log log log N))`.

The proof follows the original construction and makes each step explicit.
Two steps need new arguments:

- a hypergraph matching lemma whose constants are explicit in the size of the
  edges, replacing the Pippenger–Spencer theorem; and
- an exponential decay estimate showing that the auxiliary polynomials need
  only logarithmically many variables.

The bound is far too large to be practical. Its point is that the
construction is effective, with every constant written down.

## Contribution and prior work

The construction is that of the October 5 preprint and its predecessor,
[*Nearly minimal maxima and positive minima of Littlewood polynomials*](https://github.com/openai/math/tree/main/preprints/Nearly-minimal-maxima-and-positive-minima-of-Littlewood-polynomials-October-5-2026).
The contribution is the explicit bound, the matching lemma, and the decay
estimate. For complex coefficients of modulus one, Kahane (1980) and
Bombieri–Bourgain (2009) gave ultraflat polynomials with explicit rates. For
real signs, Balister, Bollobás, Morris, Sahasrabudhe and Tiba (2020) kept the
modulus between two constant multiples of √N.

A search of the openai/math preprint repository and of arXiv and the web on
October 10, 2026 found no earlier explicit rate for real Littlewood
polynomials. This is a bounded search, not a proof that none exists. See
Section 1.1 of the paper.

## Evidence and limits

- The theorem and its corollary are proved in the paper. The only external
  theorem used is the partial-coloring theorem of Lovett and Meka, which is
  cited, not re-proved. No numerical computation is used as evidence.
- The proofs were checked by process-separated AI audits. No human expert has
  reviewed them. Agreement among AI audits is evidence about a process, not
  independent validation.
- No polynomial at these lengths has been computed. The bound concerns the
  length that suffices, not the running time of any algorithm.
- The signs may differ from one length to the next; the paper does not
  construct one infinite sequence of signs.
- The three nested exponentials come from the packing step of the original
  construction. A faster rate would need a different packing.

## Reproduce

Requirements: pdfLaTeX (tested with TeX Live 2021) and Poppler's `pdfinfo`
and `pdftotext`. No Python is needed.

```sh
make paper                        # three pdfLaTeX passes; fixed SOURCE_DATE_EPOCH
make check                        # TeX log, page count, unresolved references
shasum -a 256 -c MANIFEST.sha256
```

`make check` checks the document's consistency; it does not check proofs.

## Repository contents

- `paper/`: LaTeX source `main.tex` and reading copy `main.pdf`.
- `audit/`: audit reports and the ledger of findings and dispositions.
- `ADMISSION.md`, `VERIFICATION.md`, `CORRECTIONS.md`, `CITATION.cff`,
  `MANIFEST.sha256`: release records.

## Role of AI

AI models did the derivations, literature search, exposition, and audits
under the author's direction. The author chose the question and is
responsible for the result and its corrections.

## License

GPL-3.0-only. See [LICENSE](LICENSE).
