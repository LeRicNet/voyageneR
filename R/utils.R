.onLoad <- function(libname, pkgname) {
  # data_path <- system.file("data", "yourdata.rds", package = pkgname)
  seurat_object <- loadSeuratObject()
  expression_matrix <- seurat_object@assays$integrated@scale.data
  assign("seurat_object", seurat_object, envir = .GlobalEnv)
  assign("expression_matrix", expression_matrix, envir = .GlobalEnv)
}
