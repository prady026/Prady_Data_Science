#Packages
install.packages("MASS")
install.packages("randomForest")
install.packages("gbm")

library(randomForest)
library(MASS)#Boston
library(gbm)

#1)Data Setup
attach(Boston)
head(Boston)
dim(Boston)



#2) Bagging
set.seed(1)
train=sample(1:nrow(Boston),nrow(Boston)/2)
Boston.test=Boston[-train,]
#Bag=randomForest(medv~.,data=Boston,subset=train,mtry=13,importance=TRUE)#mtry=13 is bagging
Bag=randomForest(medv~.,data=Boston,subset=train,mtry=13)#mtry=13 is bagging
Bag

plot(Bag)

#3) Testing of Model for Bagging
#set.seed(1)
#train=sample(1:nrow(Boston),nrow(Boston)/2)
#Boston.test=Boston[-train,]
#Bag=randomForest(medv~.,data=Boston,subset=train,mtry=13)
#Bag=randomForest(medv~.,data=Boston,subset=train,mtry=13,importance=TRUE)
#plot(Bag)
yhat=predict(Bag,newdata=Boston.test)
y=Boston[-train,"medv"]
plot(y,yhat)
cor(y,yhat)
abline(0,1,col=2)
mean((y-yhat)^2)
#importance(Bag)
Bag=randomForest(medv~.,data=Boston,subset=train,mtry=13,ntree=100)#No.of trees=25,default=500
Bag

########################################33
#4) Random Forest
#set.seed(1)
#train=sample(1:nrow(Boston),nrow(Boston)/2)
#Boston.test=Boston[-train,]
#Random=randomForest(medv~.,data=Boston,subset=train,mtry=6,importance=TRUE)#mtry=6 is for randome forest
#Random
#plot(Random)

#5) Testing of Model for Random Forest
set.seed(1)
train=sample(1:nrow(Boston),nrow(Boston)/2)
Boston.test=Boston[-train,]
#Random=randomForest(medv~.,data=Boston,subset=train,mtry=5,importance=TRUE)
Random=randomForest(medv~.,data=Boston,subset=train,mtry=5)
plot(Random)
yhat=predict(Random,newdata=Boston.test)
y=Boston[-train,"medv"]
plot(y,yhat)
abline(0,1,col=2)
mean((y-yhat)^2)

#importance(Bag)
Ran1=randomForest(medv~.,data=Boston,subset=train,mtry=5,ntree=250)#No.of trees=25,default=500
Ran1
