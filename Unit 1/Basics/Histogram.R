#Reading the data
Hdata=read.csv(file="D:/CARRER/My_Course/Daily Classes/Module1/3 Plots & Graphs/Histogram/Histo1.csv",header=T)

hist(Hdata$Height)
hist(Hdata$Height, col = "Yellow", labels = TRUE,las=1)

hist(Hdata$Height,col="green",xlim=c(160,180), breaks=20, labels = TRUE,las=1)



##########################
Hdata2=read.csv(file="D:/CARRER/My_Course/Daily Classes/Module1/3 Plots & Graphs/Histogram/Company_incentives.csv",header=T)
str(Hdata2)
summary(Hdata2)

hist(Hdata2$Incentives,col="blue",xlim=c(21906,499233),las=1, breaks=12, labels = TRUE)

#hist(Hdata2$Incentives,col="blue",xlim=c(21906,1033222),las=1, breaks=16, labels = TRUE)


