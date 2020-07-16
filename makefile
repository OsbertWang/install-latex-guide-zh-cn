INSTALLLATEX  = install-latex-guide-zh-cn
PDF       = $(INSTALLLATEX).pdf
REQUIRE   = $(INSTALLLATEX).tex $(wildcard ./chapter/*.tex) $(wildcard ./appendix/*.tex)
TEMP      = $(INSTALLLATEX).xdv $(INSTALLLATEX).aux $(INSTALLLATEX).log $(INSTALLLATEX).toc $(INSTALLLATEX).out $(INSTALLLATEX).synctex.gz \
            $(wildcard ./chapter/*.aux) $(wildcard ./appendix/*.aux)

TEX       = xelatex
MODE      = -synctex=1
NOPDFMODE = -synctex=1 --no-pdf

all: $(PDF)

$(PDF): $(REQUIRE)
	$(TEX) $(NOPDFMODE) $(INSTALLLATEX)
	$(TEX) $(MODE) $(INSTALLLATEX)

clean:
	rm $(PDF) $(TEMP)

.PHONY: all clean