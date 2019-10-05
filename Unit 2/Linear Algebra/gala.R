install.packages("faraway")
library(faraway)
data(gala)
head(gala)
dim(gala)
summary(gala)

write.csv(gala, file="D:/CARRER/My_Course/Daily Classes/Module2/1 Linear Regression/LINEAR ALGEBRA/gala.csv")

# Species   - The number of species of plants found on the island
# Endemics  - The number of endemic species
# Elevation - The highest elevation of the island (m)
# Nearest   - The distance from the nearest island (km)
# Scruz     - The distance from Santa Cruz island (km)
# Adjacent  - The area of the adjacent island (km2)



gfit <- lm(Species~Area+Endemics + Elevation+Nearest+Scruz+Adjacent,data=gala)
gs = summary(gfit)

# anova(gfit)


#### gs$cov.unscaled
#### gfit$fit
#### gfit$res

# Moving all your Predictor varirables in X matrix
x = cbind(1,gala[,-c(1)])
y = gala$Species


# To find out the Beta values ,we are taking the help of Matrix method.
# Convert you data frame X in matrix X
x = as.matrix(x)

# X-Transpose X
XTX = t(x) %*% x

# Inverses can be taken using the solve() command
xtxi = solve(XTX)  # You can also look the same values at 'gs$cov.unscaled'

#  X-Transpose Y
XTY = t(x) %*% y

# (X-Transpose X)-1 * X-Transpose Y
BHAT =  xtxi %*% XTY

## Directly we can write all these statements in one single statement
solve(t(x) %*% x, t(x) %*% y)

################ variance - covariance matrix
##solve(crossprod(x))

