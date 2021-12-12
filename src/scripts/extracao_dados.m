clc;
clear variables;

path = '/media/davi/6A81-05CF/physionet.org/files/siena-scalp-eeg/';

files = strsplit(fileread(strcat(path,'all_files.txt')));

pattern = 'PN01';

current_files = find(contains(files,pattern));


for i=1:length(current_files)
    path_file = strcat(path,files{current_files(i)});
    
    disp(path_file);
    
    [hdr, record] = edfread(path_file);
    
    fs = unique(hdr.frequency);
    
    ch_ecg = find(contains(hdr.label, 'EKG'));
    
    ecg_signal = record(ch_ecg,:);
    
    [B,P,QRS,T] = ECGsegmentationF(ecg_signal,fs);
    
    name_file = strrep(path_file, '.edf', '.mat');
    
    save(name_file, 'fs', 'ecg_signal', 'B','P','QRS','T');
    
    vars = {'hdr', 'record', 'fs', 'ch_ecg', 'ecg_signal', 'B','P','QRS','T'};
    clear(vars{:});

end






