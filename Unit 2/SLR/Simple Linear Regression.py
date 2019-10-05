# -*- coding: utf-8 -*-
"""
Created on Fri Feb  8 14:21:32 2019

@author: HI
"""


import numpy as np
import pandas as pd
#import matplotlib.pyplot as plt

# Loading the data
df = pd.read_csv("D:\CARRER/My_Course/DigitalLync/2 Module/Supervised/1 Linear Regression/SLR/Viralcount_Drug.csv")
df.shape
type(df)
list(df)
df.ndim

# Split the data in to independent and Dependent
X = df['drug'] # Only Independent variables
X.shape
X.ndim

X = X[:, np.newaxis] # converting in to 2 D arrary from 1 D array
X.ndim

# Y = df.iloc[:,1]  # Only Dependent variable

Y = df["viral count"]  # Only Dependent variable
Y.shape
Y.ndim

df.plot.scatter(x='drug', y='viral count');


# Import Linear Regression
from sklearn.linear_model import LinearRegression
model = LinearRegression().fit(X, Y)
model.intercept_  ## To check the Bo values
model.coef_       ## To check the coefficients (B1)


# Make predictions using the testing set
Y_Pred = model.predict(X)

# Errors are the difference between observed and predicted values.
Y_error = Y-Y_Pred
print(Y_error)

# R square can be obbtained using sklearn.metrics ( ):

from sklearn.metrics import mean_squared_error,r2_score
mean_squared_error(Y,Y_Pred)
Rsquare = r2_score(Y,Y_Pred)
print(Rsquare.round(3))

from math import sqrt
RMSE = sqrt(mean_squared_error(Y,Y_Pred))
print(RMSE)

############################################################################
## Individual Coeffcient Test,  R2 Square, R2 Adjusted with statsmodels
import statsmodels.api as sma
X = sma.add_constant(X) ## let's add an intercept (beta_0) to our model

#  Linear regression can be run by using sm.OLS:
import statsmodels.formula.api as sm
lm2 = sm.OLS(Y,X).fit()

#he summary of our model
lm2.summary()

