%Example: Vibrating String.
A = rand(3);
correct_eigs = eig(A);
[~,correct_evec]=eig(A);
[calculated_eigs,calc_evec] = deflation(A,0.001);
err=sum(abs(correct_eigs-calculated_eigs));

%Calculating eigen values of the vibrating string
mu = 0.954;
T = 1000;
L = 1;
h = 0.01;
N = L/h;
tol = 0.001;

%generating matrix
A = zeros(N-1,N-1);
A(1,1)= -2*T/(mu*h*h);
A(1,2)= T/(mu*h*h);
A(N-1,N-1)= -2*T/(mu*h*h);
A(N-1,N-2)= T/(mu*h*h);
for i = 2:N-2
    A(i,i)= -2*T/(mu*h*h);
    A(i,i-1)= T/(mu*h*h);
    A(i,i+1)= T/(mu*h*h);
end

%Fundamental Frequency of the uniform string
[lambda,evec]=powermethod(inv(A), tol, 10000);
f_calc = sqrt(-1/lambda)/(2*pi)
f_expected = min(sqrt(-eig(A))/(2*pi))
theoreticfrequency = sqrt(T/mu)/(2*L)
plot(evec)
