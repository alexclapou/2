/*
[1, [2, 3], [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] =>
[1, [2], [1, 3], 3, 6, [2], 5, [1, 2, 3], 7]

max(l1l2..ln)=
    l1, if n = 1
    max(l1, l2l3..ln) otherwise

max(L: list, M: Integer, X: Integer)
max(i, i, o)
*/

max([], -99999).
max([H|T], X):- max(T, M), H > M, X is H.
max([H|T], X):- max(T, M), H =< M, X is M, !.

/*
maxpos(l1l2..ln, k1k2..km, pos)=
    [], if []
    pos U maxpos(l2..ln, k1k2..km, pos+1), if l1 = max(k1k2..km)
    maxpos(l2..ln, k1k2..km, pos+1) otherwise

maxpos(L: list, L1: list, P: Integer, X:Integer)
maxpos(i, i, i, o)
*/

maxpos([], _,  _, []):- !.
maxpos([H|T], R, P, [P|NEW]):- max(R, X), X=H, !, P1 is P + 1, maxpos(T, R, P1, NEW).
maxpos([H|T], R, P, NEW):- max(R, X), X\=H, P1 is P + 1, maxpos(T, R, P1, NEW).

/*
replace(l1l2..ln) = 
    [], if []
    maxpos(l1) U replace(l2..ln), if l1 is sublist
    l1 U replace(l2..ln), otherwise

*
replace(L: List, N:List)
replace(i, o)
*/
replace([], []).
replace([H|T], [POS|Res]):-is_list(H), maxpos(H, H, 1, POS), replace(T, Res), !.
replace([H|T], [H|X]):- replace(T, X).

go:-
    L = [1, [2, 3], [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7], 
    replace(L, X),
    print(X).
