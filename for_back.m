function x=for_back(A,C)
[r,~]=size(A);
P = eye(r,r); %Identity Matrix
U = zeros(r,r); %Preallocate the space
L = zeros(r,r); %Preallocate the space

for i=1:r
        [~,h] = max(abs(A(i:r,i)));
        h = i-1+h;
       % swaping with the first Maximum non-zero row
        A([i h],:) = A([h i],:); %coping same trasformation for echelon from matrix
        P([i h],:) = P([h i],:); %coping same trasformation for Identity matrix
        L([i h],:) = L([h i],:); %coping same trasformation for Lower Triangular matrix
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
    
b=P*C; 
%Solving for y from Ly=b using forwardsubsitution (lower triangular matrix)

y(1,1)=b(1)/L(1,1); %Starts from first row

for i=2:r
    y(i,1)=(b(i)-L(i,1:i-1)*y(1:i-1,1))./L(i,i);
end

%Solving for x from Ux=y using backsubsitution (upper triangular matrix)

x(r)=y(r)/U(r,r); % starts from last row 
for i=r-1:-1:1
h=0;
    for j=(i+1):r
        h=h+U(i,j)*x(j);
    end
    x(i)=(y(i)-h)/U(i,i); 
end
x=x'; % Transpose value of x
