%a. Determine the position of the maximal element of a linear list.
%Eg.: maxpos([10,14,12,13,14], L) produces L = [2,5].
/*
max(l1l2..ln)=
    0, if []
    l1, if [l1]
    max(l1, l2l3..ln) otherwise
*/

max([], -99999).
max([H], H).
max([H|T], M):- max(T, FM), H > FM, M is H.
max([H|T], M):- max(T, FM), H =< FM, M is FM, !.

/*
maxpos(l1l2..ln, k1k2..km, pos)=
    [], if []
    pos U maxpos(l2..ln, k1k2..km, pos+1), if l1 = max(k1k2..km)
    maxpos(l2..ln, k1k2..km, pos+1) otherwise
*/

%maxpos(List, List, Position_number, New_list)
%maxpos(i, i, i, o)

maxpos([], _,  _, []):- !.
maxpos([H|T], R, P, [P|NEW]):- max(R, X), X=H, !, P1 is P + 1, maxpos(T, R, P1, NEW).
maxpos([H|T], R, P, NEW):- max(R, X), X\=H, P1 is P + 1, maxpos(T, R, P1, NEW).

go:-
    L = [10,14,12,13,14, 25, 125, 14],
    P = 1,
    maxpos(L, L, P, X),
    print(X).
