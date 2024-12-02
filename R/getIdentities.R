getIdentities <- function() {

  cnames <- colnames(seurat_object@meta.data)
  cnames <- cnames[!grepl('nCount', cnames)]
  cnames <- cnames[!grepl('nFeature', cnames)]

  return(data.frame(
    'identities' = cnames
  ))
}

getGenes <- function() {
  genes <- rownames(seurat_object)
  return(genes)
}
