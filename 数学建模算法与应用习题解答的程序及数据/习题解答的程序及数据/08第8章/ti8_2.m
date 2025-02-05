clc,clear
dd=textread('data82.txt'); %把全部原始数据保存到纯文本文件data82.txt中
yt=dd([2:2:end],:); yt=yt'; yt=nonzeros(yt); %提取零售总额数据并变成列向量
n=length(yt); alpha=0.3; st0=mean(yt(1:3))
st1(1)=alpha*yt(1)+(1-alpha)*st0;
st2(1)=alpha*st1(1)+(1-alpha)*st0;
st3(1)=alpha*st2(1)+(1-alpha)*st0;
for i=2:n
    st1(i)=alpha*yt(i)+(1-alpha)*st1(i-1);
    st2(i)=alpha*st1(i)+(1-alpha)*st2(i-1);
    st3(i)=alpha*st2(i)+(1-alpha)*st3(i-1);
end
xlswrite('lingshou.xls',[st1',st2',st3'])  %把数据写在前三列
at=3*st1-3*st2+st3;
bt=0.5*alpha/(1-alpha)^2*((6-5*alpha)*st1-2*(5-4*alpha)*st2+(4-3*alpha)*st3);
ct=0.5*alpha^2/(1-alpha)^2*(st1-2*st2+st3);
yhat=at+bt+ct;
xlswrite('lingshou.xls',yhat','Sheet1','D2')  %把数据写在第4列第2行开始的位置
plot(1:n,yt,'D',2:n,yhat(1:end-1),'*')
legend('实际值','预测值',2)  %图注显示在左上角
xishu=[ct(end),bt(end),at(end)]; %二次预测多项式的系数向量
yuce=polyval(xishu,[1:3])  %求预测多项式自变量取值为1,2，3时的值
