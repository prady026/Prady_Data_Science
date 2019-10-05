#install.packages("BSDA")# Z-test
#install.packages("EnvStats") #One sample chisquare test
#install.packages("car") #Levens Test
install.packages("multcomp") #To do multiple comparistion in anova/glth

#library(e1071) # Supporting packages for Z-test
#library(lattice)# Supporting packages for Z-test
#library(BSDA)
#library(EnvStats)
#library(car)
library(multcomp)


TC=read.csv(file="D:/CARRER/My_Course/Daily Classes/Module1/10 ANOVA/ANOVA.csv",header=T,sep=",")
TC
summary(TC)

#anovadata=lm(Data~Coating,data=TC)
#anovadata

#summary(anovadata)

#*******************ONE WAY ANOVA **************************************************************
TC.ANOVA=aov(Data~Coating,TC)
summary(TC.ANOVA)

#*******************Multiple comparisions-Tukey - Honestly Significant Difference ************************************************
TukeyHSD(TC.ANOVA)
plot(TukeyHSD(TC.ANOVA))


#*******************Multiple comparisions-Dunnett(Control group) *******************************
Control<- glht(TC.ANOVA, linfct=mcp(Coating=c("A-B=0","A-C=0","A-D=0","B-C=0","B-D=0","C-D=0")))
summary(Control)
plot(Control)



