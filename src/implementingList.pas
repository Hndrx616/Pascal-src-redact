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
(*Implementation of List*)
	procedure PURGE ( var L: LIST );
		{ PURGE removes duplicate elements from list L }
		var
			p, q: positon; { p will be the "current" position 
				in L, and q will move ahead to find equal elements }
		begin
			p := FIRST(L):
			while p <> END(L) do begin
				q := NEXT(p, L);
				while q <> END(L) do
					if same(RETRIEVE(p, L), RETRIEVE(q, L)) then
							DELETE(q, L)
					else
						q := NEXT(q, L);
				p := NEXT(p, L)
			end
		end; { PURGE }
	const
		maxlength = 100 { some suitable constant};
	type
		LIST = record
			elements: array[1..maxlength] of elementtype;
			last: integer
		end;
		position = integer;
	function END ( var L: LIST ): position; /*dagger*/
		begin
			return(L.last + 1)
		end; { END }
END