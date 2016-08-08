(* author Stephen Hilliard (c) 2015.
developer Stephen Hilliard (c) 2015.*)
PROGRAM pascal_Functions;
uses crt;
uses {comma delimited names of libraries you use}
const {global constant declaration block}
var {global variable declaration block}
(*type
		elementtype = record
		acctno: integer;
		name: packed array [1..20] of char;
		address: packed array [1..50] of char
	end*)
BEGIN
(*elimination of tail recursion*)
	function carrier ( target: integer; candidate: integer; weights: array of integer ) : boolean;
		begin
			if target = 0 then
			else if (target < 0) or (candidate > n) then
			else { consider solutions with and without candidate }
			if carrier(target-weights[candidate], candidate+1) then
				begin
					writeln(weights[candidate]);
				end
			else {pm;y possible solution is without candidate }
				candidate := candidate + 1;
				goto beginning
		end; { carrier }

END