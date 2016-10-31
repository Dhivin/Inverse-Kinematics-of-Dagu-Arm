function SendAngles(thetha,motorno,tep)
if(motorno==1)
     s1='# 5P'
      s2=500+(thetha/0.09);
end
if(motorno==2)
     s1='# 6P'
      s2=500+(thetha/0.09);
end
if(motorno==3)
     s1='# 4P'
     s2=1500-(thetha/0.09);

end
if(motorno==4)
     s1='# 3P'
     if(thetha>180)
s2=1500+(thetha/0.09);
else
 s2=1500-(thetha/0.09);   
end 
end

if(motorno==5)
     s1='# 2P'
    
end



  
   
    s2=int2str(s2);
    s3='T300'
     s = strcat(s1,s2,s3)

 fwrite(tep, [s 13 10]);





end










