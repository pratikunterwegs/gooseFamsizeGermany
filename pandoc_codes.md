---
title: Pandoc codes
---

**Markdown to PDF**

```pandoc file.rmd -o file.pdf```

**RMarkdown to PDF** or **Greek letters included**

```pandoc file.rmd -o file.pdf --latex-engine=xelatex```

**Markdown to PDF with TOC**

```pandoc file.md -o hedeby.tex --latex-engine=xelatex --toc```

**To recode files to UTF-8**

Especially for ```bibtex``` files.

```recode -f utf-8 <filename.extention>```

```pandoc geese001.md -t latex --filter pandoc-citeproc  -o geese001.pdf -S```

**To use special characters and Tufte classes**

# For centred images that occupy space

/usr/lib/rstudio/bin/pandoc/pandoc +RTS -K512m -RTS *.md goose_report.yaml --output goose_report.pdf --filter pandoc-citeproc --latex-engine pdflatex
