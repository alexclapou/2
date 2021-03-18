elem([H|_], H).
elem([_|T], E):-elem(T, E).

sterge([E|R], E, R):-!.
sterge([H|T], E, [H|R]):-sterge(T,E,R).

subm([], []).
subm([H|T], [H|R]):-subm(T, R).
subm([_|T], R):-subm(T, R).

%subm([1,2,3,4], R).
