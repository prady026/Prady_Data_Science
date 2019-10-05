"""
"""

import pandas as pd

#df = pd.read_table('D:/CARRER/My_Course/Daily Classes/Python_Classes/4 Machine Learning/SMSSpamCollection',sep='\t', header=None,names=['label', 'message'])
df  = pd.read_csv("D:/CARRER/My_Course/Daily Classes/Python_Classes/4 Machine Learning/3 NaiveBayes/SMSSpamCollection.csv", header=None, names=['label', 'message'],encoding = 'unicode_escape')
                   

##Pre-processing
df['label'] = df.label.map({'ham': 0, 'spam': 1})  # convert the labels from strings to binary values for our classifier
df['message'] = df.message.map(lambda x: x.lower())  # convert all characters in the message to lower case
df['message'] = df.message.str.replace('[^\w\s]', '') # Remove any punctuation

import nltk  # tokenize the messages into into single words
nltk.download()  
# An installation window will appear. Go to the "Models" tab and select "punkt" from the "Identifier" column. 
# Then click "Download" and it will install the necessary files.

# Tokenization is process converting all words in separated with commas
df['message'] = df['message'].apply(nltk.word_tokenize)  


from nltk.stem import PorterStemmer
stemmer = PorterStemmer()
df['message'] = df['message'].apply(lambda x: [stemmer.stem(y) for y in x])  
# we will perform some word stemming. The idea of stemming is to normalize our text for all variations of words carry the same meaning, 
# regardless of the tense. One of the most popular stemming algorithms is the Porter Stemmer
# Finally, we will transform the data into occurrences, which will be the features that we will feed into our model

from sklearn.feature_extraction.text import CountVectorizer
# This converts the list of words into space-separated strings
df['message'] = df['message'].apply(lambda x: ' '.join(x))
count_vect = CountVectorizer()  
counts = count_vect.fit_transform(df['message'])  

from sklearn.feature_extraction.text import TfidfTransformer
transformer = TfidfTransformer().fit(counts)
counts = transformer.transform(counts)  


# Training the Model
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(counts, df['label'], test_size=0.2, random_state=69)  


from sklearn.naive_bayes import MultinomialNB
model = MultinomialNB().fit(X_train, y_train)  
predicted = model.predict(X_test)


##Evaluating the Model
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test, predicted)
print(cm)  

import numpy as np
print(np.mean(predicted == y_test).round(2))  

# Compute confusion matrix
from sklearn import metrics
print("Accuracy:",metrics.accuracy_score(y_test, predicted).round(2))
print("Precision:",metrics.precision_score(y_test, predicted).round(2))
print("Recall:",metrics.recall_score(y_test, predicted).round(2))


# Show confusion matrix in a separate window
import matplotlib.pyplot as plt
plt.matshow(cm)
plt.title('Confusion matrix')
plt.colorbar()
plt.ylabel('True label')
plt.xlabel('Predicted label')
plt.show()




