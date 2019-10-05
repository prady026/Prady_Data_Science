#Reading the data
RRdata=read.csv(file="D:/CARRER/My_Course/Daily Classes/Module1/3 Plots & Graphs/BoxPlot/Call Center-Boxplot.csv",header=T)

#Box plot for whole data set
boxplot(RRdata$Calls.Rec.,horizontal = TRUE,col="pink")


quantile(RRdata$Calls.Rec., c(.25, .50, .75)) 
IQR = IQR(RRdata$Calls.Rec.)

Q1=quantile(RRdata$Calls.Rec., .25) 
Q3=quantile(RRdata$Calls.Rec., .75) 

lowerwhisker = Q1 - (1.5 * IQR)
upperwhisker = Q3 + (1.5 * IQR)


outliers1 = RRdata[which(RRdata$Calls.Rec. < 79.25),]
outliers2 = RRdata[which(RRdata$Calls.Rec. > 193.25),]

#count the number of outliers
length(RRdata[RRdata$Calls.Rec. < 79.25,])
length(RRdata[RRdata$Calls.Rec. > 193.25,])

length(RRdata[RRdata$Calls.Rec. < 79.25 | RRdata$Calls.Rec. > 193.25,])



#Reading the data
Incdata=read.csv(file="D:/CARRER/My_Course/Daily Classes/Module1/3 Plots & Graphs/BarGraph/Company_incentives.csv",header=T)

#Box plot for whole data set
boxplot(Incdata$Age,horizontal = TRUE)
boxplot(Incdata$Incentives,horizontal = TRUE)
####boxplot(Incentives~MaritalStatus,data=Incdata, main="Incentives by MaritalStatus", xlab="MaritalStatus", ylab="Incentives")


boxplot(Incdata$Age)
boxplot(Incdata$Incentives)


