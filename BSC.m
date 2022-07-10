
%{
Binary Symmetric Channel
1. Create a 2 x 2 matrix, P(Y/X) for binary symmetric channel with
channel transition probability, p < 0.5.
2. Let the input symbol probabilities corresponding to symbol 0 and
1 be ? and (1 - ?) respectively. For different values of ? ranging
from 0 to 1, find the joint probability matrix, P(X,Y) and output
probability, P(Y)
3. Find mutual information, I(X; Y) = H(Y) – H(Y/X) for each
value of ?. Plot the I(X; Y) versus ? graph and observe the channel
capacity.
%}


clc;
clear all;
close all;
p12=1/4; %cross over probability<0.5
disp('probalitiy transiton matrix =')
pybyx =[ 1-p12 p12; p12 1-p12]; %probalitiy transiton matrix
disp(pybyx) 

%{
For different values of ? ranging
from 0 to 1, finding the joint probability matrix, P(X,Y) and output
probability, P(Y)
%}




for p=0:0.5:1;
pbar=1-p;
pxy1=[pbar/2 p/2; p/2 pbar/2];
py=pbar/2 + p/2;
disp('when probability =')
disp(p)
disp('P(X,Y) =')
disp(pxy1);
disp('p(y)=')
disp(py);
end

%Plot and Evaluate the MUTUAL INFORMATION as a function of probability of transition error.

%Probability of symbol 0
p0=0.4;
%Probability of symbol 1
p1=1-p0;
p=0.01:0.01:0.09; %Range of error probability
pn=1-p; %No error probability
for i=1:9
%2.
%Evaluation of Joint Probability P(x,y) x,y={0,1}
Px0y0(i)=(1-p(i)).*p0; %P(x=0,y=0)=P(y=0|x=0)*p(x=0) %pn=1-p;
Px0y1(i)=p0.*p(i); %P(x=0,y=1)=P(y=1|x=0)*p(x=0)
Px1y0(i)=p1.*p(i); %P(x=1,y=0)=P(y=0|x=1)*p(x=1)
Px1y1(i)=p1.*(1-p(i)); %P(x=1,y=1)=P(y=1|x=1)*p(x=1)

%3.
%Calculation of Output Symbol Probabilities P(y=0) and P(y=1)
%P(y=0)= P(y=0|x=0)*P(x=0) + P(y=0|x=1)*P(x=1)
Py0(i)=(pn(i)).*p0+p(i).*p1;
Py1(i)=(pn(i)).*p1+p(i).*p0;
%4.
%Conditional Probabilities
%P(x|y) , x,y={0,1}
%Symbol used=Px_y
Px0_y0(i)=Px0y0(i)./Py0(i);
Px0_y1(i)=Px0y1(i)./Py1(i);
Px1_y0(i)=Px1y0(i)./Py0(i);
Px1_y1(i)=Px1y1(i)./Py1(i);
%Let
A(i)=Px0_y0(i);
B(i)=Px0_y1(i);
C(i)=Px1_y0(i);
D(i)=Px1_y1(i);
%5.
%Conditional Entropy of Binary Symmetric Channel
Hx_y(i)=-p0.*(1-p(i)).*log2(A(i))-p0.*p(i).*log2(B(i))-p1.*p(i).*log2(C(i))-p1.*(1-p(i)).*log2(D(i));
%6.
%Entropy of Binary Symmetric Channel
Hx(i)=-p0.*log2(p0)-(1-p0).*log2(1-p0);
%7.
%Estimation of Mutual Information
I(i)=Hx(i)-Hx_y(i);
end
plot(p,I)
xlabel('Transition Error Probability');
ylabel('Mutual Information');
title('Mutual Information against Transition Error Probability');
grid;


