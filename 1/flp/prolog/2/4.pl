/*
likes(john, peter).
likes(john, mini).
likes(john, nikole).
likes(john, angelina).
isbird(X):-animal(X), feathers(X).
issister(X, Y):-female(X), parents(X, n, f), parents(Y, n, f).
likes(john, X):-person(X).
likes(john, X):-likes(X, wine).
likes(john, X):-likes(X, wine), likes(X, food).
may_steal(john, X):-thief(john), likes(john, X).
likes(mary, wine).
likes(bob, beer).
likes(wini, apple).
likes(charlie, wine).
likes(john, X):-likes(X, wine).
*/
thief(wini).
thief(john).
thief(william).
likes(wini, ball).
likes(william, shoe).
likes(john, snow).
likes(john, dollar).

may_steal(john, X):-thief(john), likes(john, X).
