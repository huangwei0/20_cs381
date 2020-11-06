% Wei Huang
% CSCI 381 Lab

:- consult('royal.pl').

mother(M,C):- parent(M,C), female(M).

father(M,C):- parent(M,C), male(M).

spouse(X,Y):- married(X,Y); married(Y,X).

child(X,Y):- parent(Y,X).

son(X,Y):- male(X), parent(Y,X).

daughter(X,Y):- female(X), parent(Y,X).

sibling(X,Y):- parent(W,X), parent(W,Y), not(X = Y).

brother(X,Y):- male(X), sibling(X,Y), not(X = Y).

sister(X,Y):- female(X), sibling(X,Y), not(X = Y).

uncle(X,Y):- parent(W,Y), brother(X,W).
uncle(X,Y):- parent(W,Y), sister(Z,W), spouse(X,Z).


aunt(X,Y):- sister(X,W), parent(W,Y).
aunt(X,Y):- parent(Z,Y), brother(Z,W), spouse(X,W).

grandparent(X,Y):- parent(W,Y), parent(X,W).

grandfather(X,Y):- parent(W,Y), father(X,W).

grandmother(X,Y):- parent(W,Y), mother(X,W).

grandchild(X,Y):- child(X,W), child(W,Y).

ancestor(X,Y):- parent(X,Y).
ancestor(X,Y):- parent(X,Z), ancestor(Z,Y).

descendant(X,Y):- ancestor(Y,X).

older(X,Y):- born(X,W), born(Y,Z), Z > W.

younger(X,Y):- born(X,W), born(Y,Z), Z < W.

regentWhenBorn(X,Y):- born(Y,Z), reigned(X,W,R), W =< Z, R >= Z.

% extra credit
cousin(X,Y):- parent(W,Y), sibling(W,Z), child(X,Z).

portray(Term) :- atom(Term), format("~s", Term).
