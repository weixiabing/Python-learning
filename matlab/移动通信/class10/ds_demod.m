%����cΪʹ�õ�α�����
%����yΪ��Ƶ��Ϣ�ź�
%����yΪ�õ��Ľ�������ź�
function x = ds_demod(c,y)
tmp=reshape(y,length(c),length(y)/length(c));
tmp=tmp';
x=tmp*c;
x=x';
end
