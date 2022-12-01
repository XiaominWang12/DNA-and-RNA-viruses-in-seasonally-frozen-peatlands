library(ggplot2)
library(gggenes)
gene<- read.table("C:/Users/M&R/Desktop/gene.txt",  header = T)
ggplot(gene, aes(xmin = start, xmax = end, y = molecule, fill = gene, forward = direction)) +
  geom_gene_arrow() +
  facet_wrap(~ molecule, scales = "free", ncol = 1) +
  scale_fill_brewer(palette = "Set3") +
  theme_genes()
