domains 
  	name = symbol.
  	number = integer.
  	city, street = symbol.
  	house, apartment = integer.
  	brand, color = symbol.
	price = integer.
	bank = symbol.
	account, amount = integer.
  
	address = address(city, street, house, apartment).
	
predicates
	nondeterm phonebook(name, number, address).
	nondeterm automobile(name, brand, color, price).
	nondeterm depositor(name, bank, account, amount).
	
	nondeterm search_by(Brand, Color, Name, City, Number, Bank).
	
clauses
	phonebook(name1, 22211100, address(moscow, lenina, 14, 128)).
	phonebook(name1, 88877766, address(spb, alexandrova, 14, 128)).
	phonebook(name2, 44433322, address(moscow, ahmatovoy, 12, 153)).
	phonebook(name3, 66655544, address(moscow, baumanskaya, 1, 10)).
	phonebook(name3, 55544422, address(moscow, moscowskaya, 1, 10)).
	phonebook(name4, 11111111, address(spb, alexandrova, 1, 10)).
	
	automobile(name1, ford,  black,  1600000).
	automobile(name2, ford,  black,  1600000).
	automobile(name3, ford,  black,  1600000).
	
	automobile(name4, volvo,      silver, 1300000).

	automobile(name3, nissan,     red,    1300000).
	
	depositor(name1, sberbank, 444433332, 700000).
	depositor(name2, sberbank, 222233332, 200000).
	depositor(name4, tochka, 333333332, 300000).
	depositor(name4, vtb, 444433332, 700000).
	
	search_by(Brand, Color, Name, City, Number, Bank) :-	
			automobile(Name, Brand, Color, _),
			phonebook(Name, Number, address(City, _, _, _)),
			depositor(Name, Bank, _, _).


goal
	search_by(ford, black, Name, City, Number, Bank).
	%search_by(volvo, silver, Name, City, Number, Bank).
	%search_by(nissan, red, Name, City, Number, Bank).	

