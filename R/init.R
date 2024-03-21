initialize <- function() {
  s.obj <<- loadSeuratObject()
  expression_matrix <<- s.obj@assays$integrated@scale.data
}
