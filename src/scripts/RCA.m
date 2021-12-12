%% UNIVERSIDADE FEDERAL DO MARANHÃO
%% MESTRADO DE ENGENHARIA DE ELETRICIDADE
%% JONATHAN ARAUJO QUEIROZ
%%        CoDIGO : ECG Segmentation
%%%%        DATA: 30/05/2018  
%%
%clear all
close all
clc
%%%%%%%%%%% Relevant Component Analysis %%%%%%%%%%%%%%%%%%

%%%%%%%%%%%% Normal
load('B.mat')
meann=mean(B);
stdn=std(B);
varn=var(B);  
skewnessn=skewness(B);
kurtosisn=kurtosis(B);
X_n=[kurtosisn;meann;skewnessn];
%X1_n=[wentropy(kurtosisn,'shannon');wentropy(varn,'shannon'); wentropy(meann,'shannon');wentropy(skewnessn,'shannon')];
T_n1=[(kurtosisn+wentropy(kurtosisn,'shannon'));varn+wentropy(varn,'shannon'); meann+wentropy(meann,'shannon'); skewnessn+wentropy(skewnessn,'shannon')];


%%%%%%%%%%%% AF
load('Baf.mat')
meanaf=mean(Baf);
stdaf=std(Baf);
varaf=var(Baf);
skewnessaf=skewness(Baf);
kurtosisaf=kurtosis(Baf);
X_af1=[kurtosisaf;meanaf;skewnessaf];
X1_af1=[wentropy(kurtosisaf,'shannon'); wentropy(varaf,'shannon'); wentropy(meanaf,'shannon');wentropy(skewnessaf,'shannon')];
T_af1=[(kurtosisaf+wentropy(kurtosisaf,'shannon')); varaf+wentropy(varaf,'shannon'); meanaf+wentropy(meanaf,'shannon');skewnessaf+wentropy(skewnessaf,'shannon')];

%%%%%%%%%% Arritmias
load('Ba.mat')
meana=mean(Ba);
stda=std(Ba);
vara=var(Ba);
skewnessa=skewness(Ba);
kurtosisa=kurtosis(Ba);
X_a1=[kurtosisa;meana;skewnessa];
X1_a1=[wentropy(kurtosisa,'shannon');wentropy(vara,'shannon');wentropy(meana,'shannon');wentropy(skewnessa,'shannon')];
T_a1=[(kurtosisa+wentropy(kurtosisa,'shannon'));vara+wentropy(vara,'shannon'); meana+wentropy(meana,'shannon');skewnessa+wentropy(skewnessa,'shannon')];

%%%%%%%%%% Apneia 
load('Bpa1.mat')
meanap1=mean(Bap1);
stdap1=std(Bap1);
varap1=var(Bap1);
skewnessap1=skewness(Bap1);
kurtosisap1=kurtosis(Bap1);
X_ap1=[kurtosisap1;meanap1;skewnessap1];
X1_ap1=[wentropy(kurtosisap1,'shannon');wentropy(varap1,'shannon');wentropy(meanap1,'shannon');wentropy(skewnessap1,'shannon')];
T_ap1=[(kurtosisap1+wentropy(kurtosisap1,'shannon'));varap1+wentropy(varap1,'shannon');meanap1+wentropy(meanap1,'shannon');skewnessap1+wentropy(skewnessap1,'shannon')];

%%%%%%%%%% Apneia 2
load('Bap2.mat')
meanap2=mean(Bap2);
stdap2=std(Bap2);
varap2=var(Bap2);
skewnessap2=skewness(Bap2);
kurtosisap2=kurtosis(Bap2);
X_ap12=[kurtosisap2;meanap2;skewnessap2];
X1_ap12=[wentropy(kurtosisap2,'shannon');wentropy(varap2,'shannon');wentropy(meanap2,'shannon');wentropy(skewnessap2,'shannon')];
T_ap12=[(kurtosisap2+wentropy(kurtosisap2,'shannon'));varap2+wentropy(varap2,'shannon');meanap2+wentropy(meanap2,'shannon');skewnessap2+wentropy(skewnessap2,'shannon')];

