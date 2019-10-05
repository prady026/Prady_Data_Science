Boston=read.table(file="D:/CARRER/My_Course/Daily Classes/Module2/5 Residual Analysis/Polynomial Regression/Boston.csv",header=T,sep=",")
dim(Boston)
summary(Boston)
attach(Boston)
head(Boston)

Target = Boston[,15]
FullX= Boston[,2:14]

summary(FullX)

library(GGally)           # Scatter plot and correlation of all X variables
ggpairs(FullX)

cor(FullX)

plot(FullX$rm,Target)
cor(FullX$rm,Target)
plot(FullX$lstat,Target)
cor(FullX$lstat,Target)


BLR=lm(Target~rm+lstat,data=Boston)
BLR
summary(BLR)
rstd12 = rstandard(BLR) #Studentized (ri)
plot(BLR$fitted.values,rstd12,xlab="Yhat",ylab="Residual",ylim =c(-3,3))


#Searching for missing variable
plot(FullX$crim,rstd12,xlab="crim",ylab="Residual",ylim =c(-3,3))
plot(FullX$zn,rstd12,xlab="zn",ylab="Residual",ylim =c(-3,3))
plot(FullX$indus,rstd12,xlab="indus",ylab="Residual",ylim =c(-3,3))
plot(FullX$chas,rstd12,xlab="chas",ylab="Residual",ylim =c(-3,3))
plot(FullX$nox,rstd12,xlab="nox",ylab="Residual",ylim =c(-3,3))
plot(FullX$age,rstd12,xlab="age",ylab="Residual",ylim =c(-3,3))
plot(FullX$dis,rstd12,xlab="dis",ylab="Residual",ylim =c(-3,3))
plot(FullX$rad,rstd12,xlab="rad",ylab="Residual",ylim =c(-3,3))
plot(FullX$tax,rstd12,xlab="tax",ylab="Residual",ylim =c(-3,3))
plot(FullX$ptratio,rstd12,xlab="ptratio",ylab="Residual",ylim =c(-3,3))
plot(FullX$black,rstd12,xlab="black",ylab="Residual",ylim =c(-3,3))


################### polynomial regression ###########3
### 1
plot(Target,lstat)
cor(Target,lstat)
BLR1=lm(Target~lstat,data=Boston)
summary(BLR1)
plot(BLR1$fitted.values,Target)
cor(BLR1$fitted.values,Target)

#abline(lm(Target ~ lstat))


### 2
## plot(Target,poly(lstat,1))
## cor(Target,poly(lstat,1))
## BLR2=lm(Target~rm+poly(lstat,1),data=Boston)
## summary(BLR2)
## plot(BLR2$fitted.values,Target)
## cor(BLR2$fitted.values,Target)

### 3
cor(Target,poly(lstat,10))

BLR3=lm(Target~poly(lstat,2),data=Boston)
summary(BLR3)
plot(BLR3$fitted.values,Target)
cor(BLR3$fitted.values,Target)

### 4
BLR4=lm(Target~poly(rm,2)+poly(lstat,2),data=Boston)
summary(BLR4)
plot(BLR4$fitted.values,Target)
cor(BLR4$fitted.values,Target)



