domains 
	name = symbol.
	number = integer.
	city, street = symbol.
	house, apartment = integer.
	brand, color = symbol.
	price = integer.
	bank = symbol.
	account, amount = integer.
	address = address(city, street, house, apartment)
		
predicates
	nondeterm phonebook (name, number, address)
	nondeterm automobile(name, brand, color, price)
	nondeterm depositor (name, bank, account, amount)

	nondeterm search_by(name, number, brand, price)
	nondeterm search_by(number, brand)
	nondeterm search_by(name, city, number, street, bank)
		
clauses
	phonebook(name1, 22211100, address(moscow, lenina, 14, 128)).
	phonebook(name1, 22211100, address(moscow, baumanskaya, 1, 10)).
	phonebook(name1, 88877766, address(spb, lenina, 14, 128)).
	phonebook(name2, 44433322, address(moscow, ahmatovoy, 12, 153)).
	phonebook(name3, 66655544, address(moscow, baumanskaya, 1, 10)).
	phonebook(name3, 66655544, address(moscow, moscowskaya, 1, 10)).
	phonebook(name5, 11100099, address(spb, krivaya, 12, 153)).
	phonebook(name6, 33322211, address(spb, kurchatova, 1, 10)).

	automobile(name1, ford, black, 1600000).
	automobile(name1, volvo, silver, 1300000).
	automobile(name2, nissan, green, 970000).
	automobile(name4, nissan, yellow, 900000).
	automobile(name5, lexus, pink, 900000).
	automobile(name6, volvo, red, 900000).

	depositor(name1, sberbank, 444433332, 700000).
	depositor(name1, vtb,      444433332, 700000).
	depositor(name2, sberbank, 222233332, 200000).
	depositor(name3, vtb,      333333332, 300000).
	depositor(name4, sberbank, 555533332, 400000).

	search_by(Name, Number, Brand, Price) :-
			phonebook  (Name, Number, _),
			automobile (Name, Brand, _, Price).

	search_by(Number, Brand) :-
			search_by(_, Number, Brand, _).	
		
	search_by(Name, City, Number, Street, Bank) :-
			phonebook (Name, Number, address(City, Street, _, _)),
			depositor (Name, Bank, _, _).
	
goal
	search_by(Name, 22211100, Brand, Price).
	%search_by(22211100, Brand).
	%search_by(name1, moscow, Number, Street, Bank).
