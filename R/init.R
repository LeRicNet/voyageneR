#' Initialize function
#'
#' This function loads a Seurat object and extracts the expression matrix.
#'
#' @return Null; variables are saved to the global environment and accessed by
#'               the temporary id provided by the API.
#' @examples
#' initialize()
initialize <- function() {

  s.obj <<- loadSeuratObject()

  expression_matrix <<- s.obj@assays$integrated@scale.data
}
