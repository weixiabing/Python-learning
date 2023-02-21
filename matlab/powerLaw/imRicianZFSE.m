function [ZFrate] = imRicianZFSE(Pu, sigma2, K, M, Hest, alpha, H, error )

%%%INPUT:
%Pu: transmission power
%sigma2:channel noise 
%K: number of UE
%M: number of antennas
%Hest: the esitmated channel
%alpha: the ADC resolution coefficienct
%H : the channel fading matrix
%error: channel esitmation error vector UE

%%%OUTPUT:
%ZFrate: SE of ZF receivers for the K UEs


Gzf2=zeros(1,K);

ZFreceiverADCnoise=zeros(1,K);
Gzf=Hest * inv( (Hest') * Hest ) ;%H*inv(H'*H);%

ADCnoise      =   alpha*( 1 - alpha ) * diag( diag( Pu.*(H * H')  + sigma2.*eye(M) )  );

for k1=1:K
    
    Gzf2(1,k1)  =  norm( Gzf(:,k1) ).^2;
    
    ZFreceiverADCnoise(1,k1)=  Gzf(:,k1)'*ADCnoise*Gzf(:,k1);
    
end
%ZFreceiverADCnoise=abs(ZFreceiverADCnoise);

ZFrate(1:K)=log2(1+   (alpha^2 * Pu )./   (alpha^2 * sigma2*Gzf2(1,1:K)  +   ZFreceiverADCnoise(1,1:K)   ...
    + alpha^2 *Pu* sum(error)*Gzf2(1,1:K) )      )          ;











