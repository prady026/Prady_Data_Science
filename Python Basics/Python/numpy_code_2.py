# -*- coding: utf-8 -*-
"""
Created on Sat Dec 15 20:07:04 2018

@author: HI
"""

import math
math.sin(2)
math.sin(3)
math.cos(2)


## Understanding Data Types in Python ###
####################
L=list(range(10))# Need to check##
type(L)
type(L[0])
type(L[3])


####################
L2 = [str(c) for c in L]
type(L2)
type(L2[3])

####################

L3=[True, "2",3.0,4]
type(L3)
type(L3[0])
type(L3[1])
type(L3[2])
type(L3[3])
type(L3[4])

####################

import array
L=list(range(10)) #Need to check #
A = array.array('i',L)
A

# integer array:
import numpy as np
np.array([1, 4, 2, 5, 3])


#################### NumPy Array Attributes ####################

import numpy as np
np.random.seed(0)  # seed for reproducibility

x1 = np.random.randint(10, size=6)  # One-dimensional array
print(x1)
x2 = np.random.randint(10, size=(3, 4))  # Two-dimensional array
print(x2)
x3 = np.random.randint(10, size=(3, 4, 5))  
print(x3)

print("x3 ndim: ", x3.ndim)
print("x3 shape:", x3.shape)
print("x3 size: ", x3.size)
print("x3 dtype:", x3.dtype)

## Array Indexing: Accessing Single Elements ###

x1
x1[0]
x1[3]

x2
x2[0]
x2[1]
x2[2]

x2[0,0]
x2[1,0]
x2[2,2]

##################

x = np.arange(10)
x
x[:5]     # first five elements
x[5:]     # elements after index 5
x[4:7]    # middle sub-array
x[::2]    # every other element
x[1::2]   # every other element, starting at index 1
x[::-1]   # all elements, reversed
x[5::-2]  # reversed every other from index 5



###### Reshaping of Arrays #################################

grid0 = np.arange(1, 10).reshape((3, 3))
print(grid0)

grid1 = np.arange(1, 9).reshape((3, 3)) ## Improper case
print(grid1)

grid1 = np.arange(1, 10).reshape((3, 4)) ## Improper case
print(grid1)


x = np.array([1, 2, 3])
print(x)

x1=x.reshape((1, 3))
print(x1)

x2=x.reshape((3, 1))
print(x2)


######## Concatenation of arrays ###########################
x = np.array([1, 2, 3])
print(x)
y = np.array([4, 5, 6])
print(y)

np.concatenate([x, y])

z = [7, 8, 9]
print(np.concatenate([x, y, z]))


grid1 = np.array([[1, 2, 3],[4, 5, 6]])
grid2 = np.array([[11, 12, 13],[14, 15, 16]])

np.concatenate([grid1, grid2])
np.concatenate([grid1, grid2], axis=1)



