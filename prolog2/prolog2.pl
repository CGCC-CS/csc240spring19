knows_scheme(bob).
knows_scheme(alice).
knows_prolog(alice).

passes_240(Student) :- knows_scheme(Student), knows_prolog(Student).

factorial(1, 1) :- !.     % base case - 1! = 1
%    N!              N1 = N-1        (N-1)!       F = (N-1!) * N
factorial(N, F) :- N1 is N - 1, factorial(N1, F1), F is F1 * N.

% nutrition/5
% nutrition(Food, Calories, Fat, Carbs, Protein)
nutrition(egg, 85, 6, 1, 6).
nutrition(bacon, 38, 3, 0, 3).
nutrition(cereal, 130, 1, 28, 2).
nutrition(oatmeal, 150, 2, 25, 6).
nutrition(toast, 75, 0.96, 13, 2).
nutrition(fruit, 65, 0, 15, 1).
nutrition(milk, 1033, 2, 12, 8).
nutrition(juice, 80, 0, 18, 1).

% execute on consulting
:- nutrition(egg, Calories, Fat, _Carbs, Protein),
	write('Egg: Calories '), write(Calories),
	write(' Fat '), write(Fat),
	write(' Protein '), write(Protein).

lower_fat(X,Y) :- 
	nutrition(X, _, FatX, _ , _),
	nutrition(Y, _, FatY, _ , _),
	FatX < FatY.

protein_content(Food, Protein) :- nutrition(Food, _, _, _, Protein).

more_protein(X,Y) :-
	protein_content(X, ProteinX), 
	protein_content(Y, ProteinY), 
	ProteinX > ProteinY.

% math
double(X, Y) :- Y is 2 * X.
less_that_square_root(X, Y) :- Y < sqrt(X).
tangent(X, Y) :- Y is tan(X).
divides(X, Y) :- 0 is X mod Y.
				 
% family
father(bob, alice).
mother(sue, james).
mother(sue, alice).
mother(ann, sue).

dad(X,Y) :- father(X,Y).
parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).
child(X,Y) :- parent(Y,X).

ancestor(A,D) :- parent(A, D).
ancestor(A,D) :- parent(A, C), ancestor(C, D).

% graphs
% list of edges in a directed grap
edge(a,b). 
edge(a,c). 
edge(b,d). 
edge(c,d). 
edge(c,f). 
edge(d,e).
edge(f,g). 
edge(g, h). 
edge(i,j). 

connected(Node1, Node2) :- edge(Node1, Node2).
connected(Node1, Node2) :- edge(Node1, NodeX), connected(NodeX, Node2).

% lists & pairs
% PAIR: [ Head | Tail ]
% LIST: []  or [ Head | TailList ]

pairparts([H|T], H, T).

% first/2 - find the first thing in a list
first([H|_T], H).

% is_pair/1 - pair predicate
is_pair([_H |_T ]).

% is_list/1 - list predicate
is_list([]).
is_list([_H | T]) :- is_list(T).

% starts_with_same_two/1 - list starts with same two atoms
starts_with_same_two([H, H | _T]).

% at_least_two_in_list/1 - at least two elements in a list
at_least_two_in_list([_, _ | _]).


% third_element/2 - third element in a list
third_element([_,_, Third | _], Third).

% first_two - get the first two elements of a list
% first_two/3
first_two([H1, H2 | _T], H1, H2).
% first_two/2
first_two([H1, H2 | _T], [H1, H2]).


% nextto/3 - 2 elements appear next to each other in a list
nextto([X, Y | _T], X, Y).
nextto([_H | T], X, Y) :- nextto(T, X, Y).

% sum_first_x/3 - sum the first X elements of a list
sum_first_x(_List, 0, 0) :- !.
sum_first([H | T], X, Sum) :- 
	X1 is X - 1,
	sum_first_x(T, X1, SumTail),
	Sum is H + SumTail.
				
addhead(Element, List, [Element | List]).  % like cons
dupliate_head([H | T], [H, H | T]).

% listsize/2 - size of a list
listsize([], 0) :- !.
listsize([_H | T], Size) :- listsize(T, SizeTail), Size is SizeTail + 1.

% add_one_to_all/2 - increment each member of the list
add_one_to_all([], []) :- !.
add_one_to_all([H|T], [H1|T1])  :- H1 is H + 1, add_one_to_all(T, T1).

% increment/2 - increment the first parameter
increment([], []) :- !.
increment([H|T], [H1|T1])  :- !, H1 is H + 1, increment(T, T1).
increment(X,Y) :- Y is X + 1.

% only_mults_of_3/2 - keep only multiples of 3
only_mults_of_3([], []) :- !.
only_mults_of_3([H | T], [H | T1]) :- 0 is H mod 3, only_mults_of_3(T, T1).
only_mults_of_3([H | T], T1) :- X is H mod 3, X > 0, only_mults_of_3(T, T1).

% remove_eo/2 - remove every other element
remove_eo([], []) :- !.
remove_eo([X], [X]) :- !.
remove_eo([H,_|T], [H|T1]) :- remove_eo(T,T1).

% is_sorted/1 - predicate to determine if a list is sorted
is_sorted([]) :- !.
is_sorted([_]) :- !.
is_sorted([H1,H2|T]) :- H1 =< H2, is_sorted([H2|T]).

% perm_sort/2 - permutation sort
perm_sort(X,Y) :- permutation(X,Y), is_sorted(Y), !.
