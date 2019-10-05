MLRdata=read.table(file="D:/CARRER/My_Course/Daily Classes/Module2/3 Variable Selection/Sequantial Selection/BEST-Hald Cement data.csv",header=T,sep=",")
dim(MLRdata)
summary(MLRdata)

###################################################
# Backward Selection

############ Step 1 #################
full=lm(Y~.,data = MLRdata)
anova(full)
summary(full)
# MLR1=lm(Y~X1)
# anova(MLR1)
# MLR2=lm(Y~X2)
# anova(MLR2)
# MLR3=lm(Y~X3)
# anova(MLR3)
# MLR4=lm(Y~X4)
# anova(MLR4)

MLR234=lm(Y~X2+X3+X4,data = MLRdata)
anova(MLR234)

MLR134=lm(Y~X1+X3+X4,data = MLRdata)
anova(MLR134)

MLR124=lm(Y~X1+X2+X4,data = MLRdata)
anova(MLR124)

MLR123=lm(Y~X1+X2+X3,data = MLRdata)
anova(MLR123)

#comparing
anova(MLR234,full)
anova(MLR134,full)
anova(MLR124,full)
anova(MLR123,full)


# F - Distributions
qf(0.95,1,8)

# So, in the above four models MLR124 is less influlencing by adding X3 in to the model
# fcalc = 0.0182 is very low and it is < ftab = 5.317655. So, Exclude x3 from model


#Therefore the final model from step 1 is MLR124

############ Step 2 #################
MLR41=lm(Y~X4+X1,data = MLRdata)
MLR42=lm(Y~X4+X2,data = MLRdata)
MLR12=lm(Y~X1+X2,data = MLRdata)

#comparing
anova(MLR41,MLR124)
anova(MLR42,MLR124)
anova(MLR12,MLR124)

qf(0.95,1,9)

# So, in the above four models MLR124 is less influlencing by adding X4 in to the model
# fcalc = 1.8633 is very low and it is < ftab = 5.317655. So, Exclude x4 from model

#Therefore the final model from step 2 is MLR12

############ Step 3 #################
MLR1=lm(Y~X1,data = MLRdata)
MLR2=lm(Y~X2,data = MLRdata)

anova(MLR1,MLR12)
anova(MLR2,MLR12)

qf(0.95,1,10)

# Therefore both values are greater than 4.964603, so both are accepted.
summary(MLR12)

# Hence Backward selection procedues says, your model should be Y= 52.57735 + 1.46831X1 +0.66225X2 

