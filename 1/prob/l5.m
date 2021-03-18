data = [7 7 4 5 9 9 4 12 8 1 8 7 3 13 2 1 17 7 12 5 6 2 1 13 14 10 2 4 9 11 3 5 12 6 10 7]
sigma = 5
data_mean = mean(data)
alpha = 0.05
z = norminv(alpha/2)
z1 = norminv(1-alpha/2)
left = data_mean - sigma/sqrt(length(data)) * z1
right = data_mean - sigma/sqrt(length(data)) * z
fprintf("The conf. int for the mean is: (%4.2f,  %4.2f)\n", left, right)


left_1 = ((length(data)-1)