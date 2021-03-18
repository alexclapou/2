p = input("input p: ");
N = input("number of simulations: ");
v = rand(N,1)';

for i=1; N;
  if v(i) > p
    x(i) = 0
  else
    x(i) = 1
  endif
endfor
unique_values = unique(x);
unique_values_frequencies = histc(x, unique_values);
unique_values_probabilities = unique_values_frequencies / N;
