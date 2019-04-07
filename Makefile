documents := project-report.pdf

OUTDIR := latexmk-output
PDFDOCS = $(documents:.tex=.pdf)
TEX := latexmk -pdf -bibtex -output-directory=$(OUTDIR)

all: $(addprefix $(OUTDIR)/,$(PDFDOCS))

clean:
	rm -rf $(OUTDIR)

# $(bin)/$(project): $(objects)
#     $(CXX) $(cflags) $(objects) -o $(bin)/$(project)

# $(bin)/%.o: %.cpp
# 	mkdir -p $(bin)
# 	$(CXX) $(cflags) $(preprocflags) -c $< -o $@
# 	$(CXX) $(cflags) $(preprocflags) -c $< -MM -MP -MF $(bin)/$*.d -MT $@

$(OUTDIR)/%.pdf: %.tex $(OUTDIR)/dummy.txt vtreport.sty Makefile
	$(TEX) $<

$(OUTDIR)/dummy.txt:
	mkdir -p $(OUTDIR)
	touch $(OUTDIR)/dummy.txt

.PHONY: all clean
