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

  search_by_phone(number, name, brand, price).
  search_by_phone(number, brand).
  
clauses
  phonebook(alexandrov, 333222222, address(spb, moscowskaya, 1, 101)).
  phonebook(alexandrov, 111111111, address(moscow, berezkina, 33, 12)).
  phonebook(alexandrov, 111222222, address(moscow, berezkina, 33, 12)).
  phonebook(sidorov, 111222333, address(spb, sushkina, 42, 102)).
  phonebook(sidorov, 111333333, address(spb, sushkina, 42, 102)).

  automobile(alexandrov, spb, audi, black, 2700000).
  automobile(alexandrov, spb, lexus, white, 22234567).
  automobile(alexandrov, moscow, ford, white, 22234567).
  automobile(sidorov, spb, bmv, black, 1234567).
  automobile(sidorov, spb, nissan, red, 124567).
  
  depositor(alexandrov, sberbank, 99999, 123123, spb).
  depositor(alexandrov, tinkoff, 88888, 321321, spb).
  depositor(alexandrov, sberbank, 11111, 999999, moscow).
  depositor(sidorov, tochka, 22222, 9898989, spb).
  depositor(sidorov, tinkoff, 33333, 8989898, spb).
  
  search_by_phone(Number, Name, Brand, Price) :- phonebook(Name, Number, address(City, _, _, _)),
                                                 automobile(Name, City, Brand, _, Price).
  search_by_phone(Number, Brand) :- search_by_phone(Number, _, Brand, _).
    
goal
  %search_by_phone(111111111, Name, Brand, Price).
  search_by_phone(333222222, Brand).
  %phonebook(alexandrov, Number, address(moscow, Street, _, _)),
  %depositor(alexandrov, Bank, _, _, moscow).
