clc;
close all;
n=-1:4;
x=[zeros(1,1),ones(1,5)];
stem(n,x);
title('step function');
xlabel('n');
ylabel('x(n)');