set.seed (2)
x=matrix (rnorm (50*2) , ncol =2)
dim(x)
plot(x[,1],x[,2],pch=18,col="red")


x[1:25 ,1]=x[1:25 ,1]+3
x[1:25 ,2]=x[1:25 ,2]-4
plot(x[,1],x[,2],pch=18,col="red")


# We now perform K-means clustering with K = 2.
km.out =kmeans (x,2)
km.out$cluster
# K-means clustering perfectly separated the observations into two clusters
# even though we did not supply any group information to kmeans().

plot(x, col =(km.out$cluster) , main="K-Means Clustering Results with K=2", xlab ="", ylab="", pch =20, cex =2)

#################################################################
# HINT: Here the observations can be easily plotted because they are two-dimensional.
#       If there were more than two variables then we could instead perform PCA
#       and plot the first two principal components score vectors. 
#################################################################
set.seed (4)
km.out =kmeans (x,3, nstart =1)
km.out$tot.withinss
plot(x, col =(km.out$cluster) , main="K-Means Clustering Results with K", xlab ="", ylab="", pch =20, cex =2)

set.seed (4)
km.out =kmeans (x,3, nstart =20)
km.out$tot.withinss
plot(x, col =(km.out$cluster) , main="K-Means Clustering Results with K", xlab ="", ylab="", pch =20, cex =2)
km.out$cluster


# nstart: If a value of nstart greater than one is used
# then K-means clustering will be performed using multiple random assignments in Step 1 of Algorithm 10.1
# It is recommended to nstart between 20 to 50

