### Hierarcheal clustering ##########

set.seed (2)
x=matrix (rnorm (50*2) , ncol =2)
dim(x)
head(x)
plot(x[,1],x[,2],pch=18,col="red")

x[1:25 ,1]=x[1:25 ,1]+3
x[1:25 ,2]=x[1:25 ,2]-4
plot(x[,1],x[,2],pch=18,col="red")


# Complete, single, and average linkage clustering,
# With Euclidean distance as the dissimilarity measure.
#par(mfrow =c(1,3))
hc.complete =hclust(dist(x), method ="complete")
plot(hc.complete ,main =" Complete Linkage ", xlab="", sub ="",cex =0.9,col="blue")
cutree (hc.complete , 2)

hc.average  =hclust(dist(x), method ="average")
plot(hc.average , main =" Average Linkage ", xlab="", sub ="",cex =.9,col="red")
cutree (hc.average , 2)

hc.single   =hclust(dist(x), method ="single")
plot(hc.single , main=" Single Linkage ", xlab="", sub ="",cex =.9,col="darkgreen")
cutree (hc.single , 2)


#NOTE: complete and average linkage generally separate the observations into their correct groups.
#      However, single linkage identifies one point as belonging to its own cluster.


# Before performing hierarchical clustering of the observations, we use the scale() function
xsc=scale (x)
plot(hclust (dist(xsc), method ="complete"), main =" Hierarchical Clustering with Scaled Features ")

