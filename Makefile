all: intervals.pdf airplane.pdf waiter1D.pdf thesis.pdf

watch: thesis.tex
	echo latexmk -pvc -view=pdf $< 

%.tex: 
	echo "$@ being made from makefile"

thesis.pdf: thesis.tex intervals.pdf airplane.pdf waiter1D.pdf intervalPapers.bib airplanePapers.bib waiterPapers.bib Makefile
		latexmk -pdf -pdflatex="pdflatex -interactivenonstopmode" -use-make $<

%.pdf: %.tex Makefile FORCE
	latexmk -pdf -pdflatex="pdflatex -interactivenonstopmode" -use-make $<

FORCE:

clean: 
	latexmk -CA
	rm -rf \#* *~ *.bbl *.log *.aux
