# MathsPuzzles
This prolog code solves a certain type of maths puzzles.

A maths puzzle is a square grid of squares, each to be filled in with a single digit 1–9 (zero is not permitted) satisfying these constraints:
- each row and each column contains no repeated digits;
- all squares on the diagonal line from upper left to lower right contain the same value;
and
- the heading of reach row and column (leftmost square in a row and topmost square in a column) holds either the sum or the product of all the digits in that row or column

Note that the row and column headings are not considered to be part of the row or column, and so may be filled with a number larger than a single digit. The upper left corner of the puzzle is not meaningful.
When the puzzle is originally posed, most or all of the squares will be empty, with the headings filled in. The goal of the puzzle is to fill in all the squares according to the rules. A proper maths puzzle will have at most one solution.

# The Program
The program supplys a predicate puzzle solution(Puzzle) that holds when Puzzle is the representation of a solved maths puzzle.

## Input Format
A maths puzzle will be represented as a list of lists, each of the same length, representing a single row of the puzzle. The first element of each list is considered to be the header for that row. Each element but the first of the first list in the puzzle is considered to be the header of the corresponding column of the puzzle. The first element of the first element of the list is the corner square of the puzzle, and thus is ignored.

## Assumptions
- When the puzzle solution/1 predicate is called, its argument will be a proper list of proper lists, and all the header squares of the puzzle (plus the ignored corner square) are bound to integers. Some of the other squares in the puzzle may also be bound to integers, but the others will be unbound. When puzzle solution/1 succeeds, its argument must be ground. 

- The code will only be tested with proper puzzles, which have at most one solution. Of course, if the puzzle is not solvable, the predicate should fail, and it should never succeed with a puzzle argument that is not a valid solution. For example, your program would solve the above puzzle as below:

  ?- Puzzle=[[0,14,10,35],[14,_,_,_],[15,_,_,_],[28,_,1,_]],
  
  |    puzzle_solution(Puzzle).
  
  Puzzle = [[0, 14, 10, 35], [14, 7, 2, 1], [15, 3, 7, 5], [28, 4, 1, 7]] ;
  
  false.
  
  ## How to Run
  Load up SWI Prolog and load in the proj2_test.pl file with: [proj2_test].. Run tests by typing do_tests. and pressing enter/return.
  
