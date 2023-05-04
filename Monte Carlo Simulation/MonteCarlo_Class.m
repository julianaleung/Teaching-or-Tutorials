clear all;
close all;

%This section prompts the user to provide distributions of input
%parameters.
%Copyright © 2012 Juliana Leung. 

nvar = input('Number of variables: ');
ntrial = input ('Number of trials: ');

for i=1:nvar
    disp (['For variable # ', num2str(i)]);
    type=input('distribution (normal=n, lognormal=l, uniform=u, triangular = t): ', 's');
    switch type
        case 'n'
            mu =input('mean: ');
            stdev=input('standard deviation: ');
            for j=1:ntrial
                value(j,i)=norminv(rand,mu,stdev);
            end
        case 'u'
            minv = input('lower limit : ');
            maxv = input('upper limit : ');
            for j=1:ntrial
                value(j,i)=unifinv(rand,minv,maxv);
            end
       otherwise
            disp ('wrong input');
    end
end


for i=1:nvar
    figure(i);histogram(value(:,i));title(['histogram for variable ', num2str(i)]);
end

save input_value.dat value -ascii;






            
