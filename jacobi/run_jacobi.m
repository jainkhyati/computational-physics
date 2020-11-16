%testing the method on randomly generated diagonally dominant matrix
N=50;
max_it=1000000;
tol=0.000001;
A=genDiagonallyDominant(N);
B=rand(N,1);
x = jacobi(A, B, max_it, tol);
x1=linsolve(A,B);
sum(abs(x-x1))

