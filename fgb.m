
clc;
clear all;
close all;
t = 0:0.0005:10;
dc_ofst=2;
% Representation of the Message Signal
x = sin(t)+dc_ofst;
subplot(3,1,1);
plot(t,x,'black');
title('Message Signal');
xlabel('Time(s) ---->')
ylabel('Amplitude(V) ---->')
legend('Message Signal ---->');
grid on
L=8; %No of Quantization levels
smin=round(min(x));
smax=round(max(x));
Quant_levl=linspace(smin,smax,L);% Length 8, %Quantization step size will
TotalnoLevels=8;
be=(smax-smin)/TotalnoLevels;
codebook = linspace(0,smax,L+1); % Length 9, one entry for each interval
% Representation of the Quantized Signal
[index,quants] = quantiz(x,Quant_levl,codebook);
subplot(3,1,2);
plot(t,quants);
title('Quantized Signal');
xlabel('Samples ---->')
ylabel('Amplitude(V) ---->')
legend('Quantized Signal ---->');
grid on
% Representation of the PCM Signal

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Binarycoding%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:length(index)

bincode_sig{i}=dec2bin(round(index(i)),7);
end
disp('binary encoded signal')
disp(bincode_sig')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%
% SNR ratio calculation
noise=quants-x; % calculating noise
r=snr(index,noise);% SNR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%To Plot SNR Curve%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n=[3,4,5,6,7];
Le=2.^n;
re=[];
for i=1:length(Le)
Quant_levl=linspace(smin,smax,Le(i));
codebook = linspace(0,smax,Le(i)+1);
[index,quants] = quantiz(x,Quant_levl,codebook);
% SNR ratio calculation
noise=quants-x; % calculating noise
re=[re snr(index,noise)];
end
%Plotting of SNR Curve
subplot(3,1,3);
plot(Le,re,'r*-');
xlabel('Number of Quatization Levels')
ylabel('SNR')
title('SNR curve')
grid on