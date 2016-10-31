clear all
close all
clc

[handles,tep]=init;
homeposition(tep);
i = 1;

start=[2.3400, 0.000, 6.330];
goal=[9.3400, 0.000, 6.330];
out = min_jerk(start,goal);
 
count=0;
k=size(out);
for i=1:k(1)
    To=[1    0   0   out(i,1);0  0 1  out(i,2); 0  1 0   out(i,3);0 0 0 1];
    nx=To(1,1);
ny=To(2,1);
ox=To(1,2);
oy=To(2,2);
nz=To(3,1);
oz=To(3,2);
dx=To(1,4);
dy=To(2,4);
dz=To(3,4);
ax=To(1,3);
ay=To(2,3);
az=To(3,3);
%%Inverse kinematics starts here
%%Thetha 1
thetha1=atan2d(dy,dx);

%%Thetha 5
thetha5=atan2d(-oz,nz);

c1=cosd(thetha1);
s1=sind(thetha1);

%%Thetha234
thetha234=atan2d(oz,c1*ox+s1*oy);
if(thetha234<0)
thetha234=thetha234+180;
end

c234=cosd(thetha234);
s234=sind(thetha234);
x=3.15;
y=3.19;
z=7.75;

%%Thetha 3
den4=(((dx*c1+dy*s1+z*s234)^2)+((dz-z*c234)^2)-(x^2)-(y^2));
den4=den4/(2*x*y);
lol=1-(den4^2);
num4=sqrt(lol);
num4=real(num4);
thetha3=atan2d(num4,den4);

%Thetha 2
c3=cosd(thetha3);
s3=sind(thetha3);

sine2a=((c3*y+x)*(dz-z*c234))-(s3*y*(dx*c1+s1*dy+z*s234));
lilly=((c3*y+x)^2)+((s3*y)^2);
sine2=sine2a/lilly;

cos2a=((c3*y+x)*(dx*c1+s1*dy+z*s234))+(s3*y*(dz-z*c234));
cos2=cos2a/lilly;
thetha2=atan2d(sine2,cos2);

%Thetha 4
thetha4=thetha234-thetha2-thetha3;

%Cross checking the answer
[A1,A2,A3,A4,A5]=makeHomogeneousTransformations(thetha1,thetha2,thetha3,thetha4,thetha5);
T0_5 = A1*A2*A3*A4*A5;

calculated_pose=[round(T0_5(1,4)),round(T0_5(2,4)),round(T0_5(3,4))];
real_pose=[round(out(i,1)),round(out(i,2)),round(out(i,3))];

if (real_pose(1)~=calculated_pose(1))

    thetha1=atan2d(dy,dx);
if(thetha1<0)
thetha1=thetha1+180;
end
%%Thetha 5
thetha5=atan2d(-oz,nz);
if(thetha5<0)
thetha5=thetha5;
end
c1=cosd(thetha1);
s1=sind(thetha1);

%%Thetha234
thetha123=atan2d(oz,c1*ox+s1*oy);

thetha234=thetha123;

c234=cosd(thetha234);
s234=sind(thetha234);
x=3.15;
y=3.19;
z=7.75;

%%Thetha 3
den4=(((dx*c1+dy*s1+z*s234)^2)+((dz-z*c234)^2)-(x^2)-(y^2));
den4=den4/(2*x*y)
lol=1-(den4^2);
num4=sqrt(lol);
num4=real(num4)
thetha3=atan2d(num4,den4);

%Thetha 2
c3=cosd(thetha3);
s3=sind(thetha3);

sine2a=((c3*y+x)*(dz-z*c234))-(s3*y*(dx*c1+s1*dy+z*s234));
lilly=((c3*y+x)^2)+((s3*y)^2);
sine2=sine2a/lilly;

cos2a=((c3*y+x)*(dx*c1+s1*dy+z*s234))+(s3*y*(dz-z*c234));
cos2=cos2a/lilly;
thetha2=atan2d(sine2,cos2);

%Thetha 4
thetha4=thetha234-thetha2-thetha3;

end


[A1,A2,A3,A4,A5]=makeHomogeneousTransformations(thetha1,thetha2,thetha3,thetha4,thetha5);
T0_5 = A1*A2*A3*A4*A5;

calculated_pose=[round(T0_5(1,4)),round(T0_5(2,4)),round(T0_5(3,4))];
real_pose=[round(out(i,1)),round(out(i,2)),round(out(i,3))];

if (real_pose(1)~=calculated_pose(1))
     fprintf('You suck');
    thetha1=atan2d(dy,dx);
