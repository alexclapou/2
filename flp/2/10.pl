sum([], 0).
sum([X|T], S):-sum(T, S1), S is S1+X.
