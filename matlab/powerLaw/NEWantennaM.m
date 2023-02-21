% 28th Nov 2018: for imperfect CSI

clear
rng('shuffle');

iter=500;
K=30;
Mmax=400;
Mmin=50;
tau_ul=1;
tau=K*tau_ul;
%M=200;

Kn_dB = 0; %in dB
Kn = 10^(Kn_dB/10);

B = 20e6; %Transmission bandwidth (Hz)

%%%%%%%%%%%%%%%%%%%%%%%%%%%

Pu=db2pow(-10-30);%in watt
%Pu=0.01
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

sigma_sf_LOS=4;   %for LOS

%Spectral resources and properties (From Table 2)

Bc = 180e3; %Channel coherence bandwidth (Hz)
Tc = 10e-3; %Channel coherence time (s)
U = Bc * Tc; %Coherence block (number of channel uses)
%Select length of coherence block

zetaUL = 0.4; %Fraction of uplink transmission
coblock= zetaUL*U;
%Pilot Length
%Prelog factor assuming only UL transmission
prelogFactor = (coblock-tau)/coblock;

Rmax = 250;%1000; %Cell radius for a circular cell in the single-cell scenario. It is also the distance from BS to a side of the square cells in the multi-cell scenario
Rmin = 35;%100; %Minimum distance between UE and BS
userDistances = sqrt( rand(K,1)*(Rmax^2-Rmin^2)+ Rmin^2 );
%%%%%% large scale fading %%%%%%
%Compute average channel gain using the large-scale fading
%model based on 3GPP model while neglecting the shadow fading for each UE
for k1 = 1:K
    channelGaindB(k1)= -30.18-26*log10(userDistances(k1));%LoS in dB
end
% shadowing effect
for k2 = 1:K
    shadowing = sigma_sf_LOS*randn(1);
    channelGainShadowingdB(k2) = channelGaindB(k2) + shadowing;
end

beta=db2pow(channelGainShadowingdB);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M=Mmin:50:Mmax;

lengthM=length(M);


b=3;

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

MRCtemp=zeros(iter,lengthM);
MRCSEapptemp= zeros(iter,lengthM);

perMRCtemp=zeros(iter,lengthM);
perMRCSEapptemp    = zeros(iter,lengthM);

MRCtempNL=zeros(iter,lengthM);
MRCSEapptempNL= zeros(iter,lengthM);

perMRCtempNL= zeros(iter,lengthM);
perMRCSEapptempNL= zeros(iter,lengthM);


%Rician Fading assume Kn for all user are same

Omega=Kn.*eye(K);
Losbar=( Omega * inv( Omega + eye(K) ) ).^(0.5);
Losw=( inv( Omega+eye(K) ) ).^(0.5);

