"""
@author: HI
"""

import pandas as pd
df = pd.read_csv('D:/CARRER/My_Course/DigitalLync/2 Module/Supervised/8 Random forests/Boston.csv')
df.head()
df.shape


data = df.iloc[:,1:14] # Only Independent variables
data.shape
data.head()

target = df.medv


# Splitting train and test data sets
from sklearn.model_selection import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(data, target, test_size=0.3, random_state=42)

X_train.shape
X_test.shape
Y_train.shape
Y_test.shape

###############################################################################
from sklearn.ensemble import RandomForestRegressor
forest_reg = RandomForestRegressor(n_estimators=120,random_state=42,max_features=5)

forest_reg.fit(X_train, Y_train)

Y_Pred = forest_reg.predict(X_test)

from sklearn.metrics import mean_squared_error
forest_mse = mean_squared_error(Y_test, Y_Pred)
print('Mean Square Error: ', forest_mse.round(3))


import numpy as np
forest_rmse = np.sqrt(forest_mse)
print("RMSE : ",forest_rmse.round(3))

###############################################################################

