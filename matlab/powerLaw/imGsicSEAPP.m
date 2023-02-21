function [ZFGSICrateapp] = imGsicSEAPP(Group,Pu, sigma2, K, M, alphaapp,hatsigma, errorapp,beta )
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

invhatsigma=inv(real(hatsigma));
ADCnoiseapp =  alphaapp*( 1 - alphaapp ) * (Pu*sum(beta) + sigma2 );

n=K/Group ; %the number of UEs in a group
x=((1:Group).*(K/Group))'; % example repeat the group number 
tempr=repmat(x,1,n)';
tempr=tempr(:)';
GSIC2app=zeros(1,K);

for i=1:K % we got a problem here 
    ig=tempr(i);
    GSIC2app(1,i)=(invhatsigma(i,i))/((M-K+ig-K/Group));
end
    ZFGSICrateapp(1:K)=log2(1+   (alphaapp^2 * Pu) ./   (alphaapp^2 *sigma2*GSIC2app(1,1:K) +   ...
    ADCnoiseapp *  GSIC2app(1,1:K)  +alphaapp^2 *Pu* sum(errorapp)*GSIC2app(1,1:K)     )       )          ;
end

