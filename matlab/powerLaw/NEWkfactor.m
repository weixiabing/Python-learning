% 28th Nov 2018: for imperfect CSI
% 19 Jan 2019

clc
clear
rng('shuffle');
ADCbit=[1:3, 200];
iter=500;
K=30;
% Mmax=600;
% Mmin=100;
tau_ul=1;
tau=K*tau_ul;
M=200;

Kn_dB = -10:5:40; %in dB
Kfactor = 10.^(Kn_dB./10);
lengthKn=length(Kn_dB);


B = 20e6; %Transmission bandwidth (Hz)
%sigma2B = 10^(-9.6-3); %Total noise power (B*sigma2 in W)
%sigma2=sigma2B/B;
%PuDb= -10:5:40;
lengthADCbit=length(ADCbit);
%Pu=10.^(20/10).*sigma2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%
Pu=db2pow(-10-30);%in watt
%Pu=0.1;
%Noise figure at the BS (in dB)
noiseFigure = 7;
%Compute noise power
noiseVariancedBm = -174 + 10*log10(B) + noiseFigure; %-94dbm
sigma2=db2pow(noiseVariancedBm-30); %W noise power 

channelGaindB=zeros(K,1);
channelGainShadowingdB=zeros(K,1);
ricianFactor=zeros(K,1);
%The maximum distance for LoS
%Standard deviation of shadow fading in dB
%sigma_sf_NLOS=10; %for NLOS
sigma_sf_LOS=4;   %for LOS

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


MRCtemp=zeros(iter,lengthKn,lengthADCbit);
ZFtemp=zeros(iter,lengthKn,lengthADCbit);

MRCSEapptemp= zeros(iter,lengthKn,lengthADCbit);
ZFSEapptemp    = zeros(iter,lengthKn,lengthADCbit);

%Rician Fading assume Kn for all user are same



