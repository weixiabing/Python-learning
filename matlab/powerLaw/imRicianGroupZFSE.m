function [GroupZFrate] = imRicianGroupZFSE(Group,Pu, sigma2, K, M, H1, alpha, H, error )

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

Gweight2=zeros(1,K);%placeholders
ZFreceiverADCnoise=zeros(1,K);%placeholders

for stage=1:K/Group:K
    Hstage=H1(:,stage:K); % cancel the upper stage and creat the new H for this stage
    temp=Hstage*(Hstage'*Hstage)^(-1); % THE WEIGHT MATRIX FOR THIS STAGE WHICH MENAS ALL THE UPPER LAYERS HAVE BEEN CANCELLED
    Gweight(:,stage:(stage+(K/Group-1)))= temp(:,1:(K/Group));% weight matrix based on the estimated channel "Hest"
end

ADCnoise      =   alpha*( 1 - alpha ) * diag( diag( Pu.*(H * H')  + sigma2.*eye(M) )  );

for k1=1:K
    Gweight2(1,k1)=norm(Gweight(:,k1)).^2;
    ZFreceiverADCnoise(1,k1)=  Gweight(:,k1)'*ADCnoise*Gweight(:,k1);
    
end

GroupZFrate(1:K)=log2(1+   (alpha^2 * Pu )./   (alpha^2 * sigma2*Gweight2(1,1:K)  +   ZFreceiverADCnoise(1,1:K)   ...
    + alpha^2 *Pu* sum(error)*Gweight2(1,1:K) )      )          ;