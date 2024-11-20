library(R6)
library(Seurat)
library(R.cache)

# Define the SeuratClass
SeuratClass <- R6Class("SeuratClass",
                       public = list(
                         seurat_object = NULL,

                         initialize = function(seurat_object) {
                           if (!inherits(seurat_object, "Seurat")) {
                             stop("The provided object is not a Seurat object.")
                           }
                           self$seurat_object <- seurat_object
                         },

                         getIdentities = function() {
                           if (is.null(self$seurat_object)) {
                             stop("Seurat object is not initialized.")
                           }
                           return(Idents(self$seurat_object))
                         }
                       )
)

# Function to create an instance and cache it
initialize_seurat <- function(seurat_data) {
  seurat_obj <- loadSeuratObject()
  seurat_instance <- SeuratClass$new(seurat_obj)
  R.cache::setCacheRootPath("/home/opencpu/data/app")
  R.cache::saveCache(seurat_instance, key = list("seurat_instance"))
  return("Session initialized")
}

# Function to get identities using the cached instance
get_seurat_identities <- function() {
  seurat_instance <- R.cache::loadCache(key = list("seurat_instance"))
  if (is.null(seurat_instance)) {
    stop("Seurat instance not found. Initialize the session first.")
  }
  return(seurat_instance$getIdentities())
}
