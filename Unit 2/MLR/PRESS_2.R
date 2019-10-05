#########################################
Fdata=read.table(file="D:/CARRER/My_Course/Daily Classes/Module2/8 R-Square Press/MLR-Delivery Time.csv",header=T,sep=",")
dim(Fdata)
summary(Fdata)
attach(Fdata)

################# USING FUNCTIONS WE CAN CHECK ALL MODELS IN ONE SHORT ##################################################

#Full Model
MLRf.fit=lm(DeliveryTime~Cases+Distance)
MLRf.fit
anova(MLRf.fit)

#Restricted Model with cases only
MLRf.fitc=lm(DeliveryTime~Cases)
MLRf.fitc
anova(MLRf.fitc)

#Restricted Model with cases Distance
MLRf.fitd=lm(DeliveryTime~Distance)
MLRf.fitd
anova(MLRf.fitd)


##########################################################



PRESS <- function(linear.model) {
  #' calculate the predictive residuals
  pr <- residuals(linear.model)/(1-lm.influence(linear.model)$hat)
  #' calculate the PRESS
  PRESS <- sum(pr^2)
  
  return(PRESS)
}

pred_r_squared <- function(linear.model) {
  #' Use anova() to get the sum of squares for the linear model
  lm.anova <- anova(linear.model)
  #' Calculate the total sum of squares
  tss <- sum(lm.anova$'Sum Sq')
  # Calculate the predictive R^2
  pred.r.squared <- 1-PRESS(linear.model)/(tss)
  
  return(pred.r.squared)
}

model_fit_stats <- function(linear.model) {
  r.sqr     <- summary(linear.model)$r.squared
  adj.r.sqr <- summary(linear.model)$adj.r.squared
  pre.r.sqr <- pred_r_squared(linear.model)
  press     <- PRESS(linear.model)
  return.df <- data.frame("R-squared" = r.sqr, "Adj R-squared" = adj.r.sqr, "Pred R-squared" = pre.r.sqr, PRESS = press)
  return(round(return.df,3))
}


## Comparision of two or more models in one short
ldply(list(MLRf.fit, MLRf.fitc, MLRf.fitd), model_fit_stats)

##########################################################


rm(list=ls())

