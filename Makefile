SHELL := /bin/sh
PDFLATEX ?= pdflatex
export SOURCE_DATE_EPOCH := 1791590400
export FORCE_SOURCE_DATE := 1

.PHONY: paper check clean
# Three passes let a clean checkout settle cross-references, contents and hyperref data.
paper:
	cd paper && $(PDFLATEX) -interaction=nonstopmode -halt-on-error main.tex
	cd paper && $(PDFLATEX) -interaction=nonstopmode -halt-on-error main.tex
	cd paper && $(PDFLATEX) -interaction=nonstopmode -halt-on-error main.tex

# Fails on TeX warnings, bad boxes, unresolved references, or a wrong page count.
check:
	@! grep -E 'Warning|Overfull|Underfull|undefined|Rerun to get' paper/main.log
	@grep -q 'Output written on main.pdf (20 pages' paper/main.log
	@! pdftotext paper/main.pdf - | grep -F '??'
	@pdfinfo paper/main.pdf | grep -E '^(Title|Author|Subject|Pages):'
	@echo "check: PASS (document consistency only; not a proof check)"

clean:
	cd paper && rm -f main.aux main.log main.out main.toc
