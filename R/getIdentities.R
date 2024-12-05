getIdentities <- function() {

  cnames <- colnames(acp_sn_meta)
  cnames <- cnames[!grepl('nCount', cnames)]
  cnames <- cnames[!grepl('nFeature', cnames)]
  cnames <- c('Gene Expression', cnames)

  return(data.frame(
    'identities' = cnames
  ))
}

getGenes <- function() {
  genes <- rownames(seurat_object)
  return(genes)
}
