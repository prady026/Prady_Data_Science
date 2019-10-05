#Reading the data
#CCdata=read.csv(file="D:/CARRER/My_Course/Daily Classes/Module1/3 Plots & Graphs/BoxPlot/Call Center-Boxplot.csv",header=T)
#hist(CCdata$ Calls.Rec.)
#hist(CCdata$ Calls.Rec., col = "Yellow", labels = TRUE,las=1)

hist(CCdata$ Calls.Rec.,col="green",xlim=c(50,350), breaks=15, labels = TRUE,las=1)

##############################


x=pnorm(500, mean=500, sd=100)
x

#Calcualtes cummulate value up to 650
y=pnorm(650, mean=500, sd=100)
y

#Calcualtes remaining value more than 650
z=1-y
z

x-z

#
y1=qnorm(0.5, mean=500, sd=100)
y1




#Creating example data
#generate Z random Normal variates by default mean(0) and standard deviation(1)
set.seed(1)
sample1 <- rnorm(20)
sample1

mean(sample1)
sd(sample1)

#generate X random Normal variates with a given mean(10) and standard deviation(2)
set.seed(1)
sample2 <- rnorm(20,10,2)
sample2

mean(sample2)
sd(sample2)

############################
#set.seed(2)
#sample3 <- dnorm(0.25)
#sample3
############################

# pnorm is the R function that calculates the c. d. f.
# F(x) = P(X <= x)


set.seed(3)
sample3 <- pnorm(27.4, mean=50, sd=20)
sample3

#They look up P(X < 27.4) when X is normal with mean 50 and standard deviation 20.
############################


