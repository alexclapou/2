show([]).
show([A|B]):-
    format(A),
    show(B).
