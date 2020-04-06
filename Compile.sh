rm -f *.log
rm -f *.aux
rm -f *.bbl
rm -f *.blg
rm -f *.toc
rm -f *.out
rm -f *.tmp
rm -f *.fls
rm -f *.brf
rm -f *.xdv
rm -f *.fdb_latexmk
echo Start XeLaTeX......1/5
xelatex -no-pdf Main.tex
echo BiBTeX......2/5
bibtex Main
echo XeLaTeX...... 3/5
xelatex -no-pdf Main.tex
echo XeLaTeX...... 4/5
cat Main.tex|sed 's;^\\\documentclass\[draft\,chinese\]{ylbook};\\\documentclass[chinese]{ylbook};'>Main.tmp1.tex
mv Main.tex Main.tmp.tex
mv Main.tmp1.tex Main.tex
xelatex Main.tex
mv Main.tmp.tex Main.tex
echo Delete files...... 5/5
rm -f *.log
rm -f *.aux
rm -f *.bbl
rm -f *.blg
rm -f *.toc
rm -f *.out
rm -f *.tmp
rm -f *.fls
rm -f *.brf
rm -f *.xdv
rm -f *.fdb_latexmk
echo Done!
