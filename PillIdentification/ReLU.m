function y = ReLU(x)
 
 z=0;
 
 for i=1:5
 if abs(x(i)) > z
    z = abs(x(i));
 end
 end
 
 expon = 1;
 
 while (z/10^expon) >10 
    expon = expon+1;
 end

 x=x/10^expon;
 
y = max(0,x);
 
end