counter=0;
for Kn=Kfactor
    
    counter=counter+1;
    counter1=0;
    disp(['Current Counter: ' num2str(counter), ' out of Total ' num2str(lengthKn)]);
    
    
    
    
    Omega=Kn.*eye(K);
    Losbar=( Omega * inv( Omega + eye(K) ) ).^(0.5);
    Losw=( inv( Omega+eye(K) ) ).^(0.5);
    
    
    % adding a iteration here for
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
        MRCrateiter=zeros(iter,K);
        ZFrateiter=zeros(iter,K);
        MRCrateapp=zeros(iter,K);
        ZFrateapp=zeros(iter,K);
        
        for ii=1:iter
            
            LoSa = -90;
            LoSb = 90;
            LOStheta = (LoSb-LoSa).*rand(K,1) + LoSa;% generate degree from -90 to 90
            theta=deg2rad(LOStheta);%degree to radian
            lemdaLos=(3*10^8)/(900*10^6);
            d=lemdaLos/2;
            
            %         sigma_shadow = 8;   %??shadow =8dB
            %         v = 3.8;    %the path loss exponent
            %         r_h = 100;  %central disk radius
            %         radius = 1000;  %hexagonal cell's radius
            %         z = exp(normrnd(0,10^(sigma_shadow/10),K,1)); %zn
            %         r = unifrnd(r_h,radius,K,1);    %rn
            %         beta = z./(r/r_h).^v;
           % beta = 10^(-4)*[13.13;6.49;11.01;4.87;29.00;8.69;50.02;96.00;1.24;41.04];% from Zhangjiayi code.
            BETA=diag(beta);
            
            Hbar=zeros(M,K);%LoS part
            for m=1:M
                for k=1:K
                    Hbar(m,k) = exp(-1i*(m-1)*((2*pi*d)/lemdaLos)*sin(theta(k)));
                end
            end
            
            Hw = (randn(M,K)+1i*randn(M,K))/sqrt(2);% Fast fading following rayleigh distribution%%%%%%%%%
            
            H=(Hbar*Losbar+Hw*Losw)*(BETA.^0.5);% large + small scale fading
            
         
           Hw1=Hw*Losw*(BETA.^0.5);%Hw1=Hw*(BETA.^0.5);  Hw1=Hw*(BETA.^0.5);
            
            %%%%%%%channel estimation
            PtBeta=Pu.*beta;
            Psi=dftmtx(tau); %This is incorrect
            Psi=Psi(1:K,:);
            
            F = Psi;%((Pp)^(0.5).*Psi)*Losbar;
            
            Nt=sqrt(sigma2/2)*(randn(M,tau)+1i*randn(M,tau));%the channel noise
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            
            
            Cadc2=alpha*(1-alpha)*( (sigma2 + sum(PtBeta) )*eye(M));
            
            % the covariance of ADC noise
            Nadc=sqrt(Cadc2./2)*(randn(M,tau)+1i*randn(M,tau));% the ADC noise
            Yt=(Pu).^0.5*alpha*Hw1*F+alpha*Nt+Nadc;
            % observed signal in training phase with ADC noise
            %check the Pu should be the sqrt of P_t
            X=(Pu).^0.5*F;% X=PF in the note K by tau1 matrix
            hatY=zeros(M,K);
            for i2=1:K
                hatY(:,i2)= Yt*X(i2,:)';
            end
            
            %check the following ...
            Hwest=zeros(M,K);
            Bmse=zeros(1,K);
            beta1=zeros(1,K);
            
            for jj=1:K
                %the covriance: calculated column by column
                Chy=(Kn+1)^(-0.5)*alpha*tau*beta(jj)*Pu*eye(M);%alpha*tau*beta(jj)*Pu*eye(M);
                
                Cyy=alpha^2*tau^2*beta(jj)*Pu^2*eye(M)*(Kn+1)^(-1)+alpha^2*sigma2*tau*Pu*eye(M)+...
                tau*Pu*Cadc2;
                
                
              %  Cyy=alpha^2*tau^2*beta(jj)*Pu^2*eye(M)+alpha^2*sigma2*tau*Pu*eye(M)+...
                 %   tau*Pu*Cadc2;
                Chh=beta(jj)*eye(M);
                Cyh=Chy;%alpha*beta(jj)*tau*Pu*eye(M);
                %the estimated channel & Bayesian MSE: calculated column by column
                Hwest(:,jj)=Chy*inv(Cyy)*hatY(:,jj);
                Bmse(jj)=trace( Chh - Chy * inv(Cyy) * Cyh );
                beta1(jj)= trace(Chy * inv(Cyy) * Cyh);
            end
            
            Hest=  (Hbar*Losbar) *(BETA.^0.5) + Hwest*Losw; %must check if this one is correct!!!!!
            beta1=beta1./M;
            error=(Bmse./M)./(Kn+1);
            %%%%%%call function here %%%%%%
            [MRCrateiter(ii,:)] =  imRicianMRCSEkntest( Pu, sigma2, K, M, Hest, alpha, H, error);
            MRCtemp(ii,counter, counter1)=sum(MRCrateiter(ii,:));
            
           % [ZFrateiter(ii,:)] = imRicianZFSE(Pu, sigma2, K, M, Hest, alpha, H, error);
            %ZFtemp(ii,counter, counter1)=sum(ZFrateiter(ii,:));
            
            % Do the approximation following the Monte Carlo simulation above
            phi=zeros(K,K);% for approximation
            for n=1:K
                for i=1:K
                    phi(n,i)= sin( ((M*pi)/2) * ( sin( theta(n) ) - sin( theta(i) ) )  )/...
                        sin( (pi/2) * ( sin( theta(n) ) - sin( theta(i) ) )  );
                    
                end
            end
            
            %BETA1=diag(beta1);
            
            %hatsigma=BETA1*Losw^2+(BETA./M)*(   Losbar * (Hbar')  * Hbar * Losbar);
            
            [MRCrateapp(ii,:)] = imRicianMRCSEAPP(phi, Pu, sigma2, K, M, beta, beta1, Kn,  alpha, error);
            MRCSEapptemp(ii,counter, counter1)=abs(sum(MRCrateapp(ii,:)));
            
            %[ZFrateapp(ii,:)] = imRicianZFSEAPP(Pu, sigma2, K, M, alpha,hatsigma, error ,beta);
            %ZFSEapptemp(ii,counter, counter1)=abs(sum(ZFrateapp(ii,:)));
        end
    end
end

MRCSE = sum(MRCtemp./iter);

%ZFSE = abs(sum(ZFtemp)./iter);

MRCSEapp = sum(MRCSEapptemp./iter);

%ZFSEapp = sum( ZFSEapptemp./iter);



%for reproduce start from here as we modified the gross SE into net SE
Bc = 180e3; %Channel coherence bandwidth (Hz)
Tc = 10e-3; %Channel coherence time (s)
U = Bc * Tc; %Coherence block (number of channel uses)
%Select length of coherence block

zetaUL = 0.4; %Fraction of uplink transmission
coblock= zetaUL*U;
%Pilot Length
%Prelog factor assuming only UL transmission
prelogFactor = (coblock-tau)/coblock;
%for less legend
%%%%%%%%% PLOT
figure(1);
hold on;
box on;
grid on;

p(1)=plot(Kn_dB,prelogFactor.*MRCSE(:,:,1),'-','LineWidth',2);
p(2)=plot(Kn_dB,prelogFactor.*MRCSEapp(:,:,1),'s','LineWidth',2);

p(3)=plot(Kn_dB,prelogFactor.*MRCSE(:,:,2),'-','LineWidth',2);
p(4)=plot(Kn_dB,prelogFactor.*MRCSEapp(:,:,2),'s','LineWidth',2);

p(5)=plot(Kn_dB,prelogFactor.*MRCSE(:,:,3),'-','LineWidth',2);
p(6)=plot(Kn_dB,prelogFactor.*MRCSEapp(:,:,3),'s','LineWidth',2);

p(7)=plot(Kn_dB,prelogFactor.*MRCSE(:,:,4),'-','LineWidth',2);
p(8)=plot(Kn_dB,prelogFactor.*MRCSEapp(:,:,4),'s','LineWidth',2);



legend(p([1 2 3 4 5 6 7 8]),'1-bit ADC' ,'1-bit ADC approximation',...
    '2-bit ADC','2-bit ADC approximation','3-bit ADC','3-bit ADC approximation','ideal ADC','ideal ADC approximation')%,'ZF: 1-bit ADC',...
   % 'ZF: 2-bit ADC', 'ZF: 3-bit ADC', 'ZF: ideal ADC');



%'MRC: 1bit', 'MRC approximation: 1bit'  , 'MRC: 2bit', 'MRC approximation: 2bit'  , 'MRC: 3bit', 'MRC approximation: 3bit'  , 'MRC', 'MRC approximation' ,...
   % 'ZF: 1bit ', ' ZF approximation: 1bit', 'ZF: 2bit ', ' ZF approximation: 2bit', 'ZF: 3bit ', ' ZF approximation: 3bit','ZF ', ' ZF approximation');
xlabel('Rician K factor (dB)');
ylabel('Net SE [bit/s/Hz]');
