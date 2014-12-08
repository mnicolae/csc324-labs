first([X|_], X). 

rest([_|R], R).

cons(Item, List, NewList) :- append([Item], List, NewList).

elem(X, [X|_]).
elem(X, [_|T]) :- elem(X, T). 

accRev([H|T], A, R) :- accRev(T, [H|A], R).
accRev([], A, A).

myReverse(L, R) :- accRev(L, [], R).

myLength([], 0).
myLength([_|T], N) :- M is N - 1, myLength(T, M).

listRef([H|_], 0, H).
listRef([_|T], N, X) :- M is N-1, listRef(T, M, X).
