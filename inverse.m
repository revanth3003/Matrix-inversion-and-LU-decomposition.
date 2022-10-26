function B = inverse(A)
[r, c]=size(A);
B=zeros(r);
s=ref(A); 
j=1;
I=eye(r); % Identity Matrix
%checking for nonzero diagonal and equal dimentions for the matrix
for i=1:r
    if s(i,j)==0 || r~=c
        B='Warning:The given matrix is singular';
    return
    end
    j=j+1;  
end
%solving for inverse using forward elimination and back-substitution
%function
for i=1:r
   C=I(:,i);
   x=for_back(A,C);
   B(:,i)=x;
end
