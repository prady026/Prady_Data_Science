"""
Make sure to download the below lines in anaconda prompt
1. pip install -U textblob
2. python -m textblob.dowload_corpora
"""

###############################################################################
"""
Create a TextBlob
"""

from textblob import TextBlob
 # Let’s create our first TextBlob.

wiki = TextBlob("Python is a high-level, general-purpose programming language.")
    
# Part-of-speech Tagging
# Part-of-speech tags can be accessed through the tags property.

wiki.tags

# Similarly, noun phrases are accessed through the noun_phrases property.
wiki.noun_phrases # Noun Phrase Extractionc
wiki.words # Return a list of word tokens. 
wiki.np_counts # Dictionary of noun phrase frequencies in this text.


###############################################################################
"""
Sentiment Analysis
The sentiment property returns a namedtuple of the form Sentiment(polarity, subjectivity). 
The polarity score is a float within the range [-1.0, 1.0]. 
The subjectivity is a float within the range [0.0, 1.0] where 0.0 is very objective and 1.0 is very subjective.
"""

testimonial = TextBlob("Textblob is amazingly simple to use. What great fun!")
testimonial.sentiment
testimonial.sentiment.polarity

testimonial = TextBlob("I think that he went home")
testimonial.sentiment # Its a just a simple statment so nuetral values

testimonial = TextBlob("I want a camera that can take good photos")
testimonial.sentiment # Postivity in Polarity and some subjectivity

testimonial = TextBlob("I am not impressed with your performance")
testimonial.sentiment # Negativity in Polarity and high subjectivity



# testimonial.tags
# testimonial.noun_phrases
###############################################################################

"""
Tokenization
You can break TextBlobs into words or sentences.
"""

zen = TextBlob("Beautiful is better than ugly. "
               "Explicit is better than implicit. "
               "Simple is better than complex.")

zen.words
zen.sentences

###############################################################################
"""
Words Inflection and Lemmatization
Each word in TextBlob.words or Sentence.words is a Word object 
(a subclass of unicode) with useful methods, 
e.g. for word inflection.
"""

sentence = TextBlob('Use 4 spaces per indentation level.')
sentence.words

sentence.words[0].singularize()
sentence.words[1].singularize()
sentence.words[2].singularize()
sentence.words[3].singularize()
sentence.words[4].singularize()
sentence.words[5].singularize()

sentence.words[-1].pluralize()

"""
Lemmatization :it links words with similar meaning to one word.
Words can be lemmatized by calling the lemmatize method.

It is a process of grouping together the inflected forms of a word 
so they can be analyzed as a single item, identified by the word’s lemma, or dictionary form.
"""

from textblob import Word
w = Word("octopi")
w.lemmatize() # Finding the nearest word

w = Word("went")
w.lemmatize("v")  # Pass in WordNet part of speech (verb)
w = Word("left")
w.lemmatize("v")  # Pass in WordNet part of speech (verb)

###############################################################################

"""
Spelling Correction
Use the correct() method to attempt spelling correction.
"""

b = TextBlob("I havv goood speling!")
print(b.correct())


"""
Word objects have a spellcheck() Word.spellcheck() method 
that returns a list of (word, confidence) tuples with spelling suggestions.
"""

from textblob import Word
w = Word('falibility')
w.spellcheck()

w = Word('carrer')
w.spellcheck()

###############################################################################

"""
Get Word and Noun Phrase Frequencies
There are two ways to get the frequency of a word or noun phrase in a TextBlob.

The first is through the word_counts dictionary.
"""

monty = TextBlob("We are no longer the Knights who say Ni. "
                 "We are now the Knights who say Ekki ekki ekki PTANG.")
monty.word_counts['ekki']
monty.words.count('ekki') # another way

"""
If you access the frequencies this way, the search will not be case sensitive, and words that are not found will have a frequency of 0.
The second way is to use the count() method.
"""


"""
You can specify whether or not the search should be case-sensitive (default is False).
"""
monty.words.count('ekki', case_sensitive=True)

###############################################################################

"""
Translation and Language Detection
"""
b = TextBlob(u"بسيط هو أفضل من مجمع")
b.detect_language()

b = TextBlob(u"بहिंदी विश्व की एक प्रमुख भाषा है")
b.detect_language()

b = TextBlob(u"భారత దేశంలో తెలుగు మాతృభాషగా మాట్లాడే 8.7 కోట్ల (2001) జనాభాతో [1] ప్రాంతీయ భాషలలో మొదటి స్థానంలో ఉంది.")
b.detect_language()

chinese_blob = TextBlob(u"美丽优于丑陋")
chinese_blob.translate(from_lang="zh-CN", to='en')

telugu_blob1 = TextBlob(u"美丽优于丑陋")
telugu_blob1.translate(from_lang="zh-CN", to='te')

telugu_blob2 = TextBlob(u"بسيط هو أفضل من مجمع")
telugu_blob2.translate(from_lang="ar", to='te')

###############################################################################
