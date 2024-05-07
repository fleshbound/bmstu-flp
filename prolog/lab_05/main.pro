domains
	number = real
	list = number*

predicates
	length(number, list)
	len(number, number, list)
	sum(number, list)
	sum_(number, number, list)
	oddsum(number, list)
	oddsum_(number, number, list)
	filter(number, list, list)
	deletefirst(number, list, list)
	deleteall(number, list, list)
	union(list, list, list)
		
clauses
	length(Len, L):-
		len(0, Len, L).
	len(CurLen, CurLen, []).
	len(CurLen, Len, [_|T]):-
		NewLen = CurLen + 1,
		len(NewLen, Len, T).

	sum(S, L):-
		sum_(0, S, L).
	sum_(CurS, CurS, []).
	sum_(CurS, S, [H|T]):-
		NewS = CurS + H,
		sum_(NewS, S, T).
		
	oddsum(S, L):-
		oddsum_(0, S, L).
	oddsum_(CurS, CurS, []).
	oddsum_(CurS, CurS, [_|[]]).
	oddsum_(CurS, S, [_, H1|T]):-
		NewS = CurS + H1,
		oddsum_(NewS, S, T).

	filter(_, [], []).
	filter(N, [H|T], L):-
		H <= N,
		filter(N, T, L).
	filter(N, [H|T], [H|T1]):-
		H > N,
		filter(N, T, T1).

	deleteall(_, [], []).
	deleteall(N, [N|T], L):-
		deleteall(N, T, L),!.
	deleteall(N, [H|T], [H|T1]):-
		deleteall(N, T, T1).
	
	deletefirst(_, [], []).
	deletefirst(N, [N|T], T):-!.
	deletefirst(N, [H|T], [H|T1]):-
		deletefirst(N, T, T1).
		
	union([], L, L).
	union([H1|T1], L, [H1|T3]):-
		union(T1, L, T3).
goal
%	length(L, []).
%	sum(S, [1.5, 2.4]).
	oddsum(S, [1, 2, 3, 4, 5, 6]).
%	filter(2, [1, 1, 1], L).
%	deleteall(2, [1, 2, 3, 2, 3], R).
%	deletefirst(3, [1, 2, 3, 2, 3], R).
%	union([1, 2, 3], [4, 5, 6], R).