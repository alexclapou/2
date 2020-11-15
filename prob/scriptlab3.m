%P(x<=0) = P(x<0) U P(x=0)
m = input (" M:")
s = input (" S:")
b = input (" B:")
a = input (" A:")


%a
ex1a1 = normcdf(0,m,s)
ex1a2 = 1-ex1a1
%b
ex1b1= normcdf(1,m,s)
ex1b2=normcdf(-1,m,s)
ex1b=ex1b1-ex1b2
%c

%d
ex1d = norminv(1-b, m, s)

