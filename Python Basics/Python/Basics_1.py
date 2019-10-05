# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
###############################################################################

# Numbers type
count = 100          # An integer assignment
print (count)
type(count)

miles   = 1000.0       # A floating point
type(miles)
print (miles)

name    = 'Ajay'        # A string
type(name)
print (name)

del count

# Can we assign values with other than strings
x=1
x_1=3

x.1=3  # Invalid object
X@2=3  # Invalid object

# some other examples

a = 11111
b = 2.0

print(a + b)


###############################################################################

str = "Hello World" 
print (str)    # prints complete string
print (str[0])  # prints first character of string
print (str[-1])  # prints Last character of string
print (str[2:7])   #prints characters starting from 3rd to 5th 
print (str[2:])    #prints string starting from 3rd character
print (str*2)    #prints string two times
print (str + " TEST")   # prints concatenated string

c = "1"
print(c)
d = "2"
print(d)
print(c + d)   # Assigning mathematical operations to string may give wrong results
print(a + d)   # Error combination


#####################################################
a = 'this is a string'
b = a.replace('string','longer string')
print (a) 
print (b)

Ex: 1
a = '20'
type(a)

anum = int(a) # converting string to integer type
type(anum)

print (anum + anum)

Ex: 2
a = "hi"
type(a)
anum = int(a) #Originally it is only a string
print (anum)

###############################################################
a = "hi"
print (a)
b= len(a)
type(b)

z=2
d=str(z) # It cannot conver in to string from direct integer
#############

k1=25
type(k1)
float(k1)
str(k1)  # Cannot be coverted to string

k2="35"
type(k2)
float(k2) #can be converted but viceverssa not possible
int(k2)
str(k2)  
###############################################################

#Let us do some exercises
#1
#Given below string, get first 10 characters, and last 10 characters.
#Now join them to form a new string
str = 'Hey how are you doing. We are doing good'
a = len(str)
print (a) 
str1 = str[0:10]
print (str1)
str2 = str[-10:]
print (str1+" "+str2)

###############################################################


###############################################################
# Converting in to list
string = "This is python code"
strlist = list(string)
print(strlist)

# Creating a list
list = [ 'abcd', 786 , 2.23, 'ISB', 70.2 ]
tinylist = [123, 'ISB']
tinylist1 = ['k1', 'k2']

print (list)          # Prints complete list
print (list[0])       # Prints first element of the list
print (list[1:3])     # Prints elements starting from 2nd till 3rd 
print (list[2:])      # Prints elements starting from 3rd element
print (tinylist * 2)  # Prints list two times
print (tinylist1 * 3)  # Prints list two times
print (list + tinylist) # Prints concatenated lists
print (len(list))
#######################

alist = [ 'abcd', 786 , 2.23, 'ISB', 70.2 ]
print (alist)

blist = alist
print (blist)

alist = alist*2
print (alist)

########################
set = ['Ajay', 'Vijay', 'Ramesh'] # Creating a list of names
set.append('Sujay')               # Adding a name at end
print(set)
type(set)

set.insert(0, 'Man1')     #  adding a new name at starting 
print(set)

set.insert(2, 'Man2')     #  adding a new name at starting 
print(set)


set.extend(['Man3', 'Man4'])  # adding a new names at end
print(set)

print (set.index('Man3')) #showing the serial number of list
set.remove('Man4')        # removing one element from list
set.pop(2)                #it is also removing one name from list
print (set)
########################
var1 = [1, 2, 3, 4]

type(var1)
len(var1)
max(var1)
min(var1)

###########################################################
# Create lists first and second
first = [11.25, 20.0, 18.0]

# Paste together first and second: full
sorted(first, reverse = False)

# Sort full in descending order: full_sorted
sorted(first, reverse = True)

#Shows the index number
first.index(18.0)

#it will count
first.count(18.0)

########################
str1 = "    This is a bright, sunny day      "
print (str1.strip())   # Removes extraspace befor and after
print (str1.lstrip())  # Removes Left space
print (str1.rstrip())  # Removes right space
print (":".join(str1)) # Adds colon symbol for all letters
print (len(str1))      # counts length of space in double codes

###############################################################

tuple = ( 'abcd', 786 , 2.23, 'john', 70.2  )
tinytuple = (123, 'john')

print (tuple)             # Prints complete list
print (tuple[0])          # Prints first element of the list
print (tuple[1:3])        # Prints elements starting from 2nd till 3rd 
print (tuple[2:])         # Prints elements starting from 3rd element
print (tinytuple * 2)     # Prints list two times
print (tuple + tinytuple) # Prints concatenated lists


###############################################################
dict = {}
dict['one'] = "This is one"
dict[2]     = "This is two"

tinydict = {'name': 'john','code':6734, 'dept': 'sales'}


print (dict['one'])       # Prints value for 'one' key
print (dict[2])           # Prints value for 2 key
print (tinydict)          # Prints complete dictionary
print (tinydict.keys())   # Prints all the keys
print (tinydict.values()) # Prints all the values

###############################################################


   



#Line plot
import matplotlib.pyplot as plt
import numpy as np
a = np.linspace(0,10,100)
b = np.exp(-a)
plt.plot(a,b)


#Histogram
import matplotlib.pyplot as plt
from numpy.random import normal
x = normal(size=200)
plt.hist(x,bins=30)

#Scatter Plot
import numpy as np
import matplotlib.pyplot as plt
from numpy.random import normal,rand
a = rand(100)
b = rand(100)
plt.scatter(a,b)


#Pie Chart
import numpy as np
import matplotlib.pyplot as plt
Z = np.random.uniform(0,1,10)
plt.pie(Z)


import numpy as np
import pandas as pd
np.random.seed(1234)
df = pd.DataFrame(np.random.randn(10,4),columns=['Col1', 'Col2', 'Col3', 'Col4'])
boxplot = df.boxplot(column=['Col1', 'Col2', 'Col3'])

# Matrix covariance matrix
correlation = df.corr(method='pearson')
print(correlation)

df['Col1'].corr(df['Col2'])



###############################################################
format = '%.2f %s is $%d'
format %(4.5560,'Argentine Pesos',1)

print (string.count('s'))
print (string.split(' '))
print (string.upper())
print (string.lower())
print (string.swapcase())


from datetime import datetime, date, time

date1 = datetime(2014, 5, 16, 14, 45, 5)

print(date1.year)
print(date1.month)
print(date1.day)
print(date1.hour)
print(date1.minute)
print(date1.second)

datetime.strptime('20140516','%Y%m%d')

date1 = datetime(2014, 5, 16)
date2 = datetime(2014, 5, 19)
datediff = date2 - date1
print(datediff)

###############################################################
school = 'ISB'
print ('S' in school)
'L' in school

###############################################################
