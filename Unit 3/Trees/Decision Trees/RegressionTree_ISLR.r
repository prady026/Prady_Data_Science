install.packages("MASS")
install.packages("tree")

library (MASS)
library(tree)

View(Boston)
dim(Boston)
write.csv(Boston, "D:/CARRER/My_Course/Daily Classes/Module2/5 Residual Analysis/Polynomial Regression/Boston.csv")



set.seed (1)
train = sample (1: nrow(Boston ), nrow(Boston )/2)
Boston.test=Boston[-train,]

tree.boston =tree(medv~.,Boston ,subset =train)
summary (tree.boston )

plot(tree.boston )
text(tree.boston ,pretty =0)

cv.boston =cv.tree(tree.boston )
plot(cv.boston$size ,cv.boston$dev ,type='b')


prune.boston =prune.tree(tree.boston ,best =5)
plot(prune.boston )
text(prune.boston ,pretty =0)

yhat=predict(prune.boston ,newdata =Boston [-train ,])
boston.test=Boston [-train ,"medv"]
#plot(yhat ,boston.test)
abline (0,1)
mean((yhat -boston.test)^2) # Mean Squarred Error

