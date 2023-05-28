install.packages("igraph")
library(igraph)

grafo = graph(edges = c("0","1","0","2","0","5","1","2","1","6","2","4","2","5","2","6","4","5","4","3","3","6"),directed = F)
E(grafo)$weight = c(5,3.1,5.2,4.9,5.2,6,3.2,3,4.7,5.5,4.8)
plot(grafo, edge.label = E(grafo)$weight)

distances(grafo, V(grafo)$name == "0", V(grafo)$name == "3")
menorc = shortest_paths(grafo,V(grafo)$name=="0",V(grafo)$name=="3",output=c("both"))
menorc$vpath

for(i in 1:length(V(grafo))){
  V(grafo)$color[i] = ifelse(i %in% as.vector(unlist(menorc$vpath)),"green","black")
}

for(i in 1:length(E(grafo))){
  E(grafo)$color[i] = ifelse(i %in% as.vector(unlist(menorc$epath)),"green","black")
}

plot(grafo, edge.label = E(grafo)$weight)

