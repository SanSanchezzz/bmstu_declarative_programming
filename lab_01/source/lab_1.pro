domains
   name = symbol
   number = integer

predicates
  phonebook(name,number)

clauses
  phonebook(tolya, 111111111).
  phonebook(kolya, 222222222).
  phonebook(olya, 333333333).
  phonebook(sasha, 444444444).
  phonebook(misha, 555555555).
  phonebook(dasha, 666666666).
  phonebook(olya, 777777777).

goal
  %phonebook(dasha, Phone).
  phonebook(olya, 333333333).