% Author	: Sirui Yan
% StudentID : 792320
% Origin	: Oct 15 2017
% Purpose	: solve maths puzzles

%% This program is used to solve a maths puzzle.
%% Define the puzzle solving progress by defining a predicate 
%% puzzle_solution/1: puzzle_solution(Puzzle) such that Puzzle
%% is the representation of a valid solution satisfying all constraints:
%% every row and column contains no repeated digits 1-9, all values on the
%% diagonal line from upper left to lower right are same, the heading of each
%% row and column is the sum or product of all digits in that row or column.
%% Puzzle is a list of lists with same length, representing each row of 
%% the puzzle.

:- ensure_loaded(library(clpfd)).

%% puzzle_solution(Puzzle)
%% Check if all rows and columns of Puzzle satisfy all constraints of the
%% math puzzle by checking if all rows is a valid solution and all rows of
%% transposed Puzzle is a valid solution.

puzzle_solution([Head|Tail]):-
	valid_puzzle(Tail,1,_),
	transpose([Head|Tail],[_|Ttail]),
	valid_puzzle(Ttail,1,_).

%% valid_puzzle([List], Index, Value)
%% Check if all rows of the puzzle satisfy the constraints of the math puzzle.
%% [List] is a list of lists representing rows of the puzzle except the first
%% row. Index is the current index of element on diagonal and value is the 
%% value on diagonal from upper left to lower right.

valid_puzzle([],_K,_Val).
valid_puzzle([[Head|Tail]|List],K,Val):-
	in_range(Tail),
	all_different(Tail),
	element(K,Tail,Val),
	(sum_list(Tail,0,Head);
	 product_list(Tail,1,Head)),
	K0 is K + 1,
	label([Head|Tail]),
	valid_puzzle(List,K0,Val).

%% in_range(List)
%% Check if all elements in List are integer 1-9.

in_range([]).
in_range([Head|Tail]):-
	Head in 1..9,
	in_range(Tail).

%% sum_list(List, Sum0, Sum)
%% Calculate the sum of all elements in List.
%% Sum0 is the sum so far and Sum is the total sum of the List.

sum_list([],Sum,Sum).
sum_list([Head|Tail],Sum0,Sum):-
	Sum1 #= Sum0 + Head,
	sum_list(Tail,Sum1,Sum).

%% product_list(List, Product0, Product)
%% Calculate the product of all elements in List.
%% Product0 is the product so far and Product is the total product of the List.

product_list([],Product,Product).
product_list([Head|Tail],Product0,Product):-
	Product1 #= Product0 * Head,
	product_list(Tail,Product1,Product).
