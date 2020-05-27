domains
   name, university, city = symbol.

predicates
  college(university, city).
  study(name, university).

  studying_in(name, city).

clauses
  college(msu, moscow).
  college(bmstu, moscow).
  college(mit, boston).
  college(nsu, novosibirsk).
  college(itmo, piter).

  study(tolya, msu).
  study(kolya, itmo).
  study(olya, bmstu).
  study(eric, mit).
  study(sasha, bmstu).
  study(misha, nsu).
  study(misha, College) :- study(eric, College).
  study(dasha, itmo).
  study(olya, msu).

  studying_in(Name, City) :- study(Name, College),
                                college(College, City).
goal
  %study(sasha, bmstu).
  %study(olya, College).
  %study(Name, msu).
  %college(nsu, _).
  studying_in(Person, piter).
