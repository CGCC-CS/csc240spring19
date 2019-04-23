% [A, B, C, D] => [C, B, A, D]
flip_three([H1, H2, H3 | T], [H3, H2, H1 | T]).

do_strange_thing([A, B, C, D | T], [A, A, C, C, C, D, A, A, B, C, D | T]).

change(H, Q, D, N, P) :-
	member(N, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]),
	member(D, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]),
	member(Q, [0, 1, 2, 3, 4]),
    member(H, [0, 1, 2]),
    S is ( (H * 50) + (Q * 25) + (D * 10) + (N * 5) ),
	S =< 100,
	P is 100 - S.

% Cut example
% Replace odd numbers with the atom odd, remove 0s, and replace even numbers with half their value
% Cut below ensures we stop searching for a solution if the list is empty
numrep([], []) :- !.
% Cut below stops searching if the first element is 0
numrep([0 | T], T1) :- !, numrep(T, T1).
% Cut below stops searching if H is even
numrep([H | T], [X | T1]) :- 0 is H mod 2, !, X is H / 2, numrep(T, T1).
% We dont need to check if H is odd in the last rule, we know it is or else we would not reach this line
numrep([_H | T], [odd | T1]) :- numrep(T, T1).

warm_blooded(dinosaur).
warm_blooded(cat).
warm_blooded(dog).     
warm_blooded(chicken). 
four_legs(lizard).
four_legs(dog).
four_legs(cat).
two_legs(chicken).

mammal0(bear).
mammal0(M) :- warm_blooded(M), four_legs(M).
mammal0(dolphin).

mammal1(bear).
mammal1(M) :- !, warm_blooded(M), four_legs(M).
mammal1(dolphin).

mammal2(bear).
mammal2(M) :- warm_blooded(M), !, four_legs(M).
mammal2(dolphin).

mammal3(bear).
mammal3(M) :- warm_blooded(M), four_legs(M), !.
mammal3(dolphin).

mammal4(_) :- !, fail.  % Nothing is a mammal4!

all_the_mammals(Mammals) :- findall(Mammal, mammal0(Mammal), Mammals).
find_all_change(Ways) :- findall([H, Q, D, N, P], change(H, Q, D, N, P), Ways).
find_big_coins(Ways) :- setof([H, Q, D], change(H, Q, D, _N, _P), Ways).

% ?- mammal4(X).
% false.
% 
% ?- asserta(mammal4(horse)).
% true.
% 
% ?- mammal4(X).
% X = horse ;
% false.
% ?- assertz(mammal4(fox)).
% true.
% 
% ?- mammal4(X).
% X = mouse ;
% false.

% You can also assert rules:
% ?- assert((big(X) :- X > 10)).
% true.
% 
% ?- big(14).
% true.
% 
% ?- big(4).
% false.

% Guessing game
newgame(X) :- retractall(guess(_Y)), assert((guess(Y) :- X = Y)).
% ?- consult('i:/csc240 s19/prolog3.pl').
% true.
% 
% ?- newgame(4).
% true.
% 
% ?- guess(2).
% false.
% 
% ?- guess(6). 
% false.
% 
% ?- guess(4).
% true.

