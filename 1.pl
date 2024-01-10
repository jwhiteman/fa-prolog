male(jeffcoat).
male(jack).
male(ron).
male(benito).
male(royce).

female(letty).
female(shala).
female(mindy).
female(dena).
female(winchester).
female(sally).

father(jack, ron).
father(jack, benito).
father(jack, letty).
father(jack, sally).
father(jeffcoat, jack).
father(ron, winchester).
father(royce, shala).

mother(dena, mindy).
mother(mindy, ron).
mother(mindy, benito).
mother(shala, letty).
mother(shala, sally).

parent(X, Y) :- father(X, Y); mother(X, Y).
diff(X, Y)   :- X \== Y.

% 1.3
is_mother(X)     :- female(X), mother(X, _).

is_father(X)     :- male(X), father(X, _).
is_son(X)        :- male(X), father(_, X), mother(_, X).

sister_of(X, Y)  :- female(X), mother(Z, X), mother(Z, Y), diff(X, Y).
sister_of(X, Y)  :- female(X), father(Z, X), father(Z, Y), diff(X, Y).

grandpa_of(X, Y) :- male(X), father(X, Z), father(Z, Y).
grandpa_of(X, Y) :- male(X), father(X, Z), mother(Z, Y).

sibling(X, Y)    :- parent(Z, X), parent(Z, Y), diff(X, Y).
