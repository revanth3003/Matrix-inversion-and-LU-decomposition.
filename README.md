# Matrix-inversion-and-LU-decomposition.
Matrix inversion and LU decomposition.


for_back.m - function that will compute the appropriate elementary matrices to both forward elimination and back-substitution.

inverse.m -  function that will return the inverse of a given input matrix using (for_back.m) function, or
              an appropriate error message if the matrix is singular. Example: A=randi([-1,4],4,4);C x=inverse.m(A)
              
lup.m - a function that computes the LU-decomposition of an input matrix. The function would return L, U and P
        Example: A=randi([-1,4],4,4); [L U P]=lup.m(A)

The inverse.m will return the inverse of a given input matrix, or an appropriate error message if the matrix is singular by using the for_back.m function


Note: Make sure you have function files is in your path before run. 

Thank you 

