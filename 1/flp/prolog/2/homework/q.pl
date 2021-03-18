inserare([], L, L).
inserare([H|T], L, [H|R]):-
   inserare(T, L, R).
subst([], _, _, []).
subs([H|T], E, List, R):-
    H =:=E,
    inserare(List, T, RI),
    subst(RI, E, List, R).
subst([H|T], E, List, [H|R]):-
    H =\= E,
    subst(T, E, List, R).

go:-
    subst([1,2,1,3,1,4],1,[10,11],X),
    print(X).
