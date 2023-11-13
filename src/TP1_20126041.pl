homme(Albert).
homme(Tom).
homme(Daniel).
homme(Claude).
homme(Michel).
homme(Jack).
homme(André).
homme(Bernard).
homme(Francois).
homme(Roger).

femme(Marie).
femme(Isabelle).
femme(Jacques).
femme(Sylvie).
femme(Monique).
femme(Jeanne).
femme(Camille).
femme(Nicole).
femme(Melia).
femme(René).
femme(Jacqueline).

marier(Albert, Marie).
marier(Tom, Isabelle).
marier(Daniel, Jacques).
marier(Sylvie, Claude).
marier(Michel, Monique).
marier(Jeanne, Jack).
marier(Melia, Bernard).
marier(Francois, Jacqueline).



epoux(X, Y):-marier(X, Y), homme(X).
epouse(X, Y):-marier(X,Y), femme(X).

parent(Albert, Sylvie).
parent(Marie, Sylvie).
parent(Tom, Claude).
parent(Isabelle, Claude).
parent(Jacques, Michel).
parent(Daniel, Michel).
parent(Sylvie, Jack).
parent(Sylvie, André).
parent(Sylvie, Camille).
parent(Claude, Jack).
parent(Claude, André).
parent(Claude, Camille).
parent(Michel, Bernard).
parent(Michel, Nicole).
parent(Monique, Bernard).
parent(Monique, Nicole).
parent(Jeanne, Melia).
parent(Jack, Melia).
parent(Bernard, René).
parent(Bernard, Francois).
parent(Melia, René).
parent(Melia, Francois).
parent(Francois, Roger).
parent(Jacqueline, Roger).

pere(X,Y):-parent(X,Y), homme(X).
mere(X,Y):-parent(X,Y), femme(X).

enfant_de_meme_parents(X,Y):-pere(Z,X), pere(Z,Y), mere(T,X),mere(T,Y),, not(X,Y).

frere(X,Y):-enfant_de_meme_parents(X,Y), homme(X).
soeur(X,Y):-enfant_de_meme_parents(X,Y), femme(X).

grand_parent(X,Y):-parent(X,Z), parent(Z,Y).
grand_pere(X,Y):-grand_parent(X,Y),homme(X).
grand_mere(X,Y):-grand_parent(X,Y),homme(X).

oncle_ou_tante(X,Y):-enfant_de_meme_parents(Z,X), parent(Z,Y).
oncle(X,Y):-oncle_ou_tante(X,Y),homme(X).
tante(X,Y):-oncle_ou_tante(X,Y),femme(X).

cousin(X,Y):-oncle_ou_tante(Z,Y), parent(Z,X).

niece_ou_neveu(X,Y):-enfant_de_meme_parents(Z,Y), parent(Z,X).
niece(X,Y):-niece_ou_neveu(X,Y), femme(X).
neveu(X,Y):-niece_ou_neveu(X,Y), homme(X).

petit_fils(X,Y):-grand_parent(Y,X),homme(X).
petit_fille(X,Y):-grand_parent(Y,X),femme(X).