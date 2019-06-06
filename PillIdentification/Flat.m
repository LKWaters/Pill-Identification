function [ imf ] = Flat( image)

dir = 'C:\Users\lkwis\Documents\OUT';
if ~isdir(dir)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end


img = imcrop(image,[1,1,159,119]); % crops image to picture
img = imcrop(img,[42,7,95,90]); % crops image to only botom of box

bb = fullfile(dir, sprintf('PillEmpty.png'));
back = imread(bb);
back2 = imcrop(back,[1,1,159,119]); % crops image to picture
back2 = imcrop(back2,[42,7,95,90]);

im = img-back2;

% outlines individual pill
conv = rgb2lab(im);
ab = conv(:,:,2:3);
ab = im2single(ab);
nColors = 2;
pixel_labels = imsegkmeans(ab,nColors,'NumAttempts',3);

mask2 = pixel_labels==2;

%find center
xcen = 0;
ycen = 0;
[xcen,ycen] = FindC(mask2);

Cmask = imcrop(mask2,[xcen-29,ycen-24,54,49]);
Finmask = MaskFill(Cmask);

cluster2 = imcrop(im,[xcen-29,ycen-24,54,49]);
final = cluster2 .* uint8(Finmask);


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

end

