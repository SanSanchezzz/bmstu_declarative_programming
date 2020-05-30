predicates
	  max2(integer, integer, integer).
	  max2WithCut(integer, integer, integer).
	  max3(integer, integer, integer, integer).
	  max3WithCut(integer, integer, integer, integer).
clauses
	max2(A, B, A) :- A >= B.
	max2(A, B, B) :- B > A.
	  
	max2WithCut(A, B, A) :- A > B,!.
	max2WithCut(_, B, B).
	  
	max3(A, B, C, A) :- A >= B, A >= C.
	max3(A, B, C, B) :- B > A, B >= C.
	max3(A, B, C, C) :- C > A, C > B.
	  
	max3WithCut(A, B, C, A) :- A > B, A > C,!.
	max3WithCut(_, B, C, B) :- B > C,!.
	max3WithCut(_, _, C, C).
goal
	max2WithCut(3, 2, Max).
