#!/usr/bin/env sh

tmp="."

rm -f 01paper.pdf

makeindex "${tmp}/1paper.nlo" -s 1nomencl.ist -o "${tmp}/01paper.nls"

makeindex -s "${tmp}/01paper.ist" -t "${tmp}/01paper.slg" -o "${tmp}/01paper.syi" "${tmp}/01paper.syg"
makeindex -s "${tmp}/01paper.ist" -t "${tmp}/01paper.clg" -o "${tmp}/01paper.cyi" "${tmp}/01paper.cyg"
makeindex -s "${tmp}/01paper.ist" -t "${tmp}/01paper.alg" -o "${tmp}/01paper.acr" "${tmp}/01paper.acn"
makeindex -s "${tmp}/01paper.ist" -t "${tmp}/01paper.glg" -o "${tmp}/01paper.gls" "${tmp}/01paper.glo"
makeindex -s "${tmp}/01paper.ist" -o "${tmp}/01paper.ind" "${tmp}/01paper.idx"

pdflatex -aux-directory="${tmp}" 01paper.tex

bibtex "${tmp}/01paper.aux"

pdflatex -aux-directory="${tmp}" 01paper.tex

pdflatex -aux-directory="${tmp}" 01paper.tex
