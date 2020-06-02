domains
	list = integer*. 
	
predicates	
	biggerThan(list, integer, list).
	oddElements(list, list).
	deleteElement(list, integer, list).	
	createSet(list, list).
	
clauses
	biggerThan([], _, []).
	biggerThan([H|T], Min, [H|ResultTail]) :- 
		H > Min,
		biggerThan(T, Min, ResultTail).  
	biggerThan([H|T], Min, ResultTail) :- 
		H <= Min,
		biggerThan(T, Min, ResultTail).
	
	oddElements([], []).
	oddElements([_], []).
	oddElements([_|[H|T]],[H|ResultTail]) :-
		oddElements(T, ResultTail).

	deleteElement([], _, []).
	deleteElement([El|T], El, ResultTail) :- 
		deleteElement(T, El, ResultTail).
	deleteElement([H|T], El, [H|ResultTail]) :- 
		H <> El,
		deleteElement(T, El, ResultTail).

	createSet([], []).
	createSet([H|T], [H|ResultTail]) :-
		deleteElement(T, H, TmpResult),
		createSet(TmpResult, ResultTail).
	
goal
	%biggerThan([1, 2, 3, 4, 2, 1], 2, Result).
	%oddElements([1, 2, 3, 4], Result).
	%oddElements([1, 2, 3], Result).
	%deleteElement([1, 2, 3, 3, 1, 3, 4], 3, Result).
	createSet([1, 2, 3, 3, 1, 3, 4], Result).
	%createSet([1, 1, 1], Result).