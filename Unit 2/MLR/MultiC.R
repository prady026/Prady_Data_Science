#####################################################################

MLRdata=read.table(file="D:/CARRER/My_Course/Daily Classes/Module2/4 Multicolinearity/BEST-Hald Cement data.csv",header=T,sep=",")
dim(MLRdata)


# Full model
MLR1234=lm(Y~X1+X2+X3+X4,data=MLRdata)
MLR1234
anova(MLR1234)
summary(MLR1234)


# Backward selection procedure result
MLR12=lm(Y~X1+X2,data=MLRdata)
MLR12
anova(MLR12)
summary(MLR12)

# Forward selection procedure result
MLR14=lm(Y~X1+X4,data=MLRdata)
MLR14
anova(MLR14)
summary(MLR14)

#####################################
MLR124=lm(Y~X1+X2+X4,data=MLRdata)
MLR124
anova(MLR124)
summary(MLR124)

plot(MLRdata$X2,MLRdata$X4)
cor(MLRdata$X2,MLRdata$X4)

#####################################################################
install.packages("car")
library(car)

# Finding multicollineary in constructed models
vif(MLR12)
vif(MLR14)
vif(MLR124)

# Splitting only X columns in to separate dataset
FullX=MLRdata[,2:5]
FullX

# Checking Correlation
cor(FullX)

#Correlation and Scatter plot 
install.packages("GGally") # Scatter plot and correlation of all X variables
library(GGally)           # Scatter plot and correlation of all X variables

ggpairs(FullX)

X=MLRdata[,-1]
Y=MLRdata[,1]

#individual diagnostic checking - Individual Multicollinearity variables test
install.packages("mctest") #Individual Multicollinearity variables test
library(mctest) #Individual Multicollinearity variables test


imcdiag(X,Y)

# After Removing the collinearity problem variables
#####################################################################
X=MLRdata[,c(-1,-5)]
Y=MLRdata[,1]
imcdiag(X,Y)
#####################################################################
X=MLRdata[,c(-1,-3)]
Y=MLRdata[,1]
imcdiag(X,Y)

