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
  phonebook = phonebook(name, number, address).
  automobile = automobile(name, city, brand, color, price).
  depositor = depositor(name, bank, account, amount).

predicates
  phonebook(name, number, address).
  automobile(name, city, brand, color, price).
  depositor(name, bank, account, amount, city).

  search_by_car(brand, color, name, city, number, bank).
  
clauses
  phonebook(alexandrov, 333222222, address(spb, moscowskaya, 1, 101)).
  phonebook(alexandrova, 333222333, address(spb, moscowskaya, 1, 101)).
  phonebook(alexandrov, 111111111, address(moscow, berezkina, 33, 12)).
  phonebook(alexandrov, 111222222, address(moscow, berezkina, 33, 12)).
  phonebook(sidorov, 111222333, address(spb, sushkina, 42, 102)).
  phonebook(sidorov, 111333333, address(spb, sushkina, 42, 102)).

  automobile(alexandrov, spb, audi, black, 2700000).
  automobile(alexandrova, spb, audi, black, 2700000).
  automobile(alexandrov, spb, lexus, white, 22234567).
  automobile(alexandrov, moscow, ford, white, 22234567).
  automobile(sidorov, spb, bmv, black, 1234567).
  automobile(sidorov, spb, nissan, red, 124567).
  
  depositor(alexandrov, sberbank, 99999, 123123, spb).
  depositor(alexandrova, sberbank, 66666, 123123, spb).
  depositor(alexandrov, tinkoff, 88888, 321321, spb).
  depositor(alexandrov, sberbank, 11111, 999999, moscow).
  depositor(sidorov, tochka, 22222, 9898989, spb).
  depositor(sidorov, tinkoff, 33333, 8989898, spb).
  
  search_by_car(Brand, Color, Name, City, Number, Bank) :- automobile(Name, City, Brand, Color, _),
                                                           phonebook(Name, Number, address(City, _, _, _)),
                                                           depositor(Name, Bank, _, _, City).
    
goal
  %search_by_car(audi, black, Name, City, Number, Bank).
  %search_by_car(ford, white, Name, City, Number, Bank).
  search_by_car(nissan, pink, Name, City, Number, Bank).