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

Pandoc uses a template which, when used with XeTeX calls mathspec.sty; mathspec.sty calls fontspec.sty with some options. If something else calls fontspec.sty then there will be a clash, and tufte-handout.cls does so. One solution would be to edit the template Pandoc uses. Taking out mathspec.sty would do the trick.
