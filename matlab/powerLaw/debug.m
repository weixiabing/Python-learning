% 28th Nov 2018: for imperfect CSI
%
%SINR=(alpha*K_n.*beta*Eu)/(sigma2*(K_n+1)) 19 Jan 2019
%sum(SINR)
clc
clear
rng('shuffle');

iter=500;
K=30;
Mmax=800;
Mmin=100;
tau_ul=1;
tau=K*tau_ul;
Group=10;% G stands for the number of groups;
%K/Group=number of UEs in the Group,i.e.,Group=1 for ZF; Group=K for SIC
Kn_dB = 0; %in dB
Kn = 10^(Kn_dB/10);
B = 20e6; %Transmission bandwidth (Hz)
%sigma2B = 10^(-9.6-3); %Total noise power (B*sigma2 in W)
%sigma2=sigma2B/B;
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Pu=0.1;
%Noise figure at the BS (in dB)
noiseFigure = 7;
%Compute noise power
noiseVariancedBm = -174 + 10*log10(B) + noiseFigure; %-94dbm
sigma2=db2pow(noiseVariancedBm-30); %W noise power
Eu=db2pow(-10-30);%try 6 or 10 dbm; 10.^(PuDb./10).*sigma2;%in watt  ;%0.5;%10^(40/10)*sigma2; % 20 db
%large-scale fading
channelGaindB=zeros(K,1);
channelGainShadowingdB=zeros(K,1);
ricianFactor=zeros(K,1);
%The maximum distance for LoS
%Standard deviation of shadow fading in dB
%sigma_sf_NLOS=10; %for NLOS
sigma_sf_LOS=4;   %for LOS
%
Rmax = 250;%1000; %Cell radius for a circular cell in the single-cell scenario. It is also the distance from BS to a side of the square cells in the multi-cell scenario
Rmin = 35;%100; %Minimum distance between UE and BS
userDistances = sqrt( rand(K,1)*(Rmax^2-Rmin^2)+ Rmin^2 );
%%%%%% large scale fading %%%%%%
%Compute average channel gain using the large-scale fading
%model based on 3GPP model while neglecting the shadow fading for each UE
for k = 1:K
    channelGaindB(k)= -30.18-26*log10(userDistances(k));%LoS in dB
end
% shadowing effect
for k = 1:K
    shadowing = sigma_sf_LOS*randn(1);
    channelGainShadowingdB(k) = channelGaindB(k) + shadowing;
end

beta=db2pow(channelGainShadowingdB);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

M=Mmin:50:Mmax;
%ADCbit=1:5;
lengthM=length(M);
ADCbit=[3 6 12];
lengthADCbit=length(ADCbit);

ZFtemp=zeros(iter,lengthM,lengthADCbit);
GZFtemp=zeros(iter,lengthM,lengthADCbit);

perGZFtemp=zeros(iter,lengthM,lengthADCbit);

Gsicrateapptemp= zeros(iter,lengthM,lengthADCbit);
ZFSEapptemp    = zeros(iter,lengthM,lengthADCbit);
perGsicrateapptemp= zeros(iter,lengthM,lengthADCbit);
%Rician Fading assume Kn for all user are same

Omega=Kn.*eye(K);
Losbar=( Omega * inv( Omega + eye(K) ) ).^(0.5);
Losw=( inv( Omega+eye(K) ) ).^(0.5);

