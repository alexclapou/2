
elem([H|_], H).
elem([_|T], E):-elem(T, E).

sterge([E|R], E, R):-!.
sterge([H|T], E, [H|R]):-sterge(T,E,R).

comb([], 0, []).
comb([H|T], K, [H|R]):- K1 is K-1, comb(T, K1, R).
comb([_|T], K, R):-comb(T, K, R).

perm([], []).
perm(L, [E|RR]):- elem(L, E), sterge(L, E, R), perm(R, RR).

aranj(L, K, RR):-comb(L, K, R), perm(R, RR).

%aranj([1,2,3,4], 3, R).
