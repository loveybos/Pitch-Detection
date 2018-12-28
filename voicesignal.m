clear all
close all
x=audioread('test.wav');           %读取声音文件
figure(1);stem(x,'.');           %显示声音信号的波形

n=200;
for m=1:length(x)/n;           %对每一帧求短时自相关函数
    for k=1:n;
        Rm(k)=0;
        for i=(k+1):n;
            Rm(k)=Rm(k)+x(i+(m-1)*n)*x(i-k+(m-1)*n);
        end
    end
    p=Rm(10:n);                %防止误判，去掉前边10个数值较大的点
    [Rmax,N(m)]=max(p);        %读取第一个自相关函数的最大点
end                            
N=N+10;                        %补回前边去掉的10个点
T=N/8;                         %算出对应的周期
figure(2);stem(T,'.');axis([0 length(T) 0 20]);
xlabel('帧数(n)');ylabel('周期(ms)');title('基音周期');

T1= medfilt1(T,7);             %去除野点，中值平滑
figure(3);stem(T1,'.');axis([0 length(T1) 0 20]);
xlabel('帧数(n)');ylabel('周期(ms)');title('基音周期');