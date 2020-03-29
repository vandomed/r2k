Quick Kable Outputs with ‘r2k’
================
Dane Van Domelen <br> <vandomed@gmail.com>
2020-03-28

<!-- README.md is generated from README.Rmd. Please edit that file -->

## Installation

You can install and load **r2k** from GitHub via the following code:

``` r
devtools::install_github("vandomed/r2k")
library("r2k")
```

## Concept

The idea is to provide functions that work just like a common base R
function, like `table` and `glm`, but that immediately produce neat
`kable` outputs. For example, you can call `table_r2k` just as you would
`table`, but the result will be a `kable` that is immediately printed to
the RStudio Viewer, and which is immediately ready for printing in an R
Markdown document.

## Functions

### table\_r2k

Here’s an example:

To summarize a fitted generalized linear model, simply call `glm_v` as
you would `glm`. The result will be a formatted summary table printed to
the RStudio Viewer. Here’s an example for logistic regression:

``` r
table_r2k(mtcars$cyl, mtcars$gear)
```

![Figure](vignettes/table_r2k.PNG)

From here, you can “snip” the table and save it as a figure (as I did
for this README) or copy directly from the Viewer and paste outside of
R.

Alternatively, you can call `table_r2k` within an R Markdown document,
and the resulting table should print very nicely without any extra
steps.

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
