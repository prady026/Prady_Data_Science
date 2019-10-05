install.packages("BSDA")# Z-test
install.packages("EnvStats") #One sample chisquare test

#library(e1071) # Supporting packages for Z-test
#library(lattice)# Supporting packages for Z-test
library(BSDA)
library(EnvStats)


Lungcapdata=read.delim(file="D:/CARRER/My_Course/Datasets/Lungcapdata.txt",header=T)
Lungcapdata
dim(Lungcapdata)
head(Lungcapdata)

mean(Lungcapdata$LungCap)
sd(Lungcapdata$LungCap)



z.test(x=Lungcapdata$LungCap, alternative = "two.sided", mu = 8,sigma.x=2.662008, conf.level = 0.95)#Default is two sided

varTest(Lungcapdata$LungCap, alternative = "greater", conf.level = 0.95,sigma.squared =4 )



#####################################################################33

cokedata=read.table(file="D:/CARRER/My_Course/Daily Classes/Module1/8 One Sample/coke.csv",header=T)
cokedata
sd(cokedata$x)

z.test(x=cokedata$x, alternative = "two.sided", mu = 1000,sigma.x=59.455, conf.level = 0.95)#Default is two sided

varTest(cokedata$x, alternative = "greater", conf.level = 0.95,sigma.squared =20 )



