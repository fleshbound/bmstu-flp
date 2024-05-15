domains
	llist = l(list); i(integer)
	list = llist*

predicates
	sum(integer, list).
	sum_(integer, integer, list).
	get2sum(integer, list).
	sum2(integer, integer, list).
	
clauses
	sum(S, L):-sum_(0, S, L).
	
	sum_(CurS, CurS, []).
	sum_(CurS, S, [i(H)|T]):-
		NewS = CurS + H,!,
		sum_(NewS, S, T).
	sum_(CurS, S, [l(H)|T]):-
		sum_(0, HSum, H),
		NewS = CurS + HSum,
		sum_(NewS, S, T).
		
	get2sum(S, L):- sum2(0, S, L).
	sum2(N, 0, []):-N<=2.
	sum2(2, H, [i(H)|_]):-!.
	sum2(2, S, [l(H)|_]):-sum(S, H),!.
	sum2(CurN, S, [_|T]):-
		NewN = CurN + 1,
		sum2(NewN, S, T).

goal
	get2sum(S, [i(1), i(2)]).
%	get2sum(S, [i(1), i(3), l([i(1), i(2), l([i(1), i(2), i(3)])])]).
	%sum(S, [i(1), i(2), i(3), l([i(1), i(2), l([i(1), i(2), i(3)])])]).