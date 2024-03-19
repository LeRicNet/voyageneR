loadSeuratObject <- function() {
  seurat_object <- readRDS("/home/opencpu/data/acp_scn_annotated.rds")
  return(seurat_object)
}
