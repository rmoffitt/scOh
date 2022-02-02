#' Add together two numbers
#' @export
#' @param x A number.
#' @param y A number.
#' @return The sum of \code{x} and \code{y}.
#' @examples
#' add(1, 1)
#' add(10, 1)


convert_symbol_entrez<-function(gene){
  library(org.Hs.eg.db)
  ids<-bitr(gene, fromType = "SYMBOL", toType = "ENTREZID", OrgDb=org.Hs.eg.db)
  # remove duplicate IDS (here I use "ENSEMBL", but it should be whatever was selected as keyType)
  dedup_ids = ids[!duplicated(ids[c("SYMBOL")]),]
  # Create a new dataframe df2 which has only the genes which were successfully mapped using the bitr function above
 # df2 = gene[gene %in% dedup_ids$SYMBOL,]
  out<-NULL
  out$symbol<-intersect(dedup_ids$SYMBOL,gene)
  # Create a new column in df2 with the corresponding ENTREZ IDs
out$entrez<-dedup_ids$ENTREZID

  # Create a vector of the gene unuiverse

return(out$entrez)
  print("Convert Complete!")
}
