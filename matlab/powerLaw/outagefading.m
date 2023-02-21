%clear
function [beta,Kn] = outagefading(K)
Kmax=200000;% overall Kmax samples in the pool
channelGaindB=zeros(Kmax,1);%path loss
channelGainShadowingdB=zeros(Kmax,1);% path  loss + shadowing
Rmax = 250;%1000; %Cell radius for a circular cell in the single-cell scenario
Rmin = 35;%100; %Minimum distance between UE and BS
userDistances = sqrt( rand(Kmax,1)*(Rmax^2-Rmin^2)+ Rmin^2 );
sigma_sf_LOS=8;% shadowing sigma
for Kmax = 1:Kmax
    channelGaindB(Kmax)= -35-35*log10(userDistances(Kmax));%path loss
    shadowing = sigma_sf_LOS*randn(1);
    channelGainShadowingdB(Kmax) = channelGaindB(Kmax)+ shadowing;% path  loss + shadowing
end



lastUE=Kmax*0.05;%calculate the number of samples out of the pool
%betaorder=sort(channelGainShadowingdB);
%G0dB=betaorder(lastUE);%found the threashold
%G0=db2pow(G0dB);% transfer it to dicimal

[outagebeta,outagedPosition]=mink(channelGainShadowingdB,lastUE);% find the weakest beta out of the Kmax sampls
betadBpool=setdiff(channelGainShadowingdB,outagebeta,'stable');%outage the 5% weakest beta from the pool

betapool=db2pow(betadBpool);%the pool ready for use with 9.5w samples

%minbeta=min(betapool);%just check the min beta in the new pool

%need to null the distances for Kn'calculation as well
userDistances(outagedPosition) = [];%outage the weak UEs's distance and used for getting K-factor

%in each simulation iteration

beta=zeros(K,1);
Kn=zeros(K,1);
for k=1:K
    ik=randi([1,Kmax*0.95],1,1);
    beta(k)= betapool(ik);
    Kn(k)=db2pow(13-0.03.*userDistances(ik));
end


end

