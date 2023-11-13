%EX1:
main:- open('sortieavecformat.txt',write,S),

tab(S,8), write(S,un), nl(S), tab(S,4),write(S,deux), tab(S,4), write(S,trois), nl(S), tab(S,4), write(S,quatre), tab(S,4),write(S,cinq), tab(S,4),write(S,six),
close(S).

%EX2:
main2:- open('sortieavecformat.txt',read,S), get_code(S,X), readMot(X,S,L), print(L), close(S).

readMot(-1,_,[]).
readMot(ASCII,Mots,[X|Y]):-checkCharAndReadRest(ASCII,Chars,Mots), atom_codes(X,Chars),get_code(Mots,ASCII_1),readMot(ASCII_1,Mots,Y).

checkCharAndReadRest(10, [], _):- !.
checkCharAndReadRest(46, [], _):- !.
checkCharAndReadRest(44, [], _):- !.
checkCharAndReadRest(9, [], _):- !.
checkCharAndReadRest(32, [], _):- !.
checkCharAndReadRest(-1, [], _):- !.
checkCharAndReadRest(Char,[Char|Chars],S):-get_code(S,NextChar), checkCharAndReadRest(NextChar,Chars,S).

print([]).
print([X|Y]):- X \= '',writeln(X), print(Y).
print([X|Y]):- X == '',print(Y).

%EX3:

main3:- open('sortieavecformat.txt',read,S), get_code(S,X), readMots(X,S,L),mem(L), close(S).

readMots(-1,_,[]).
readMots(ASCII,Mots,[X|Y]):-checkCharAndReadRest(ASCII,Chars,Mots), atom_codes(X,Chars),get_code(Mots,ASCII_1),readMot(ASCII_1,Mots,Y),!.

checkCharAndReadRests(10, [], _):- !.
checkCharAndReadRests(46, [], _):- !.
checkCharAndReadRests(44, [], _):- !.
checkCharAndReadRests(9, [], _):- !.
checkCharAndReadRests(32, [], _):- !.
checkCharAndReadRests(-1, [], _):- !.
checkCharAndReadRests(Char,[Char|Chars],S):-get_code(S,NextChar), checkCharAndReadRest(NextChar,Chars,S).


mem([]).
mem([X|Y]):-check(X,[X|Y],Z), delete_dup(X,[X|Y], L),mem(L).
check(X,[],0).
check(X,[H|T],Z):- X == H, check(X,T,A),Z is 1+A,write(X), write(" "), write(Z),nl.
check(X,[H|T],Z):- check(X,T,Z).



delete_dup(_,[],[]).
delete_dup(X,[X|T],R):- delete_dup(X,T,R).
delete_dup(X,[H|T],[H|R]) :- delete_dup(X,T,R).
