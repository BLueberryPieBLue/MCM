clc,clear
a=[130,10.3,0.35,2.76;105,10.7,0.4,2.0;20,1.4,4.5,0.22;
30,6.26,0.25,1.67;20,10.13,0.5,0.23];
b=[1,4,23,110,660;0.09,0.36,1.8,7.1,27.1;
37,12,2.4,0.55,0.17;0.02,0.06,0.31,1.2,4.6];
c=a./repmat(max(a),size(a,1),1);
c(:,3)=min(a(:,3))./a(:,3)
d=b./repmat(max(b,[],2),1,size(b,2));
d(3,:)=min(b(3,:))./b(3,:)
mu=mean(b');
sigma=std(b');
w=sigma./mu;
w=w/sum(w)
x=dist(c,d)
y=mandist(c,d)
