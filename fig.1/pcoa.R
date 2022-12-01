library(ade4)
library(ggplot2)
library(RColorBrewer)
library(vegan)
data <- read.table("C:/Users/Xiaomin Wang/Desktop/pcoa.txt", h = T)
data01<-data[,-268]
dis01<-vegdist(data01,method = "euclidean")
pcoa1<- dudi.pco(dis01, scan = FALSE,nf=3)
pcoa1
pcoa1_eig<-pcoa1$eig[1:2]/sum(pcoa1$eig)
pcoa1_eig
sample_site1<-data.frame({pcoa1$li})[1:2]
sample_site1$names<-rownames(sample_site1)
sample_site1$names
data$ID
sample_site1$level<-factor(data$ID,levels = c("A","B","C","D"))
sample_site1$level
names(sample_site1)[1:2]<-c("PCoA1","PCoA2")
p<-ggplot(sample_site1, mapping=aes(PCoA1, PCoA2,color=level))+theme_classic()+stat_ellipse(level = 0.95)
p<-p+geom_point()
p
