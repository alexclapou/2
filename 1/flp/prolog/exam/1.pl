candidat(E,[E|_]).
candidat(E,[_|T]):-candidat(E,T).

conditie(L, K, S, Lg, Sum, H, E):-
    Lg<K,
    candidat(E, L),
    E < H,
    Sum1 is Sum + E,
    Sum1 =< S.
 
comb(L, K, S, C, Lg, Sum, [H|T]):-conditie(L, K, S, Lg, Sum, H, E),
    Lg1 is Lg+1,
    Sum1 is Sum + E,
    comb(L, K, S, C, Lg1, Sum1, [E|[H|T]]).

go():-
    %X = [[2, 4], 3, [1], [2, 7, 5], 6, [3, 2]],
    Y = [1,2,3,4,5],
    %Z=3,
    comb([1,2,3,4,5],3,9,Q,0,0,[1,2,3,4,5]),
    print(X).
