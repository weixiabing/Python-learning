function [ZFGSICrateapp] = RicianZFGSICSEAPP(G,P, sigma2, K, M, alphaapp,Sigma, beta )

%%%INPUT:
%K: number of UE
%M: number of antennas
%beta: the large scale fading of channel
%beta1: the large scale fading of the estimated channel i.e. \delta^2 in the note
%Kn: K factor
%Hest: the esitmated channel
%alpha: the ADC resolution coefficienct
%H : the channel fading matrix
%error: cahnnel esitmation error for ever UE : BMSE?????
%Losw,    Losbar  ,  Hbar: the coefficienct in rician fading channel
%%%OUTPUT:
%ZFrate: SE for MRC from UE1 to UEK
%ZFrateapp: the corresponding approximation results

%hatsigma=BETA1*Losw^2+(BETA./M)*(   Losbar * (Hbar')  * Hbar * Losbar);
if P == -1 
    ZFGSICrateapp = 0 ;
else 
Pu=P/K;
invsigma=inv(Sigma);
ADCnoiseapp =  alphaapp*( 1 - alphaapp ) * (sum(Pu.*beta) + sigma2 );

Gzf2app=zeros(1,K);

n=K/G;
x=((1:G).*(K/G))'; % example repeat the group number 
tempr=repmat(x,1,n)';
tempr=tempr(:)';
MKk=(M-K-(K/G)+tempr)';%%%CHANGED FOR GROUP
for i7=1:K
    Gzf2app(1,i7)  =    invsigma(i7,i7) /  (beta(i7,1)*(MKk(i7)) );
end
ZFGSICrateapp(1:K)=log2(1+   (alphaapp^2 * Pu) ./   (alphaapp^2 *sigma2*Gzf2app(1,1:K) +   ...
    ADCnoiseapp *  Gzf2app(1,1:K)      )       )          ;
end