counter=0;
for mi=M
    disp(['Current M: ' num2str(mi)]);
    counter=counter+1;
    counter1=0;
    Pu= Eu/mi;
    for b =ADCbit
        counter1=counter1+1;
        %     b=3;
        
        if b ==1
            rho=0.3634;
        elseif b==2
            rho=0.1175;
        elseif b==3
            rho=0.03454;
        elseif b==4
            rho=0.009497;
        elseif b == 5
            rho=0.002499;
        else
            rho=((pi*sqrt(3))/2)*(2^(-2*b));% used for the following calculation of alpha
        end
        alpha= 1- rho;
        
        ZFrateiter=zeros(iter,K);
        ZFrateapp=zeros(iter,K);
        GZFrateiter=zeros(iter,K);
        Gsicrateapp=zeros(iter,K);
        perGZFrateiter=zeros(iter,K);
        perGsicrateapp=zeros(iter,K);
        
        
        for ii=1:iter
            
            
            LOSa = -90;
            LOSb = 90;
            LOStheta = (LOSb-LOSa).*rand(K,1) + LOSa;% generate degree from -90 to 90
            theta=deg2rad(LOStheta);%degree to radian
            lemdaLos=(3*10^8)/(900*10^6);
            d=lemdaLos/2;
            
            %beta = 10^(-4)*[13.13;6.49;11.01;4.87;29.00;8.69;50.02;96.00;1.24;41.04];% from Zhangjiayi code.
            BETA=diag(beta);
            
            Hbar=zeros(mi,K);%LoS part
            for m=1:mi
                for k=1:K
                    Hbar(m,k) = exp(-1i*(m-1)*((2*pi*d)/lemdaLos)*sin(theta(k)));
                end
            end
            
            Hw = (randn(mi,K)+1i*randn(mi,K))/sqrt(2);% Fast fading following rayleigh distribution%%%%%%%%%
            
            H=(Hbar*Losbar+Hw*Losw)*(BETA.^0.5);% large + small scale fading
            
            Hw1=Hw*Losw*(BETA.^0.5);%Hw1=Hw*(BETA.^0.5);% Hw1=Hw*(BETA.^0.5);
            
            %%%%%%%channel estimation
            PtBeta=Pu.*beta;
            Psi=dftmtx(tau); %
            Psi=Psi(1:K,:);
            
            F = Psi;%((Pp)^(0.5).*Psi)*Losbar;
            
            Nt=sqrt(sigma2/2)*(randn(mi,tau)+1i*randn(mi,tau));%the channel noise
            %new training power allocation,
            Cadc2=alpha*(1-alpha)*( (sigma2 + sum(PtBeta) )*eye(mi));
            % the covariance of ADC noise
            Nadc=sqrt(Cadc2./2)*(randn(mi,tau)+1i*randn(mi,tau));% the ADC noise
            Yt=(Pu).^0.5*alpha*Hw1*F+alpha*Nt+Nadc;
            % observed signal in training phase with ADC noise
            %check the Pu should be the sqrt of P_t
            X=(Pu).^0.5*F;% X=PF in the note K by tau1 matrix
            hatY=zeros(mi,K);
            for i2=1:K
                hatY(:,i2)= Yt*X(i2,:)';
            end
            
            %check the following ...
            Hwest=zeros(mi,K);
            Bmse=zeros(1,K);
            beta1=zeros(1,K);
            
            for jj=1:K
                %the covriance: calculated column by column
                Chy=(Kn+1)^(-0.5)*alpha*tau*beta(jj)*Pu*eye(mi); % Chy=alpha*tau*beta(jj)*Pu*eye(mi);
                Cyy=alpha^2*tau^2*beta(jj)*Pu^2*eye(mi)*(Kn+1)^(-1)+alpha^2*sigma2*tau*Pu*eye(mi)+...
                    tau*Pu*Cadc2;
                %Cyy=alpha^2*tau^2*beta(jj)*Pu^2*eye(mi)+alpha^2*sigma2*tau*Pu*eye(mi)+...
                % tau*Pu*Cadc2;
                Chh=beta(jj)*eye(mi);
                Cyh=Chy;%=alpha*beta(jj)*tau*Pu*eye(mi);
                %the estimated channel & Bayesian MSE: calculated column by column
                Hwest(:,jj)=Chy*inv(Cyy)*hatY(:,jj);
                Bmse(jj)=trace( Chh - Chy * inv(Cyy) * Cyh );
                beta1(jj)= trace(Chy * inv(Cyy) * Cyh);
            end
            
            Hest=(Hbar*Losbar) *(BETA.^0.5) + Hwest*Losw; %must check if this one is correct!!!!!
            beta1=beta1./mi;
            error=(Bmse./mi)./(Kn+1);
            
            %%%%%%spectrum efficiency %%%%%%
            [ZFrateiter(ii,:)] =  imRicianGroupZFSE(K,Pu, sigma2, K, mi, Hest, alpha, H, error);
            ZFtemp(ii,counter, counter1)=sum(ZFrateiter(ii,:));
            
            [GZFrateiter(ii,:)] = imRicianGroupZFSE(Group,Pu, sigma2, K, mi, Hest, alpha, H, error);
            GZFtemp(ii,counter, counter1)=sum(GZFrateiter(ii,:));
            
             [perGZFrateiter(ii,:)] = imRicianGroupZFSE(Group,Pu, sigma2, K, mi, H, alpha, H, zeros(size(error)));
            perGZFtemp(ii,counter, counter1)=sum(perGZFrateiter(ii,:));
            
            %%%%%%% approximation%%%%%%%%%%%%%%%%%%%%%%%%        
            BETA1=diag(beta1);
            hatsigma=BETA1*Losw^2+(BETA./mi)*(   Losbar * (Hbar')  * Hbar * Losbar);
            
            [Gsicrateapp(ii,:)] = imGsicSEAPP(Group,Pu, sigma2, K, mi, alpha,hatsigma, error,beta );
            Gsicrateapptemp(ii,counter, counter1)=abs(sum(Gsicrateapp(ii,:)));
            
            [ZFrateapp(ii,:)] = imRicianZFSEAPP(Pu, sigma2, K, mi, alpha,hatsigma, error ,beta);
            ZFSEapptemp(ii,counter, counter1)=abs(sum(ZFrateapp(ii,:)));
            
            Sigma=Losw^2 + (1/mi)*(   Losbar * (Hbar')  * Hbar * Losbar);
            [perGsicrateapp(ii,:)] = RicianZFGSICSEAPP(Group,Pu, sigma2, K, mi, alpha,Sigma,beta );
            perGsicrateapptemp(ii,counter, counter1)=abs(sum(perGsicrateapp(ii,:)));
            
        end
    end
end
%
ZFSE = abs(sum(ZFtemp)./iter);
ZFSEapp = abs(sum( ZFSEapptemp)./iter);
GSICSE = abs(sum(GZFtemp)./iter);
GSICSEapp = abs(sum(Gsicrateapptemp)./iter);

perGSICSE=abs(sum(perGZFtemp)./iter);
perGSICSEapp=abs(sum(perGsicrateapptemp)./iter);
 
%
figure(1);
hold on;
box on;
grid on;
% the 1st ADC bits
plot(M,GSICSE(:,:,1),'-','LineWidth',2);
plot(M,GSICSEapp(:,:,1),'d','LineWidth',2);
plot(M,ZFSE(:,:,1),'--','LineWidth',2);
plot(M,ZFSEapp(:,:,1),'s','LineWidth',2);
plot(M,perGSICSE(:,:,1),'-','LineWidth',2);
plot(M,perGSICSEapp(:,:,1),'d','LineWidth',2);
% the 2nd ADC bits
plot(M,GSICSE(:,:,2),'-','LineWidth',2);
plot(M,GSICSEapp(:,:,2),'d','LineWidth',2);
plot(M,ZFSE(:,:,2),'--','LineWidth',2);
plot(M,ZFSEapp(:,:,2),'s','LineWidth',2);
plot(M,perGSICSE(:,:,2),'-','LineWidth',2);
plot(M,perGSICSEapp(:,:,2),'d','LineWidth',2);
% the 3rd ADC bits
plot(M,GSICSE(:,:,3),'-','LineWidth',2);
plot(M,GSICSEapp(:,:,3),'d','LineWidth',2);
plot(M,ZFSE(:,:,3),'--','LineWidth',2);
plot(M,ZFSEapp(:,:,3),'s','LineWidth',2);
plot(M,perGSICSE(:,:,3),'-','LineWidth',2);
plot(M,perGSICSEapp(:,:,3),'d','LineWidth',2);
%
l1= legend('GSIC: 3bit', 'GSIC approximation: 3bit'  ,'ZF: 3bit', ' ZF approximation: 3bit',...
    'perGSIC: 3bit', 'perGSIC approximation: 3bit',...
    'GSIC: 6bit', 'GSIC approximation: 6bit'  ,'ZF: 6bit', ' ZF approximation: 6bit',...
    'perGSIC: 6bit', 'perGSIC approximation: 6bit',...
    'GSIC: 12bit', 'GSIC approximation: 12bit'  ,'ZF: 12bit', ' ZF approximation: 12bit',...
    'perGSIC: 12bit', 'perGSIC approximation: 12bit');
%
x1=xlabel('Number of BS Antennas');
y1= ylabel('SE [bit/s/Hz]');
set(x1,'FontName','Times New Roman','FontSize',11,'FontWeight','normal')
set(y1,'FontName','Times New Roman','FontSize',11,'FontWeight','normal')
set(l1,'FontName','Times New Roman','FontSize',11,'FontWeight','normal')
