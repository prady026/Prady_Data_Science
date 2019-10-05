
install.packages("caret")
install.packages("dplyr")
install.packages("funModeling")


library(caret) # contains dummyVars function
library(dplyr) # data munging library
library(funModeling)


heart_disease
dim(heart_disease)
str(heart_disease)
summary(heart_disease)
write.csv(heart_disease,"D:/CARRER/My_Course/Daily Classes/Module2/7 Dummy Variables/Case1/heart_disease.csv")

# Checking categorical variables
status=df_status(heart_disease, print_results = F)
filter(status,  type %in% c("factor", "character")) %>% select(variable)


dmy = dummyVars(" ~ .", data = heart_disease)
heart_disease_2 = data.frame(predict(dmy, newdata = heart_disease))


# Checking the new numerical data set:
colnames(heart_disease_2)
dim(heart_disease_2)
summary(heart_disease_2)



# before
as.numeric(heart_disease[7, "chest_pain"])

# after
heart_disease_2[7, c("chest_pain.1", "chest_pain.2", "chest_pain.3", "chest_pain.4")]


write.csv(heart_disease_2,"D:/CARRER/My_Course/Daily Classes/Module2/7 Dummy Variables/Case1/heart_disease2.csv")
