install.packages("MVA")
install.packages("calibrate")
install.packages("HSAUR2")
install.packages("pls")
install.packages("ISLR")#Hitters
install.packages("rgl")
install.packages("Rcmdr")
install.packages("ellipse")
library(calibrate)
library(MVA)
library(HSAUR2)
library(pls)
library(ISLR)
library(rgl)
library(scatterplot3d)
#library(Rcmdr)
library(ellipse)
###########################################

dim(USArrests)
dimnames(USArrests)
View(USArrests)
write.csv(USArrests, "D:/CARRER/My_Course/Daily Classes/Module3/4 Principle Component Analysis/USArrests.csv")
## Different crimes along with the states


apply(USArrests,2,mean)
apply(USArrests,2,var) #Varaiances are diiferent,say standardize it.
pr.out=prcomp(USArrests,scale=T) #It does not consider city as it mentioned row.names.
names(pr.out)
pr.out$rotation # 4 eighen vectors will be shown
names(pr.out)

#pr.out$center
#pr.out$scale
pr.out$rotation
pr.out$x # Actual Principal components

pr.out$x[,1]
pr.out$x[,2]
pr.out$x[,3]
pr.out$x[,4]


#Manual calculation for eigen values/vectors
x=scale(USArrests)
x=cor(x)
eigen(x)

plot(pr.out)
summary(pr.out)
#Looks out the cummulative proportion of PC2 and PC3
#So, we can consider the PC1 and PC2 are the final variables.
#or, we can consider the PC1,PC2 and PC3 are the final variables.

cor(pr.out$x) # Should be zeros
plot(pr.out$x[,-1],pr.out$x[,-2]) # It should be ellipse in shape i.e they are independent

dim(pr.out$x )
biplot (pr.out , scale =0,cex=0.7)
#Scores generated in plot
#PcA1 vs PcA2

pv1=eigen(x)$values/sum(eigen(x)$values)
pv1
plot(pv1 , xlab=" Principal Component ", ylab=" Proportion of Variance Explained ", ylim=c(0,1) ,type="b")

#####################################


install.packages("plot3D")
library("plot3D")


data(USArrests)
with(USArrests, text3D(Murder, Assault, Rape, 
                       labels = rownames(USArrests), colvar = UrbanPop, 
                       col = gg.col(100), theta = 60, phi = 20,
                       xlab = "Murder", ylab = "Assault", zlab = "Rape", 
                       main = "USA arrests", cex = 0.6, 
                       bty = "g", ticktype = "detailed", d = 2,
                       clab = c("Urban","Pop"), adj = 0.5, font = 2))

plot3d(USArrests$Murder,USArrests$Assault,USArrests$Rape,pch=16,type="s",aspect=T,size=2,col=3,xlab = "Murder", ylab = "Assault", zlab = "Rape")


