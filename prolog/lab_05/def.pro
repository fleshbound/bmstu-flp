domains
	llist = l(list); i(integer)
	list = llist*

predicates
	sum(integer, list).
	sum_(integer, integer, list).
	is_list(list).
	
clauses
	is_list([]).
	is_list([_|T]):-is_list(T).

	sum(S, L):-sum_(0, S, L).
	
	sum_(CurS, CurS, []).
	sum_(CurS, S, [i(H)|T]):-
		NewS = CurS + H,!,
		sum_(NewS, S, T).
	sum_(CurS, S, [l(H)|T]):-
		sum_(0, HSum, H),
		NewS = CurS + HSum,
		sum_(NewS, S, T).

goal
	sum(S, [i(1), i(2), i(3), l([i(1), i(2), l([i(1), i(2), i(3)])])]).