install.packages("NLP")
install.packages("tm")
install.packages("wordcloud")
install.packages("e1071")
install.packages("gmodels")
install.packages("RColorBrewer")

library(NLP)
library(tm)  # tm means Text mining
library(wordcloud)

library(e1071)#naive Bayes function
library(gmodels)
library(RColorBrewer)

#Document on tm package # tm means Text mining
vignette("tm")
#Note:execute all the steps in order as the previous step is an input to the next step.


#1)Data Setup
sms_raw=read.csv(file="D:/CARRER/My_Course/Daily Classes/Module3/2 Naive Bayes/SMS-SPAM-BAYES.csv",header=T,sep=",",stringsAsFactors=F) #stringsAsFactors will #not allow as data as factor type
names(sms_raw)
attach(sms_raw)
str(sms_raw)
sms_raw$type=factor(sms_raw$type)
str(sms_raw)

#2)Understad the data
prop.table(table(sms_raw$type))
sms_raw[1:5,]

#3)Create Corpus # Updated with Vcorpus instead of Corpus
sms_corpus=VCorpus(VectorSource(sms_raw$text))#Creating a corpus vector
# Corpus is going to create all text in vector format
inspect(sms_corpus[1:3])#To see first three sms

#4) Transformation or cleaning of corpus
corpus_clean=tm_map(sms_corpus,tolower)#Convert everything into lower case.
corpus_clean=tm_map(sms_corpus,PlainTextDocument)#If we don not run this,it will create error while creating sparse matrix.
corpus_clean=tm_map(corpus_clean,removeNumbers)
corpus_clean=tm_map(corpus_clean,removeWords,stopwords())#Removing filler words are called Stopwords(to,but etc).
corpus_clean=tm_map(corpus_clean,removePunctuation)#Remove Punctuation
corpus_clean=tm_map(corpus_clean,stripWhitespace)#Remove white spaces leaving single white space.

#5)Tokenization #Process of splitting a message into individual components.
sms_dtm=DocumentTermMatrix(corpus_clean) #Create sparse matrix
dim(sms_dtm)
inspect(sms_dtm[1:10,1:10]) # To display sparse matrix #Opposite to sparse is dense matrix

#5)Creating training and test data
#********************
#Splitting raw data into training and testing data
sms_raw_train=sms_raw[1:4169,]
sms_raw_test=sms_raw[4170:5574,]
#*********************
#Splitting sparse data into training and testing data
sms_dtm_train=sms_dtm[1:4169,]
sms_dtm_test=sms_dtm[4170:5574,]
#*********************
#Splitting corpus data into training and testing data
sms_corpus_train=corpus_clean[1:4169]
sms_corpus_test=corpus_clean[4170:5574]

#6)Visualizing text data using wordcloud
wordcloud(corpus_clean,min.freq=40,random.order=F,colors=brewer.pal(8, "Dark2")) #min.freq=Min number of times atleast appear to display in wordcloud
#And consider min.freq=10 percent of documents



#7) Creation of frequent data table
sms_dict=(findFreqTerms(sms_dtm_train,5))#Create the list of the words which seen more than 5 documents(1% of total documents)
sms_train=DocumentTermMatrix(sms_corpus_train,list(dictionary = sms_dict))
sms_test=DocumentTermMatrix(sms_corpus_test,list(dictionary = sms_dict))
#sms_train[1:2,c(2,3)]
#inspect(sms_train[21:40,21:30])

#8) Creation of data table with updated with binary data in the table
#**************
#Create a function to convert the data "Yes" or "No"
convert_count=function(x){
  x=ifelse(x>0,1,0)
  x=factor(x,levels=c(0,1),labels=c("No","Yes"))
  return(x)
}
sms_train=apply(sms_train,MARGIN=2,convert_count)
sms_test=apply(sms_test,MARGIN=2,convert_count)

#9) Building the model
sms_classifier=naiveBayes(sms_train,sms_raw_train$type,laplace=1) # using laplace will replace as 1 with 0 probabilities
#10) Prediction using test data
sms_test_pred=predict(sms_classifier,newdata=sms_test)

#11)Performance Evaluation
Performance=CrossTable(sms_raw_test$type,sms_test_pred,prop.r=T,prop.t=F,prop.c=F,dnn=c("Actual","Predicted"))
Accuracy=mean(sms_raw_test$type==sms_test_pred)
Accuracy

