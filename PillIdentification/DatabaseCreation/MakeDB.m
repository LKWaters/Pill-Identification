dir = 'C:\Users\lkwis\Documents\DataBase_Pill'; %pill database location

if ~isdir(dir)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end

ImageList = zeros(600,8250,'double');
AnsKey = zeros(600,6,'double');
for i = 1:100
  ImageList(i,:) = howBroke(imread(fullfile(dir, sprintf('Tylenol(%d).png', i))),1);
  AnsKey(i,:) = [1,0,0,0,0,0];
  ImageList(100+i,:) = howBroke(imread(fullfile(dir, sprintf('Asprin(%d).png', i))),2);
  AnsKey(100+i,:) = [0,1,0,0,0,0];
  ImageList(200+i,:) = howBroke(imread(fullfile(dir, sprintf('Empty(%d).png', i))),3);
  AnsKey(200+i,:) = [0,0,1,0,0,0];
  ImageList(300+i,:) = howBroke(imread(fullfile(dir, sprintf('Pepcid(%d).png', i))),4);
  AnsKey(300+i,:) = [0,0,0,1,0,0];
  ImageList(400+i,:) = howBroke(imread(fullfile(dir, sprintf('Advil(%d).png', i))),5);
  AnsKey(400+i,:) = [0,0,0,0,1,0];
   ImageList(500+i,:) = howBroke(imread(fullfile(dir, sprintf('Acetaminophen(%d).png', i))),6);
   AnsKey(500+i,:) = [0,0,0,0,0,1];
end



X = ImageList;
y = AnsKey;

save('TestData.mat','X','y');

