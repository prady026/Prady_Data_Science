library(car)
library(MASS)
library(qpcR)
library(nortest)
library(e1071)
library(calibrate)
library(plyr) #### This will allow the testing (e.g., comparison of model1 and model2)

#########################################


Fdata=read.table(file="D:/CARRER/My_Course/Daily Classes/Module2/8 R-Square Press/MLR-Delivery Time.csv",header=T,sep=",")
dim(Fdata)
summary(Fdata)
attach(Fdata)

#########################################
#Full Model
MLRf.fit=lm(DeliveryTime~Cases+Distance)
MLRf.fit
anova(MLRf.fit)
summary(MLRf.fit)

# calculate the predictive residuals
eii = resid(MLRf.fit)/(1 - lm.influence(MLRf.fit)$hat)
eii

#calculate the PRESS
Press = sum(eii^2)

# Calculate the total sum of squares from Anova
TSS=sum(anova(MLRf.fit)[,2])
TSS

# Calculate R-Square Predicted
Rsq_Pred= 1 - (Press/TSS)
Rsq_Pred

#################################
PRESS(MLRf.fit) # It provides PRESS Residuals,PRESS Statistic and Rsquare Prediction=P square

