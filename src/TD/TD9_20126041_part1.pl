range(X,X).
range(X,K) :- X>64, X<K-1.
readin:-get0(X),process(X).
process(42).
process(X):-X=\=42, range(X,90) -> X1 is X + 32, put(X1), nl, readin; put(X),nl,readin.


# readfile:-see('C:\\Users\\Admin\\Documents\\Prolog\\input.txt'), readin, seen.
# readin:-get0(X), process(X).
# process(-1).
# process(X):-X=\= -1, put(X), readin.

# readnsave(Input,Output):-
# see(Input),tell(Output),readncopy,seen,told.
# readncopy:-get0(X),process1(X).
# process1(-1).
# process1(X):- X=\= -1,put(X),readncopy.

# copyterms(Infile,Outfile):-
# seeing(S),telling(T),
# see(Infile),tell(Outfile),
# copy,
# seen,see(S),told,tell(T).

# copy:-read(X),process(X).
# process(end_of_file).
# process(X):- X \= end_of_file,

# writeq(X),write('.'),nl,
# copy.

# main:- open('input.txt',read,S),
# read(S,H1),
# read(S,H2),
# read(S,H3),
# read(S,H4),
# close(S),
# write([H1,H2,H3,H4]), nl.

main:- open('input.txt',read,Str),
read_houses(Str,Houses),
close(Str),
write(Houses), nl.

read_houses(Stream,[]):-at_end_of_stream(Stream).

read_houses(Stream,[X|L]):-\+ at_end_of_stream(Stream), read(Stream,X), read_houses(Stream,L).

