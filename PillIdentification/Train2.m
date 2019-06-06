load('TestData.mat');
load('DeepNeuralNetwork3.mat')

input_Image = X;

correct_Output = y;
 
%for first time use un-comment these for a random array of weights
%w1 = 2*rand(4455,8250)-1;

%w2 = 2*rand(2940,4455)-1;
 
%w3 = 2*rand(1940,2940)-1;
 
%w4 = 2*rand(6,1940)-1;
 
for epoch = 1:10000 %number of iterations through NN
 disp(epoch);
[w1, w4] = DeepLearning2(w1, w4, input_Image, correct_Output);  

if rem(epoch,10)
    save('DeepNeuralNetwork3.mat')
end
 end