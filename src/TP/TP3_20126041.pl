% EX1:

alterner(L,[],L).
alterner([],L,L).
alterner([X|L1],L2,[X|L3]) :- alterner(L2,L1,L3).


% EX2:


fleche(v1,v2,20).
fleche(v1,v3,10).
fleche(v1,v4,30).
fleche(v1,v5,5).
fleche(v1,v6,15).
fleche(v2,v3,15).
fleche(v3,v4,10).
fleche(v3,v6,15).
fleche(v5,v4,9).
fleche(v6,v5,7).

%traverser(X,X).
%traverser(X,Y):- fleche(X,Z,_),  write(X), write(' to '), write(Z),nl,traverser(Z,Y).

traverser(Y,Y,[],0):-!.
%traverser([],Y,Y,A)
traverser(X,Y,[X|H],A):- fleche(X,Z,A1), write(X), write(' to '), write(Z),write(', weight: '),write(A1), nl ,traverser(Z,Y,H,A2), A is A1 + A2,write(',total weight: '), write(A).
