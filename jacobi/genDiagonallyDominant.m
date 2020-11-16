function [A] = genDiagonallyDominant( N )
%generates Diagonally Dominant Matrix of size N
A=rand(N,N);
for i = 1:N
    sum = 0;
    for j = 1:N
        sum=sum+abs(A(i,j));        
    end
    A(i,i)=A(i,i)+sum;
    %strict diagonal dominace    
end
end