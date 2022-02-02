#'Seurat Object to CSV Conversion Wrapper
#'
#'CSV Conversion Wrapper for Seurat Objects
#'@param data_slot Choose which data slot to pull from. Default is (counts)

#'@return csv file output into working directory
#'@examples
#'seurat_to_csv(pbmc.seurat)
#'@export
#'
#'
#'

library(data.table)
library(Seurat)
library(dplyr)
library(beepr)
#=======================================================================
seurat_to_csv <- function(seurat_object,
                          data_slot="counts",
                          matrix_file="counts.csv",
                          meta_file="meta.csv"){
  #load seurat object
print("....Running Seurat to CSV Conversion....")
#=======================================================================
#=======================================================================
# Pull out original counts matrix from Seurat Object
out <-as.matrix(GetAssayData(object = seurat_object, slot = paste(data_slot)))
print("....Matrix Extracted....")
write.csv(out, file=paste(matrix_file), row.names = T, col.names = T)
rm(out)
print("....Saved Matrix as CSV....")
meta<-as.data.frame(seurat_object@meta.data)
print("....Meta Data Extracted....")
#=======================================================================
#=======================================================================
write.csv(meta, file=meta_file, row.names = T, col.names = T)
print("....Saved Meta Data as CSV....")
print("....Outputs Complete....")
#=======================================================================
beep()
}
