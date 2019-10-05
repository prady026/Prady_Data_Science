"""

#!/usr/bin/python3
# Anchor extraction from html document
from bs4 import BeautifulSoup
from urllib.request import urlopen

with urlopen('https://en.wikipedia.org/wiki/Data_science') as response:
    soup = BeautifulSoup(response, 'html.parser')
    for anchor in soup.find_all('a'):
        print(anchor.get('href', '/'))
        
"""

###################################################################
        
#import the library used to query a website import urllib2 
import urllib.request #if you are using python3+ version

#specify the url
wiki = "https://en.wikipedia.org/wiki/List_of_state_and_union_territory_capitals_in_India"

#Query the website and return the html to the variable 'page'
#page = urllib.urlopen(wiki) 

page = urllib.request.urlopen(wiki) #For python 3 use 

#import the Beautiful soup functions to parse the data returned from the website
from bs4 import BeautifulSoup

#Parse the html in the 'page' variable, and store it in Beautiful Soup format
soup = BeautifulSoup(page)

print(soup.prettify())
soup.title
soup.title.string
soup.a
soup.find_all("a")

all_tables=soup.find_all('table')
right_table=soup.find('table', class_='wikitable sortable plainrowheaders')
right_table

#Generate lists
A=[]
B=[]
C=[]
D=[]
E=[]
F=[]
G=[]

for row in right_table.findAll("tr"):
    cells = row.findAll('td')
    states=row.findAll('th') #To store second column data
    if len(cells)==6: #Only extract table body not heading
        A.append(cells[0].find(text=True))
        B.append(states[0].find(text=True))
        C.append(cells[1].find(text=True))
        D.append(cells[2].find(text=True))
        E.append(cells[3].find(text=True))
        F.append(cells[4].find(text=True))
        G.append(cells[5].find(text=True))
        
#import pandas to convert list to data frame
import pandas as pd
df=pd.DataFrame(A,columns=['Number'])
df['State/UT']=B
df['Admin_Capital']=C
df['Legislative_Capital']=D
df['Judiciary_Capital']=E
df['Year_Capital']=F
df['Former_Capital']=G
df

list(df)
df.head()



df['State/UT']              = df['State/UT'].str.strip() # Removing space
df['Admin_Capital']         = df['Admin_Capital'].str.strip() # Removing space
df['Legislative_Capital']   = df['Legislative_Capital'].str.strip() # Removing space
df['Judiciary_Capital']     = df['Judiciary_Capital'].str.strip() # Removing space
df['Year_Capital']          = df['Year_Capital'].str.strip() # Removing space
df['Former_Capital']        = df['Former_Capital'].str.strip() # Removing space

df.head()
