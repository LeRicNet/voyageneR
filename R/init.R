#' Initialize function
#'
#' This function loads a Seurat object and extracts the expression matrix.
#'
#' @return Null; variables are saved to the global environment and accessed by
#'               the temporary id provided by the API.
#' @examples
#' initialize()
initialize <- function() {

  seurat_object <- loadSeuratObject()

  # expression_matrix <<- s.obj@assays$integrated@scale.data
  assign("seurat_object", seurat_object, envir = .GlobalEnv)
}

checkEnv <- function() {
  global_vars <- ls(envir = globalenv())
  return(global_vars)
}
