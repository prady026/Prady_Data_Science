#from sklearn.datasets import load_breast_cancer
#cancer = load_breast_cancer()

"""
print(cancer.DESCR)
cancer.data
cancer.data.shape
print(cancer.feature_names)
print(cancer.target_names)
"""

import pandas as pd
raw_data=pd.read_csv('D:/CARRER/My_Course/Daily Classes/Python_Classes/4 Machine Learning/7 KNN/breast-cancer-wisconsin-data.csv', delimiter=',')
raw_data.shape
raw_data.head(5)

"""
cancer = load_breast_cancer()
"""

# Split the data in to independent and Dependent
cancerdata = raw_data.iloc[:,2:32] # Only Independent variables
cancerdata.shape
list(cancerdata)
cancertarget = raw_data.iloc[:,1]  # Only Dependent variable
cancertarget.shape


###############################################################################
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(cancerdata, cancertarget, stratify=cancertarget, random_state=42)

X_train.shape
X_test.shape
list(X_train)
#pd.crosstab(y_train['diagnosis'],y_test)


# Install KNN
from sklearn.neighbors import KNeighborsClassifier
knn = KNeighborsClassifier(n_neighbors=5)
knn.fit(X_train, y_train)

# Prediction
y_pred=knn.predict(X_test)

# Compute confusion matrix
from sklearn import metrics
cm = metrics.confusion_matrix(y_test, y_pred)
print(cm)
import numpy as np
print(np.mean(y_pred == y_test).round(2))  
print('Accuracy of KNN n-5, on the test set: {:.3f}'.format(knn.score(X_test, y_test)))



###############################################################################
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(cancerdata, cancertarget, stratify=cancertarget, random_state=42)

# Install KNN
from sklearn.neighbors import KNeighborsClassifier
knn = KNeighborsClassifier(n_neighbors=8)
knn.fit(X_train, y_train)

# Prediction
y_pred=knn.predict(X_test)

# Compute confusion matrix
from sklearn import metrics
cm = metrics.confusion_matrix(y_test, y_pred)
print(cm)
print(np.mean(y_pred == y_test))  
print('Accuracy of KNN n-8, on the test set: {:.3f}'.format(knn.score(X_test, y_test)))



###############################################################################
# Resplit the data, with a different randomization (inspired by Muller & Guido ML book - https://www.amazon.com/dp/1449369413/)
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(cancerdata, cancertarget, stratify=cancertarget, random_state=42)

# Create two lists for training and test accuracies
training_accuracy = []
test_accuracy = []

# Define a range of 1 to 10 (included) neighbors to be tested
neighbors_settings = range(1,11)

# Loop with the KNN through the different number of neighbors to determine the most appropriate (best)
for n_neighbors in neighbors_settings:
    clf = KNeighborsClassifier(n_neighbors=n_neighbors)
    clf.fit(X_train, y_train)
    training_accuracy.append(clf.score(X_train, y_train))
    test_accuracy.append(clf.score(X_test, y_test))
    
# Visualize results - to help with deciding which n_neigbors yields the best results (n_neighbors=6, in this case)
import matplotlib.pyplot as plt

plt.plot(neighbors_settings, training_accuracy, label='Accuracy of the training set')
plt.plot(neighbors_settings, test_accuracy, label='Accuracy of the test set')
plt.ylabel('Accuracy')
plt.xlabel('Number of Neighbors')
plt.legend()



###############################################################################
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(cancerdata, cancertarget, stratify=cancertarget, random_state=42)

# Install KNN
from sklearn.neighbors import KNeighborsClassifier
knn = KNeighborsClassifier(n_neighbors=5)
knn.fit(X_train, y_train)

# Prediction
y_pred=knn.predict(X_test)

# Compute confusion matrix
from sklearn import metrics
cm = metrics.confusion_matrix(y_test, y_pred)
print(cm)
print(np.mean(y_pred == y_test))  
print('Accuracy of KNN n-5, on the test set: {:.3f}'.format(knn.score(X_test, y_test)))
###############################################################################
