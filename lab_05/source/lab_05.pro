domains
	firstname, lastname = symbol.
	number = integer.
	city, street = symbol.
	house, apartment = integer.
	label, color, gcolor = symbol.
	price = integer.
	bank = symbol.
	account, amount = integer.
	
	address = address(city, street, house, apartment)
	ownership = automobile(label, price, color);
				arrea(label, price, gcolor);
				boat(label, price);
				house(label, price).
	person = person(firstname, lastname).
	
predicates	
	nondeterm depositor (person, bank,  account, amount).
	nondeterm phonebook (person, number, address).
	
	nondeterm type(symbol, ownership).
	nondeterm price(integer, ownership).
	
	nondeterm owns(person, ownership).
	nondeterm owns(person, symbol, integer).
	
	nondeterm count_prices(person, integer).
clauses
	phonebook(person(fname1, lname1), 22211100, address(moscow, lenina, 14, 128)).
	phonebook(person(fname1, lname1), 22211100, address(moscow, baumanskaya, 1, 10)).
	phonebook(person(fname1, lname1), 88877766, address(spb, lenina, 14, 128)).
	phonebook(person(fname2, lname2), 44433322, address(moscow, ahmatovoy, 12, 153)).
	phonebook(person(fname3, lname3), 66655544, address(moscow, baumanskaya, 1, 10)).
	phonebook(person(fname3, lname3), 66655544, address(moscow, moscowskaya, 1, 10)).
	
	depositor(person(fname1, lname1), sberbank, 444433332, 700000).
	depositor(person(fname1, lname1), vtb, 444433332, 700000).
	depositor(person(fname2, lname2), sberbank, 222233332, 200000).
	depositor(person(fname3, lname3), vtb, 333333332, 300000).
	
	type(Name, automobile(CarName, _, _)) :-Name=CarName, !.
	type(Name, arrea(ArreaName, _, _)) :-Name=ArreaName, !.
	type(Name, boat(BoatName, _)) :-Name=BoatName, !.
	type(Name, house(HouseName, _)) :-Name=HouseName, !. 
	
	price(Price, automobile(_, Price, _)) :-Price=Price, !.
	price(Price, arrea(_, ArreaPrice, _)) :-Price=ArreaPrice, !.
	price(Price, boat(_, TransportPrice)) :-Price=TransportPrice, !.
	price(Price, house(_, BPrice)) :-Price=BPrice, !.
				   
	owns(person(fname1, lname1), automobile(carlabel, 2000000, black)).
	owns(person(fname1, lname1), arrea(arrealabel, 1200000, black)).
	owns(person(fname1, lname1), boat(boatlabel, 23)).
	owns(person(fname2, lname2), automobile(carlabel, 2300000, red)).
	owns(person(fname2, lname2), house(houselabel, 1203212)).
	
	owns(Person, Name, Price) :- owns(Person, Ownership), 
					   type(Name, Ownership),
					   price(Price, Ownership).
	
	count_prices(Person, Sum) :- owns(Person, Name, Price),
					   owns(Person, Name1, Price1),
					   Name <> Name1, 
					   owns(Person, Name2, Price2),
					   Name1<>Name2, 
					   Name <>Name2,
					   owns(Person, Name3, Price3),
					   Name<>Name3,
					   Name1<>Name3, 
					   Name2<>Name3,
					   Sum = Price+Price1+Price2+Price3, !.
	
	count_prices(Person, Sum) :- owns(Person, Name, Price),
					   owns(Person, Name1, Price1),
					   Name<>Name1, 
					   owns(Person, Name2, Price2),
					   Name1<>Name2, 
					   Name <>Name2,
					   Sum = Price+Price1+Price2, !.
					   
	count_prices(Person, Sum) :- owns(Person, Name, Price),
					   owns(Person, Name1, Price1),
					   Name<>Name1, 
					   Sum = Price+Price1, !.
					   
	count_prices(Person, Sum) :- owns(Person, _, Sum), !.
	
goal 
	%owns(person(fname2, lname2), Name, _).
	%owns(person(fname1, lname1), Name, Price).
	count_prices(person(fname1, lname1), Sum).
