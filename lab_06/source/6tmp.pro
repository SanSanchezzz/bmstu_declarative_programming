domains
	name = symbol.
	flag = symbol.

predicates 
	/* mother or father, mother, father, child*/
	grandparents(flag, name, name, name).
	/*mother, father, child*/
	parents(name, name, name).
	
clauses 		
	/* 4th generation */
	parents(nastya, tolya, misha).
	parents(nastya, tolya, polina).
	parents(varvara, tolya, vitya).
	
	/* 3rd generation */
	parents(ulya, igor, katya).
	parents(ulya, igor, zhora).
	parents(varvara, andrey, nadya).
	
	/* 2nd generation */
	parents(nadya, misha, dima).
	parents(katya, vitya, sasha).
	parents(nadya, zhora, rolan).
	
	/* 1st generation */
	parents(sasha, rolan, nikita).
	parents(sasha, dima, olya).
	
	grandparents(mom, GrandMa, GrandPa, Child)
		:- parents(Mother, _, Child),
		parents(GrandMa, GrandPa, Mother).
						            
	grandparents(dad, GrandMa, GrandPa, Child) :-
		parents(_, Father, Child),
		parents(GrandMa, GrandPa, Father).
	
goal
	/*All the grandparents*/
	grandparents(mom, GrandMa, GrandPa, rolan).
	
	/*All the grandfathers*/
	% grandparents(_, _, GrandPa, olya).
	
	/*All the grandmothers*/
	%grandparents(_, GrandMa, _, olya).
	
	/*All the mother's grandmothers*/
	% grandparents(mom, GrandMa, _, olya).
	
	/*All the mother's grandfathers*/
	%grandparents(mom, GrandMa, _, olya). 