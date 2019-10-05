install.packages("ggpubr")
library("ggpubr")
#######################


data=read.delim(file="D:/CARRER/PDF & DOCS/Data Sets/STAT501_Lesson09/wordrecall.txt",header=T,sep="\t")
dim(data)
attach(data)


#Full Model
MLRF=lm(prop~time)
MLRF
summary(MLRF)


#Checking the linearity assumption
plot(data$prop,data$time,xlab="time",ylab="prop")
#The resulting fitted line plot suggests that the proportion of recalled items (y) is not linearly related to time (x):

#Let us check Fitted values vs Residuals
rstd = rstandard(MLRF) #Studentized (ri)
plot(MLRF$fitted.values,rstd,xlab="Fitted values",ylab="Studentized Residual")
#The residuals vs. fits plot also suggests that the relationship is not linear:

#############
#ggqqplot(rstd)
#############


# Lets try with our previous example and will see either the results are matching or not.
boxtidwell=boxTidwell(prop~time) 
boxtidwell



## To make the relationship linear between x and y, we are uisng logarithmic transformation 
## Since it is the most common and most useful data transformation available.
logtime=log(data$time)

newdata=data.frame(data,logtime)
plot(newdata$prop,newdata$logtime,xlab="Log(Time)",ylab="prop")


MLRF1=lm(prop~logtime)
summary(MLRF1)

#Let us check Fitted values vs Residuals
rstd1 = rstandard(MLRF1) #Studentized (ri)
plot(MLRF1$fitted.values,rstd1,xlab="Fitted values",ylab="Studentized Residual")

#The residuals vs. fits plot also suggests that the relationship is not linear:
#You really shouldn't expect perfection when you resort to taking data transformations. 
#Sometimes you have to just be content with significant improvements. 
#By the way, the plot also suggests that it is okay to assume that the error variances are equal.


####k1=newdata$prop-MLRF1$fitted.values
####ggqqplot(k1)

