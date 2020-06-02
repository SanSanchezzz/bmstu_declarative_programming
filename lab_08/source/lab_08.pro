predicates	
	factorial(integer, integer).
	factorial(integer, integer, integer).
	
	fibb(integer, integer).
	fibb(integer, integer, integer, integer, integer).
	sign(integer, integer).
	
clauses
	factorial(N, -1) :- N < 0, !.
	factorial(0, 1) :- !.
	factorial(N, Result) :- factorial(N, 1, Result).
	
	factorial(1, Result, Result) :- !.
	factorial(N, Cur, Result) :- 
		NewN = N - 1,
		NewMult = Cur * N,
		factorial(NewN, NewMult, Result).
		
	fibb(0, 0) :- !.
	fibb(1, 1) :- !.
	fibb(N, Result) :- 
		N < 0, 
		NormalN = N * -1,
		fibb(NormalN, PrevResult),
		sign(NormalN, Sign),
		Result = PrevResult * Sign, !.
	fibb(N, Result) :- fibb(N, 2, 0, 1, Result).
	
	fibb(N, N, Prev1, Prev2, Result) :- Result = Prev1 + Prev2, !.
	fibb(N, CurN, Prev1, Prev2, Result) :- 
		NewN = CurN + 1,
		Next = Prev1 + Prev2,
		fibb(N, NewN, Prev2, Next, Result).
	
	sign(N, 1) :- (N mod 2) = 1, !.
	sign(_, -1).
	
goal
	%factorial(-10, Result).
	%factorial(0, Result).
	%factorial(5, Result).
	
	%fibb(-9, Result). % 34
	%fibb(-8, Result). % -21
	%fibb(-2, Result). % -1
	%fibb(2, Result). % 1
	fibb(8, Result). % 21