%% Carregamento de edf e Sinal de ECG

function [ecg, fs] = get_ecg(file)
% file = 'chb04_28.edf';

[hdr, record]  = edfread(file);

% Freq amostral
fs = hdr.frequency(1);

% Channels
labels = hdr.label;

ecg_idx = find(contains(labels, 'ECG'));
 
ecg = record(ecg_idx,:);

name_file = strrep(file,'edf','mat');

save(name_file, 'ecg', 'fs');


