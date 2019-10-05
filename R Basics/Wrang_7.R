#####################   Lists in R  #########################################
# It's pretty inconvenient that vectors in R can only hold the same data type. What if we wanted something that holds different data types? 
# We would then need to use the list data structure in R. A list is a generic vector that can hold other objects. Think of an object as a variable or function.

a = c(5,6,7,8,9)
b = c("dog", "cat", "mouse")
c = c(T, F, T, T)
mylist = list(a,b,c)

#Adding function in to the Lists
mylist = list(a,b,c,adder)

#Working what class for 4th object
class(mylist[[4]])

#printing reqired elements from first object
mylist[[1]][4:5]
mylist[[2]]
mylist[[2]][1]


#Removing one object
mylist = mylist[-4]

#Using list in to loop
for(i in mylist) {
  print(i[1])
}

#Example
startup_data = read.csv('D:/CARRER/PDF & DOCS/R/R_Classes/Data Wrangling/second_crunchbase.csv', header = T, stringsAsFactors = F)

startup_list = list(startup_data$region, startup_data$funding_rounds, startup_data$market)

class(startup_list[[2]])

startup_list[[2]]

