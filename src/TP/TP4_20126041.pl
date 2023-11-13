%EX1

calcule(Input, Output):- open(Input, read, Stream), 
				read_file(Stream, Lines), %Appel_de_predicat
				close(Stream), 
				write_output(Output, Lines),!. %Appel_de_predicat

write_output(Output, Lines):- open(Output, write, Stream), 
							write_line(Stream, Lines), %Appel_de_predicat
							close(Stream).

write_line(_,[]):-!.
write_line(Stream, [H|T]):- writeq(Stream, H), nl(Stream), write_line(Stream, T). %ecrire_la_somme_de_chaque_ligne


somme([], 0).
somme([H|T], S) :-  number_string(X, H), %Convertir_un_element_de_chaine_en_entier
						 somme(T, S1), %appel_recursif
						 S is X + S1. %la_somme_de_chaque_ligne_sera_additionnee_recursivement

read_file(Stream,[]) :- at_end_of_stream(Stream).
read_file(Stream,[H|T]) :- \+ at_end_of_stream(Stream), 
						read_line_to_codes(Stream, Ch), %Lire_les_lettres_sur_la_ligne_en_caracteres_et_mettre_dans_une_liste
						atom_codes(Tmp, Ch),			%Convertir_entre_un_atome_et_une_liste_de_codes_de_caracteres
						split_string(Tmp," ","", S),    %Diviser_la_liste_contenant_des_phrases_en_mots_et_les_mettre_dans_la_liste
						somme(S, H), 					%Appel_de_predicat
						read_file(Stream, T), !.		%Appeler_a_cet_predicat_s_il_y_a_d_autres_phrases_dans_le_fichier_d_entree

%EX2


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

				  
toPhrase([], []).
toPhrase([T|H], S):-atom_string(X, T), 
					toPhrase(H, S1), 
					append([X], S1, S).
				  %Convertit_le_texte_en_une_liste_de_valeurs_ASCII_d_un_mot
				  %Appeler_recursivement_pour_obtenir_les_mots_suivants_d_une_phrase
				  %Combinera_le_code_ASCII_des_mots_que_vous_venez_de_prendre_dans_une_nouvelle_liste_dans_le_bon_ordre_de_la_phrase
				  %et_prendra_la_valeur_de_cette_liste_a_utiliser.

grammaire(X):- open(X, read, Stream), 
		   readFile(Stream, _), 
		   close(Stream).
		   
readFile(Stream, []):-at_end_of_stream(Stream).
readFile(Stream, [_|Q]):- 
				\+at_end_of_stream(Stream), read_line_to_codes(Stream, T),
			    atom_codes(Tmp, T), 
			    split_string(Tmp," ", ".", S),
			    toPhrase(S, X),nl,
			    write(X),nl,
			    (s(X, [])->write("It's correct."); write("It's not correct.")),
			    readFile(Stream, Q), !.
				%Lire_les_lettres_sur_la_ligne_en_caracteres_et_mettre_dans_une_liste
				%Convertir_entre_un_atome_et_une_liste_de_codes_de_caracteres
				%Diviser_la_liste_contenant_des_phrases_en_mots_et_les_mettre_dans_la_liste
				%Utilisez_la_clause_if_pour_verifier_si_une_phrase_est_vraie_ou_fausse
				%Appel_de_predicat
				%Ecrire_un_mot
				%Appeler_a_cet_predicat_s_il_y_a_d_autres_phrases_dans_le_fichier_d_entree