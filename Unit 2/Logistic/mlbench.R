install.packages("mlbench")
data(BreastCancer, package="mlbench")
head(BreastCancer)
summary(BreastCancer)
dim(BreastCancer)



bc = BreastCancer[complete.cases(BreastCancer), ]
dim(bc)
str(bc)
write.csv(bc, "D:/CARRER/My_Course/Daily Classes/Module2/10 Logistic Regression/mlbench/bc.csv")
dim(bc)

#Fitting the model with one varible only
#when you build a logistic model with factor variables as features, it converts each level in the factor into a dummy binary variable of 1's and 0's.
#glm(Class ~ Cell.shape, family="binomial", data = bc)


# remove id column
bc = bc[,-1]
str(bc)

# convert factors to numeric
# When converting a factor to a numeric variable, you should always convert it to character and then to numeric, else, the values can get screwed up.
for(i in 1:9) {
  bc[, i] = as.numeric(as.character(bc[, i]))
}
str(bc)



# Encode the response variable into a factor variable of 1's and 0's.
bc$Class = ifelse(bc$Class == "malignant", 1, 0)
str(bc)
bc$Class = factor(bc$Class, levels = c(0, 1))
str(bc)

# The response variable Class is now a factor variable and all other columns are numeric.


table(bc$Class)


library(caret)

# Prep Training and Test data.
set.seed(100)
ind = sample(2, nrow(bc), replace=TRUE, prob=c(0.7, 0.3))
trainData = bc[ind==1,]
testData  = bc[ind==2,]

dim(trainData)
dim(testData)


table(trainData$Class)
table(testData$Class)

# Build Logistic Model
logitmod = glm(Class ~ Cl.thickness + Cell.size + Cell.shape, family = "binomial", data=trainData)
summary(logitmod)

pred = predict(logitmod, newdata = testData, type = "response")
# when you use logistic regression, you need to set type='response' in order to compute the prediction probabilities.


y_pred_num = ifelse(pred > 0.5, 1, 0)
y_pred = factor(y_pred_num, levels=c(0, 1))
y_act = testData$Class

table(y_pred,y_act)
mean(y_pred == y_act)


#########################################################
# To avoid confusion, always specify the positive argument.
# Otherwise, it is possible for '0' to be taken as 'positive' or the 'event', and will cause a big mistake which may go unnoticed.
# I want 'malignant' Class to be 'positive' so, I have set positive="1" below.

confusionMatrix(y_pred, y_act, positive="1", mode="everything")


### ROC  ### Receiver operating characteristic
install.packages("InformationValue")
library(InformationValue)

plotROC(y_act, pred)
AUROC(y_act, pred)

# AUROC - Area under ROC curve
#TPR - True positive Rate
#FPR - False Positive Rate
#########################################################

