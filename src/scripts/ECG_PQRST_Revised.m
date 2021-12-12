clc
clear all
close all
%% what does this code do?
%This code takes an ecg signal filters it and gets the QRS complex
%locations. This uses thresholding and "findpeaks"

%Normal Paramters(in seconds) (approx) (can verify with code accordingly)

%QRS complex     0.06-0.1
%RR              0.6 - 1.2
%heart rate      60-100bpm (essential for sinus rythm)
%PR interval     0.12 - 0.2
%QT interval     less than 1/2 the RR interval

%RR, QT,QRS and PR intervals are found (mean)
%heart rate is computed

%in normal ECG signals, this code will give the correct peak locations and
%even handle cetain cases. However under extremely abnormal cases, wrong peaks get
%marked hence we can detect an abnormality since the intervals won't be in range.

%Compiled and Maintained by 
%Rohan Sanghavi
%% signal aquiring and preprocessing
try
    load('/media/davi/6A81-05CF/physionet.org/files/siena-scalp-eeg/1.0.0/PN00/PN00-5.mat');
    ecg1 = ecg_signal;
    
catch 
    error('File is not found');
end 
%fs = 256; %From database itself
ecg2 = ecg1%extractfield(ecg1,'val');
[ecg1,d]= lowpass(ecg2,9/(fs/2)); %filtering (keep same) vary with dataset
ecg_f = baseline_remove(ecg1);
ecg_f = ecg_f(350:3400);
ecg_f = ecg_f./max(ecg_f); %normalization (VVVimp)
num_filt = d.Coefficients;
%% extraction of R peaks for windowing purposes
[pks,locs_R] = findpeaks(ecg_f,'MinPeakHeight',0.4,'MinPeakDistance',90); %R peaks
mean_RR = mean(diff(locs_R))/fs; 
%% window extraction
if length(locs_R)<=6
    ecg_f = ecg_f.*1;
    ecg_inv = -1.*ecg_f;
else 
    Number = 5;%peaks to consider (KEEP SAME)  (keep standard) DO NOT CHANGE LEAVE CONSTANT (pls note)
    wl = (round(mean_RR*fs))*Number;

    idx = locs_R(round(length(locs_R)/2)) - round(wl/2); %this is done to ensure that the ecg signal
    %starts symetrically about the the R peak as often as possible
    %so at centre R peak, - 1/2 the window length so symmetry is
    %assured.(VVVVVIMP)

    ecg_f = ecg_f(bsxfun(@plus,idx,0:wl-1));  %extracted indexes
    ecg_inv = -ecg_f;

end 
%% thresholding and peak finding
[pks3,locs_R2] = findpeaks(ecg_f,'MinPeakHeight',0.4,'MinPeakDistance',90); %R peaks

[pks2,locs_S] =findpeaks(ecg_inv,'MinPeakHeight',0.4,'MinPeakDistance',160); %S peaks

[~,min_locs] = findpeaks(ecg_inv,'MinPeakDistance',19); %Q peaks
locs_Q = min_locs(ecg_inv(min_locs)>0.12 & ecg_inv(min_locs)<0.3); %threshold values keep same
%vary threshold with dataset/signal

[~,min_locs2] = findpeaks(ecg_f,'MinPeakDistance',22); 
locs_PT = min_locs2(ecg_f(min_locs2)>0.03 & ecg_f(min_locs2)<0.4); %threshold values keep same
%vary with dataset/signal

%% since windowing is done P and T locations can be determined
if(isempty(locs_PT) ==0)
    if (locs_PT(1) - locs_R2(1) <0  & locs_PT(2) - locs_R2(1) >0)
        locs_P = locs_PT(1:2:end);
        locs_T= locs_PT(2:2:end);
    
    elseif (locs_PT(1) -locs_R2(1) <0 & locs_PT(2) - locs_R2(1) <0)
  
        locs_P = locs_PT(2:2:end);
        locs_T= locs_PT(1:2:end);
    else 
    
        locs_P = locs_PT(2:2:end);
        locs_T= locs_PT(1:2:end);
    end 
else
    locs_P =[];
    locs_T =[];
