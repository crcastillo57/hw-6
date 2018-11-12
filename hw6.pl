%  CLASS:  CSCE 4430
%  ASSIGNMENT:  Assignment 6
%  NAME:  Christian Castillo

%This program is modified from: https://rosettacode.org/wiki/I.Q._Puzzle.

c:-['assign6.pl'].

% use pack_install(lambda).

:- use_module(library(lambda)).

% Function to call all puzzle moves
go :-
	puzzle1,
	puzzle2,
	puzzle3,
	puzzle4,
	puzzle5.

% Runs puzzle starting from empty spot 0
puzzle1 :-
	write("=== 0 ==="),
	nl,
	play([1], [2,3,4,5,6,7,8,9,10,11,12,13,14,15], [], Moves), 
	show(Moves, [1]),
	nl.

% Starting from empty spot 1
puzzle2 :- 
	write("=== 1 ==="),
	nl,
	play([2], [1,3,4,5,6,7,8,9,10,11,12,13,14,15], [], Moves),
	show(Moves, [2]),
	nl.

% Starting from empty spot 2
puzzle3 :-
	write("=== 2 ==="),
	nl,
	play([3], [1,2,4,5,6,7,8,9,10,11,12,13,14,15], [], Moves),
	show(Moves, [3]),
	nl.

% Starting from empty spot 3
puzzle4 :-
	write("=== 3 ==="),
	nl,
	play([4], [1,2,4,5,6,7,8,9,10,11,12,13,14,15], [], Moves),
	show(Moves, [4]),
	nl.

% Starting from empty spot 4
puzzle5 :-
	write("=== 4 ==="),
	nl,
	play([5], [1,2,4,5,6,7,8,9,10,11,12,13,14,15], [], Moves),
	show(Moves, [5]),
	nl.


% Intiates a play of the game, recursively
play(_, [_], Lst, Moves) :-
	reverse(Lst, Moves).
 
play(Free, Occupied, Lst, Moves) :-
	select(S, Occupied, Oc1),
	select(O, Oc1, Oc2),
	select(E, Free, F1),
	move(S, O, E),
	play([S, O | F1], [E | Oc2], [move(S,O,E) | Lst], Moves).
 

% List of moves(Start, Mid, End)

move(S,2,E) :-
	member([S,E], [[1,4], [4,1]]).
move(S,3,E) :-
	member([S,E], [[1,6], [6,1]]).
move(S,4,E):-
	member([S,E], [[2,7], [7,2]]).
move(S,5,E):-
	member([S,E], [[2,9], [9,2]]).
move(S,5,E):-
	member([S,E], [[3,8], [8,3]]).
move(S,6,E):-
	member([S,E], [[3,10], [10,3]]).
move(S,5,E):-
	member([S,E], [[4,6], [6,4]]).
move(S,7,E):-
	member([S,E], [[4,11], [11,4]]).
move(S,8,E):-
	member([S,E], [[4,13], [13,4]]).
move(S,8,E):-
	member([S,E], [[5,12], [12,5]]).
move(S,9,E):-
	member([S,E], [[5,14], [14,5]]).
move(S,9,E):-
	member([S,E], [[6,13], [13,6]]).
move(S,10,E):-
	member([S,E], [[6,15], [15,6]]).
move(S,8,E):-
	member([S,E], [[9,7], [7,9]]).
move(S,9,E):-
	member([S,E], [[10,8], [8,10]]).
move(S,12,E):-
	member([S,E], [[11,13], [13,11]]).
move(S,13,E):-
	member([S,E], [[12,14], [14,12]]).
move(S,14,E):-
	member([S,E], [[15,13], [13,15]]).
 
% Shows the results by printing out successive states
show([], Free) :-
	numlist(1,15, Lst),
	maplist(\X^I^(member(X, Free) -> I = .; I = x),
		Lst,
		[I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15]),
	format('    ~w        ~n', [I1]),
	format('   ~w ~w      ~n', [I2,I3]),
	format('  ~w ~w ~w    ~n', [I4,I5,I6]),
	format(' ~w ~w ~w ~w  ~n', [I7,I8,I9,I10]),
	format('~w ~w ~w ~w ~w~n', [I11,I12,I13,I14,I15]).
 
% Recursively print through list
show([move(Start, Middle, End) | Tail], Free) :-
	numlist(1,15, Lst),
	maplist(\X^I^(member(X, Free) -> I = .; I = x),
		Lst,
		[I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15]),
	format('    ~w        ~n', [I1]),
	format('   ~w ~w      ~n', [I2,I3]),
	format('  ~w ~w ~w    ~n', [I4,I5,I6]),
	format(' ~w ~w ~w ~w  ~n', [I7,I8,I9,I10]),
	format('~w ~w ~w ~w ~w~n', [I11,I12,I13,I14,I15]),
	nl,
	select(End, Free, F1),
	show(Tail,  [Start, Middle | F1]).
     
