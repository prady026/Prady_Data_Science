# From the previous programming we have understood how to hold for loop and ifelse statments in one programming
# Can we do something for series of expressions,Suppose you want to do year tags for the first 100 rows of this new dataset.


new_startup_data = read.csv('D:/CARRER/My_Course/Daily Classes/R_Classes/Data Wrangling/second_crunchbase.csv', header = T, stringsAsFactors = F)

years = new_startup_data$founded_year[1:100]

for(i in years) {
  if(is.na(i)) {
    print('Information Not Available')
  } else if(i > 2009) {
    print('Early Stage')
  } else {
    print('Late Stage')
  }
}


######## Creating Custom Functions ###########################
# Practice Problem: Creating a "Summer" Function
# Write a function that given a number N, it outputs the sum of the numbers 1 to N
# If N = 10, what should your function return?

adder = function(n) {
  summer=sum(1:n)
  return(summer)
}


adder(10)

##############################################################
#Taking the example of previous one, if i found every day a new data set and need to chnge my dataset name will time taking process to change all the instructions.
# Can i do something with a small change my whole process run again.

#The best thing to do would be to:
  
# 1. Create a function which performs the tags
# 2. Place the dataset as an argument in that function
# 3. Then call the function when we want to do this year tagging process on new data.


year_tag = function(new_startup_data, rows=1:50) {
  years = new_startup_data$founded_year[rows]
  for(i in years) {
    if(is.na(i)) {
      print('Information Not Available')
    } else if(i > 2009) {
      print('Early Stage')
    } else {
      print('Late Stage')
    }
  }
}

year_tag(new_startup_data)



##############################################
# This is a famous programming problem for job interviews! Apparently, 199 out of 200 applicants for every programming job can't successfully do this problem, but it's really quite simple!
  
#  Print the numbers 1 through 100:
#  For multiples of 3, print "Fizz" instead of the number
#  For multiples of 5, print "Buzz" instead of the number
#  For multiples of 3 and 5, print "FizzBuzz" instead of the number

#To do this problem we first need to show you how modulo %% works. If you remember your long division, modulo simply returns the remainder of an expression.
10 %% 5
8 %% 3

# Answer













#################################################################
## Practice Problem: Custom Function

## Write a function num_check which checks if a number is a multiple of 3 or 5. If it is return TRUE, if it isn't return FALSE.
## Check the accuracy of this function on your own by verifying num_check(711) returns TRUE and num_check(2632) returns FALSE.

# Answer





# How to check
num_check(2632)

#################################################################

