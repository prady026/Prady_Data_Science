# package:
install.packages("tree")
install.packages("ISLR")

library(tree)
library(ISLR)

#1)Data setup
attach(Carseats)#ISLR
High=ifelse(Sales<=8,"No","Yes")
Carseats=data.frame(Carseats,High)
#2)Creating Classification Tree
class.tree=tree(High~.-Sales,data=Carseats)
names(class.tree)
summary(class.tree)
plot(class.tree)
text(class.tree,pretty=0)
class.tree
#3) Model performance(test data)
set.seed(2)
train=sample(1:nrow(Carseats),200)
Carseats.test=Carseats[-train,]
High.test=High[-train]

#Model creation
tree.carseats=tree(High~.-Sales,Carseats,subset=train)

#Prediction Tree creation
tree.pred=predict(tree.carseats,Carseats.test,type="class")

#Running test data on prediction tree
table(tree.pred,High.test)
#Checking the accuracy on test data
mean(tree.pred==High.test)

#4)Cross Validation error
set.seed(3)
tree.carseats=tree(High~.-Sales,Carseats,subset=train)
tree.cv=cv.tree(tree.carseats,FUN=prune.misclass) # FUN default is deviance
names(tree.cv)
tree.cv
plot(tree.cv$size,tree.cv$dev,type="b") #size=9 is the best
#plot(tree.cv$k,tree.cv$dev,type="b")
#**************************

#pruning of tree
Prune.tree=prune.misclass(tree.carseats,best=9)
plot(Prune.tree)
text(Prune.tree,pretty=0)
#Model performance on pruned tree
Prunetree.pred=predict(Prune.tree,Carseats.test,type='class')
table(Prunetree.pred,High.test)
mean(Prunetree.pred==High.test)
