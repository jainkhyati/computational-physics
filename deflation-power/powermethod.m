function [lambda,eigenvector]=powermethod(A, tol, n)
%This function finds the largest eigen vector of the given matrix A
%Largest is picked only in terms of magnitude
%X is the randomly generated vector
%n is the number of iterations the program is to be run forat max.
    sz=size(A,2);
    xold=rand(sz,1);
    xnew=xold;
    error=1000;%%to be able to enter the loop

  while(error>tol)
      xold=xnew;%
      xnew=A*xnew;
      xnew=xnew/norm(xnew);%ax normaliseda%2x
      lambda0=(xold'*A*xold)/(xold'*xold);
      lambda1=(xnew'*A*xnew)/(xnew'*xnew);
      error=abs(lambda0-lambda1);
      n=n-1;
      if(n==0)
        break;
      end

  end
  lambda1=mean((A*xnew)./xnew);
 lambda=(xnew'*A*xnew)/(xnew'*xnew);%lambda expected:  <x|A|x>/<x|x>
 eigenvector=xnew;
end
