domains
	address = address(symbol, symbol, integer, integer)

predicates
	car(symbol, symbol, symbol, integer, string).
	phone(symbol, string, address).
	car_owner(symbol, symbol, symbol, symbol, string)
	
clauses
	car(avdeykina, mazda, red, 41000, "765").
	car(konkina, mercedes, white, 45000, "123").
	car(skobeleva, mazda, red, 42000, "890").
	car(skobelev, porsche, blue, 50000, "735").
	car(ivanov, mazda, red, 39000, "111").
	car(ivanova, honda, yellow, 35000, "222").
	car(knyazev, porsche, white, 51000, "777").
	
	phone(avdeykina, "+79258704075", address(moscow, borisovskiye, 1, 1)).
	phone(konkina, "+79168300870", address(moscow, yangelya, 1, 2)).
	phone(skobeleva, "+79262839739", address(moscow, borisovskiye, 1, 10)).
	phone(skobelev, "+79433819740", address(orel, tverskaya, 1, 10)).
	phone(ivanov, "+79162888779", address(moscow, borisovskiye, 1, 10)).
	phone(ivanova, "+79453217740", address(orel, tverskaya, 1, 10)).
	phone(knyazev, "+79666667788", address(rostov, lenina, 10, 2)).
	
	car_owner(Surname, Model, Color, City, Phone):-
		car(Surname, Model, Color, _, _),
		phone(Surname, Phone, address(City, _, _, _)).
goal
	car_owner(X, mazda, red, Y, Z).
	% car_owner(skobelev, _, _, moscow, _).
