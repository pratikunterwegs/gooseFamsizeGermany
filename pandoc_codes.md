---
title: Pandoc codes
---

**Markdown to PDF**

```pandoc file.rmd -o file.pdf```

**RMarkdown to PDF** or **Greek letters included**

```pandoc file.rmd -o file.pdf --latex-engine=xelatex```

**Markdown to PDF with TOC**

```pandoc file.md -o hedeby.tex --latex-engine=xelatex --toc
