function [X] = STFT(x)
%�����ź�x�����STFT����X
x=x(:);              % �����źŵ���������

nw = 512;             % ֡��
nm = 512/2;                          % ֡��
win = hamming(nw+1);
win(end) = []; win = win(:);        % ������
win = win/(0.54*nw/nm);             % �����������ع��������

in=0;
xs = zeros(nw,1);                   % ֡���ݣ����룩
ind=1;
while(in+nm<=length(x))              % �ж���Ҫ����֡�������Ƿ񳬳������ź�(x)���ȣ���������ѭ��
    xs = [xs(nm+1:end);x(in+1:in+nm)];% ȡx��nm������xs��nw-nm��������µ�xs��ʵ��������֡

    XS = fft(xs.*win);              % ��xs�Ӵ���ĸ���Ҷ�任
    X(:,ind)=XS(1:nw/2+1);
    in=in+nm;
    ind=ind+1;
end


end

