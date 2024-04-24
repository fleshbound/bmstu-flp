domains
	list = integer*

predicates
	mult_by_num(integer, list, list).
	oddlist(list, list).
		
clauses
	mult_by_num(_, [], []).
	mult_by_num(N, [H|T], [H1|T1]):-
		H1 = H * N,
		mult_by_num(N, T, T1).

	oddlist([], []).
	oddlist([H|T], [H1|T1]):-
		0 = H mod 2,
		H1 = H,
		oddlist(T, T1).
	oddlist([_|T], [_|T1]):-
		oddlist(T, T1).
	
goal
%	mult_by_num(2, [1, 2, 3], X).
	oddlist([1, 2, 3, 4], X).