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

/usr/lib/rstudio/bin/pandoc/pandoc +RTS -K512m -RTS goose_mmdata.utf8.md --to latex --from markdown+autolink_bare_uris+ascii_identifiers+tex_math_single_backslash --output goose_mmdata.pdf --template /home/pratik/R/x86_64-pc-linux-gnu-library/3.4/tufte/rmarkdown/templates/tufte_handout/resources/tufte-handout.tex --highlight-style pygments --latex-engine xelatex --variable 'documentclass:tufte-handout' --bibliography geese_citations.bib --filter /usr/lib/rstudio/bin/pandoc/pandoc-citeproc