if(thetha1<0)
thetha1=thetha1+180;
end
%%Thetha 5
thetha5=atan2d(-oz,nz);
if(thetha5<0)
thetha5=thetha5+180;
end
c1=cosd(thetha1);
s1=sind(thetha1);

%%Thetha234
thetha123=atan2d(oz,c1*ox+s1*oy);

thetha234=thetha123;

c234=cosd(thetha234);
s234=sind(thetha234);
x=3.15;
y=3.19;
z=7.75;

%%Thetha 3
den4=(((dx*c1+dy*s1+z*s234)^2)+((dz-z*c234)^2)-(x^2)-(y^2));
den4=den4/(2*x*y)
lol=1-(den4^2);
num4=sqrt(lol);
num4=real(num4)
thetha3=atan2d(num4,den4);

%Thetha 2
c3=cosd(thetha3);
s3=sind(thetha3);

sine2a=((c3*y+x)*(dz-z*c234))-(s3*y*(dx*c1+s1*dy+z*s234));
lilly=((c3*y+x)^2)+((s3*y)^2);
sine2=sine2a/lilly;

cos2a=((c3*y+x)*(dx*c1+s1*dy+z*s234))+(s3*y*(dz-z*c234));
cos2=cos2a/lilly;
thetha2=atan2d(sine2,cos2);

%Thetha 4
thetha4=thetha234-thetha2-thetha3;

end
[A1,A2,A3,A4,A5]=makeHomogeneousTransformations(thetha1,thetha2,thetha3,thetha4,thetha5);
T0_5 = A1*A2*A3*A4*A5;

calculated_pose=[round(T0_5(1,4)),round(T0_5(2,4)),round(T0_5(3,4))];
real_pose=[round(out(i,1)),round(out(i,2)),round(out(i,3))];

if (real_pose(1)~=calculated_pose(1))
thetha123=atan2d(oz,c1*ox+s1*oy);

thetha234=thetha123+180;

c234=cosd(thetha234);
s234=sind(thetha234);
x=3.15;
y=3.19;
z=7.75;

%%Thetha 3
den4=(((dx*c1+dy*s1+z*s234)^2)+((dz-z*c234)^2)-(x^2)-(y^2));
den4=den4/(2*x*y)
lol=1-(den4^2);
num4=sqrt(lol);
num4=real(num4)
thetha3=atan2d(num4,den4);

%Thetha 2
c3=cosd(thetha3);
s3=sind(thetha3);

sine2a=((c3*y+x)*(dz-z*c234))-(s3*y*(dx*c1+s1*dy+z*s234));
lilly=((c3*y+x)^2)+((s3*y)^2);
sine2=sine2a/lilly;

cos2a=((c3*y+x)*(dx*c1+s1*dy+z*s234))+(s3*y*(dz-z*c234));
cos2=cos2a/lilly;
thetha2=atan2d(sine2,cos2);

%Thetha 4
thetha4=thetha234-thetha2-thetha3;
 
end
[A1,A2,A3,A4,A5]=makeHomogeneousTransformations(thetha1,thetha2,thetha3,thetha4,thetha5);
T0_5 = A1*A2*A3*A4*A5;

calculated_pose=[round(T0_5(1,4)),round(T0_5(2,4)),round(T0_5(3,4))];
real_pose=[round(out(i,1)),round(out(i,2)),round(out(i,3))];

if (real_pose(1)~=calculated_pose(1))
    count=count+1;
    test1(count,:)=[i*.2 thetha1 thetha2 thetha3 thetha4 thetha5];
 
end
s(i)=thetha234;
if i==1
   Startpos( thetha1 ,thetha2 ,thetha3, thetha4 ,thetha5,tep);
   l=[thetha1 thetha2 thetha3 thetha4 thetha5];
    tm(i,:)=l;
    
    updateArm('unused', handles,l);
else

SendAngles(thetha1,1,tep);
SendAngles(thetha2,2,tep);
SendAngles(thetha3,3,tep);
SendAngles(thetha4,4,tep);

end
    l=[thetha1 thetha2 thetha3 thetha4 thetha5];
    tm(i,:)=l;
    
    updateArm('unused', handles,l);
 time(i)=0.2*i;
end
fclose(tep)

angles1=tm(:,1);
angles2=tm(:,2);
angles3=tm(:,3);
angles4=tm(:,4);
angles5=tm(:,5);
figure
subplot(3,2,1)
xlabel('-2\pi < x < 2\pi') % x-axis label
ylabel('sine and cosine values') % y-axis label
plot(time,angles1);
subplot(3,2,2)
plot(time,angles2);
subplot(3,2,3)
plot(time,angles3);
subplot(3,2,4)
plot(time,angles4);
subplot(3,2,5)
plot(time,s);
