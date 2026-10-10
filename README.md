# An explicit rate for ultraflat real Littlewood polynomials

Jeffery Kline

**Version 0.1.0 — release candidate.** No DOI exists yet. Admission under the
project's [public research standard](https://jeff-kline.github.io/posts/research-program/index.html)
is a release decision, not peer review or a correctness certificate.

The paper is [paper/main.pdf](paper/main.pdf); its source is
[paper/main.tex](paper/main.tex).

## Introduction

A real Littlewood polynomial of length $N$ is a polynomial

```math
P(z)=\epsilon_0+\epsilon_1 z+\cdots+\epsilon_{N-1}z^{N-1},\qquad \epsilon_j\in\{-1,+1\}.
```

On the unit circle $|P|$ has mean square $N$, so $\sqrt N$ is its natural
size. A family of such polynomials is *ultraflat* if $|P(z)|/\sqrt N$ tends
to $1$ uniformly on the circle as $N$ grows.

OpenAI's preprint
[*Ultraflat real Littlewood polynomials*](https://github.com/openai/math/tree/main/preprints/Ultraflat-real-Littlewood-polynomials-October-5-2026)
(October 5, 2026) proved that for every $\varepsilon>0$ and every sufficiently
large $N$ there is such a polynomial with

```math
(1-\varepsilon)\sqrt N\le |P(z)|\le (1+\varepsilon)\sqrt N\qquad\text{for all } |z|=1.
```

Its proof gives no value for "sufficiently large".

This paper gives one: for every $0<\varepsilon<1$, every length

```math
N\ge \exp\Bigl(\exp\Bigl(\exp\bigl(10^{12}\log^2(2/\varepsilon)\bigr)\Bigr)\Bigr)
```

works. In particular, for every $N\ge\exp(\exp(\exp(10^{12}\log^2 4)))$ the
error can be taken to be

```math
\varepsilon=2\exp\Bigl(-10^{-6}\sqrt{\log\log\log N}\Bigr).
```

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
modulus between two constant multiples of $\sqrt N$. Erdélyi (2026) states a lower
bound for the maximum modulus that is compatible with the rate here.

Quantitative matching theorems exist (Alon–Kim–Spencer 1997;
Kang–Kühn–Methuku–Osthus 2023) with explicit exponents, but as far as we found
their constants are not given as explicit functions of the edge size, which
this proof needs. The matching lemma here is written to supply such constants;
it is not claimed to improve on those results.

On October 10, 2026 we searched arXiv (queries on "ultraflat" and on
"Littlewood polynomials", through submissions of October 8), the openai/math
preprint repository, and the web. We found no earlier explicit rate for real
Littlewood polynomials. This is a bounded search, not a proof that none
exists. See Section 1.1 of the paper.

## Evidence and limits

- The theorem and its corollary are proved in the paper. The external results
  used are the Lovett–Meka partial-coloring theorem and Bertrand's postulate;
  both are cited, not re-proved. No numerical computation is used as evidence.
- The proofs were checked by separate AI reviews. No human expert has
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
