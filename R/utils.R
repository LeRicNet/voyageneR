.onLoad <- function(libname, pkgname) {
  # data_path <- system.file("data", "yourdata.rds", package = pkgname)
  seurat_object <- loadSeuratObject()
  assign("seurat_object", seurat_object, envir = .GlobalEnv)
}
