remove(_, [], []).
remove(1,[_|T],T):- !.
remove(N,[H|T],[H|R]):- N1 is N-1, remove(N1,T,R).

subs([], _, _, []).
subs([X|T], S, X, [S|R]):- !, subs(T, S, X, R).
subs([D|T], S, X, [D|R]):- subs(T,S,X,R). %D \= X, subs(T, S, X, R).

go:-
    L=[1,2,3,4,3],
    S=[5,5,5,5],
    subs(L, S, 3, N),
    print(N).

/*
remove(l1l2..ln, N)=
    [], if list empty
    [l2l3..ln], if N = 1
    l1 U remove(l2l3..ln, N-1) if N != 1


subs(l1l2..ln, s1s2..sn, X)=
    [], if list empty
    s1s2..s2 U subs(l2..ln, s1s2..sn, X), if l1 = X
    l1 U subs(l2..ln, s1s2..sn, X), if l1 != X
    */


gcd(0, A, A):- A > 0, !.
gcd(A, B, R):- A >= B, R1 is A-B, gcd(R1,B,R).
gcd(A, B, R):- A < B, R1 is B-A, gcd(R1,A,R).
gcd_in_list([], R):- R is 0, !.
gcd_in_list(H, H):- !.
gcd_in_list([H|[S|T]], R):- gcd(H,S,H), R is H, gcd_in_list([S|T], R).
