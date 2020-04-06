#' Alternate Version of 'table' that Returns a Formatted Kable
#'
#' Works just like \code{\link[base]{table}}, but returns a formatted
#' \code{\link[knitr]{kable}} which should print nicely in a report.
#'
#'
#' @param ... Arguments to pass to \code{\link[base]{table}}.
#'
#'
#' @return \code{\link[base]{kable}} object.
#'
#'
#' @examples
#' # Frequency of mtcars$cyl
#' table_v(mtcars$cyl)
#'
#' # Crosstab of cyl and gear
#' table_v(mtcars$cyl, mtcars$gear)
#'
#' # Crosstab of cyl and gear, across strata of am
#' table_v(mtcars$cyl, mtcars$gear, mtcars$am)
#'
#'
#' @export
table_k <- function(...) {

  # Call table
  arguments <- list(...)
  df.table <- table(..., deparse.level = 2)

  # Get variable names
  varnames <- names(dimnames(df.table))
  varnames <- sapply(varnames, function(x) {
    loc <- which(unlist(strsplit(x, "")) == "$")
    if (length(loc) == 0) return(x)
    return(substring(x, (loc + 1)))
  })

  if (length(varnames) == 1) {

    # Convert to matrix
    levels <- names(df.table)
    df <- matrix(df.table, nrow = 1, dimnames = list(NULL, levels))

    # Add header
    header <- length(levels)
    names(header) <- varnames
    df %>%
      kable() %>%
      kable_styling(full_width = FALSE) %>%
      collapse_rows(1) %>%
      add_header_above(header = header) %>%
      return()

  }

  if (length(varnames) == 2) {

    # Convert table to matrix and get group levels
    rnames <- rownames(df.table)
    cnames <- colnames(df.table)

    # Add X groups as first column
    df <- matrix(as.character(df.table), nrow = nrow(df.table))
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
      add_header_above(header = header) %>%
      return()

  }

  # Get levels of i, j, and k variable
  rnames <- dimnames(df.table)[[1]]
  cnames <- dimnames(df.table)[[2]]
  snames <- dimnames(df.table)[[3]]

  n.rows <- length(rnames)
  n.cols <- length(cnames)
  n.strata <- length(snames)
  n.each <- n.rows * n.cols

  # Create side-by-side ixj tables, separated by "" columns
  df <- cbind(varnames[1], rnames, matrix(df.table[1: n.each], nrow = n.rows, dimnames = list(NULL, cnames)))
  for (ii in 2: n.strata) df <- cbind(df, "", matrix(df.table[(n.each * (ii - 1) + 1): (n.each * 2)], nrow = n.rows, dimnames = list(NULL, cnames)))
  colnames(df)[1: 2] <- ""

  # Create header
  header <- c(2, n.cols)
  for (ii in 2: n.strata) header <- c(header, 1, n.cols)
  names(header) <- rep(" ", length(header))
  names(header)[seq(2, length(header), 2)] <- paste(varnames[2], " (", varnames[3], " = ", snames, ")", sep = "")

  # Output
  df %>%
    kable() %>%
    kable_styling(full_width = FALSE) %>%
    column_spec(column = 1: 2, bold = TRUE) %>%
    collapse_rows(1) %>%
    add_header_above(header = header) %>%
    return()

}
