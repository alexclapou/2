A = [1,0,-2;2,1,3;0,1,0]
B = [2,1,1;1,0,-1;1,1,0]
C = A - B
D = A * B
E = A.*B
x = 0:0.1:3;
subplot(3, 1, 1);
plot(x, fiTrst_function(x), "bx")
title("(x^5)/10")
legend("XASDASD")
subplot(3,1,2);
plot(x, x.*sin(x), "rp")
title("x*sin(x)")
subplot(3,1,3)
plot(x, cos(x), "cd")
title("cos(x)")