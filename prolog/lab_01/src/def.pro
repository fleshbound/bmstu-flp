domains
	address = address(symbol, symbol, integer, integer)

predicates
	car(symbol, symbol, symbol, integer, string).
	phone(symbol, string, address).
	car_owner(symbol, symbol, symbol, symbol, string).
	family(symbol, symbol, symbol, string).
	human(symbol, string).
	gson_car(symbol, string, symbol, symbol, string, symbol, symbol).
	
clauses
	human(avdeykina, "female").
	human(konkina, "female").
	human(skobeleva, "female").
	human(skobelev, "male").
	human(ivanov, "male").
	human(ivanova, "female").
	human(knyazev, "male").
	
	family(knyazev, ivanov, ivanova, "father").
	family(knyazev, skobelev, skobeleva, "mother").
	family(konkina, ivanov, ivanova, "father").
	family(konkina, skobelev, skobeleva, "mother").

	car(avdeykina, mazda, red, 41000, "765").
	car(konkina, mamercedes, white, 45000, "123").
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
	
	gson_car(GSon, Sex, GPa, GMa, Line, Model, Color):-
		car(GSon, Model, Color, _, _),
		family(GSon, GPa, GMa, Line),
		human(GSon, Sex).
goal
	% gson_car(_, _, _, GMa, _, porsche, white).
	gson_car(GSon, "male", _, skobeleva, _, Model, Color).
	