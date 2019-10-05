# -*- coding: utf-8 -*-
"""
Created on Tue Dec 25 20:22:51 2018

@author: HI
"""

import pandas as pd  
import numpy as np  
#import matplotlib.pyplot as plt  
#%matplotlib inline

dataset = pd.read_csv('D:/CARRER/My_Course/Daily Classes/Python_Classes/4 Machine Learning/5 Trees/petrol_consumption.csv')
dataset.shape
dataset.head()
dataset.describe()
type(dataset)




X = dataset.drop('Petrol_Consumption', axis=1)  #Whether to drop labels from the index (0 or ‘index’) or columns (1 or ‘columns’)
y = dataset['Petrol_Consumption'] 

from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=0)


from sklearn.tree import DecisionTreeRegressor  
regressor = DecisionTreeRegressor(max_depth=4)  
regressor.fit(X_train, y_train)
print(f'Decision tree has {regressor.tree_.node_count} nodes with maximum depth {regressor.tree_.max_depth}.')
y_pred = regressor.predict(X_test)  


############## To draw the picture

from sklearn import tree
import graphviz 
dot_data = tree.export_graphviz(regressor, out_file=None, 
                    filled=True, rounded=True,  
                    special_characters=True)  
graph = graphviz.Source(dot_data)  
graph

##############

df=pd.DataFrame({'Actual':y_test, 'Predicted':y_pred})  
df

from sklearn import metrics  

print('Mean Absolute Error:', metrics.mean_absolute_error(y_test, y_pred))  
print('Mean Squared Error:', metrics.mean_squared_error(y_test, y_pred).round(3))  
print('Root Mean Squared Error:', np.sqrt(metrics.mean_squared_error(y_test, y_pred)).round(3)) 


