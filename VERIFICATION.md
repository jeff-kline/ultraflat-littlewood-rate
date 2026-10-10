# Verification record

This record covers the document build and the release files. It does not
check proofs; see `audit/` for the proof review.

## Environment

- pdfTeX 3.141592653-2.6-1.40.22 (TeX Live 2021, MacPorts), default fonts
- Poppler `pdfinfo` / `pdftotext` 26.07.0
- macOS 26.6.2, `shasum` 6.01
- No Python is needed to build or check the paper.

## Commands

```sh
make paper                        # three pdfLaTeX passes; SOURCE_DATE_EPOCH=1791590400
make check                        # no TeX warnings or bad boxes, 20 pages, no "??"
shasum -a 256 -c MANIFEST.sha256  # every tracked file except the manifest itself
```

## Expected output

- `make check` prints the PDF title, author, subject and `Pages: 20`, then
  `check: PASS (document consistency only; not a proof check)`.
- Every line of `shasum -a 256 -c MANIFEST.sha256` reports `OK`.

## Clean reproduction

Recorded at freeze: the commands above run in a fresh extraction of the
candidate commit, with no inherited TeX auxiliary files.

## Exclusions

Build auxiliaries (`paper/*.aux`, `*.log`, `*.out`, `*.toc`) are not tracked.
The release-audit tooling used during preparation is not part of the release.
