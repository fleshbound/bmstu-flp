predicates
	max2(integer, integer, integer).
	max2_true(integer, integer, integer).
	max3(integer, integer, integer, integer).
	max3_true(integer, integer, integer, integer).

clauses
	max2(X, Y, R):-
		X > Y,
		R = X.
	max2(X, Y, R):-
		X <= Y,
		R = Y.
	
	max2_true(X, Y, X):-
		X > Y,!.
	max2_true(_, Y, Y).
	
	max3(X, Y, Z, R):-
		X >= Y,
		X >= Z,
		R = X.
	max3(X, Y, Z, R):-
		Y >= X,
		Y >= Z,
		R = Y.
	max3(X, Y, Z, R):-
		Z >= Y,
		Z >= X,
		R = Z.
		
	max3_true(X, Y, Z, X):-
		X > Y,
		X > Z,!.
	max3_true(_, Y, Z, Y):-
		Y > Z,!.
	max3_true(_, _, Z, Z).
	
goal
	max3(2, 2, 1, R).
%	max3_true(1, 3, 2, R).