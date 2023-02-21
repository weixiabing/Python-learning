% 28th Nov 2018: for imperfect CSI
clc
clear
rng('shuffle');

iter=500;
K=30;
% Mmax=600;
% Mmin=100;
tau_ul=1;
tau=K*tau_ul;
M=200;

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

channelGaindB=zeros(K,1);
channelGainShadowingdB=zeros(K,1);
%ricianFactor=zeros(K,1);
%The maximum distance for LoS
%Standard deviation of shadow fading in dB
%sigma_sf_NLOS=10; %for NLOS
sigma_sf_LOS=4;   %for LOS

%Spectral resources and properties (From Table 2)
%B = 20e6; %Transmission bandwidth (Hz)
Bc = 180e3; %Channel coherence bandwidth (Hz)
Tc = 10e-3; %Channel coherence time (s)
U = Bc * Tc; %Coherence block (number of channel uses)
%Select length of coherence block

zetaUL = 0.4; %Fraction of uplink transmission
coblock= zetaUL*U;
%Pilot Length
%Prelog factor assuming only UL transmission
prelogFactor = (coblock-tau)/coblock;
%K*zetaUL*(1-(tauUL)*K/(U*zetaUL))
prelogFactor25=(coblock-4*tau)/coblock;
%prelogFactor50=(coblock-2*tau)/coblock;
%prelogFactor=(tau_c -tau_p)/tau_c;





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

PuDb=-40:5:10;% in dBm -40:5:10;
lengthPuDb=length(PuDb);
Puvector=db2pow(PuDb-30);%in watt

b=3;%ADC resolution

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

MRCtemp=zeros(iter,lengthPuDb);
%ZFtemp=zeros(iter,lengthPuDb);
perMRCtemp=zeros(iter,lengthPuDb);
%perZFtemp=zeros(iter,lengthPuDb);

%MRCtempNL=zeros(iter,lengthPuDb);
%perMRCtempNL=zeros(iter,lengthPuDb);
%MRCSEapptempNL= zeros(iter,lengthPuDb);
%perMRCSEapptempNL= zeros(iter,lengthPuDb);

MRCSEapptemp= zeros(iter,lengthPuDb);
%ZFSEapptemp    = zeros(iter,lengthPuDb);
%perZFSEapptemp    = zeros(iter,lengthPuDb);
perMRCSEapptemp    = zeros(iter,lengthPuDb);

MRCtempR= zeros(iter,lengthPuDb);
MRCSEapptempR = zeros(iter,lengthPuDb);


%Rician Fading assume Kn for all user are same

Omega=Kn.*eye(K);
Losbar=( Omega * inv( Omega + eye(K) ) ).^(0.5);
Losw=( inv( Omega+eye(K) ) ).^(0.5);

