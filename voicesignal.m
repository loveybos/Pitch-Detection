clear all
close all
x=audioread('test.wav');           %��ȡ�����ļ�
figure(1);stem(x,'.');           %��ʾ�����źŵĲ���

n=200;
for m=1:length(x)/n;           %��ÿһ֡���ʱ����غ���
    for k=1:n;
        Rm(k)=0;
        for i=(k+1):n;
            Rm(k)=Rm(k)+x(i+(m-1)*n)*x(i-k+(m-1)*n);
        end
    end
    p=Rm(10:n);                %��ֹ���У�ȥ��ǰ��10����ֵ�ϴ�ĵ�
    [Rmax,N(m)]=max(p);        %��ȡ��һ������غ���������
end                            
N=N+10;                        %����ǰ��ȥ����10����
T=N/8;                         %�����Ӧ������
figure(2);stem(T,'.');axis([0 length(T) 0 20]);
xlabel('֡��(n)');ylabel('����(ms)');title('��������');

T1= medfilt1(T,7);             %ȥ��Ұ�㣬��ֵƽ��
figure(3);stem(T1,'.');axis([0 length(T1) 0 20]);
xlabel('֡��(n)');ylabel('����(ms)');title('��������');