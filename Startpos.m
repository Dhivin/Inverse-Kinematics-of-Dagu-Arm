function Startpos( thetha1 ,thetha2 ,thetha3 ,thetha4 ,thetha5,tep)

s2=500+(thetha1/0.09);
    s2=int2str(s2);
    s1='# 5 P';
      s3='T3000'
      
     s = strcat(s1,s2,s3)


 fwrite(tep, [s 13 10]);
pause(3);
s2=500+(thetha2/0.09);
    s2=int2str(s2);
    s1='# 6 P';
      s3='T3000'
      
     s = strcat(s1,s2,s3)


 fwrite(tep, [s 13 10]);
pause(3);

s2=1500-(thetha3/0.09);
    s2=int2str(s2);
    s1='# 4 P';
      s3='T3000'
      
     s = strcat(s1,s2,s3)


 fwrite(tep, [s 13 10]);
pause(3);
if(thetha4>180)
s2=1500+(thetha4/0.09);
else
 s2=1500-(thetha4/0.09);   
end   
    s2=int2str(s2);
    
    
    s1='# 3 P';
      s3='T3000'
      
     s = strcat(s1,s2,s3)


 fwrite(tep, [s 13 10]);
pause(3);





end