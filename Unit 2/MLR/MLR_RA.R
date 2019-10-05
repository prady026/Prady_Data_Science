MLRdata=read.table(file="D:/CARRER/My_Course/Daily Classes/Module2/3 Variable Selection/Sequantial Selection/BEST-Hald Cement data.csv",header=T,sep=",")
dim(MLRdata)
summary(MLRdata)
attach(MLRdata)


MLRF=lm(Y~X1+X2+X3+X4,data=MLRdata)
MLRF
anova(MLRF)
summary(MLRF)

#############################
## case 1 using good fit model
MLRF12=lm(Y~X1+X2,data=MLRdata)
MLRF12
anova(MLRF12)
summary(MLRF12)
rstd12 = rstandard(MLRF12) #Studentized (ri)
plot(MLRF12$fitted.values,rstd12,xlab="Yhat",ylab="Residual",ylim =c(-3,3))
## All the points are lying between -3 to +3 and checking for consistency
## That means the model we finalized is absolutely correct

#Searching for missing variable
plot(MLRdata$X3,rstd12,xlab="X3",ylab="Residual",ylim =c(-3,3))
plot(MLRdata$X4,rstd12,xlab="X4",ylab="Residual",ylim =c(-3,3))


#############################
## case 2 using good fit model

MLRF14=lm(Y~X1+X4,data=MLRdata)
MLRF14
anova(MLRF14)
summary(MLRF14)
rstd14 = rstandard(MLRF14) #Studentized (ri)
plot(MLRF14$fitted.values,rstd14,xlab="Yhat",ylab="Residual",ylim =c(-3,3))


plot(MLRdata$X2,rstd14,xlab="X2",ylab="Residual",ylim =c(-3,3))
plot(MLRdata$X3,rstd14,xlab="X3",ylab="Residual",ylim =c(-3,3))


#############################
## case 3 using unfit model

MLRF1=lm(Y~X1,data=MLRdata)
MLRF1
anova(MLRF1)
summary(MLRF1)
rstd1 = rstandard(MLRF1) #Studentized (ri)
plot(MLRF1$fitted.values,rstd1,xlab="Yhat",ylab="Residual",ylim =c(-3,3))

plot(MLRdata$X2,rstd1,xlab="X2",ylab="Residual",ylim =c(-3,3))
plot(MLRdata$X3,rstd1,xlab="X3",ylab="Residual",ylim =c(-3,3))
plot(MLRdata$X4,rstd1,xlab="X4",ylab="Residual",ylim =c(-3,3))
#############################


