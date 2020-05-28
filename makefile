INSTALLLATEX  = main
PDF     = $(INSTALLLATEX).pdf
REQUIRE = $(INSTALLLATEX).tex
TEMP    = $(INSTALLLATEX).xdv $(INSTALLLATEX).aux $(INSTALLLATEX).log $(INSTALLLATEX).toc $(INSTALLLATEX).out $(INSTALLLATEX).synctex.gz

TEX     = xelatex
MODE    = -synctex=1
NOPDFMODE=-synctex=1 --no-pdf

RM      = rm

all: $(PDF)

$(PDF): $(REQUIRE)
	$(TEX) $(NOPDFMODE) $(INSTALLLATEX)
	$(TEX) $(MODE) $(INSTALLLATEX)

clean:
	$(RM) $(PDF) $(TEMP)

.PHONY: all clean