#!/usr/bin/env texlua
-- Add ALL pkgs from list... (only need in firt run) , comment after
os.execute("tlmgr install $(cat texlive/texlive_packages | grep -v -e '^[[:space:]]*$' -e '^#')")
-- Update TeXLive distribution
os.execute("tlmgr update --self --all --no-auto-install")
-- Compiling files using latexmk -cd /path/to/file.tex
os.execute("latexmk -pdf -cd src/main.tex")
os.execute("latexmk -pdf -cd src/biber-mwe.tex")
os.execute("latexmk -e '$pdflatex=q/pdflatex %O -shell-escape %S/' -pdf -cd src/minted.tex")
os.execute("latexmk -xelatex -cd src/fonts.tex")
