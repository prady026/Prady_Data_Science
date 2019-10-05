###################   Data Wrangling : Regular Expressions and Indicator variables   ###########################

########## Regular Expressions ##############
#Regular expressions are:
  
#  A special text string for describing a search pattern. The most common use of regular expressions (regex for short) is in the creation of spam filters.
#  Lets first write some basic regex using character sets
#  [[:alpha:]] - All alphabetic
#  [[:digit:]] - Digits 0 1 2 3 4 5 6 7 8 9
#  [[:alnum:]] - All alphabetic or digits
#  [[:lower:]] - Lower case alphabetic
#  [[:upper:]] - Upper case alphabetic

##Example
first_names = c('ALEX', 'randle?', 'Joseph', 'Michael?', 'david', 'Charlie','1234')

grep('[[:alpha:]]', first_names)
grep('[[:digit:]]', first_names)
grep('[[:alnum:]]', first_names)
grep('[[:lower:]]', first_names)
grep('[[:upper:]]', first_names)


## How to find out mixed letters (Numeric + Alaphabets + special words)
explicit_words = c('v1agra', 'vi@gra', 'viagra', 'via$gra', 'v_iagra')
grep('^[a-z]+[1@$_]', explicit_words)

########################## Creating Variables Syntax ###############################################

# Suppose in the flag dataset you wanted to identify the flags which have the following characteristics:
# landmass = 4 , population > 5 , religion = 1

# Creating a indicator Variable
data$AF50CR = 0
dim(data)

# Next we identify the appropriate rows in the flag data with a which() statement and then assign a 1 in the 'AF50CR' column
identified = which(data$landmass == 4 & data$population > 5 & data$religion == 1)
data[identified,]
data$AF50CR[identified] = 1
sum(data$AF50CR[identified])



# Task1
# Now create an indicator variable for flags which have the following characteristics and name the column 'AM20CHR'
# landmass = 1 or 2 , population > 20 , religion = 1

#Q: What is the total sum population of the countries which are 1 in the 'AM20CHR' column?







##Suppose we now want to only grab the names which are not properly capitalized. To do this we can use a meta character ^ 
##which defines what the first character in the pattern must be. This regex selects any string that starts with a lower case alphabetic character.

grep('^[[:alpha:]]', first_names)
grep('^[[:digit:]]', first_names)
grep('^[[:alnum:]]', first_names)
grep('^[[:lower:]]', first_names)
grep('^[[:upper:]]', first_names)

