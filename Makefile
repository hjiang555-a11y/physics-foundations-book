# Makefile for Physics Foundations Book
# Uses Tectonic (XeTeX-based, auto-downloads packages)

TECTONIC = /tmp/tectonic
BOOKDIR  = book
MAIN     = $(BOOKDIR)/main.tex
OUTDIR   = $(BOOKDIR)/build
PDF      = $(OUTDIR)/main.pdf
FINAL    = $(BOOKDIR)/physics-foundations.pdf

.PHONY: all clean

all: $(FINAL)

$(FINAL): $(MAIN) $(BOOKDIR)/chapters/*.tex $(BOOKDIR)/refs.bib
	@mkdir -p $(OUTDIR)
	$(TECTONIC) --outdir $(OUTDIR) $(MAIN)
	@cp $(PDF) $(FINAL)
	@echo "Done: $(FINAL)"

clean:
	rm -rf $(OUTDIR) $(FINAL)
