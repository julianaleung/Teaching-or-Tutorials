%This function calculates the output parameter (OV) 
%**** NEED TO CHANGE THE FOLLOWING LINE FOR DIFFERENT CASES****
%**** This is just an example!!!! ****
%Copyright © 2012 Juliana Leung. 

function fval=OV_calc(x)

s=size(x);

fval=0;
for i=1:s(2)
    fval=fval+x(i);
end

