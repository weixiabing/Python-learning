function [ZFrateapp] = imRicianZFSEAPP(Pu, sigma2, K, M, alphaapp,hatsigma, errorapp,beta )

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
invhatsigma=inv(hatsigma);

ADCnoiseapp =  alphaapp*( 1 - alphaapp ) * (Pu*sum(beta) + sigma2 );

Gzf2app=zeros(1,K);

for i7=1:K
    Gzf2app(1,i7)  =    invhatsigma(i7,i7) /  (M - K) ;
end
ZFrateapp(1:K)=log2(1+   (alphaapp^2 * Pu) ./   (alphaapp^2 *sigma2*Gzf2app(1,1:K) +   ...
    ADCnoiseapp *  Gzf2app(1,1:K)  +alphaapp^2 *Pu* sum(errorapp)*Gzf2app(1,1:K)     )       )          ;
end












