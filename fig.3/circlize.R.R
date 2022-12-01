library(statnet)
library(circlize)
data<-read.csv("C:/Users/M&R/Desktop/1.csv",header=T,row=1)
my.data<-as.matrix(data) 
rownames(my.data) <-c("0-20", "20-40", "40-60", "60-80","80-100")
colnames(my.data) <-c("Acidobacteria","Actinobacteria","Bacteroidetes",
                      "Balneolaeota","Candidatus Saccharibacteria","Chloroflexi",
                      "Crenarchaeota","Cyanobacteria","Euryarchaeota",
                      "Firmicutes","NAmissing","Planctomycetes",
                      "Proteobacteria","Spirochaetes", "Thaumarchaeota",
                      "Thermodesulfobacteria","Thermotogae","Verrucomicrobia","Tenericutes")
grid.col = NULL
grid.col[c("0-20", "20-40", "40-60", "60-80","80-100")] = c("blue", "black", "orange", "chocolate","gray")
grid.col[colnames(my.data)] = c("lavender", "khaki","mistyrose",
                                "sienna1", "skyblue", "brown1",
                                "gold", "maroon", "salmon", 
                                "moccasin","wheat","black", 
                                "green","cyan","pink","orange","purple","black","gray")
circos.par(gap.degree = c(rep(2, nrow(my.data)-1), 10, rep(2, ncol(my.data)-1), 10),
           start.degree = 180)
chordDiagram(my.data,
             directional = TRUE,
             diffHeight = 0.06,
             grid.col = grid.col,
             transparency = 0.5)
egend("right",pch=20,legend=colnames(my.data),
      col=grid.col[colnames(my.data)],bty="n",
      cex=1,pt.cex=3,border="black") 
pdf(file="circlize.pdf", width=8, height=5, pointsize=8)
chordDiagram(my.data,directional = TRUE,diffHeight = 0.06,grid.col = grid.col, transparency = 0.5)
legend("right",pch=20,legend=colnames(my.data),col=grid.col[colnames(my.data)],bty="n",cex=1,pt.cex=3,border="black")
dev.off()
