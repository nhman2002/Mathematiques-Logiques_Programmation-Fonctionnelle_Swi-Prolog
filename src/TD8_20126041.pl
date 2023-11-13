%EX de DCG
%ex1
s1-->[].
s1 -->[a], s1, [b].

%ex2
s2-->[s1].
s2-->[a], s1, [b].

%ex3
s3-->[].
s3-->[a], s3, [b], [b].

%ex4
palindrome_pair-->[].
palindrome_pair--> [a], palindrome_pair, [a].
palindrome_pair--> [b], palindrome_pair, [b].

%ex5
palindrome_impair--> [b], palindrome_impair, [b].
palindrome_impair--> [a], palindrome_impair, [a].
palindrome_impair-->[a].
palindrome_impair-->[b].


%EX de la page 24

s --> sn(Nombre), sv(Nombre).
sn(Nombre) --> nom(Nombre).
sn(Nombre) --> det(Nombre), nom(Nombre).
sn(Nombre) --> det(Nombre), s_adj(Nombre,_), nom(_).
sv(Nombre) --> vi(Nombre).
sv(Nombre) --> vt(Nombre), sn(_).
s_adj(Nombre, T) --> adj1(Nombre,adj1, T).
s_adj(Nombre, T) --> adj2(Nombre,adj2, T).
s_adj(Nombre, T) --> adj1(Nombre,adj1,T),adj2(Nombre,adj2, T).


vi(Nombre) --> [Mot], {lexique(Mot, vi, Nombre)}.
vt(Nombre) --> [Mot], {lexique(Mot, vt, Nombre)}.

nom(Nombre) --> [Mot], {lexique(Mot, nom, Nombre)}.
det(Nombre) --> [Mot], {det(Mot, det, Nombre)}.
det(the, det, _).
det(an, det, voyelle).
det(a, det, con).

adj1(Nombre, adj1,_) --> [Mot], {adj1(Mot, adj1, Nombre)}.
adj2(Nombre, adj2,_) --> [Mot], {adj2(Mot, adj2, Nombre)}.

adj1(small, adj1, con).
adj1(large, adj1, con).


adj2(brown, adj2, con).
adj2(orange, adj2, voyelle).
adj2(green, adj2, con).
adj2(blue, adj2, con).

lexique(boy, nom, con).
lexique(cat, nom, con).
lexique(man, nom, con).
lexique(dog, nom, con).
lexique(mat, nom, con).

lexique(took, vt, _).
lexique(sees, vt, _).
lexique(saw, vt, _).
lexique(hears, vt, _).
lexique(will_see, vt, _).
lexique(sat, vi, _).