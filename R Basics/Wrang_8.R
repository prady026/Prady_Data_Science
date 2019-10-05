head(iris)
dim(iris)


GetTotal <- function(x1, x2) {
  
  TotalSepal.Width <- sum(x1)
  TotalPetal.Width <- sum(x2)
  Mean_Sepal.Width <-  mean(x1)
  Mean_Petal.Width <-  mean(x2)
  SD_Sepal.Width <-  sd(x1)
  SD_Petal.Width <-  sd(x2)
  return.df <- data.frame("Sum of Total Sepal Width" = TotalSepal.Width,
                          "Sum of Total Petal Width" = TotalPetal.Width,
                          "Mean of Total Sepal Width: " = Mean_Sepal.Width,
                          "Mean of Total Sepal Width: " = Mean_Petal.Width,
                          "SD of Total Sepal Width: " = SD_Sepal.Width,
                          "SD of Total Sepal Width: " = SD_Petal.Width)}


Total.width <- GetTotal(iris$Sepal.Width,iris$Petal.Width)
Total.width




'"list(TotalSepal.Width,TotalPetal.Width,Mean_Sepal.Width,Mean_Petal.Width,SD_Sepal.Width,SD_Petal.Width)

