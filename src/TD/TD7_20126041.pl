scalarMult(X,[],[]).
scalarMult(X,[T1|Q1],[T2|Q2]):- is(T2,*(T1,X)), scalarMult(X,Q1,Q2).


accDot([],[],A,A).
accDot([T1|Q1], [T2|Q2], A, X) :- is(Anew,+(A,*(T1,T2))), accDot(Q1, Q2, Anew, X).
dotProduct(Vector1, Vector2, X) :- accDot(Vector1, Vector2, 0, X).


puissant(X,0,1).
puissant(X,Y,Z):- Y >  0, !, Y1 is Y-1, puissant(X,Y1,Z1), Z is X * Z1.

fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, F) :- N > 1, N1 is N-1, fibonacci(N1, F1), N2 is N-2, fibonacci(N2, F2), F is F1+F2.

even(X) :- Y is mod(X, 2), Y =:= 0.
odd(X) :- Y is X + 1, even(Y).

somme_des_impairs([],0).      
somme_des_impairs([T|Q], S) :- odd(T), somme_des_impairs(Q, Y), S is Y + T.
somme_des_impairs([T|Q], S) :- even(T), somme_des_impairs(Q, S).  

somme_des_pairs([],0).      
somme_des_pairs([T|Q], S) :- even(T), somme_des_pairs(Q, Y), S is Y + T.
somme_des_pairs([T|Q], S) :- odd(T),somme_des_pairs(Q, S). 

nombre_des_pairs([], 0).
nombre_des_pairs([T|Q], N):- nombre_des_pairs(Q, N1), even(T), N is N1+1.
nombre_des_pairs([T|Q], N):- nombre_des_pairs(Q, N1), odd(T), N is N1.