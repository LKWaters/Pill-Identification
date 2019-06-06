function [out] = howBroke(image,i)

dir = 'C:\Users\lkwis\Documents\DataBase_Pill';

if ~isdir(dir)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end

img = imcrop(image,[1,1,159,119]); % crops image to picture
img = imcrop(img,[42,7,95,90]); % crops image to only botom of box

back = imread(fullfile(dir, sprintf('Empty(1).png')));
back2 = imcrop(back,[1,1,159,119]); % crops image to picture
back2 = imcrop(back2,[42,7,95,90]);


if i == 5
im3 = img-back2;

image = im2double(im3);
image_mark_red = image(:,:,1) >= 0.45;

BW = MaskFill(image_mark_red);

xcen = 0;
ycen = 0;
[xcen,ycen] = FindC(BW);

Cmask = imcrop(BW,[xcen-29,ycen-24,54,49]);
single = imcrop(im3,[xcen-29,ycen-24,54,49]);

Cmask = MaskFill(Cmask);

final = single .* uint8(Cmask);
elseif i == 6
        
im3 = img-back2;
im2 = im3-(back2+50);
BW = im2bw(im2,0.1);
BW = MaskFill(BW);

xcen = 0;
ycen = 0;
[xcen,ycen] = FindC(BW);

Cmask = imcrop(BW,[xcen-29,ycen-24,54,49]);
single = imcrop(im3,[xcen-29,ycen-24,54,49]);

Cmask = MaskFill(Cmask);

final = single .* uint8(Cmask);

else
im3 = img-back2;
BW = im2bw(im3,0.38);
BW = MaskFill(BW);

xcen = 0;
ycen = 0;
[xcen,ycen] = FindC(BW);

Cmask = imcrop(BW,[xcen-29,ycen-24,54,49]);
single = imcrop(im3,[xcen-29,ycen-24,54,49]);

Cmask = MaskFill(Cmask);

final = single .* uint8(Cmask);
end
%{ 
outlines individual pill
conv = rgb2lab(im);
ab = conv(:,:,2:3);
ab = im2single(ab);
nColors = 2;
pixel_labels = imsegkmeans(ab,nColors,'NumAttempts',3);

mask2 = pixel_labels==1;

%find center
xcen = 0;
ycen = 0;
[xcen,ycen] = FindC(mask2);

Cmask = imcrop(mask2,[xcen-29,ycen-24,54,49]);
Finmask = MaskFill(Cmask);

cluster2 = imcrop(im,[xcen-29,ycen-24,54,49]);
final = cluster2 .* uint8(Finmask);
%}
imf = zeros(1,8250,'double');
x = 1;

for i = 1:55
   for j = 1:50
       for k = 1:3
          imf(1,x) = final(j,i,k);
          x = x+1;
       end
   end
end
out = imf;

end

