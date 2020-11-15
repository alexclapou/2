%Generate all permutation of N (N - given) respecting the property: for every 2<=i<=n exists an 1<=j<=i,
%so |v(i)-v(j)|=1.
/*
check_if_exist(L: list, I: Integer)
check_if_exist(i, i)

check_if_exist(l1l2..ln, x) = 
    false, if []
    true, if l1 = x
    check_if_exist(l2..ln, x), otherwise
*/
check_if_exist([H|_], H):-!.
check_if_exist([_|T], H):-check_if_exist(T, H).

/*
generate_number(N: Integer, Z: Integer, NN: Integer)
generate_number(i, i, o)

generate_number(n, x) = 
    x, if x < n
    generate_number(n, x+1), otherwise
*/
generate_number(_, N, N).
generate_number(N, Z, NN):- Z < N, N1 is Z + 1, generate_number(N, N1, NN).

/*
perm(N:Integer, L: List)
perm(i, o)

perm(n) = perm_aux(n, 1, [generate_number(n, 1)])
*/
%reverse
rev([],Z,Z).
rev([H|T],Z,Acc) :- rev(T,Z,[H|Acc]).

cond([H|_], X):- abs(H-X) =<1, !.
cond([_|T], X):- cond(T, X).


perm(N, L):-generate_number(N, 1, I), perm_aux(N, L, 1, [I]).

/*
perm_aux(N:integer, L:list, Lg:integer, Col:list)
(i,o,i,i) 

perm_aux(n, len, col1...coln) =
    col1..coln, if len = n
    perm_aux(n, len+1, X U col1..coln), if abs(col1, X) <= 1 and check_if_exist(X, col1..coln) is false and X = generate_number(n, 1)
*/
perm_aux(N, Col, N, NEW):-rev(Col, NEW, []), !.
perm_aux(N, L, Lg, [H|T]):-generate_number(N, 1, I), cond([H|T], I),  \+ check_if_exist([H|T], I), Lg1 is Lg+1, perm_aux(N, L, Lg1, [I|[H|T]]).

go:-
    perm(5, X),
    print(X).
