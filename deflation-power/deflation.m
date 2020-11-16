function [lambda,evec] = deflation(A,tol)
% Function : calulates eigen values and vectors of a real matrix A
% input   A        REAL matrix
%         tol      REAL error tolerance
%
% output  lambda   REAL solution vector of eigen values
%         evec     REAL matrix of eigen vectors in columns
% **PLEASE NOTE**%
%Uses Hotelling Deflation method
%A needs to be symmetric
    n=size(A,1);
    lambda=zeros(n,1);
            evec = zeros(n,n);

    B=A;
    for i = 1:n
        [e,v] = powermethod(B,tol,1000);
        x = v/sum(v.*v);
        B = B - e*v*x';
        lambda(i)=e;
        %finding the corresponding eigenvector (A-e*I)x = 0
        evec(:,i)=linsolve(A-e*eye(n),zeros(n,1));
    end

end
