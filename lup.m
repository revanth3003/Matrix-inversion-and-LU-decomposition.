function [L,U,P]=lup(A)
[r,c] = size(A); % size of the matrice 
P = eye(r,r); %Identity matrix
if r<=c % if # of rows equals to or less than # of columns for a given matrix
    U = zeros(r,c); %Preallocate the space
    L = zeros(r,r); %Preallocate the space
    for i=1:r
        [~,s] = max(abs(A(i:r,i)));
        s = i-1+s;
       % swaping with the first Maximum non-zero row
        A([i s],:) = A([s i],:); %coping same trasformation for Upper Triangular matrix
        P([i s],:) = P([s i],:); %coping same trasformation for Identity matrix
        L([i s],:) = L([s i],:); %coping same trasformation for Lower Triangular matrix
        if A(i,i)~=0  % if row and columnn is a nonzero number
        L(i:r,i) = A(i:r,i) / A(i,i);
        end
        if A(i,i)==0 % if row and columnn is a zero number
        L(i:r,i) = A(i:r,i);
        end
        U(i,:) = A(i,:);
        A(i+1:r,:) = A(i+1:r,:) - L(i+1:r,i)*A(i,:);
  
    end
    U(:,end) = A(:,end);
    
end

if r>c % if # of rows greater than # of columns for a given matrix
    U = zeros(c,c); %Preallocate the space
    L = zeros(r,c); %Preallocate the space
    for i=1:c
        [~,s] = max(abs(A(i:r,i))); 
        s = i-1+s;
        % swaping with the first Maximum non-zero row
        A([i s],:) = A([s i],:); %coping same trasformation for Upper Triangular matrix
        P([i s],:) = P([s i],:); %coping same trasformation for Identity matrix
        L([i s],:) = L([s i],:); %coping same trasformation for Lower Triangular matrix
        if A(i,i)~=0 % if row and columnn is a nonzero number
        L(i:r,i) = A(i:r,i) / A(i,i);
        end
        if A(i,i)==0 % if row and columnn is a zero number
        L(i:r,i) = A(i:r,i);
        end
        U(i,:) = A(i,:);
        A(i+1:r,:) = A(i+1:r,:) - L(i+1:r,i)*A(i,:);
  
    end
    U(1:r-1,:) = A(1:r-1,:);
end
   