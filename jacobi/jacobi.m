function [x, error, iter, flag]  = jacobi(A, B, max_it, tol)
% 
% input   A        REAL matrix
%         x        REAL initial guess vector
%         b        REAL right hand side vector
%         max_it   INTEGER maximum number of iterations
%         tol      REAL error tolerance
%
% output  x        REAL solution vector
%         error    REAL error norm
%         iter     INTEGER number of iterations performed
%         flag     INTEGER: 0 = solution found to tolerance
%                           1 = no convergence given max_it
% **PLEASE NOTE**%
% a sufficient condition (not necessary) for jacobi iteration to work is
% that A is diagonallty dominant. This ensures the spectral radius of T is
% less than one
% Way to check the result: linsolve(A,B)
% --------------------------------------------------------------

%Check if A is not diagonally dominant, jacobi may not converge for that case
if(isDiagonallyDominant(A)==0)
    disp('Not a diagonally Dominant Matrix');
end

%Calculating D
D = diag(diag(A)); % diag is an overloaded function, please check documentation

R = A - D; %Remainder matrix
iter=0;%actual number of iterations
N=size(A,1);
x=rand(N,1);
flag=0;
%iterating a maximum of max_it times to get the solution
for i= 1:max_it
    iter=iter+1;
    x_new=D\(B-R*x);
    %computing error
    error=abs(max(x-x_new));
    if(error<tol)       
        break;
    end
    x=x_new;
end
    if(error>tol)
        flag=1;
    end
end

