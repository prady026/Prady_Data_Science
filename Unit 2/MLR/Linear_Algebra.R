A <- matrix(c(1,3,2,2,8,9),ncol=3)

A <- matrix(c(1,3,2,2,8,9),ncol=2)
B <- matrix(c(5,8,3,4,2,7),ncol=2)

A+B  # Sum of matrices (Only matrices with the same dimensions can be added)
t(A+B) #Transpose of A


A <- matrix(c(1,3,2,2,8,9),ncol=3,byrow=T)
B <- matrix(c(5,8,3,4,2,7),nrow = 3)

A+B

A%*%B #Mulitplying two matrices

A <- matrix(c(1,3,2,4),ncol=2,byrow=T)
A

A_inv <- solve(A)  #inverse of a matrix
A_inv

I = A%*%A_inv # A.Ainverse = I (Identity matrix)
I

