#' Add together two numbers
#' @export
#' @param x A number.
#' @param y A number.
#' @return The sum of \code{x} and \code{y}.
#' @examples
#' add(1, 1)
#' add(10, 1)


pseudobulk_all<-function(object){

  library(purrr)
  tmp<-object
  DefaultAssay(tmp)<-"RNA"
  #tmp<-NormalizeData(tmp)
  #x<-Seurat::AverageExpression(tmp,group.by = c("CellType2","Patient"),assays = "RNA")
  #x<-as.matrix(x$RNA)
  #colnames(x)<-unname(colnames(x))
  full.split<-SplitObject(tmp,split.by = c("Patient"))

  means<-array(NA)
  nm<-list()
  for (i in 1:length(full.split)){
    data <- as.matrix(GetAssayData(full.split[[i]]))
    a <- as.data.frame(rowSums(data, na.rm=TRUE))
    nm[[i]]<- data.frame(sum=rowSums(data, na.rm=TRUE))
    nm[[i]]$gene<-rownames(a)
    rownames(nm[[i]])<-rownames(a)
  }
  newdf<-nm %>% purrr::reduce(left_join, by = "gene")
  newdf[is.na(newdf)] <- 0
  rownames(newdf)<-newdf$gene
  tmp<-c(2)
  newdf<-newdf[-tmp]
  colnames(newdf)<-names(full.split)
  rm(full.split)
return(newdf)
}
