# -*- coding: utf-8 -*-
"""
Created on Sat Dec 15 17:39:42 2018

@author: HI
"""

# pip install numpy in Anaconda prompt

# This is one of the most important features of numpy. 
# ndarray is an n-dimensional array, a grid of values of the same kind. 
# A tuple of nonnegative integers indexes this tuple. 
# An array’s rank is its number of dimensions.

import numpy as np

#####################
a = np.array([1,2,3]) # A single dimension array .ie single row
print(a)
type(a)   # What kind of datatype it is
a.ndim


a[0]
a[1]
a[2]

a[1] = 5 # Re-assigning the values
print(a)

#####################
b = np.array([[1,2,3],[4,5,6]]) # A two dimension array i.e two rows
print(b)
type(b)
b.shape
b.ndim

b[0,1]
b[1,0]
b[1,2]

#####################
a=np.array([[1,2,3],[4,5,6]])
a.ndim
print(a)

b=np.array([[1,2,3],[4,5,6],[7,8,9]]) # A two dimentions arrary with 3 x 3 matrix
print(b)
b.ndim
b.shape

#####################
import numpy as np

np.random.seed(0)  # seed for reproducibility

x1 = np.random.randint(10, size=6)          # One-dimensional array
x2 = np.random.randint(10, size=(3, 4))     # Two-dimensional array
x3 = np.random.randint(10, size=(3, 4, 5))  # Three-dimensional array

print("x3 ndim: ", x3.ndim)
print("x3 shape:", x3.shape)
print("x3 size: ", x3.size)
print("itemsize:", x3.itemsize, "bytes")
print("nbytes:", x3.nbytes, "bytes")

#####################
x = np.array([1, 2, 3])
y = np.array([4, 5, 6])

np.hstack([x, y]) # Horizontally stacking
np.vstack([x, y]) # vertically stacking

x5 = np.random.randint(10, size=(3, 3))     # Two-dimensional array
x6 = np.random.randint(10, size=(3, 3))     # Two-dimensional array

np.hstack([x5, x6]) # Horizontally stacking
np.vstack([x5, x6]) # vertically stacking
#####################

######## Aggregations: Min, Max, and Everything In Between #######
import numpy as np
L = np.random.random(10)
np.sum(L)
np.min(L)
np.max(L)
np.mean(L)
np.std(L)
np.var(L)


# M = np.random.random((3, 4))
# print(M)

import numpy as np
x = [1, 4, 8, 10, 12, 4]
np.mean(x)
np.median(x)

np.sum(x)
np.prod(x)
np.mean(x)
np.std(x)
np.var(x)
np.min(x)
np.max(x)
np.argmin(x) # Find index of minimum value
np.argmax(x) # Find index of maximum value 
np.median(x)

np.percentile(x,25) # Compute percentile vlaues
np.percentile(x,50)
np.percentile(x,75)


#####################
# Create list baseball
baseball = [180, 215, 210, 210, 188, 176, 209, 200]
type(baseball)

# Create a numpy array from baseball: np_baseball
np_baseball = np.array(baseball)
print(np_baseball)
type(np_baseball)





