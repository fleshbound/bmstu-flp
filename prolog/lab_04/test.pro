domains
	props = id(integer); name(symbol); sex(string)
	props_list = props*

predicates
	properties(props_list).
	id_name(integer, string).
	
clauses
	properties([id(1) | [name(valeria), sex("female")]]).
	id_name(Id, X):-properties([id(Id), name(X), _]).
	
goal
%	properties([id(1), name(X) | _]).
%	id_name(1, X).