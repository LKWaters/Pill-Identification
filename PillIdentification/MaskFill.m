function [grain] = MaskFill(mask)

y1 = -1;
y2 = -1;


    for i =10:49
        for j =10:54
           
           if (mask(i,j) == 1) && (mask(i,j+1) == 0)
               y1 = j;
               for x=j+1:48
                   
                   if (mask(i,x) ==0) && (mask(i,x+1) == 1)
                    y2 = x;
                   end 
               end
               
               if  ~(y1==-1)&&~(y2 ==-1)
               for p = y1:y2
                    mask(i,p) = 1;
               end
               y1 = -1;
               y2 = -1;
               
           end
            
        end
        end
    end
    
    
    
    finMask = bwareaopen(mask,50);  
    
    cc = bwconncomp(finMask,4);
    if cc.NumObjects() > 0
    grain = false(size(finMask));
    grain(cc.PixelIdxList{1}) = true;
   
    else
       grain = finMask; 
    end     
end

