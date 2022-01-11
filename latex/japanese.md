# Using Japanese in LaTeX

If you are using `pdflatex` for compile, using `CJKutf8` is a quick and easy solution.
Add `\usepackage{CJKutf8}` to your preamble and use the following environment.  

```
\begin{CJK}{UTF8}{ipxm}
日本語の文章
\end{CJK}
```

Using font `ipxm` will look better than `min`.
