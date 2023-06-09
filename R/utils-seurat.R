.check_seurat_installed <- function(quietly = FALSE) {
  pkg <- 'SeuratObject'
  checks <- c(
    installed = requireNamespace(pkg, quietly = TRUE),
    version = tryCatch(
      expr = utils::packageVersion(pkg) >= .MINIMUM_SEURAT_VERSION(),
      error = function(...) {
        return(FALSE)
      }
    )
  )
  if (isTRUE(quietly)) {
    return(invisible(all(checks)))
  }
  if (!checks['installed']) {
    stop(sQuote(pkg), " must be installed", call. = FALSE)
  }
  if (!checks['version']) {
    stop(
      sQuote(pkg),
      " must be version ",
      .MINIMUM_SEURAT_VERSION('c'),
      " or higher",
      call. = FALSE
    )
  }
  return(invisible(TRUE))
}

.anndata_to_seurat_reduc <- function(x, type = c('embeddings', 'loadings')) {
  if (is.null(x)) {
    return(NULL)
  }
  stopifnot(is.character(x), is.character(type))
  type <- type[1L]
  type <- match.arg(type)
  return(switch(
    EXPR = type,
    embeddings = tolower(gsub(pattern = '^X_', replacement = '', x = x)),
    loadings = {
      m <- regexpr(pattern = '[[:upper:]]+', text = x)
      x <- tolower(unlist(regmatches(x = x, m = m)))
      x[x == 'pc'] <- 'pca'
      x[x == 'ic'] <- 'ica'
      x
    }
  ))
}

.MINIMUM_SEURAT_VERSION <- function(repr = c('v', 'c')) {
  repr <- repr[1L]
  repr <- match.arg(arg = repr)
  version <- '4.1.0'
  return(switch(EXPR = repr, v = package_version(version), version))
}
