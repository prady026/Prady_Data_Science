#################################   Data Wrangling Skills: Matching and De-duplicating  ###########################
# Match() Explained
# The data you will be working with has two different classes (A & B) each with 30 students and includes their name and year.

# Using match()
# The match function is used to determine matched values between vectors or data frames.
# To find the students who are in both class A and class B and return 0 if no match, try the following code:


class_data = read.csv('D:/CARRER/My_Course/Daily Classes/R_Classes/Data Wrangling/classes.csv', header = T, stringsAsFactors = F)
head(class_data)

m1=match(class_data$A, class_data$B, nomatch = 0)
m1
class_data[which(m1 > 0),]

m2=match(class_data$B, class_data$A, nomatch = 0)
m2
class_data[which(m2 > 0),]

class_data[which(m1 > 0 | m2 > 0),]

# You can also use the syntax %in% which checks for a match and returns a logical vector. 
# The logical vector matches is FALSE for values with no match and TRUE for values with a match.

matches = class_data$A %in% class_data$B
matches

# Note that this match,%in% syntax not only works for with in the file but also works for between the files.

##############################################################################################################
##Which() Explained

# Lets first select class A of the dataset. The which() function returns the indices of an object where the statement is true. 
# You can use it to find specific row values or groups of row values in a data frame.

# Selecting the required columns of classA from the data set class_data
classA = class_data[,c(1,2)]

# using which() function i am pulling out separate rows from dataset.
Junior_rowsA = which(classA$A.Year == 'Junior')
JuniorsA = classA[Junior_rowsA, ]
JuniorsA

soph_rowsA = which(classA$A.Year == 'Sophomore')
sophomoresA = classA[soph_rowsA, ]
sophomoresA

Senior_rowsA = which(classA$A.Year == 'Senior')
SeniorsA = classA[Senior_rowsA, ]
SeniorsA

#if you want to combine Both Juniors and Sophomore in to one group
SJ_rowsA = which(classA$A.Year == 'Junior' | classA$A.Year == 'Sophomore')
SJ_A = classA[SJ_rowsA, ]
SJ_A

##############################################################################################################
##Duplicate() Explained
#The first original value in the vector/data frame is returned FALSE and every duplicate value when found it is returned it is TRUE.

class_data$A.Year
duplicates = duplicated(class_data$A.Year)
class_data$A.Year[!duplicates]
table(duplicates)

################# TASK ON Wrang_1.R ##############
##Now using the 'classes_test.csv' data set.

#Q. Inside quiz_class_data are two students who are 'Fifth' years. Gertrude and another student. Find out the other students name Use which().


#Q. How many fifth years are in class A of classes_test.csv?


#Q. How many duplicate names are there in class A of quiz_class_data


