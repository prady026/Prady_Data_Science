library (ISLR)
install.packages("boot")

library (boot)

Auto=read.delim(file="D:/CARRER/My_Course/Daily Classes/Module2/9 Assessing Performance/Re-Sampling Methods/CV/Auto.csv",header=T,sep=",")
dim(Auto)
names(Auto)
attach(Auto)
summary(Auto)


glm.fit=glm(mpg~horsepower ,data=Auto)
cv.err = cv.glm(Auto ,glm.fit)
cv.err$delta[1]

# The two numbers in the delta vector contain the cross-validation results.
# In this case the numbers are identical (up to two decimal places) and correspond
# to the LOOCV statistic

#delta	
# A vector of length two. 
# The first component is the raw cross-validation estimate of prediction error. 
# The second component is the adjusted cross-validation estimate. 
# The adjustment is designed to compensate for the bias introduced by not using LOOCV.

# seed : The value of .Random.seed when cv.glm was called

# Now i want to check MSE on differerent models

cv.error=c()
for (i in 1:5)
  {
  glm.fit=glm(mpg~poly(horsepower ,i),data=Auto)
  cv.error[i]=cv.glm (Auto ,glm.fit)$delta [1]
  }
cv.error

plot(x = 1:5, y = cv.error, type='b',xlab = "Polynomial Degree", ylab = "Cross Validation Error", main = "LOOCV-Bias / Variance Tradeoff")