%%%%%%%%%% Apneia 3
load('Bap3.mat')
meanap3=mean(Bap3);
stdap3=std(Bap3);
varap3=var(Bap3);
skewnessap3=skewness(Bap3);
kurtosisap3=kurtosis(Bap3);
X_ap13=[kurtosisap3;meanap3;skewnessap3];
X1_ap13=[wentropy(kurtosisap3,'shannon');wentropy(varap3,'shannon');wentropy(meanap3,'shannon');wentropy(skewnessap3,'shannon')];
T_ap13=[(kurtosisap3+wentropy(kurtosisap3,'shannon'));varap3+wentropy(varap3,'shannon');meanap3+wentropy(meanap3,'shannon');skewnessap3+wentropy(skewnessap3,'shannon')];


%%%%%%%%%% Supraventricular Arrhythmia
load('Bsa.mat')
meansa=mean(Bsa);
stdsa=std(Bsa);
varsa=var(Bsa);
skewnesssa=skewness(Bsa);
kurtosissa=kurtosis(Bsa);
X_sa=[kurtosissa;meansa;skewnesssa];
X1_sa=[wentropy(kurtosissa,'shannon');wentropy(varsa,'shannon');wentropy(meansa,'shannon');wentropy(skewnesssa,'shannon')];
T_sa=[(kurtosissa+wentropy(kurtosissa,'shannon'));varsa+wentropy(varsa,'shannon');meansa+wentropy(meansa,'shannon');skewnesssa+wentropy(skewnesssa,'shannon')];


%%%%%%%%%% Morte Cardíaca
load('Bmc.mat')
meanmc=mean(Bmc);
stdmc=std(Bmc);
varmc=var(Bmc);
skewnessmc=skewness(Bmc);
kurtosismc=kurtosis(Bmc);
X_mc=[kurtosismc;meanmc;skewnessmc];
X1_mc=[wentropy(kurtosismc,'shannon');wentropy(varmc,'shannon');wentropy(meanmc,'shannon');wentropy(skewnessmc,'shannon')];
T_mc=[(kurtosismc+wentropy(kurtosismc,'shannon'));varmc+wentropy(varmc,'shannon');meanmc+wentropy(meanmc,'shannon');skewnessmc+wentropy(skewnessmc,'shannon')];



%%%%%%%%%% Insuficiência cardíaca congestiva
load('Bicc.mat')
meanicc=mean(Bicc);
stdicc=std(Bicc);
varicc=var(Bicc);
skewnessicc=skewness(Bicc);
kurtosisicc=kurtosis(Bicc);
X_icc=[kurtosisicc;meanicc;skewnessicc];
X1_icc=[wentropy(kurtosisicc,'shannon');wentropy(varicc,'shannon');wentropy(meanicc,'shannon');wentropy(skewnessicc,'shannon')];
T_icc=[(kurtosisicc+wentropy(kurtosisicc,'shannon'));varicc+wentropy(varicc,'shannon');meanicc+wentropy(meanicc,'shannon');skewnessicc+wentropy(skewnessicc,'shannon')];




%%%%%%%%%% Epilepsy Post-Ictal
load('Bep.mat')
meanep=mean(Bep);
stdep=std(Bep);
varep=var(Bep);
skewnessep=skewness(Bep);
kurtosisep=kurtosis(Bep);
X_ep=[kurtosisep;meanep;skewnessep];
X1_ep=[wentropy(kurtosisep,'shannon');wentropy(varep,'shannon');wentropy(meanep,'shannon');wentropy(skewnessep,'shannon')];
T_ep=[(kurtosisep+wentropy(kurtosisep,'shannon'));varep+wentropy(varep,'shannon');meanep+wentropy(meanep,'shannon');skewnessep+wentropy(skewnessep,'shannon')];



