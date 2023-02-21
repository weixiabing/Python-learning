function [EEvalue,averagePower] = imGroupRicianZFsicAPP(Kn,G,epsilon,hatsigma,SINR,M,K,alpha,sigma2,beta,prelogFactor,prefixPower,circuitpower,AA,scalingFactor)
%imRicianZFSEAPP(Pu, sigma2, K, M, alphaapp,hatsigma, errorapp,beta)
%Kn is different for UEs find the equal Kn case with the backup function

%%%INPUT:
%K: number of UE
%M: number of antennas
%beta: the large scale fading of channel
%beta1: the large scale fading of the estimated channel i.e. \delta^2 in the note
%Kn: K factor
%Hest: the esitmated channel
%alpha: the ADC resolution coefficienct
%H: the channel fading matrix
%error: cahnnel esitmation error for ever UE : BMSE
%Losw, Losbar, Hbar: the coefficienct in rician fading channel
%%%OUTPUT:
%ZFrate: SE for MRC from UE1 to UEK
%ZFrateapp: the corresponding approximation results
ctau=SINR;
invhatsigma=inv(real(hatsigma));

n=K/G ;
x=((1:G).*(K/G))'; % example repeat the group number 
tempr=repmat(x,1,n)';
tempr=tempr(:)';
MKk=(M-K-(K/G)+tempr)';%%%CHANGED FOR GROUP

% Omega=diag(Kn);
% Losbar2=( Omega * inv( Omega + eye(K) ) );
% Losw2=( inv( Omega+eye(K) ) );
% Losw2inv= Omega+eye(K);


thetazfsic=(ctau*sigma2) / (  alpha-alpha*ctau*(  (1/alpha-1)*...
    sum( diag(invhatsigma)'./(MKk') ) ...
        + sum(   ( (ones(1,K)-epsilon).*diag(invhatsigma)' )./( ( Kn'+ones(1,K) ) .*(MKk') )    )       )   );% may have problem 

%     thetazfsic1=(ctau*sigma2)/(alpha-alpha*ctau*((1/alpha-1)*...
%     sum(  diag(Losbar2+Losw2).* diag(invhatsigma)  ./ (MKk) ) ...
%     + sum( (  (1-epsilon').*diag(invhatsigma)   )./((diag(Losw2inv)).*(MKk))   )  ) )   ;
%%%%%calculate power allocation 
p=zeros(K,1);

%CHANGED FOR GROUP 
for i=1:K % we got a problem here 
    ig=tempr(i);
    p(i,1)=(thetazfsic*(invhatsigma(i,i)))/((M-K+ig-K/G)*beta(i));
end
%%%%%calculate power allocation
if min(p)>0
    
    %Compute the sum of the uplink user powers. Note that the sum of
    %the downlink powers are the same, due to uplink-downlink duality.
    sumPower=sum(p);
    
else
    
    %Assign a negative value when the SINRs are infeasible.
    sumPower = -1;
end

if sumPower>0
    
    %Compute the EE
    %averagePower = sumPower;
    averagePower = abs(sumPower);
    EEvalue = ( prelogFactor*log2(1+SINR) ) / (  prefixPower*averagePower + circuitpower + AA*prelogFactor*log2(1+SINR)); %Scale to get a reasonable scale!
    EEvalue=EEvalue./scalingFactor;
else
    averagePower = -1;
    %Set the EE to zero when the current SINRs are infeasible
    EEvalue = 0;
    
end
