install.packages("ISLR")
library (ISLR)

Auto=read.delim(file="D:/CARRER/My_Course/Daily Classes/Module2/9 Assessing Performance/Re-Sampling Methods/CV/Auto.csv",header=T,sep=",")
dim(Auto)
names(Auto)
attach(Auto)
summary(Auto)
str(Auto)

##############################
#Checking the linearity assumption
plot(Auto$mpg,Auto$horsepower)


##############################
set.seed (1) #To Keep dataset consistency
train=sample (392 ,196)

lm.fit=lm(mpg~horsepower,data=Auto,subset = train)
mean((mpg-predict(lm.fit,Auto))[-train ]^2) # -train means test

lm.fit2=lm(mpg~poly(horsepower,2),data=Auto,subset = train)
mean((mpg-predict(lm.fit2,Auto))[-train ]^2)

lm.fit3=lm(mpg~poly(horsepower,3),data=Auto,subset = train)
mean((mpg-predict(lm.fit3,Auto))[-train ]^2)

##############################

set.seed (2)
train=sample (392 ,196)

lm.fit=lm(mpg~horsepower,data=Auto,subset = train)
mean((mpg-predict(lm.fit,Auto))[-train ]^2)

lm.fit2=lm(mpg~poly(horsepower,2),data=Auto,subset = train)
mean((mpg-predict(lm.fit2,Auto))[-train ]^2)

lm.fit3=lm(mpg~poly(horsepower,3),data=Auto,subset = train)
mean((mpg-predict(lm.fit3,Auto))[-train ]^2)

##############################

set.seed (3)
train=sample (392 ,196)

lm.fit=lm(mpg~horsepower,data=Auto,subset = train)
mean((mpg-predict(lm.fit,Auto))[-train ]^2)

lm.fit2=lm(mpg~poly(horsepower,2),data=Auto,subset = train)
mean((mpg-predict(lm.fit2,Auto))[-train ]^2)

lm.fit3=lm(mpg~poly(horsepower,3),data=Auto,subset = train)
mean((mpg-predict(lm.fit3,Auto))[-train ]^2)

##############################

set.seed (4)
train=sample (392 ,196)

lm.fit=lm(mpg~horsepower,data=Auto,subset = train)
mean((mpg-predict(lm.fit,Auto))[-train ]^2)

lm.fit2=lm(mpg~poly(horsepower,2),data=Auto,subset = train)
mean((mpg-predict(lm.fit2,Auto))[-train ]^2)

lm.fit3=lm(mpg~poly(horsepower,3),data=Auto,subset = train)
mean((mpg-predict(lm.fit3,Auto))[-train ]^2)

##############################################################

###
cv.error <- c()
for(i in 1:6) {
  set.seed (1)
  train=sample (392 ,196)
  
  lm.fit=lm(mpg~poly(horsepower ,i),data=Auto,subset = train)
  cv.error[i]=mean((mpg-predict(lm.fit,Auto))[-train ]^2)
}

cv.error

plot(x = 1:6, y = cv.error, type='b',xlab = "Polynomial Degree", ylab = "Mean squarred Error")