%%%%%%%%%% Abdominal and Direct Fetal
load('Badf.mat')
meanadf=mean(Badf);
stdadf=std(Badf);
varadf=var(Badf);
skewnessadf=skewness(Badf);
kurtosisadf=kurtosis(Badf);
X_adf=[kurtosisadf;meanadf;skewnessadf];
X1_adf=[wentropy(kurtosisadf,'shannon');wentropy(varadf,'shannon');wentropy(meanadf,'shannon');wentropy(skewnessadf,'shannon')];
T_adf=[(kurtosisadf+wentropy(kurtosisadf,'shannon'));varadf+wentropy(varadf,'shannon');meanadf+wentropy(meanadf,'shannon');skewnessadf+wentropy(skewnessadf,'shannon')];



figure
subplot(1,4,1)

plot(T_n1(3,:), 'y*', 'linewidth',2)
hold on
plot(T_af1(3,:), 'm*', 'linewidth',2)
plot(T_a1(3,:), 'c*', 'linewidth',2)
plot(T_ap1(3,:), 'r*', 'linewidth',2)
plot(T_ap12(3,:), 'g*', 'linewidth',2)
plot(T_ap13(3,:), 'b*', 'linewidth',2)
plot(T_sa(3,:), 'k*', 'linewidth',2)
plot(T_mc(3,:), 'y+', 'linewidth',2)
plot(T_icc(3,:), 'm+', 'linewidth',2)
plot(T_ep(3,:), 'c+', 'linewidth',2)
plot(T_adf(3,:), 'r+', 'linewidth',2)
xlabel('Average+Entropy');

subplot(1,4,2)
plot(T_n1(2,:), 'y*', 'linewidth',2)
hold on
plot(T_af1(2,:), 'm*', 'linewidth',2)
plot(T_a1(2,:), 'c*', 'linewidth',2)
plot(T_ap1(2,:), 'r*', 'linewidth',2)
plot(T_ap12(2,:), 'g*', 'linewidth',2)
plot(T_ap13(2,:), 'b*', 'linewidth',2)
plot(T_sa(2,:), 'k*', 'linewidth',2)
plot(T_mc(2,:), 'y+', 'linewidth',2)
plot(T_icc(2,:), 'm+', 'linewidth',2)
plot(T_ep(2,:), 'c+', 'linewidth',2)
plot(T_adf(2,:), 'r+', 'linewidth',2)
xlabel('Variance+Entropy') ;


subplot(1,4,3)
plot(T_n1(4,:), 'y*', 'linewidth',2)
hold on
plot(T_af1(4,:), 'm*', 'linewidth',2)
plot(T_a1(4,:), 'c*', 'linewidth',2)
plot(T_ap1(4,:), 'r*', 'linewidth',2)
plot(T_ap12(4,:), 'g*', 'linewidth',2)
plot(T_ap13(4,:), 'b*', 'linewidth',2)
plot(T_sa(4,:), 'k*', 'linewidth',2)
plot(T_mc(4,:), 'y+', 'linewidth',2)
plot(T_icc(4,:), 'm+', 'linewidth',2)
plot(T_ep(4,:), 'c+', 'linewidth',2)
plot(T_adf(4,:), 'r+', 'linewidth',2)
xlabel('Skewness+Entropy');


subplot(1,4,4)
plot(T_n1(1,:), 'y*', 'linewidth',2)
hold on
plot(T_af1(1,:), 'm*', 'linewidth',2)
plot(T_a1(1,:), 'c*', 'linewidth',2)
plot(T_ap1(1,:), 'r*', 'linewidth',2)
plot(T_ap12(1,:), 'g*', 'linewidth',2)
plot(T_ap13(1,:), 'b*', 'linewidth',2)
plot(T_sa(1,:), 'k*', 'linewidth',2)
plot(T_mc(1,:), 'y+', 'linewidth',2)
plot(T_icc(1,:), 'm+', 'linewidth',2)
plot(T_ep(1,:), 'c+', 'linewidth',2)
plot(T_adf(1,:), 'r+', 'linewidth',2)
xlabel('Kurtosis+Entropy');



