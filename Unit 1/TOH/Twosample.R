install.packages("BSDA")# Z-test
install.packages("EnvStats") #One sample chisquare test

library(e1071) # Supporting packages for Z-test
library(lattice)# Supporting packages for Z-test
library(BSDA)
library(EnvStats)


cardata=read.table(file="D:/CARRER/My_Course/Daily Classes/Module1/9 Two Sample/cars.csv",header=T,sep=",")
# F-test - When sample size is < 30 'R' is calculating Fcalc is calculating as Lower variance/Higher variance.
var.test(x=cardata$USCARS,y=cardata$GERMANCARS,alternative = "two.sided",conf.level = 0.95)

#We got confirmed that variances are equal so go for t-test
t.test(x=cardata$USCARS,y=cardata$GERMANCARS, alternative = "two.sided", mu = 0,var.equal=T,conf.level = 0.95)#Default is two sided
#We got confirmed that variances are not equal so go for t-test
t.test(x=cardata$USCARS,y=cardata$GERMANCARS, alternative = "two.sided", mu = 0,var.equal=F,conf.level = 0.95)#Default is two sided


# F-test - When sample size is > 30 'R' is calculating Fcalc is calculating as Higher variance/Lower variance.
Lungcapdata=read.delim(file="D:/CARRER/My_Course/Daily Classes/Module1/9 Two Sample/Lungcapdata.txt",header=T) 
var.test(x=Lungcapdata$LungCap[Lungcapdata$Gender=="male"],y=Lungcapdata$LungCap[Lungcapdata$Gender=="female"],alternative = "two.sided",conf.level = 0.95)

summary(Lungcapdata)





