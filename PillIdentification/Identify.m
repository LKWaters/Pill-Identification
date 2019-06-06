function [identification] = Identify(expected)

load('DeepNeuralNetwork3.mat');
load('TestData.mat');

dir = 'C:\Users\lkwis\Documents\DataBase_Pill'; %the location o the pill picture you wsh to identify
if ~isdir(dir)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end

im = fullfile(dir, sprintf('Pill.png'));

NewImage = Flat(imread(im));


input_Image = NewImage';
 
input_of_hidden_layer1 = w1*input_Image;
 
output_of_hidden_layer1 = ReLU(input_of_hidden_layer1);

%{
extra hiden layers if desired, change line 35 to: input_of_output_node = w4*output_of_hidden_layer3;
input_of_hidden_layer2 = w2*output_of_hidden_layer1;
 
output_of_hidden_layer2 = ReLU(input_of_hidden_layer2);
 
input_of_hidden_layer3 = w3*output_of_hidden_layer2;
 
output_of_hidden_layer3 = ReLU(input_of_hidden_layer3);
%}
 
input_of_output_node = w4*output_of_hidden_layer1;
 
final_output = Softmax2(input_of_output_node);

x = 1;
for i = 1:6
    if expected(i,1) == 1
        break
    else
        x = x+1;
    end 
end

if (expected(x,1)-final_output(x,1)) <= 0.5
    identification = '1';
else
    identification = '0';
end

print(identification);

end

