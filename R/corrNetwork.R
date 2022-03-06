corrNetwork<-function(df,threshold=0.5,layout='nicely'){

  library(tidygraph)
  library(ggraph)
  library(corrr)
  library(tidyverse)
  options(ggrepel.max.overlaps = Inf)

  swiss.cor <- df %>%    # t() for matrix transpose
    correlate() %>%    # correlate() is equivalent to cor() but                                                put NA as its diagonal entry and different class
    shave(upper = TRUE) %>%            # Shave the data frame to lower triangular matrix
    stretch(na.rm = TRUE) %>%
    filter(r >= threshold)

  ## - Create Graph Table
  set.seed(100)
  swiss.graph <- as_tbl_graph(swiss.cor, directed = F)
  # There are 11 city missing, which means they have weak correlation to other city
  swiss.graph %>% activate(nodes) %>% as.data.frame() %>% nrow()
  ## - CellType2 Metadata
  # Set Node Colors
  met<-data.frame(Ident=names(swiss.graph[2]))
  met$CellType1<-NULL
  met$CellType1[met$Ident%in%c(a1,a2)]<-"Stroma"
  met$CellType1[met$Ident%in%c(b1,b2)]<-"Myeloid"
  met$CellType1[met$Ident%in%c(c1,c2)]<-"Epithelium"
  met$CellType1[met$Ident%in%c(d1,d2)]<-"Lymphocytes"
  met$CellType1[met$Ident%in%c(e1,e2)]<-"Endo"
  str(met$Ident)
  # Convert Factors into Colors
  color_easy = c("red", "blue", "yellow", "green","purple")[as.factor(met$CellType1)]
  levels(met$CellType1)
  ## - Plot Graph Network
  #==================================
  ggraph(swiss.graph,layout=layout) +
   # geom_edge_bend(aes(alpha=r,width=r),edge_colour = "grey66") +

    geom_edge_link0 (aes(alpha=r),edge_colour = "grey66") +
    geom_node_point(aes(color=color_easy,size=4)) +
    geom_node_text(
      aes(label = name), size = 4, repel = TRUE   ) +
    theme_graph()
}
