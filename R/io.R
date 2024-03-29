#' Load a Seurat object
#'
#' This function loads a Seurat object from a specified file.
#'
#' @return A Seurat object loaded from "/home/opencpu/data/acp_scn_annotated.rds".
#' @export
#'
#' @examples
#' loadSeuratObject()
#'
loadSeuratObject <- function() {
  # seurat_object <- readRDS("/home/opencpu/data/acp_scn_annotated.rds")
  seurat_object <- qs::qread("/home/opencpu/data/acp_scn.qs")
  return(seurat_object)
}
