# -*- coding: utf-8 -*-
"""
Created on Fri Dec 14 12:14:10 2018

@author: HI
"""
#######################################################################
def printme(str ):
   "..."
   print (str)
   return

printme("abc")

#######################################################################

# Function definition is here
# Function definition is here
def changeme( mylist ):
#   "This changes a passed list into this function"
   mylist.append([1,2,3,4]);
   print ("Values inside the function: ", mylist)
   return

# Now you can call changeme function
mylist = [10,20,30];
changeme(mylist);
#print ("Values outside the function: ", mylist)


#######################################################################   
# Function definition is here
def printinfo(name,age):
#   "This prints a passed info into this function"
   print ("Name: ", name)
   print ("Age ", age)
   return;

# Now you can call printinfo function
printinfo(name="miki",age=50)
printinfo(name="sunny",age=35)

#######################################################################   
# Function definition is here
def sum( arg1, arg2 ):
   # Add both the parameters and return them."
   total = arg1 + arg2
   return total;

# Now you can call sum function
total = sum( 10, 20 );
print ("Outside the function : ", total)
#######################################################################   


x=7
eval('x**2')

