###############################################################################
"""
Basic
"""

from textblob import TextBlob
## creating a textblob object
blob = TextBlob("Hyderabad is a great place to learn software courses.")

## textblobs are like python strings
blob[0:5]

blob.upper()
blob.lower()


blob2 = TextBlob("It contains a lot of institutes to learn and get the job.")

## concat
blob + " And " + blob2


###############################################################################
"""
Tokenization


blob = TextBlob("Hyderabad is a great place to learn software courses. \n It contains a lot of institutes to learn and get the job.")
blob.sentences
blob.sentences[0]

"""
###############################################################################

"""
Noun phrase extraction
"""    

blob = TextBlob("Hyderabad is a great place to learn software courses.")
for np in blob.noun_phrases:
    print (np)
    
###############################################################################
    
"""
POS tagging
"""

for words, tag in blob.tags:
    print (words, tag)
    
###############################################################################
"""
Sentiment Analysis
"""
print (blob)
blob.sentiment


###############################################################################
"""
Word Inflection and Lemmatization
"""
blob = TextBlob("Digital Nest is a great platform to learn data science. \n It helps community through blogs, hackathons, discussions,etc.")
print (blob.sentences[1].words[1])
print (blob.sentences[1].words[1].singularize())


from textblob import Word
w = Word('Platform')
w.pluralize()


## using tags
for word,pos in blob.tags:
    if pos == 'NN':
        print (word.pluralize())
        

## lemmatization
w = Word('running')
w.lemmatize("v")  ## v here represents verb

###############################################################################
"""
Ngrams
The TextBlob.ngrams() method returns a list of tuples of n successive words.
"""
#for ngram in blob.ngrams(2):
#    print (ngram)

"""
if X=Num of words in a given sentence K, 
the number of n-grams for sentence K would be: Ngrams_K=X-(N-1)

To estimate the probabilities of next words or of whole sequences, 
the N-gram model is one of the most important tools in speech and language processing.

A combination of multiple words together are called N-Grams. 
N grams (N > 1) are generally more informative as compared to words, 
and can be used as features for language modelling.  

N-grams can be easily accessed in TextBlob using the ngrams function,
which returns a tuple of n successive words.


"""



blob = TextBlob("Now is better than never.")
blob.ngrams(n=3)

blob1 = TextBlob("Digital Nest is a great platform to learn data science. \n It helps community through blogs, hackathons, discussions,etc.")
blob1.ngrams(n=5)




###############################################################################
"""
Spelling correction
"""

blob = TextBlob('Hyderabad is a geat place to learn software coures.')
blob.correct()
blob.words[3].spellcheck()


###############################################################################
"""
Creating a short summary from a text
"""

blob = TextBlob('Digital Nest is a thriving community for data driven industry. This platform allows \
    people to know more about analytics from its articles, Q&A forum, and learning paths. Also, we help \
    professionals & amateurs to sharpen their skillsets by providing a platform to participate in Hackathons.')



Coordinateconj = list()
for word, tag in blob.tags:
    if tag == 'CC':
        Coordinateconj.append(word.lemmatize())
print(Coordinateconj)

verb = list()
for word, tag in blob.tags:
    if tag == 'VB':
        verb.append(word.lemmatize())
print(verb)

nouns = list()
for word, tag in blob.tags:
    if tag == 'NN':
        nouns.append(word.lemmatize())
print(nouns)

import random
from textblob import Word

for item in random.sample(nouns, 5):
    word = Word(item)
    print (word.pluralize())
    
    
###############################################################################
"""
Language Translation
"""

blob = TextBlob('Hyderabad is a great place to learn software courses.')
blob.translate(to ='ar')
blob = TextBlob('هذا رائع')
blob.detect_language()
blob.translate(from_lang='ar', to ='en')
blob.translate(to= 'en')


###############################################################################
"""
Text Classification using textblob

Let’s build a simple text classification model using TextBlob. 
For this, first, we need to prepare a training and testing data.
"""

training = [
            ('Tom Holland is a terrible spiderman.','pos'),
            ('a terrible Javert (Russell Crowe) ruined Les Miserables for me...','pos'),
            ('The Dark Knight Rises is the greatest superhero movie ever!','neg'),
            ('Fantastic Four should have never been made.','pos'),
            ('Wes Anderson is my favorite director!','neg'),
            ('Captain America 2 is pretty awesome.','neg'),
            ('Let\s pretend "Batman and Robin" never happened..','pos'),
            ]
testing = [
           ('Superman was never an interesting character.','pos'),
           ('Fantastic Mr Fox is an awesome film!','neg'),
           ('Dragonball Evolution is simply terrible!!','pos')
           ]

"""
Textblob provides in-build classifiers module to create a custom classifier. 
So, let’s quickly import it and create a basic classifier.
"""


from textblob.classifiers import NaiveBayesClassifier
classifier = NaiveBayesClassifier(training)
print (classifier.accuracy(testing))

"""
classifier.show_informative_features()
classifier.show_informative_features(3)

As, we can see that if the text contains “is”, 
then there is a high probability that the statement will be negative.
"""

classifier.classify("the weather is terrible!")
classifier.classify("I am very happy today")
classifier.classify("This book was so helpful")
classifier.classify("I'm excited to try my new classifier.")
classifier.classify("This is an awesome library!")


## decision tree classifier
from textblob.classifiers import DecisionTreeClassifier
dt_classifier = DecisionTreeClassifier(training)
print (dt_classifier.accuracy(testing))




###############################################################################

