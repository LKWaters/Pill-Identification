function y = Softmax2(x)
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
 
ex = exp(x/(10^expon));
 
y = ex/sum(ex);
 

end


