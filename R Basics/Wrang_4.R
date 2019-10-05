################# #  For loops #########################
# First we will show the syntax (how it is written in code).
# Hashtag is the character for comments in R. Anything written after a hashtag in R is not run

# For loop
for(variable in sequence) {
  #do expression(s)#
}

#Ex1
for(i in 1:5) {
  print(i)
}

# i is our variable
# 1:5 is our sequence
# print(i) is our single expression, although it can include many.

#Ex2
evens = c(2,4,6,8,10)

for(i in evens) {
  print(i)
}


##########################  If/else statement ########################################
# If/else statements are the most basic control structure. You may have even used them in Excel. Let's just jump right into the syntax.

# If/else statement
# if(logical condition) {
# expression
# } else if(logical condition) {
# expression
# } else {
# expression
# }

#Ex:
if(5 > 3) {
  print("Statement 1 is true")
} else if(234 > 100) {
  print("Statement 2 is true")
} else {
  print("None of the statements are true")
}


#Q Which of the following when placed in the first if(______) would make this if/else statement print "Statement 2 is true"?
# A) 5 == 5
# B) 6 > 7
# C) 100 == 90
# D) B or C


########################################### Nesting Control Structures #######################################

# We already learnt how to use for loop and how to use if/else statements, so let us know how can we nested within each other.

badnumbers = c(5,10,15,20)

for(i in 1:21) {
if(i %in% badnumbers) {
  print("Bad numbers")
} else {
  print(i)
}
}

