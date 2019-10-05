MLRdata=read.table(file="D:/CARRER/My_Course/Daily Classes/Module2/2 MLR/Advertising.csv",header=T,sep=",")
dim(MLRdata)
attach(MLRdata)
##########################################


MLR1=lm(sales~newspaper)
anova(MLR1)
summary(MLR1)
##########################################
MLR2=lm(sales~newspaper+radio)
anova(MLR2)
summary(MLR2)
##########################################
MLR3=lm(sales~TV+radio+newspaper)
anova(MLR3)
summary(MLR3)

##Full model
MLR4=lm(sales~newspaper+radio+TV)
MLR4
anova(MLR4)
summary(MLR4)
####################################

#
############################################
# Splitting only X columns in to separate dataset
FullX=MLRdata[,2:4]
FullX

# Checking Correlation
cor(FullX)

#Correlation and Scatter plot 
ggpairs(FullX)

# Finding multicollineary in constructed models
vif(MLR1)
vif(MLR2)
vif(MLR3)
vif(MLR4)


