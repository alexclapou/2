candidat(E,[E|_]).
candidat(E,[_|T]):-candidat(E,T).



perm([], []).
perm([E|T], P) :-
    perm(T, L),
    insereaza(E, L, P). % (i, i, o)


pe toate pozitiile
insereaza(E, L, [E|L]).
insereaza(E, [H|T], [H|Rez]) :-
insereaza(E, T, Rez).


comb([H|_], 1, [H]).
comb([_|T], K, C) :-
comb(T, K, C).
comb([H|T], K, [H|C]) :-
K > 1,
K1 is K-1,
comb(T, K1, C).


 len([], 0).
 len([_|T], R1):- len(T, R), R1 is R + 1.
 elim([], [], _).
 elim([H|T], R, NR):- is_list(H), len(H, X), 0 is mod(X, 2), NR > 0, NR1 is NR - 1, !, elim(T, R, NR1)


f(1, 1):-!.
f(2, 2):-!.
f(K, X):-K1 is K-1,
        f(K1, Y),
        aux(Y,K,X).
        /*
        Y>1,
        !,
        K2 is K-2,
        X=K2.
f(K, X):-K1 is K-1,
        f(K1,X).
        */
aux(Y, K, X):-Y>1,
              !, 
              K2 is K-2,
              X=K2.
aux(Y, _, Y).


min([A], A).
min([H|T], OUT):- min(T, R), aux(H, R, OUT).
aux(H, R, OUT):-
        H >= R,
        !,
        OUT = R.
aux(H, _, H).



min([A], A).
min([H|T], H):- min(T, R), H < R, !.
min([_|T], R):- min(T, R).


par([], []).
par([H|T], [H|R]):- 0 is mod(H, 2),!, par(T, R).
par([H|T], R):- 1 is mod(H, 2), par(T, R).


inv([], Col, Col).
inv([H|T], Col, R):- inv(T, [H|Col], R).


add([], X, [X]).
add([H|T], X, [H|R]):- add(T, X, R).


member([H|_], H):-!.
member([_|T], R):-member(T, R).


fac(0, 1):-!.
fac(N, R1):- N > 0, N1 is N - 1, fac(N1, R), R1 is R * N.


loc([], [], _).
loc([H|T], R, H):-loc(T, R, H).
loc([H|T], [H|R], X):- loc(T, R, X)

