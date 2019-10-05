install.packages("leaps")

library(leaps)

MLRdata=read.table(file="D:/CARRER/My_Course/Daily Classes/Module2/3 Variable Selection/All Possible Regression/BEST-Hald Cement data.csv",header=T,sep=",")

dim(MLRdata)
summary(MLRdata)
attach(MLRdata)

###################################################
k = leaps(x=MLRdata[,2:5], y=MLRdata[,1], names=names(MLRdata)[2:5], method="Cp")
k

l = leaps(x=MLRdata[,2:5], y=MLRdata[,1], names=names(MLRdata)[2:5], method="adjr2")
l
l$adjr2



j = leaps(x=MLRdata[,2:5], y=MLRdata[,1], names=names(MLRdata)[2:5], method="r2")
j

data.frame(l$which,l$adjr2,k$Cp,j$r2)

#Cp, adjr2 or  r2 also we can use


###################################################

#Null Model
MLRN=lm(Y~1,data=MLRdata)
MLRN
anova(MLRN)
summary(MLRN)

#Full Model
MLRF=lm(Y~X1+X2+X3+X4,data=MLRdata)
MLRF
anova(MLRF)
summary(MLRF)

###################################################
MLR1=lm(Y~X1)
MLR1
anova(MLR1)
summary(MLR1)

MLR2=lm(Y~X2)
MLR2
anova(MLR2)
summary(MLR2)

MLR3=lm(Y~X3)
MLR3
anova(MLR3)
summary(MLR3)

MLR4=lm(Y~X4)
MLR4
anova(MLR4)
summary(MLR4)

#####################################################################
MLR12=lm(Y~X1+X2,data=MLRdata)
MLR12
anova(MLR12)
summary(MLR12)

MLR13=lm(Y~X1+X3)
MLR13
anova(MLR13)
summary(MLR13)

MLR14=lm(Y~X1+X4,data=MLRdata)
MLR14
anova(MLR14)
summary(MLR14)

MLR23=lm(Y~X2+X3)
MLR23
anova(MLR23)
summary(MLR23)

MLR24=lm(Y~X2+X4)
MLR24
anova(MLR24)
summary(MLR24)

MLR34=lm(Y~X3+X4)
MLR34
anova(MLR34)
summary(MLR34)

#####################################################################

MLR214=lm(Y~X2+X1+X4,data=MLRdata)
MLR214
anova(MLR214)
summary(MLR214)

MLR314=lm(Y~X3+X1+X4,data=MLRdata)
MLR314
anova(MLR314)
summary(MLR314)

MLR234=lm(Y~X2+X3+X4,data=MLRdata)
MLR234
anova(MLR234)
summary(MLR234)

MLR123=lm(Y~X1+X2+X3,data=MLRdata)
MLR123
anova(MLR123)
summary(MLR123)


#####################################################################
