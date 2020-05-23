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
  space = real.
  ownership = automobile(brand, color, price);
             house(price, city);
             ground(price, space, city);
             boat(price, name).
             

predicates
  phonebook(name, number, address).
  owner(name, city, ownership).
  depositor(name, bank, account, amount, city).
  
  owns(name, city, name).
  owns(name, city, name, price).
  amount_ownership(name, city, integer).
  amount_automobile(name, city, price).
  amount_house(name, city, price).
  amount_ground(name, city, price).
  amount_boat(name, city, price).
  
clauses
  phonebook(alexandrov, 333222222, address(spb, moscowskaya, 1, 101)).
  phonebook(alexandrova, 333222333, address(spb, moscowskaya, 1, 101)).
  phonebook(alexandrov, 111111111, address(moscow, berezkina, 33, 12)).
  phonebook(alexandrov, 111222222, address(moscow, berezkina, 33, 12)).
  phonebook(sidorov, 111222333, address(spb, sushkina, 42, 102)).
  phonebook(sidorov, 111333333, address(spb, sushkina, 42, 102)).

  depositor(alexandrov, sberbank, 99999, 123123, spb).
  depositor(alexandrova, sberbank, 66666, 123123, spb).
  depositor(alexandrov, tinkoff, 88888, 321321, spb).
  depositor(alexandrov, sberbank, 11111, 999999, moscow).
  depositor(sidorov, tochka, 22222, 9898989, spb).
  depositor(sidorov, tinkoff, 33333, 8989898, spb).
  
  owner(alexandrov, spb, automobile(bmv, black, 123123123)).
  owner(alexandrova, spb, automobile(bmv, black, 123123123)).
  owner(alexandrov, moscow, automobile(lexus, white, 321321321)).
  owner(sidorov, spb, automobile(nissan, gray, 100100100)).
  
  owner(alexandrov, spb, house(99999999, spb)).
  owner(alexandrov, moscow, house(89898989, moscow)).
  owner(sidorov, spb, house(77777777, spb)).
  
  owner(alexandrova, spb, ground(12312333, 44.123, rublevka)).
  owner(alexandrov, moscow, ground(3213211, 77.7, chistoe)).
  
  owner(alexandrov, moscow, boat(99999, victoria)).
  
  owns(Lastname, City, Property, Cost) :- owner(Lastname, City, automobile(_, _, Cost)), Property = automobile.
  owns(Lastname, City, Property, Cost) :- owner(Lastname, City, house(Cost, _)), Property = house.
  owns(Lastname, City, Property, Cost) :- owner(Lastname, City, ground(Cost, _, _)), Property = ground.
  owns(Lastname, City, Property, Cost) :- owner(Lastname, City, boat(Cost, _)), Property = boat.
  owns(Lastname, City, Property) :- owns(Lastname, City, Property, _).

  amount_automobile(Lastname, City, Cost) :- owner(Lastname, City, automobile(_, _, Cost)),!.
  amount_automobile(_, _, 0).

  amount_house(Lastname, City, Cost) :- owner(Lastname, City, house(Cost, _)),!.
  amount_house(_, _, 0).

  amount_ground(Lastname, City, Cost) :- owner(Lastname, City, ground(Cost, _, _)),!.
  amount_ground(_, _, 0).

  amount_boat(Lastname, City, Cost) :- owner(Lastname, City, boat(Cost, _)),!.
  amount_boat(_, _, 0).

  amount_ownership(Lastname, City, Sum) :-
		amount_automobile(Lastname, City, Price_automobile),
		amount_house(Lastname, City, Price_house),
		amount_ground(Lastname, City, Price_ground),
		amount_boat(Lastname, City, Price_boat),
		Sum = Price_automobile + Price_house + Price_ground + Price_boat.
    

goal
  %owns(alexandrov, spb, Ownership, Price).
  %owns(alexandrov, moscow, Ownership).
  amount_ownership(alexandrov, spb, Amount).