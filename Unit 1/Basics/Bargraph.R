#Reading the data
data=read.csv(file="D:/CARRER/My_Course/Daily Classes/Module1/3 Plots & Graphs/BarGraph/Company_incentives.csv",header=T)
dim(data)
str(data)

# Create the bar chart
counts1 = table(data$Race)
barplot(counts1)

counts2 = table(data$MaritalStatus)
barplot(counts2)

counts3 = table(data$Gender,data$MaritalStatus)
barplot(counts3,col=c("darkblue","red","green"),legend = rownames(counts3),xlab = "Marital Status",ylab="No of People")


barplot(counts3,col=c("darkblue","red"),legend = rownames(counts3),xlab = "Marital Status",ylab="Frequancy of People", beside=TRUE)





##################################
### Display frequency (%) and count on a bar chart

install.packages("ggplot2")
library(ggplot2) 

            
df <- data.frame(outcome = as.factor(c("Good", "Bad")), n = c(700, 300), freq = c(70, 30))
            
ggplot(df, aes(x=outcome, y=freq, fill=outcome)) + 
              geom_bar(stat="identity", width=.4) +
              geom_text(aes(label=paste0(freq,"%")), vjust=1.5, colour="white")
            

ggplot(df, aes(x=outcome, y=freq, fill=outcome)) + 
              geom_bar(stat="identity", width=.4) +
              geom_text(aes(label=paste0(freq, "%\n(", n, ")")), vjust=1.5, colour="white")
            
