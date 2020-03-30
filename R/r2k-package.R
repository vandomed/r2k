#' R Functions Modified to Immediately Return Kable Outputs
#'
#' For example, table_r2k(x, y) is like table(x, y) but produces a kable output
#' that prints neatly to the RStudio Viewer or to an R Markdown document. Other
#' functions include lm_r2k, glm_r2k, gee_r2k, coxph_r2k, and svyglm_r2k. Also
#' includes a generic r2k function for converting R objects to kables.
#'
#' \tabular{ll}{
#' Package: \tab r2k \cr
#' Type: \tab Package \cr
#' Version: \tab 1.1.1 \cr
#' Date: \tab 2020-03-29 \cr
#' License: \tab GPL-3 \cr
#' }
#'

#' @author Dane R. Van Domelen \cr \email{vandomed@gmail.com}
#'
#'
#' @docType package
#' @importFrom dplyr %>%
#' @importFrom kableExtra add_header_above collapse_rows column_spec kable_styling
#' @importFrom knitr kable
#' @import MASS
#' @import stats
#' @importFrom survey svyby svychisq svyglm svymean svyquantile svyranktest svytable svyttest svyvar
#' @importFrom utils capture.output
#' @name r2k-package
NULL