% % figure
% % subplot(2,2,1)
% % plot3(T_n1(1,:),T_n1(2,:),T_n1(3,:), 'y*', 'linewidth',2)
% % hold on
% % plot3(T_af1(1,:),T_af1(2,:),T_af1(3,:), 'm*', 'linewidth',2)
% % plot3(T_a1(1,:),T_a1(2,:),T_a1(3,:), 'c*', 'linewidth',2)
% % plot3(T_ap1(1,:),T_ap1(2,:),T_ap1(3,:), 'r*', 'linewidth',2)
% % plot3(T_ap12(1,:),T_ap12(2,:),T_ap12(3,:), 'g*', 'linewidth',2)
% % plot3(T_ap13(1,:),T_ap13(2,:),T_ap13(3,:), 'b*', 'linewidth',2)
% % plot3(T_sa(1,:),T_sa(2,:),T_sa(3,:), 'k*', 'linewidth',2)
% % plot3(T_mc(1,:),T_mc(2,:),T_mc(3,:), 'y+', 'linewidth',2)
% % plot3(T_icc(1,:),T_icc(2,:),T_icc(3,:), 'm+', 'linewidth',2)
% % plot3(T_ep(1,:),T_ep(2,:),T_ep(3,:), 'c+', 'linewidth',2)
% % plot3(T_adf(1,:),T_adf(2,:),T_adf(3,:), 'r+', 'linewidth',2)
% % xlabel({'Kurtosis+Entropy'});
% % ylabel('Variance+Entropy') ;
% % zlabel('Skewness+Entropy');
% % legend('Healthy','Atrial Fibrillation','Arrhythmia','Apneia1','Apneia2','Apneia3','Supraventricular Arrhythmia','Heart deatha','Congestive heart failure','Epilepsy Post-Ictal','Abdominal and Direct Fetal')
% % 
% % 
% % 
% % subplot(2,2,3)
% % plot3(T_n1(1,:),T_n1(2,:),T_n1(3,:), 'y*', 'linewidth',2)
% % hold on
% % plot3(T_af1(1,:),T_af1(2,:),T_af1(3,:), 'm*', 'linewidth',2)
% % plot3(T_a1(1,:),T_a1(2,:),T_a1(3,:), 'c*', 'linewidth',2)
% % plot3(T_ap1(1,:),T_ap1(2,:),T_ap1(3,:), 'r*', 'linewidth',2)
% % plot3(T_ap12(1,:),T_ap12(2,:),T_ap12(3,:), 'g*', 'linewidth',2)
% % plot3(T_ap13(1,:),T_ap13(2,:),T_ap13(3,:), 'b*', 'linewidth',2)
% % plot3(T_sa(1,:),T_sa(2,:),T_sa(3,:), 'k*', 'linewidth',2)
% % xlabel({'Kurtosis+Entropy'});
% % ylabel('Variance+Entropy') ;
% % zlabel('Skewness+Entropy');
% % legend('Healthy','AF','Arrhythmia','Apneia1','Apneia2','Apneia3','Supraventricular Arrhythmia')
% % 
% % subplot(2,2,4)
% % plot3(T_mc(1,:),T_mc(2,:),T_mc(3,:), 'y*', 'linewidth',2)
% % hold on
% % plot3(T_icc(1,:),T_icc(2,:),T_icc(3,:), 'm+', 'linewidth',2)
% % plot3(T_ep(1,:),T_ep(2,:),T_ep(3,:), 'c+', 'linewidth',2)
% % plot3(T_adf(1,:),T_adf(2,:),T_adf(3,:), 'r+', 'linewidth',2)
% % xlabel({'Kurtosis+Entropy'});
% % ylabel('Variance+Entropy') ;
% % zlabel('Skewness+Entropy');
% % legend('Morte Cardiaca','Insuficiencia cardiaca congestiva','Epilepsy Post-Ictal','Abdominal and Direct Fetal')
% % title('593647 Heartbeats')
% % %
% % 
% % subplot(1,2,1)
% % plot3(X_n(1,:),X_n(2,:),X_n(3,:), 'y*', 'linewidth',2)
% % hold on
% % plot3(X_af1(1,:),X_af1(2,:),X_af1(3,:), 'm*', 'linewidth',2)
% % plot3(X_a1(1,:),X_a1(2,:),X_a1(3,:), 'c*', 'linewidth',2)
% % plot3(X_ap1(1,:),X_ap1(2,:),X_ap1(3,:), 'r*', 'linewidth',2)
% % plot3(X_ap12(1,:),X_ap12(2,:),X_ap12(3,:), 'g*', 'linewidth',2)
% % plot3(X_ap13(1,:),X_ap13(2,:),X_ap13(3,:), 'b*', 'linewidth',2)
% % plot3(X_sa(1,:),X_sa(2,:),X_sa(3,:), 'k*', 'linewidth',2)
% % plot3(X_mc(1,:),X_mc(2,:),X_mc(3,:), 'y+', 'linewidth',2)
% % plot3(X_icc(1,:),X_icc(2,:),X_icc(3,:), 'm+', 'linewidth',2)
% % plot3(X_ep(1,:),X_ep(2,:),X_ep(3,:), 'c+', 'linewidth',2)
% % plot3(X_adf(1,:),X_adf(2,:),X_adf(3,:), 'r+', 'linewidth',2)
% % xlabel({'Kurtosis'});
% % ylabel('Variance') ;
% % zlabel('Skewness');
% % legend('Healthy','Atrial Fibrillation','Arrhythmia','Apneia1','Apneia2','Apneia3','Supraventricular Arrhythmia','Heart deatha','Congestive heart failure','Epilepsy Post-Ictal','Abdominal and Direct Fetal')
% % 
% % subplot(1,2,2)
% % plot3(X1_n(1,:),X1_n(2,:),X1_n(3,:), 'y*', 'linewidth',2)
% % hold on
% % plot3(X1_af1(1,:),X1_af1(2,:),X1_af1(3,:), 'm*', 'linewidth',2)
% % plot3(X1_a1(1,:),X1_a1(2,:),X1_a1(3,:), 'c*', 'linewidth',2)
% % plot3(X1_ap1(1,:),X1_ap1(2,:),X1_ap1(3,:), 'r*', 'linewidth',2)
% % plot3(X1_ap12(1,:),X1_ap12(2,:),X1_ap12(3,:), 'g*', 'linewidth',2)
% % plot3(X1_ap13(1,:),X1_ap13(2,:),X1_ap13(3,:), 'b*', 'linewidth',2)
% % plot3(X1_sa(1,:),X1_sa(2,:),X1_sa(3,:), 'k*', 'linewidth',2)
% % plot3(X1_mc(1,:),X1_mc(2,:),X1_mc(3,:), 'y+', 'linewidth',2)
% % plot3(X1_icc(1,:),X1_icc(2,:),X1_icc(3,:), 'm+', 'linewidth',2)
% % plot3(X1_ep(1,:),X1_ep(2,:),X1_ep(3,:), 'c+', 'linewidth',2)
% % plot3(X1_adf(1,:),X1_adf(2,:),X1_adf(3,:), 'r+', 'linewidth',2)
% % xlabel({'Kurtosis+Entropy'});
% % ylabel('Variance+Entropy') ;
% % zlabel('Skewness+Entropy');
% % legend('Healthy','Atrial Fibrillation','Arrhythmia','Apneia1','Apneia2','Apneia3','Supraventricular Arrhythmia','Heart deatha','Congestive heart failure','Epilepsy Post-Ictal','Abdominal and Direct Fetal')
% % 
% % 
% % % 
%  figure
%  plot(B(:,1:50000));
%  xlabel('a)');
% figure
% plot(Ba(:,1:25000));
% xlabel('b)');
% figure
% plot(Badf);
% xlabel('c)');
% figure
% plot(Baf(:,1:25000));
% xlabel('d)');
% figure
% plot(Bap1(:,1:25000));
% xlabel('e)');
% 
% figure
% plot(Bap2);
% xlabel('f)');
% figure
% plot(Bap3);
% xlabel('g)');
% figure
% plot(Bep);
% xlabel('h)');
% figure
% plot(Bicc);
% xlabel('i)');
% figure
% plot(Bmc);
% xlabel('j)');
% figure
% plot(Bsa);
% xlabel('k)');

