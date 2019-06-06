function [xcen,ycen] = FindC(mask)

mask1 = imcrop(mask,[9;12;74;85]);

xCentroid = mean(mask1);
yCentroid = mean(mask1');
mod = 0;
xcen = 1;
ycen = 1;

for i =1:75
    if xCentroid(1,xcen)<xCentroid(1,i)
       mod = 0;
       xcen = i;
    elseif xCentroid(1,xcen)==xCentroid(1,i)
        mod = i-xcen;
    end
end
xcen = round(xcen +mod/2)+9;

for i =1:80
    if yCentroid(1,ycen)<yCentroid(1,i)
       mod = 0;
       ycen = i;
    elseif yCentroid(1,ycen)==yCentroid(1,i)
        mod = i-ycen;
    end
end
ycen = round(ycen +mod/2)+12;


if xcen <30
    xcen = 30;
elseif xcen >60
    xcen = 60;
end

if ycen <25
    ycen = 25;
elseif ycen >65
    ycen = 65;
end

end




