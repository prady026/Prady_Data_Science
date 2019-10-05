# -*- coding: utf-8 -*-
"""
Created on Thu Dec 20 19:41:47 2018

@author: HI
"""

a = [1, 3.5, "Hello"]
type(a)

# How to create arrays?

import array as arr
a = arr.array('d', [1, 3.5, "Hello"]) ## If you creating an array it should contians numeric only

a = arr.array('d', [1.1, 3.5, 4.5])  ## 'd' stand for floats and b,B,u,h,H,i,I,l,L,f are other internal type codes
print(a)


# How to access array elements?
import array as arr
a = arr.array('i', [2, 4, 6, 8])
print(a)

print("First element:", a[0])
print("Second element:", a[1])
print("Last element:", a[-1])

# How to slice arrays?
import array as arr

numbers_list = [2, 5, 62, 5, 42, 52, 48, 5]
numbers_array = arr.array('i', numbers_list)

print(numbers_array[2:5]) # 3rd to 5th
print(numbers_array[:-5]) # beginning to 4th
print(numbers_array[5:])  # 6th to end
print(numbers_array[:])   # beginning to end


# How to change or add elements?
import array as arr
numbers = arr.array('i', [1, 2, 3, 5, 7, 10])

# changing first element
numbers[0] = 0    
print(numbers)

# changing 3rd to 5th element
numbers[2:5] = arr.array('i', [4, 6, 8])   
print(numbers)     # Output: array('i', [0, 2, 4, 6, 8, 10])

# Python Matrix
A = [[1, 4, 5, 12], 
    [-5, 8, 9, 0],
    [-6, 7, 11, 19]]

print("A =", A) 
print("A[1] =", A[1])      # 2nd row
print("A[1][2] =", A[1][2])   # 3rd element of 2nd row
print("A[0][-1] =", A[0][-1])   # Last element of 1st Row

print("A :", A)

###########
column = [];        # empty list
for row in A:
  column.append(row[2])   

print("3rd column =", column)
###########

## Access matrix elements, rows and columns ##


## Access rows of a Matrix

import numpy as np

A = np.array([[1, 4, 5, 12], [-5, 8, 9, 0],[-6, 7, 11, 19]])

print("A[0] =", A[0]) # First Row
print("A[2] =", A[2]) # Third Row
print("A[-1] =", A[-1])


## Access columns of a Matrix
import numpy as np

A = np.array([[1, 4, 5, 12], [-5, 8, 9, 0],[-6, 7, 11, 19]])

print("A[:,0] =",A[:,0]) # First Column
print("A[:,1] =",A[:,1]) # Second Column
print("A[:,3] =", A[:,3]) # Fourth Column
print("A[:,-1] =", A[:,-1]) # Accessing to Last Column (4th column in this case)


## Slicing of a Matrix

import numpy as np
A = np.array([[1, 4, 5, 12, 14], [-5, 8, 9, 0, 17],[-6, 7, 11, 19, 21]])
print(A)

#############################
print(A[0]) # First Row print
print(A[0:]) # First Row - Accessing from Left side from colon
print(A[:0]) # First Row- Accessing from Right side - Nullset
print(A[:1]) # First Row- To access from Right side of colon start with 1
print(A[:2]) # First and Second Row with out comma

print(A[:,0]) # to access columns u need to use comma only - First column
print(A[:,1]) # to access columns u need to use comma only - Second column
#############################

print(A[:0, :0]) # Null set
print(A[:0, :1]) # Null set
print(A[:1, :0]) # Null set

print(A)
print(A[:1, :1]) # First Row , First column
print(A[:1, :2]) # First Row , First two columns
print(A[:1, :3]) # First Row , First three columns
print(A[:1, :4])
print(A[:1, :5])

print(A[:2, :1]) # Two Rows, one Column
print(A[:3, :1]) # Three Rows, one Column
print(A[:3, :3]) # Three Rows, three Column

print(A[:1,])  # First row, all columns
print(A[:,1])  # All rows, second column

print(A[:, 2:5]) # All Rows , from column 3 to 5
print(A[0:2:, ]) # All columns , first two rows

#############################

print(A)
print(A[2,1]) # Third row, first column - Selcting one particular element

