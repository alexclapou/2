%flow model i o
/*
elem(l1l2..ln)={
    l1
    elem(l2..ln)
    }
*/
elem([H|_], H).
elem([_|T], E):-elem(T, E).

%flow model i i o
/*
sterge(l1l2..ln, x)={
    l2..ln, if l1 = x
    l1 U sterge(l2..ln), if l1 != x
}
*/
sterge([E|R], E, R):-!.
sterge([H|T], E, [H|R]):-sterge(T,E,R).

%flow model i o
/*
*/
perm([], []).
perm(L, [E|RR]):- elem(L, E), sterge(L, E, R), perm(R, RR).

%perm([1,2,3,4], Y),
