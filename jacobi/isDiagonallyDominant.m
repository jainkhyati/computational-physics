function flag = isDiagonallyDominant( A )
%returns 1 if the given matrix is diagonally dominant
%assumes a square matrix as input

N = size(A,1);
flag=1;
for i = 1:N
    sum = 0;
    for j = 1:N
        if(j~=i)
            sum=sum+abs(A(i,j));
        end
        
    end
    if(sum>=abs(A(i,i)))%strict diagonal dominace
        flag=0;
        break;
    end
end
end

