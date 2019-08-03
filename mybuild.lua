#!/usr/bin/env texlua
-- Add ALL pkgs from list... (only need in firt run) 
os.execute("tlmgr install $(cat texlive/texlive_packages | grep -v -e '^[[:space:]]*$' -e '^#')")
-- Update TeXLive distribution
-- os.execute("tlmgr update --self --all --no-auto-install")
os.execute("latexmk -e '$pdflatex=q/lualatex %O -interaction=nonstopmode %S/' -pdf main.tex")
-- os.execute("dvips sample2e.dvi")
-- os.execute("ps2pdf sample2e.ps")
-- Compiling files using latexmk -cd /path/to/file.tex
--os.execute("latexmk -e '$pdflatex=q/pdflatex %O -interaction=nonstopmode %S/' -pdf -cd src/main.tex")
--os.execute("latexmk -pdf -cd src/biber-mwe.tex")
--os.execute("latexmk -e '$pdflatex=q/pdflatex %O -shell-escape %S/' -pdf -cd src/minted.tex")
--os.execute("latexmk -e '$pdflatex=q/xelatex %O -shell-escape %S/' -pdf -cd src/fonts.tex")
