Quick Kable Outputs
================
Dane Van Domelen <br> <vandomed@gmail.com>
2020-04-05

<!-- README.md is generated from README.Rmd. Please edit that file -->

## Installation

To install and load **r2k** from GitHub:

``` r
devtools::install_github("vandomed/r2k")
library("r2k")
```

## Concept

The idea is to provide functions that work just like common base R
functions, like `table` and `glm`, but that immediately produce clean
`kable` printed to the RStudio Viewer or to an R Markdown document.

Each function has two variants: `<function>_v` and `<function>_k`. The
`_v` version (for “Viewer”) prints to the Viewer but still returns the
object you’d expect from `<function>`. The `_k` version (for “kable”)
returns a `kable` which should print nicely without any further steps in
R Markdown/**knitr** documents.

## Functions

### table\_v

If you swap in `table_v` for `table`, the results print neatly to the
Viewer:

``` r
df <- table_v(mtcars$cyl, mtcars$gear)
```

![Figure](vignettes/table_v.PNG)

From there, if you want to export the table out of R, you could “snip”
the table and save it as a figure (as I did for this README) or copy
directly from the Viewer and paste outside of R. In my experience,
output from the Viewer pastes nicely into Word, Excel, and PowerPoint.

Similarly, you can use `table_k` in R Markdown documents to quickly
generate `kable` outputs without any extra steps.

### r2k

The namesake function is very simple: it just converts R objects to
kables by calling `kable` and `kable_styling`. To print out the
4-cylinder cars in `mtcars`, using **dplyr** and piping:

``` r
mtcars %>%
  dplyr::filter(cyl == 4) %>%
  r2k()
```

![Figure](vignettes/r2k.PNG)

## References

<div id="refs" class="references">

<div id="ref-knitr3">

Xie, Yihui. 2014. “Knitr: A Comprehensive Tool for Reproducible Research
in R.” In *Implementing Reproducible Computational Research*, edited by
Victoria Stodden, Friedrich Leisch, and Roger D. Peng. Chapman;
Hall/CRC. <http://www.crcpress.com/product/isbn/9781466561595>.

</div>

<div id="ref-knitr2">

———. 2015. *Dynamic Documents with R and Knitr*. 2nd ed. Boca Raton,
Florida: Chapman; Hall/CRC. <https://yihui.name/knitr/>.

</div>

<div id="ref-knitr1">

———. 2018. *Knitr: A General-Purpose Package for Dynamic Report
Generation in R*. <https://yihui.name/knitr/>.

</div>

</div>
