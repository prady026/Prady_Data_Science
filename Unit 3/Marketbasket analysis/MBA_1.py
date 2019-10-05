"""
************************  DATA SET INFORMATION ************************  
This is a transnational data set which contains all the transactions occurring 
between 01/12/2010 and 09/12/2011 for a UK-based and registered non-store 
online retail. The company mainly sells unique all-occasion gifts. 
Many customers of the company are wholesalers.

Attribute Information:
InvoiceNo:   Invoice number. Nominal, a 6-digit integral number uniquely assigned to each transaction. If this code starts with letter 'c', it indicates a cancellation. 
StockCode:   Product (item) code. Nominal, a 5-digit integral number uniquely assigned to each distinct product. 
Description: Product (item) name. Nominal. 
Quantity:    The quantities of each product (item) per transaction. Numeric.	
InvoiceDate: Invice Date and time. Numeric, the day and time when each transaction was generated. 
UnitPrice:   Unit price. Numeric, Product price per unit in sterling. 
CustomerID:  Customer number. Nominal, a 5-digit integral number uniquely assigned to each customer. 
Country:     Country name. Nominal, the name of the country where each customer resides.
"""

import pandas as pd
df = pd.read_excel('D:/CARRER/My_Course/DigitalLync/2 Module/Unsupervised/1 Market Basket Analysis/New folder/Online Retail.xlsx')
df.shape
df.head()
list(df)


# Removing NA if any in Invoice
df['Description'] = df['Description'].str.strip() # Removing space
df.shape
df.dropna(axis=0, subset=['InvoiceNo'], inplace=True) # No blanks so No change
df.shape

# Removing Invoice starts with C
df['InvoiceNo'] = df['InvoiceNo'].astype('str') #
df = df[~df['InvoiceNo'].str.contains('C')]
df.shape

list(df)
########### France ######

basket = (df[df['Country'] =="France"]
          .groupby(['InvoiceNo', 'Description'])['Quantity']
          .sum().unstack().reset_index().fillna(0)
          .set_index('InvoiceNo'))
"""
if there are duplicated products for a given InvoiceNO then we sum them. 
If one of the Quantity isnt listed for a InvoiceNO, 
we create a new row full of 0.
"""

basket.shape
list(basket)
basket.head()

basket.to_csv("D:/CARRER/My_Course/DigitalLync/2 Module/Unsupervised/1 Market Basket Analysis/New folder/basket.csv")


###########
def encode_units(x):
    if x <= 0:
        return 0
    if x >= 1:
        return 1

###########
basket_sets = basket.applymap(encode_units)
basket_sets.shape
basket_sets.to_csv("D:/CARRER/My_Course/DigitalLync/2 Module/Unsupervised/1 Market Basket Analysis/New folder/basket_sets.csv")



# basket_sets.drop('POSTAGE', inplace=True, axis=1) # Not clear why Postage is removed from the set.
# basket_sets.shape


###########
from mlxtend.frequent_patterns import apriori
frequent_itemsets = apriori(basket_sets, min_support=0.07, use_colnames=True)
frequent_itemsets.shape

###########
from mlxtend.frequent_patterns import association_rules
rules = association_rules(frequent_itemsets, metric="lift", min_threshold=1)
rules.shape
rules.head()

rules.to_csv("D:/CARRER/My_Course/DigitalLync/2 Module/Unsupervised/1 Market Basket Analysis/New folder/rules.csv")


rules[ (rules['lift'] >= 6) &
       (rules['confidence'] >= 0.8) ]


basket['ALARM CLOCK BAKELIKE GREEN'].sum()
basket['ALARM CLOCK BAKELIKE RED'].sum()

########### Germany ######
basket2 = (df[df['Country'] =="Germany"]
          .groupby(['InvoiceNo', 'Description'])['Quantity']
          .sum().unstack().reset_index().fillna(0)
          .set_index('InvoiceNo'))

basket_sets2 = basket2.applymap(encode_units)
basket_sets2.drop('POSTAGE', inplace=True, axis=1)
frequent_itemsets2 = apriori(basket_sets2, min_support=0.05, use_colnames=True)
rules2 = association_rules(frequent_itemsets2, metric="lift", min_threshold=1)

rules2[ (rules2['lift'] >= 4) &
        (rules2['confidence'] >= 0.5)]

###########
