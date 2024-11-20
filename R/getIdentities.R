getIdentities <- function() {
  return(data.frame(
    'identities' = colnames(seurat_object@meta.data)
  ))
}
