%{
Source Coding - Huffman Code
1. Generate Huffman code for the source with symbol probabilities
{1/2, 1/3, 1/6}.
2. Find the entropy, average codeword length and efficiency of the
code.
3. Create the second order extended source by taking probabilities
of 9 symbols in the extended source as the product of every
possible combinations of two symbols from the original source.
4. Generate Huffman code for the extended source symbols and
find the entropy, average codeword length and efficiency of the
code.
5. Compare the two efficiencies and appreciate the Shannon’s
source coding theorem. .
%}

clc;
clear all;
close all;
symbols = [1 2 3];
prob = [1/2 1/3 1/6];
[dict,avrlen] = huffmandict(symbols, prob);
avrlengst=num2str(avrlen);
disp('The Huffman code dictionary =>');
disp(dict);
H=0;
for i= symbols
    H=H+(prob(i)*log2(1/prob(i)));
end
entropy=num2str(H);
disp(strcat('The average length of the code  = ',avrlengst));
disp(strcat('Entropy of the code =',entropy));
e=(H/avrlen)*100;
efficieny=num2str(e);
disp(strcat('The efficieny of the code = ', efficieny))

%{ 
Code for second order extended source by taking probabilities of 9
 symbols in the extended source as the product of every possible 
combinations of two symbols from the original source
%}

a = [1/2 1/2 1/2 1/3 1/3 1/3 1/6 1/6 1/6];
c = [1/2 1/3 1/6 1/2 1/3 1/6 1/2 1/3 1/6 ];
symp = [1 2 3 4 5 6 7 8 9];
prob2=a.*c;
disp('Probabilities of second order extended DMS =>')
disp(prob2);
[dict2,avrlen2] = huffmandict(symp,prob2);
avrlengstx=num2str(avrlen2);

disp('The Huffman code dictionary of extended DMS =>');
disp(dict2);
H2=0;
for j= symp
    H2=H2+(prob2(j)*log2(1/prob2(j)));
end
entropy2=num2str(H2);
disp(strcat('The average length of the extended huffman code  = ',avrlengstx));
disp(strcat('Entropy of the extended huffman code =',entropy2));
e2=(H2/avrlen2)*100;
efficieny=num2str(e2);
disp(strcat('The efficieny of the extended huffman code = ', efficieny))

%{
By Shanonons theorem length of the code must be greaterthan or equal to
entropy of the code
%}
if avrlen>=H
    disp('Average length of the code is greater than its entropy');
else
    disp('null');
end
if avrlen2>=H2
    disp('Average length of the extended huffman code is greater than its entropy');
else
    disp('null');
end
disp('Therefore it satisfies the Shannon’source coding theorem');


