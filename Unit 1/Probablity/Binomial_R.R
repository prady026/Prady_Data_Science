# Case 1
# P(x=r) - Exactly - Issuing Credit Cards or not

x0=dbinom(250,500,0.32)
x0

x1=dbinom(4,5,0.6)
x1

x2=dbinom(5,5,0.6)
x2


#x3=dbinom(r,n,p)
x3=dbinom(3,5,0.6)
x3

x4=dbinom(4,5,0.6)
x4

x5=dbinom(5,5,0.6)
x5

# Atleast 3
X345 = x3 + x4 +x5
X345

1-X345


x0
x1
x2
x3
x4
x5

# Case 2
# The Sum of all probabilties is equal to one
x6 = x0+x1+x2+x3+x4+x5
x6

# Case 3
# P(x=0,1,2) - Atmost 2 (First 3 probabilities including 0)
x7 = pbinom(130,500,0.326)
x7

# Case 4
# P(x=3,4,5) - Atleast 3 (Calculating Remaining from Total sum of probabilities i.e 1 - x7)
x8 = 1-x7
x8

# Case 5 - Negative Binomail Distribution
# Here we know the cumulative Probabilities value find out the how many people are going to issue Credit card
# Finding out 'r' values from given cummulative probabilites, sample size and percentages.
x10 <- qbinom(0.01024,5,0.6)
x11 <- qbinom(0.08704,5,0.6)
x12 <- qbinom(0.31744,5,0.6)
x13 <- qbinom(0.66304,5,0.6)
x14 <- qbinom(0.92224,5,0.6)
x15 <- qbinom(1,5,0.6)

x10
x11
x12
x13
x14
x15


# Simulating the random numbers by following distribution
k1=rbinom(10,1,0.50)
k1


############## Min value
x0=pbinom(1480,5000,0.326)
x1=1-x0
x1

############## Max value
x0=pbinom(1800,5000,0.326)
x0


##################################
# My target is reach 3000 people then what is n?
# For what sample size if i reach such that i can reach 3000 people atleast

#9700

x10=pbinom(3000,5000,0.326)
x11=1-x10
x11

# My target is reach 5000 people then what is n?
# For what sample size if i reach such that i can reach 5000 people atleast

x10=pbinom(5000,16000,0.326)
x11=1-x10
x11