end 
%% Eliminate noise / unwanted peak detection by using known parameters 
% We can never have a Q peak after a S peak.
%It covers most cases. In case of a severe issue, the wrong peaks will be
%detected and hence the mean time period will vary.
if length(locs_S)>=length(locs_Q)
    locs_S_check = locs_S(1:length(locs_Q));
    check = any(locs_Q>locs_S_check);
    if check ==1
        locs_to_remove = find((locs_Q>locs_S_check)>0);
        locs_Q([locs_to_remove]) =[];
    end 
end 
%% plots

%fvtool(d); %(If you want to see filter response)

figure(1);
hold on
plot(ecg_f,'linewidth',1.5);
plot(locs_R2,ecg_f(locs_R2),'rv','MarkerFaceColor','r');
plot(locs_Q,ecg_f(locs_Q),'rs','MarkerFaceColor','g');
plot(locs_S,ecg_f(locs_S),'o','MarkerFaceColor','y');
plot(locs_P,ecg_f(locs_P),'v','MarkerFaceColor','m');
plot(locs_T,ecg_f(locs_T),'s','MarkerFaceColor','k');
legend('ECG Signal','R peaks','Q Peaks','S Peaks','P peaks','T peaks');
hold off
title('QRS complex being marked on the fitered ECG signal along with the P and T peaks');
xlabel('Samples');
ylabel('Normalised Amplitude');


figure(2);
subplot(2,1,1);
[BW,Flo,Fhi] = obw(ecg2,fs);
obw(ecg2,fs);
subplot(2,1,2);
[BW2,Flo2,Fhi2] = obw(ecg_f,fs);
obw(ecg_f,fs);
%% time intervals
%the below code computes all relevant time differences 
% in case of any abnormility, length of the vector is adjusted to give a
% numerical answer
%we basically perform truncation.
%% RR period

RR_period = diff(locs_R2);
RR_mean = mean(RR_period)/fs; % we consider the unwindowed mean for accuracy
%% QRS complex period
QRS_period =[];

if length(locs_Q) > length(locs_S)
    locs_Q1 = locs_Q(1:length(locs_S));
    locs_S1 = locs_S;
    
else 
    locs_S1 = locs_S(1:length(locs_Q));
    locs_Q1 = locs_Q;
   
end 

for j = 1:max(length(locs_Q1),length(locs_S1))
    QRS_period(j) = (locs_S1(j) - locs_Q1(j));
end 

QRS_mean = mean(QRS_period)/fs;

if isnan(QRS_mean) ==1 
    QRS_mean = 0;
end 
%% PR interval
PR_interval =[];
temp =0;
if length(locs_R2) > length(locs_P)
    locs_R3 = locs_R2(1:length(locs_P));
    locs_P2 = locs_P;
    temp =1;
else 
    locs_P2 = locs_P(1:length(locs_R2));
    locs_R3 = locs_R2;
    temp =1;
end 


for k = 1 :max(length(locs_R3),length(locs_P2))
    PR_interval(k) = locs_R3(k) - locs_P(k);
    
end 
if temp ==0
    mean_PR = mean(PR_interval)/fs;
elseif temp ==1
    mean_PR = abs(mean(PR_interval))/fs;
end 

if isnan(mean_PR) == 1
    mean_PR = 0;
end 
%% QT interval
QT_interval = [];
if length(locs_Q) > length(locs_T)
    locs_Q2 = locs_Q(1:length(locs_T));
    locs_T2 = locs_T;
    flag =1;
    
else 
    locs_T2 = locs_T(1:length(locs_Q));
    locs_Q2 = locs_Q;
    flag =1;
end 


for k = 1 :max(length(locs_Q2),length(locs_T2))
    QT_interval(k) = locs_T2(k) - locs_Q2(k);
    
end 
if flag ==0 
    mean_QT = mean(QT_interval)/fs;
elseif flag == 1
    mean_QT = abs(mean(QT_interval))/fs;
end 

if isnan(mean_QT) ==1 
    mean_QT = 0;
end 
%% heart rate
%heart rate in bpm is computed using a single formula
bpm = round(60/mean_RR);