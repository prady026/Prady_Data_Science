SLRdata=read.table(file="D:/CARRER/My_Course/Daily Classes/Module2/1 Linear Regression/SLR/Viralcount_Drug.csv",header=T,sep=",")
attach(SLRdata)
SLR=lm(viral.count~drug)

SLR$fitted.values
SLR$residuals

anova(SLR)
summary(SLR)

RSS <- c(crossprod(SLR$residuals))
MSE <- RSS / length(SLR$residuals)
RMSE <- sqrt(MSE)

RSS
MSE
RMSE