%%
figure
plot3(X1_n(1,:),X1_n(2,:),X1_n(3,:), 'y*', 'linewidth',2)
hold on
plot3(X1_af1(1,:),X1_af1(2,:),X1_af1(3,:), 'm*', 'linewidth',2)
plot3(X1_a1(1,:),X1_a1(2,:),X1_a1(3,:), 'c*', 'linewidth',2)
plot3(X1_ap1(1,:),X1_ap1(2,:),X1_ap1(3,:), 'r*', 'linewidth',2)
plot3(X1_ap12(1,:),X1_ap12(2,:),X1_ap12(3,:), 'g*', 'linewidth',2)
plot3(X1_ap13(1,:),X1_ap13(2,:),X1_ap13(3,:), 'b*', 'linewidth',2)
plot3(X1_sa(1,:),X1_sa(2,:),X1_sa(3,:), 'k*', 'linewidth',2)
plot3(X1_mc(1,:),X1_mc(2,:),X1_mc(3,:), 'y+', 'linewidth',2)
plot3(X1_icc(1,:),X1_icc(2,:),X1_icc(3,:), 'm+', 'linewidth',2)
plot3(X1_ep(1,:),X1_ep(2,:),X1_ep(3,:), 'c+', 'linewidth',2)
plot3(X1_adf(1,:),X1_adf(2,:),X1_adf(3,:), 'r+', 'linewidth',2)
xlabel({'Kurtosis'});
ylabel('Variance') ;
zlabel('Skewness');
legend('Healthy','Atrial Fibrillation','Arrhythmia','Apneia1','Apneia2','Apneia3','Supraventricular Arrhythmia','Heart deatha','Congestive heart failure','Epilepsy Post-Ictal','Abdominal and Direct Fetal')


