MLRdata=read.table(file="D:/CARRER/My_Course/Daily Classes/Module2/3 Variable Selection/Sequantial Selection/BEST-Hald Cement data.csv",header=T,sep=",")
dim(MLRdata)
summary(MLRdata)
attach(MLRdata)

###################################################
# Forward Selection

############ Step 1 #################
MLR1=lm(Y~X1)
anova(MLR1)

MLR2=lm(Y~X2)
anova(MLR2)

MLR3=lm(Y~X3)
anova(MLR3)

MLR4=lm(Y~X4)
anova(MLR4)

# F - Distributions
qf(0.95,1,11)

#Therefore the final model from step 1 is MLR4

############ Step 2 #################
MLR41=lm(Y~X4+X1)
MLR42=lm(Y~X4+X2)
MLR43=lm(Y~X4+X3)

anova(MLR41)
anova(MLR42)
anova(MLR43)



#comparing
anova(MLR4,MLR41)
anova(MLR4,MLR42)
anova(MLR4,MLR43)

qf(0.95,1,10)

#Therefore the final model from step 1 is MLR41

############ Step 3 #################
MLR412=lm(Y~X4+X1+X2)
MLR413=lm(Y~X4+X1+X3)

anova(MLR412)
anova(MLR413)




anova(MLR41,MLR412)
anova(MLR41,MLR413)

qf(0.95,1,9)

# Therefore both values are less than 5.11, so both are rejected
summary(MLR41)

# Hence Forward selection procedure says, your model should be Y= 103.09738 + 1.43996(X1) -0.61395(X4)



##############################

## NULL MODEL  ################
null=lm(Y~1,data = MLRdata)

## FULL MODEL  ################
full=lm(Y~.,data = MLRdata)
anova(full)

