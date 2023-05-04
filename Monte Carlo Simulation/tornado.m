%It calculates the tornado chart using the input_value.dat + user-input of mean values.
%Copyright © 2012 Juliana Leung. 

clear all;
clc;
load input_value.dat;
I=input_value;
[ntrial nvar]=size(I);

disp('Input values for the mean scenario: ')
for i=1:nvar
    x(1,i)=input(['variable ', num2str(i), ' = ']);
end
mean_scenario=OV_calc(x(1,:));

for i=1:nvar
    for j=1:nvar
        if i==j
            value(:,j)=I(:,i);
        else
            value(:,j)=ones(ntrial,1)*x(1,j);
        end
    end
    for k=1:ntrial
        OV(k,i)=OV_calc(value(k,:));
    end
    Y(i,:)=[min(OV(:,i))-mean_scenario,max(OV(:,i))-mean_scenario];
end

bar(Y)






    