counter=0;% count for how many M in the step of 50 we tested
for mi=Mmin:50:Mmax
    
    counter=counter+1;
    
    disp(['Current mi: ' num2str(counter),' out of Total ' num2str(lengthM)]);
    
    MRCrateiter=zeros(iter,K);
    MRCrateapp=zeros(iter,K);
    
    
    perMRCrateiter=zeros(iter,K);
    perMRCrateapp=zeros(iter,K);
   
    
    MRCrateappNL=zeros(iter,K);
    MRCrateiterNL=zeros(iter,K);
    
    perMRCrateappNL=zeros(iter,K);
    perMRCrateiterNL=zeros(iter,K);
  
    
    for ii=1:iter
        
        a = -90;
        bb = 90;
        LOStheta = (bb-a).*rand(K,1) + a;% generate degree from -90 to 90
        theta=deg2rad(LOStheta);%degree to radian
        lemdaLos=(3*10^8)/(900*10^6);
        d=lemdaLos/2;
        
         BETA=diag(beta);
        
        Hbar=zeros(mi,K);%LoS part
        for m=1:mi
            for k=1:K
                Hbar(m,k) = exp(-1i*(m-1)*((2*pi*d)/lemdaLos)*sin(theta(k)));
            end
        end
        
        Hw = (randn(mi,K)+1i*randn(mi,K))/sqrt(2);% Fast fading following rayleigh distribution%%%%%%%%%
        
        H=(Hbar*Losbar+Hw*Losw)*(BETA.^0.5);% large + small scale fading
        
        Hw1=Hw*Losw*(BETA.^0.5);%Hw1=Hw*(BETA.^0.5);
        
        %%%%%%%channel estimation
        PtBeta=Pu.*beta;
        Psi=dftmtx(tau); %This is incorrect
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
            Chy=(Kn+1)^(-0.5)*alpha*tau*beta(jj)*Pu*eye(mi); %Chy=alpha*tau*beta(jj)*Pu*eye(mi);
            Cyy=alpha^2*tau^2*beta(jj)*Pu^2*eye(mi)*(Kn+1)^(-1)+alpha^2*sigma2*tau*Pu*eye(mi)+...
                tau*Pu*Cadc2;%alpha^2*tau^2*beta(jj)*Pu^2*eye(mi)+alpha^2*sigma2*tau*Pu*eye(mi)+...
            %tau*Pu*Cadc2;
            Chh=beta(jj)*eye(mi);
            Cyh=Chy;%alpha*beta(jj)*tau*Pu*eye(mi);
            %the estimated channel & Bayesian MSE: calculated column by column
            Hwest(:,jj)=Chy*inv(Cyy)*hatY(:,jj);
            Bmse(jj)=trace( Chh - Chy * inv(Cyy) * Cyh );
            beta1(jj)= trace(Chy * inv(Cyy) * Cyh);
        end
        HNL=Hwest*Losw;
        Hest=  (Hbar*Losbar) *(BETA.^0.5) + Hwest*Losw; %must check if this one is correct!!!!!
        beta1=beta1./mi;
        error=(Bmse./mi)./(Kn+1);
        
        %%%%%%call function here %%%%%%
        %LoS
        %%%imperfect CSI SE:
        [MRCrateiter(ii,:)] =  imRicianMRCSEkntest( Pu, sigma2, K, mi, Hest, alpha, H, error);
        MRCtemp(ii,counter)=sum(MRCrateiter(ii,:));
        %perfect CSI
        [perMRCrateiter(ii,:)] =  imRicianMRCSEkntest(Pu, sigma2, K, mi, H, alpha, H, 0);
        perMRCtemp(ii,counter)=sum(perMRCrateiter(ii,:));
        
        %NoN-Los:NL
        %%%imperfect CSI SE:
        [MRCrateiterNL(ii,:)] =  imRicianMRCSEkntest( Pu, sigma2, K, mi, HNL, alpha, Hw1, error);
        MRCtempNL(ii,counter)=sum(MRCrateiterNL(ii,:));
        %
        %%perfect CSI
        [perMRCrateiterNL(ii,:)] =  imRicianMRCSEkntest( Pu, sigma2, K, mi, Hw1, alpha, Hw1, 0);
        perMRCtempNL(ii,counter)=sum(perMRCrateiterNL(ii,:));
        
        
       phi=zeros(K,K);% for approximation
        for n=1:K
            for i=1:K
                phi(n,i)= sin( ((mi*pi)/2) * ( sin( theta(n) ) - sin( theta(i) ) )  )/...
                    sin( (pi/2) * ( sin( theta(n) ) - sin( theta(i) ) )  );
                
            end
        end
        % Approximation following the Monte Carlo simulation above
        %LoS
        %imperfect CSI
        [MRCrateapp(ii,:)] = imRicianMRCSEAPP(phi, Pu, sigma2, K, mi, beta, beta1, Kn,  alpha, error);
        MRCSEapptemp(ii,counter)=abs(sum(MRCrateapp(ii,:)));
        %perfect CSI
        [perMRCrateapp(ii,:)] = imRicianMRCSEAPP(phi, Pu, sigma2, K, mi, beta, beta', Kn,  alpha, 0);
        perMRCSEapptemp(ii,counter)=abs(sum(perMRCrateapp(ii,:)));
        
        
        %% NoN-LoS : NL%%%%CHECK THIS ONE
        %imperfect CSI
        [MRCrateappNL(ii,:)] = imRicianMRCSEAPP(phi, Pu, sigma2, K, mi, inv( Kn+1 ).*beta, (inv( Kn+1 ).*beta1), 0,  alpha, error);
        MRCSEapptempNL(ii,counter)=abs(sum(MRCrateappNL(ii,:)));
        
        
        %perfect CSI
        [perMRCrateappNL(ii,:)] = imRicianMRCSEAPP(phi, Pu, sigma2, K, mi, inv( Kn+1 ).*beta, (inv( Kn+1 ).*beta)', 0,  alpha, 0);
        perMRCSEapptempNL(ii,counter)=abs(sum(perMRCrateappNL(ii,:)));
        
        
        
    end
    
end
%LoS
MRCSE = prelogFactor.*sum(MRCtemp./iter);
MRCSEapp = prelogFactor.*sum(MRCSEapptemp./iter);
% %compare with perfect CSI
perMRCSENL = prelogFactor.*sum(perMRCtempNL./iter);
perMRCSEappNL = prelogFactor.*sum(perMRCSEapptempNL./iter);

%N-LoS
MRCSENL = prelogFactor.*sum(MRCtempNL./iter);
MRCSEappNL = prelogFactor.*sum(MRCSEapptempNL./iter);
% %compare with perfect CSI
perMRCSE = prelogFactor.*sum(perMRCtemp./iter);
perMRCSEapp = prelogFactor.*sum(perMRCSEapptemp./iter);

%%%%%%%%% PLOT
figure(1);
hold on;
box on;
grid on;
%
plot(M,MRCSE,'-','LineWidth',2);%imperfect
plot(M,MRCSEapp,'s','LineWidth',2);

plot(M,perMRCSE,'-','LineWidth',2);%perfect
plot(M,perMRCSEapp,'s','LineWidth',2);

plot(M,MRCSENL,'--','LineWidth',2);%
plot(M,MRCSEappNL,'s','LineWidth',2);

plot(M,perMRCSENL,'--','LineWidth',2);%
plot(M,perMRCSEappNL,'s','LineWidth',2);

%
legend('Imperfect CSI', 'Imperfect CSI approximation' ,...
    'Perfect CSI','Perfect CSI approximation'  ,...
    'Imperfect CSI Rayleigh','Imperfect CSI Rayleigh approximation',...
    'Perfect CSI Rayleigh','Perfect CSI Rayleigh approximation');

%legend('MRC', 'MRC approximation'  ,'ZF ', ' ZF approximation');
xlabel('Number of BS Antennas');
ylabel('Net SE [bit/s/Hz]');
% 
% AVGsumSE=sum(MRCtemp./iter);
% AVGsumappSE=sum(MRCSEapptemp./iter);
% 
% NMSE=norm(AVGsumSE-AVGsumappSE)^2/norm(AVGsumSE)^2