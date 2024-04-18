domains
	surname = symbol
	car_model = symbol
	color = symbol
	price = integer
	car_num = string
	phone_num = string
	
	city = symbol
	street = symbol
	house_num = integer
	flat_num = integer
	address = address(city, street, house_num, flat_num)
	
	bank_name = symbol
	bank_balance = integer
	account_num = string
	
	subtype, type = symbol
	space = integer
	run = integer
	
	ownership = 
		car(car_model, color, price, car_num);
	 	water_transport(subtype, price, run);
		building(subtype, price, space);
		plot(subtype, price, space)

predicates
	phone(surname, phone_num, address).
	bank_account(surname, bank_name, account_num, bank_balance).
	owner(surname, ownership).
	ownership_price_sum(surname, subtype, subtype, subtype, subtype, price, price, price, price, price).
	ownership_price(surname, type, subtype, price).
	
clauses
	ownership_price_sum(Surname, Car, Plot, Building, WaterTr, P1, P2, P3, P4, Sum):-
		ownership_price(Surname, car, Car, P1),
		ownership_price(Surname, plot, Plot, P2),
		ownership_price(Surname, building, Building, P3),
		ownership_price(Surname, water_transport, WaterTr, P4),
		Sum = P1 + P2 + P3 + P4.
		
	ownership_price(Surname, car, Subtype, Price):-
		owner(Surname, car(Model, _, Price, _)),
		Model = Subtype,!.
	ownership_price(Surname, plot, Subtype, Price):-
		owner(Surname, plot(Subtype, Price, _)),!.
	ownership_price(Surname, building, Subtype, Price):-
		owner(Surname, building(Subtype, Price, _)),!.
	ownership_price(Surname, water_transport, Subtype, Price):-
		owner(Surname, water_transport(Subtype, Price, _)),!.
	ownership_price(_, _, none, 0).
		
	owner(avdeykina, plot(dacha, 100, 100)).
	owner(avdeykina, building(cottage, 350, 120)).
	owner(avdeykina, water_transport(boat, 25, 333)).
	owner(avdeykina, car(mazda, red, 41000, "765")).
	owner(skobeleva, car(hundai, brown, 40000, "123")).
	owner(skobeleva, plot(dacha, 200, 120)).
	owner(knyazev, water_transport(yacht, 500, 0)).
	
	bank_account(avdeykina, tinkoff, "10001", 727).
	bank_account(konkina, sberbank, "10002", 15000).
	bank_account(skobeleva, alpha, "10003", 16000).
	bank_account(skobelev, rsb, "10004", 90000).
	bank_account(ivanov, tinkoff, "10005", 500).
	bank_account(ivanova, tinkoff, "10006", 1).
	bank_account(knyazev, ozonbank, "10007", 15).
	
	phone(avdeykina, "+79258704075", address(moscow, borisovskiye, 1, 1)).
	phone(konkina, "+79168300870", address(moscow, yangelya, 1, 2)).
	phone(skobeleva, "+79262839739", address(moscow, borisovskiye, 1, 10)).
	phone(skobelev, "+79433819740", address(orel, tverskaya, 1, 10)).
	phone(ivanov, "+79162888779", address(moscow, borisovskiye, 1, 10)).
	phone(ivanova, "+79453217740", address(orel, tverskaya, 1, 10)).
	phone(knyazev, "+79666667788", address(rostov, lenina, 10, 2)).
goal
	% ownership_price_sum(avdeykina, Car, Plot, Building, WaterTr, _, _, _, _, _).
	% ownership_price_sum(knyazev, Car, Plot, Building, WaterTr, CarPrice, PlotPrice, BPrice, WaterPrice, _).
	ownership_price_sum(avdeykina, _, _, _, _, _, _, _, _, Sum).
	
	
