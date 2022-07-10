clc;
close all;
n=-2:2;
x=[zeros(1,2), ones(1,1),zeros(1,2)];
stem(n,x);
title('Impusle function');
xlabel('n');
ylabel('x(n)');