%%
figure
plot3(T_n1(1,:),T_n1(2,:),T_n1(3,:), 'y*', 'linewidth',2)
hold on
plot3(T_af1(1,:),T_af1(2,:),T_af1(3,:), 'm*', 'linewidth',2)
plot3(T_a1(1,:),T_a1(2,:),T_a1(3,:), 'c*', 'linewidth',2)
plot3(T_ap1(1,:),T_ap1(2,:),T_ap1(3,:), 'r*', 'linewidth',2)
plot3(T_ap12(1,:),T_ap12(2,:),T_ap12(3,:), 'g*', 'linewidth',2)
plot3(T_ap13(1,:),T_ap13(2,:),T_ap13(3,:), 'b*', 'linewidth',2)
plot3(T_sa(1,:),T_sa(2,:),T_sa(3,:), 'k*', 'linewidth',2)
plot3(T_mc(1,:),T_mc(2,:),T_mc(3,:), 'y+', 'linewidth',2)
plot3(T_icc(1,:),T_icc(2,:),T_icc(3,:), 'm+', 'linewidth',2)
plot3(T_ep(1,:),T_ep(2,:),T_ep(3,:), 'c+', 'linewidth',2)
plot3(T_adf(1,:),T_adf(2,:),T_adf(3,:), 'r+', 'linewidth',2)
xlabel({'Kurtosis of the cardiac cycles +','Entropy of the kurtosis of the cardiac cycles'});
ylabel({'Variance of the cardiac cycles +','Entropy of the variance of the cardiac cycles'}) ;
zlabel({'Skewness of the cardiac cycles +','Entropy of the skewness of the cardiac cycles'});
legend('Healthy','Atrial Fibrillation','Arrhythmia','Apneia1','Apneia2','Apneia3','Supraventricular Arrhythmia','Heart deatha','Congestive heart failure','Epilepsy Post-Ictal','Abdominal and Direct Fetal')

