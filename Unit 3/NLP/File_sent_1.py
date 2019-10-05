
"""

First time installer should run the command as "pip install pysrt" in anaconda prompt 
"""
import pysrt

# Loading the Subtitle
subs = pysrt.open('D:/CARRER/My_Course/DigitalLync/2 Module/Unsupervised/5 NLP/5 Sentiment Analysis/New folder/Demo.srt')

sub = subs[0]

# Subtitle text
text = sub.text
text_without_tags = sub.text_without_tags

# Start and End time
start = sub.start.to_time()
end = sub.end.to_time()

# Removing line and saving
#del subs[index]
subs.save('D:/CARRER/My_Course/DigitalLync/2 Module/Unsupervised/5 NLP/5 Sentiment Analysis/New folder/file.srt')

"""
pip install -U textblob
"""
from textblob import TextBlob

text = '''
The titular threat of The Blob has always struck me as the ultimate movie
monster: an insatiably hungry, amoeba-like mass able to penetrate
virtually any safeguard, capable of--as a doomed doctor chillingly
describes it--"assimilating flesh on contact.
Snide comparisons to gelatin be damned, it's a concept with the most
devastating of potential consequences, not unlike the grey goo scenario
proposed by technological theorists fearful of
artificial intelligence run rampant.
'''

blob = TextBlob(text)
blob.tags           # [('The', 'DT'), ('titular', 'JJ'),
                    #  ('threat', 'NN'), ('of', 'IN'), ...]

blob.noun_phrases   # WordList(['titular threat', 'blob',
                    #            'ultimate movie monster',
                    #            'amoeba-like mass', ...])

for sentence in blob.sentences:
    print(sentence.sentiment.polarity)
# 0.060
# -0.341

blob.translate(to="es")  # 'La amenaza titular de The Blob...'

# Sentiment Analysis
blob = TextBlob(text)
sentiment_polarity = blob.sentiment.polarity # -0.1590909090909091
sentiment_subjectivity = blob.sentiment.subjectivity # 0.6931818181818182

