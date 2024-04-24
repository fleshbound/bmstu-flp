domains
	number, index = integer

predicates
	factorial(number, number).
	factorial(number, number, number).
	fibonacci(index, number).
	fibonacci(index, number, number, number).
	
clauses
	factorial(N, Nfact) :- factorial(N, 1, Nfact).
	factorial(0, CurFact, CurFact) :- !.
	factorial(1, CurFact, CurFact) :- !.
	factorial(N, CurFact, R) :-
		Y=N-1,
		Nfact = CurFact * N,
		factorial(Y, Nfact, R).

	fibonacci(N, R) :- fibonacci(N, 0, 1, R).
	fibonacci(0, R, _, R) :- !.
	fibonacci(1, _, R, R) :- !.
	fibonacci(Cnt, Prev1, Prev2, R) :-
		Cnt1 = Cnt - 1,
		Prev3 = Prev1 + Prev2,
		fibonacci(Cnt1, Prev2, Prev3, R).
goal
	% factorial(4, F).
	% factorial(1, F).
	fibonacci(2, R).
	% fibonacci(11, R).