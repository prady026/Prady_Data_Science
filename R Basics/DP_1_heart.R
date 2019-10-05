install.packages("readxl")
library("readxl")


heartraw = read_excel("D:/CARRER/My_Course/Daily Classes/R_Classes/Data Processing1/heart.xlsx", sheet = 1)
names(heartraw)
str(heartraw)
dim(heartraw)
summary(heartraw)

#few of the columns are in character format and missing values are available

heartraw$Status         = as.factor(heartraw$Status)
heartraw$DeathCause     = as.factor(heartraw$DeathCause)
heartraw$Sex            = as.factor(heartraw$Sex)  
heartraw$Chol_Status    = as.factor(heartraw$Chol_Status)
heartraw$BP_Status      = as.factor(heartraw$BP_Status)
heartraw$Weight_Status  = as.factor(heartraw$Weight_Status)
heartraw$Smoking_Status = as.factor(heartraw$Smoking_Status)

###############################################
install.packages("car")
library(car)

#Recoding for continous variables
heartraw$Height      <- recode(heartraw$Height,"NA=64.81")
heartraw$Weight      <- recode(heartraw$Weight,"NA=150.0")
heartraw$MRW         <- recode(heartraw$MRW,"NA=118")
heartraw$Smoking     <- recode(heartraw$Smoking,"NA=1")
heartraw$Cholesterol <- recode(heartraw$Cholesterol,"NA=223")

summary(heartraw)

heartraw$DeathCause = as.character(heartraw$DeathCause)
heartraw$DeathCause[is.na(heartraw$DeathCause)] <- "Missing values"
heartraw$DeathCause = as.factor(heartraw$DeathCause)

heartraw$Chol_Status = as.character(heartraw$Chol_Status)
heartraw$Chol_Status[is.na(heartraw$Chol_Status)] <- "Missing values"
heartraw$Chol_Status = as.factor(heartraw$Chol_Status)

heartraw$Weight_Status = as.character(heartraw$Weight_Status)
heartraw$Weight_Status[is.na(heartraw$Weight_Status)] <- "Overweight"
heartraw$Weight_Status = as.factor(heartraw$Weight_Status)

heartraw$Smoking_Status = as.character(heartraw$Smoking_Status)
heartraw$Smoking_Status[is.na(heartraw$Smoking_Status)] <- "Non-smoker"
heartraw$Smoking_Status = as.factor(heartraw$Smoking_Status)

summary(heartraw)

###############################################################
# Converting a continous data in to Discrete data
# First create the new column
heartraw$AgeGrade <- NA
str(heartraw$AgeGrade)

heartraw$AgeGrade[heartraw$AgeAtStart<=35] <- "Under 35"
heartraw$AgeGrade[heartraw$AgeAtStart>=36 & heartraw$AgeAtStart<=50] <- "Age 36-50"
heartraw$AgeGrade[heartraw$AgeAtStart>50] <- "Age 50+"

heartraw$AgeGrade = as.factor(heartraw$AgeGrade)
summary(heartraw)
###############################################################

# Adding of 2 or more factors in to one group
heartraw$Smoke_or_not <- NA
heartraw$Smoke_or_not<-recode(heartraw$Smoking_Status, "c('Heavy (16-25)','Light (1-5)','Moderate (6-15)','Very Heavy (> 25)')='Smoker';else='Non-Smoker'")
summary(heartraw)


########################## Finding Duplicates ###################

# Generate a vector 
set.seed(158)
x <- round(rnorm(20, 10, 5))
x

# For each element: is this one a duplicate (first instance of a particular value not counted)
duplicated(x)

x[duplicated(x)]

# Duplicated entries, without repeats
k=unique(x[duplicated(x)])
length(k)






# The original vector with all duplicates removed. These do the same:
unique(x)


###############################################
# Rename column by name: change "beta" to "two"
names(heartraw)[names(heartraw)=="Smoke_or_not"] <- "SMOKE_OR_NOT"
summary(heartraw)

