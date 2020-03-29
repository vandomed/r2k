#' Shortcut to Convert an R Object to a Kable
#'
#' Calls \code{\link[knitr]{kable}} and \code{\link[kableExtra]{kable_styling}}
#' as appropriate based on class of input object and creates object ready to
#' snip or copy/paste out of R. Currently works for data frames and matrices.
#'
#' @param x Object to convert to \code{\link[knitr]{kable}}.
#'
#'
#' @return \code{\link[knitr]{kable}}
#'
#'
#' @examples
#' r2k(mtcars)
#'
#'
#' @export

r2k <- function(x) {

  classx <- class(x)
  if ("data.frame" %in% classx | "matrix" %in% classx) {
    return(x %>% kable() %>% kable_styling(full_width = FALSE))
  }
  return(NULL)

}