counter=0;
for Pu=Puvector
    
    counter=counter+1;
    
    disp(['Current Counter: ' num2str(counter),' out of Total ' num2str(lengthPuDb)]);
    
    MRCrateiter=zeros(iter,K);
    %ZFrateiter=zeros(iter,K);
    perMRCrateiter=zeros(iter,K);
    %perZFrateiter=zeros(iter,K);
    MRCrateiterR=zeros(iter,K);
    %MRCrateiterNL=zeros(iter,K);
    %perMRCrateiterNL=zeros(iter,K);
    MRCrateappR=zeros(iter,K);
    MRCrateapp=zeros(iter,K);
    %ZFrateapp=zeros(iter,K);
    %perZFrateapp=zeros(iter,K);
    perMRCrateapp=zeros(iter,K);
    
    %MRCrateappNL=zeros(iter,K);
    %perMRCrateappNL=zeros(iter,K);
    
    for ii=1:iter
        
        a = -90;
        bb = 90;
        LOStheta = (bb-a).*rand(K,1) + a;% generate degree from -90 to 90
        theta=deg2rad(LOStheta);%degree to radian
        lemdaLos=(3*10^8)/(900*10^6);
        d=lemdaLos/2;
        
        
        
        
        
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
        Hw1=Hw*Losw*(BETA.^0.5); % Rayleigh fading part + K factor + large scale fading
        % Hw1=Hw*(BETA.^0.5);
        
        %%%%%%%channel estimation
        
        %new training power allocation
        PtBeta=Pu.*beta;
        Psi=dftmtx(tau); % checked
        Psi=Psi(1:K,:);
        F = Psi;%((Pp)^(0.5).*Psi)*Losbar;
        
        %the channel noise
        Nt=sqrt(sigma2/2)*(randn(M,tau)+1i*randn(M,tau));
        % the covariance of ADC noise
        Cadc2=alpha*(1-alpha)*( (sigma2 + sum(PtBeta) )*eye(M));
        Nadc=sqrt(Cadc2./2)*(randn(M,tau)+1i*randn(M,tau));% the ADC noise
        % observed signal in training phase with ADC noise
        Yt=(Pu).^0.5*alpha*Hw1*F+alpha*Nt+Nadc;
        
        X=(Pu).^0.5*F;% X=(P)^.(0.5)Phi in the draft, which is a K by tau1 matrix
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
            %Chy=alpha*tau*beta(jj)*Pu*eye(M);
            Chy=(Kn+1)^(-0.5)*alpha*tau*beta(jj)*Pu*eye(M);
            
            Cyy=alpha^2*tau^2*beta(jj)*Pu^2*eye(M)*(Kn+1)^(-1)+alpha^2*sigma2*tau*Pu*eye(M)+...
                tau*Pu*Cadc2;
            % Cyy=alpha^2*tau^2*beta(jj)*Pu^2*eye(M)+alpha^2*sigma2*tau*Pu*eye(M)+...
            %  tau*Pu*Cadc2;
            Chh=beta(jj)*eye(M);
            Cyh=Chy; %alpha*beta(jj)*tau*Pu*eye(M);
            %the estimated channel & Bayesian MSE: calculated column by column
            Hwest(:,jj)=Chy*inv(Cyy)*hatY(:,jj);
            Bmse(jj)=trace( Chh - Chy * inv(Cyy) * Cyh );
            beta1(jj)= trace(Chy * inv(Cyy) * Cyh);
        end
        %HNL=Hwest*Losw;
        Hest=  (Hbar*Losbar) *(BETA.^0.5) + Hwest*Losw; %checked
        beta1=beta1./M;
        error=(Bmse./M)./(Kn+1);%checked
        
        %%%%%%call the functions here and calculate the SE of the system %%%%%%
        %imperfect CSI SE:
        [MRCrateiter(ii,:)] =  imRicianMRCSEkntest( Pu, sigma2, K, M, Hest, alpha, H, error);
        MRCtemp(ii,counter)=sum(MRCrateiter(ii,:));%checked
        %         %%imperfect CSI SE: NoN-Los:NL
        %         [MRCrateiterNL(ii,:)] =  imRicianMRCSEkntest( Pu, sigma2, K, M, HNL, alpha, Hw1, error);
        %         MRCtempNL(ii,counter)=sum(MRCrateiterNL(ii,:));
        %
        %%%% and compare with perfect CSI by setting the
        %%%%error to zero and Hest to H
        [perMRCrateiter(ii,:)] =  imRicianMRCSEkntest( Pu, sigma2, K, M, H, alpha, H, 0);
        perMRCtemp(ii,counter)=sum(perMRCrateiter(ii,:));
        
        %         %%NoN-Los:NL
        %         [perMRCrateiterNL(ii,:)] =  imRicianMRCSEkntest( Pu, sigma2, K, M, Hw1, alpha, Hw1, 0);
        %         perMRCtempNL(ii,counter)=sum(perMRCrateiterNL(ii,:));
        %
        %check the following ...
        
        %%%%%%%%WITHOUT ADC
        
        YtR=(Pu).^0.5*alpha*Hw1*F+alpha*Nt;
        % observed signal in training phase with ADC noise
        %check the Pu should be the sqrt of P_t
        % X=(Pu).^0.5*F;% X=PF in the note K by tau1 matrix
        hatYR=zeros(M,K);
        for i3=1:K
            hatYR(:,i3)= YtR*X(i3,:)';
        end
        
        HwestR=zeros(M,K);
        BmseR=zeros(1,K);
        beta1R=zeros(1,K);
        for jj2=1:K
            %the covriance: calculated column by column
            ChyR=(Kn+1)^(-0.5)*alpha*tau*beta(jj2)*Pu*eye(M);
            
            CyyR=alpha^2*tau^2*beta(jj2)*Pu^2*eye(M)*(Kn+1)^(-1)+alpha^2*sigma2*tau*Pu*eye(M);
            
            ChhR=beta(jj2)*eye(M);
            CyhR=ChyR;%alpha*beta(jj2)*tau*Pu*eye(M);
            %the estimated channel & Bayesian MSE: calculated column by column
            HwestR(:,jj2)=ChyR*inv(CyyR)*hatYR(:,jj2);
            BmseR(jj2)=trace( ChhR - ChyR * inv(CyyR) * CyhR );
            beta1R(jj2)= trace(ChyR * inv(CyyR) * CyhR);
        end
        
        HestR=  (Hbar*Losbar) *(BETA.^0.5) + HwestR*Losw; %must check if this one is correct!!!!!
        beta1R=beta1R./M;
        errorR=(BmseR./M)./(Kn+1);
        
        %%round robin
        [MRCrateiterR(ii,:)] =  imRicianMRCSEkntest( Pu, sigma2, K, M, HestR, alpha, H, errorR);
        MRCtempR(ii,counter)=sum(MRCrateiterR(ii,:));
                
        % Approximation following the MonteCarlo simulation above
        phi=zeros(K,K);% for approximation
        for n=1:K
            for i=1:K
                phi(n,i)= sin( ((M*pi)/2) * ( sin( theta(n) ) - sin( theta(i) ) )  )/...
                    sin( (pi/2) * ( sin( theta(n) ) - sin( theta(i) ) )  );
                
            end
        end
        %imperfect CSI:
        %LOS
        [MRCrateapp(ii,:)] = imRicianMRCSEAPP(phi, Pu, sigma2, K, M, beta, beta1, Kn,  alpha, error);
        MRCSEapptemp(ii,counter)=abs(sum(MRCrateapp(ii,:)));
        %         %%%%%% NoN-LoS : NL%%%%CHECK THIS ONE
        %         [MRCrateappNL(ii,:)] = imRicianMRCSEAPP(phi, Pu, sigma2, K, M, inv( Kn+1 ).*beta, (inv( Kn+1 ).*beta1), Kn,  alpha, error);
        %         MRCSEapptempNL(ii,counter)=abs(sum(MRCrateappNL(ii,:)));
        %round robin
        [MRCrateappR(ii,:)] = imRicianMRCSEAPP(phi, Pu, sigma2, K, M, beta, beta1R, Kn,  alpha, errorR);
        MRCSEapptempR(ii,counter)=abs(sum(MRCrateappR(ii,:)));
        
        
        
        %         %%%% perfect CSI
        
        %LOS
        [perMRCrateapp(ii,:)] = imRicianMRCSEAPP(phi, Pu, sigma2, K, M, beta, beta', Kn,  alpha, 0);
        perMRCSEapptemp(ii,counter)=abs(sum(perMRCrateapp(ii,:)));
        %         %%%%%% NoN-LoS : NL
        %         [perMRCrateappNL(ii,:)] = imRicianMRCSEAPP(phi, Pu, sigma2, K, M, inv( Kn+1 ).*beta, (inv( Kn+1 ).*beta)', Kn,  alpha, 0);
        %         perMRCSEapptempNL(ii,counter)=abs(sum(perMRCrateappNL(ii,:)));
        %
        
        
    end
    
end

%%%%%Imperfect CSI
MRCSE = prelogFactor.*sum(MRCtemp./iter);% checked
MRCSEapp = prelogFactor.*sum(MRCSEapptemp./iter);
%ZFSE = prelogFactor.*abs(sum(ZFtemp)./iter);
%ZFSEapp =prelogFactor.* sum( ZFSEapptemp./iter);
%NON-LOS
MRCSER25=   prelogFactor25.*sum(MRCtempR./iter);   %imperfect
MRCSEappR25= prelogFactor25.*sum(MRCSEapptempR./iter); % imperfect approximation

%%%%%perfect CSI
perMRCSE = prelogFactor.*sum(perMRCtemp./iter);
perMRCSEapp = prelogFactor.*sum(perMRCSEapptemp./iter);
%NON-LOS
%perMRCSENL=  prelogFactor.*sum(perMRCtempNL./iter);   %perfect
%perMRCSEappNL=prelogFactor.*sum(perMRCSEapptempNL./iter);
%perZFSE = prelogFactor.*abs(sum(perZFtemp)./iter);
%perZFSEapp = prelogFactor.*sum(perZFSEapptemp./iter);
%%%%%%%%% PLOT
figure(1);
hold on;
box on;
grid on;

plot(PuDb,MRCSE,'-','LineWidth',2);
plot(PuDb,MRCSEapp,'s','LineWidth',2);
%plot(PuDb,ZFSE,':','LineWidth',2);
%plot(PuDb,ZFSEapp,'s','LineWidth',2);

plot(PuDb,perMRCSE,'-','LineWidth',2);
plot(PuDb,perMRCSEapp,'s','LineWidth',2);
%plot(PuDb,perZFSE,':','LineWidth',2);
%plot(PuDb,perZFSEapp,'s','LineWidth',2);

plot(PuDb,MRCSER25,'-','LineWidth',2);
plot(PuDb,MRCSEappR25,'s','LineWidth',2);

% plot(PuDb,MRCSENL,':','LineWidth',2);
% plot(PuDb,MRCSEappNL,'s','LineWidth',2);

legend('Imperfect CSI MRC', 'Imperfect CSI MRC approximation',  ...
    'Perfect CSI MRC',  'Perfect CSI MRC approximation',...
    'RoundRobin25%MRC','RoundRobin25%MRC approximation')
% 'Perfect CSI NoN-LoS','Perfect CSI NoN-LoS approximation','Imperfect CSI NoN-LoS','Imperfect CSI NoN-LoS approximation');
% legend('Imperfect CSI MRC', 'Imperfect CSI MRC approximation'  ,'Imperfect CSI ZF ', 'Imperfect CSI ZF approximation',...
%     'Perfect CSI MRC',  'Perfect CSI MRC approximation', 'Perfect CSI ZF'  , 'Perfect CSI ZF approximation',...
%     'Perfect CSI NoN-LoS','Perfect CSI NoN-LoS approximation','Imperfect CSI NoN-LoS','Imperfect CSI NoN-LoS approximation');
xlabel('Transmission Power (dBm)');
ylabel('SE [bit/s/Hz]');