%%

%%%%%%
box1=[X1_n(1,:) X1_n(2,:) X1_n(3,:)];
box2=[X1_af1(1,:) X1_af1(2,:) X1_af1(3,:)];

boxplot([X1_adf';X1_af1';X1_ap12';X1_ap13'])


figure
subplot(3,1,1)
boxplot([X_adf(1,1:84);X_af1(1,1:84);X_ap1(1,1:84);X_ap12(1,1:84);X_ap13(1,1:84);X_a1(1,1:84);X_ep(1,1:84);X_icc(1,1:84);X_mc(1,1:84);X_n(1,1:84);X_sa(1,1:84)]')

subplot(3,1,2)
boxplot([X_adf(2,1:84);X_af1(2,1:84);X_ap1(2,1:84);X_ap12(2,1:84);X_ap13(2,1:84);X_a1(2,1:84);X_ep(2,1:84);X_icc(2,1:84);X_mc(2,1:84);X_n(2,1:84);X_sa(2,1:84)]')

subplot(3,1,3)
boxplot([X_adf(3,1:84);X_af1(3,1:84);X_ap1(3,1:84);X_ap12(3,1:84);X_ap13(3,1:84);X_a1(3,1:84);X_ep(3,1:84);X_icc(3,1:84);X_mc(3,1:84);X_n(3,1:84);X_sa(3,1:84)]')

figure
plot3(X1_n(1,:),X1_n(2,:),X1_n(3,:), 'y*', 'linewidth',2)
hold on
boxplot(X1_af1(1,:),X1_af1(2,:),X1_af1(3,:), 'm*', 'linewidth',2)
boxplot(X1_a1(1,:),X1_a1(2,:),X1_a1(3,:), 'c*', 'linewidth',2)
boxplot(X1_ap1(1,:),X1_ap1(2,:),X1_ap1(3,:), 'r*', 'linewidth',2)
boxplot(X1_ap12(1,:),X1_ap12(2,:),X1_ap12(3,:), 'g*', 'linewidth',2)
boxplot(X1_ap13(1,:),X1_ap13(2,:),X1_ap13(3,:), 'b*', 'linewidth',2)
boxplot(X1_sa(1,:),X1_sa(2,:),X1_sa(3,:), 'k*', 'linewidth',2)
plot3(X1_mc(1,:),X1_mc(2,:),X1_mc(3,:), 'y+', 'linewidth',2)
plot3(X1_icc(1,:),X1_icc(2,:),X1_icc(3,:), 'm+', 'linewidth',2)
plot3(X1_ep(1,:),X1_ep(2,:),X1_ep(3,:), 'c+', 'linewidth',2)
plot3(X1_adf(1,:),X1_adf(2,:),X1_adf(3,:), 'r+', 'linewidth',2)
xlabel({'Kurtosis'});
ylabel('Variance') ;
zlabel('Skewness');
legend('Healthy','Atrial Fibrillation','Arrhythmia','Apneia1','Apneia2','Apneia3','Supraventricular Arrhythmia','Heart deatha','Congestive heart failure','Epilepsy Post-Ictal','Abdominal and Direct Fetal')
