###################   Data Wrangling : Advanced Matching   ###########################

##sub() and gsub() Functions
data = read.csv('D:/CARRER/My_Course/Daily Classes/R_Classes/Data Wrangling/flag_data.csv', header = T, stringsAsFactors = F)
head(data)
dim(data)

# The sub() and gsub() functions perform replacement on matches the function finds.
# sub() performs the replacement on the first match
# gsub() performs replacement on all of the matches

#The task is using gsub we need to encode the 'landmass' in the given data file
data$landmass = gsub('N.America', 1, data$landmass)
data$landmass = gsub('S.America', 2, data$landmass)
data$landmass = gsub('Europe', 3, data$landmass)
data$landmass = gsub('Africa', 4, data$landmass)
data$landmass = gsub('Asia', 5, data$landmass)
data$landmass = gsub('Oceania', 6, data$landmass)

head(data)

#grep() Function
#This function helps to find the given code or string in the given data set by showing it rows
grep('5', data$landmass)
grep('red', data$mainhue)

#Q. Find the mainhue color for Puerto-Rico


#Q. True or False. Hong-Kong is a country in our flag dataset?

