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
        case 'l'
            mu =input('mean of ln(X): ');
            stdev=input('standard deviation of ln(X): ');
            for j=1:ntrial
                value(j,i)=logninv(rand,mu,stdev);
            end
        case 'u'
            minv = input('lower limit : ');
            maxv = input('upper limit : ');
            for j=1:ntrial
                value(j,i)=unifinv(rand,minv,maxv);
            end
        case 't'
            a = input('lower limit: ');
            b = input('upper limit: ');
            c = input('mode: ');
            Fc = (c-a)/(b-a);
            for j=1:ntrial
                x=rand;
                if x<Fc
                    value(j,i)= a+sqrt(x*(b-a)*(c-a));
                else
                    value(j,i)=b-sqrt((1-x)*(b-a)*(b-c));
                end
            end       
        otherwise
            disp ('wrong input');
    end
end


for i=1:nvar
    figure(i);hist(value(:,i));title(['histogram for variable ', num2str(i)]);
end

save input_value.dat value -ascii;

%This section calls the function OV_calc to calculate the value of the
%output variable
for j=1:ntrial
    OV(j,1)=OV_calc(value(j,:));
end
x=min(OV):((max(OV)-min(OV))*0.01):max(OV);
figure(i+1);
subplot(2,1,1);histogram(OV);title('histogram of output variable');
n_elements=histc(OV,x);c_elements = cumsum(n_elements);
subplot(2,1,2);plot(x,c_elements/ntrial);




            
