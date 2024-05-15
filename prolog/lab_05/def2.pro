domains
	list = integer*
	elems = l(list); i(integer); q(llist)
	llist = elems*
	
predicates
	max(integer, list)
	max_(integer, integer, list)
	process(llist, llist)
	
clauses
	max(0, []).
	max(M, [H|T]):-max_(H, M, T).
	max_(CurM, CurM, []).
	max_(CurM, M, [H|T]):-
		H > CurM,!,
		max_(H, M, T).
	max_(CurM, M, [_|T]):-
		max_(CurM, M, T).

	process([], []).
	process([i(H)|T1], [i(H)|T2]):-
		process(T1, T2).
	process([l(H)|T1], [i(H1)|T2]):-
		max(H1, H),
		process(T1, T2).
	process([q(H)|T1], [q(HRes)|T2]):-
		process(H, HRes),
		process(T1, T2).

goal
	process([i(1), q([i(1), l([1, 5, 1]), i(3)]), l([1, 3, 4])], R).