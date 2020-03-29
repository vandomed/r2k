#' Alternate Version of 'table' that Returns a Neatly Formatted Kable
#'
#' Calls \code{\link[base]{table}}, does some basic formatting, and then calls
#' \code{\link[knitr]{kable}} and \code{\link[kableExtra]{kable_styling}}.
#'
#'
#' @param ... Arguments to pass to \code{\link[base]{table}}.
#'
#'
#' @return \code{\link[knitr]{kable}}
#'
#'
#' @examples
#' # Crosstab of gears and cylinder using mtcars dataset
#' table_r2k(mtcars$cyl, mtcars$gear)
#'
#'
#' @export
table_r2k <- function(...) {

  # Call table
  arguments <- list(...)
  df <- table(..., deparse.level = 2)

  varnames <- names(dimnames(df))
  varnames <- sapply(varnames, function(x) {
    loc <- which(unlist(strsplit(x, "")) == "$")
    if (length(loc) == 0) return(x)
    return(substring(x, (loc + 1)))
  })

  # Convert table to matrix and get group levels
  df <- as.matrix(df)
  rnames <- rownames(df)
  cnames <- colnames(df)

  # Add X groups as first column
  df <- matrix(as.character(df), nrow = nrow(df))
  df <- cbind(rnames, df)

  # Add Y group as column names
  colnames(df) <- c("", cnames)

  # Set first column to x variable name
  df <- cbind(varnames[1], df)

  # Create header for y variable name
  header <- c(2, ncol(df) - 2)
  names(header) <- c(" ", varnames[2])

  # Output
  df %>%
    kable() %>%
    kable_styling(full_width = FALSE) %>%
    column_spec(column = 1: 2, bold = TRUE) %>%
    collapse_rows(1) %>%
    add_header_above(header = header)

}
