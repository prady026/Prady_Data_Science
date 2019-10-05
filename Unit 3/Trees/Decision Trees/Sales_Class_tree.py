# -*- coding: utf-8 -*-
"""
Created on Tue Mar  5 21:43:02 2019

@author: HI
"""

import pandas as pd  
import numpy as np  
# import matplotlib.pyplot as plt  
# %matplotlib inline

dataset = pd.read_csv("D:/CARRER/My_Course/DigitalLync/2 Module/Supervised/7 Decision Tree/ClassificationTrees/sales.csv")  
dataset.shape
dataset.head() 
dataset.describe()
type(dataset)

#X = dataset.drop('high', axis=1)  #Whether to drop labels from the index (0 or ‘index’) or columns (1 or ‘columns’)
#X = dataset.iloc[:,1:5]  #Whether to drop labels from the index (0 or ‘index’) or columns (1 or ‘columns’)
X = dataset.iloc[:,1:11]  #Whether to drop labels from the index (0 or ‘index’) or columns (1 or ‘columns’)
Y = dataset['high']

X_1 = dataset['ShelveLoc']
X_2 = dataset['Urban']
X_3 = dataset['US']

###############################################################
# One-hot encode
def cat2int(column):
    vals = list(set(column))
    for i, string in enumerate(column):
        column[i] = vals.index(string)
    return column

X['ShelveLoc']=cat2int(X_1)
X['Urban']    =cat2int(X_2)
X['US']       =cat2int(X_3)

X.head()
Y.head()

###############################################################

from sklearn.model_selection import train_test_split  
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.20) 

X_train.shape, X_test.shape, Y_train.shape, Y_test.shape

from sklearn.tree import DecisionTreeClassifier  
# classifier = DecisionTreeClassifier() # By default gini will be added
classifier = DecisionTreeClassifier(max_depth=5) # best fit
# classifier = DecisionTreeClassifier(criterion='entropy',max_depth=9)

classifier.fit(X_train, Y_train)
print(f'Decision tree has {classifier.tree_.node_count} nodes with maximum depth {classifier.tree_.max_depth}.')

Y_pred = classifier.predict(X_test) 

df=pd.DataFrame({'Actual':Y_test, 'Predicted':Y_pred})  
df

from sklearn.metrics import classification_report, confusion_matrix  
cm=confusion_matrix(Y_test, Y_pred)
print(confusion_matrix(Y_test, Y_pred))  
print("Accuracy: ",np.mean(Y_pred == Y_test).round(2))  
print(classification_report(Y_test, Y_pred)) 

###############################################################

from sklearn import tree
import graphviz 
dot_data = tree.export_graphviz(classifier, out_file=None, 
                    filled=True, rounded=True,  
                    special_characters=True)  
graph = graphviz.Source(dot_data)  
graph

