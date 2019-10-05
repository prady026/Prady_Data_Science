library (ISLR)
install.packages("boot")
library (boot)


Auto=read.delim(file="D:/CARRER/My_Course/Daily Classes/Module2/9 Assessing Performance/Re-Sampling Methods/CV/Auto.csv",header=T,sep=",")
dim(Auto)
names(Auto)
attach(Auto)
summary(Auto)

set.seed(1)
glm.fit = glm(mpg ~ horsepower, data=Auto)
cv.error = cv.glm(Auto, glm.fit,K=10)
cv.error$delta[1]

#here we will fit linear regreesion model but using glm() function without passing family type. 
#because later it can be used together with cv.glm() [ part of boot library ].



# Now i want to check MSE on differerent models
set.seed(1)
cv.error=c()

for (i in 1:5) {
  glm.fit = glm(mpg ~ poly(horsepower,i), data=Auto)
  cv.error[i] = round(cv.glm(Auto, glm.fit,K=10)$delta[1],2)
}

cv.error


# These are 5 test-MSEs for 5 different models using 10-fold CV.

plot(x = 1:5, y = cv.error, type='b',xlab = "Polynomial Degree", ylab = "Cross Validation Error", main = "K-Fold Bias/Variance Tradeoff")



##################################################################
