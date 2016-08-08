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
(*Stacks and Recursive Procedures*)
	procedure MAKENULL ( var M: MAPPING );
		{ same as for list }
	procedure ASSIGN ( var M: MAPPING;
			d: domaintype; r: rangetype );
		var
			x: elementtype; { the pair (d,r) }
			p: position; { used to go from first to last position on list M }
		begin
			x.domain := d;
			x.range := r;
			p := FIRST(M);
			while p <> END(M) do
				if RETRIEVE(p, M).domain = d then
					DELETE(p, M) { remove element with domain d }
				else

					p := NEXT(p, M);
			INSERT(x, FIRST(M),M) { put (d, r) at front of list }
		end; { ASSIGN }
	function COMPUTE ( var M: MAPPING;
			d: domaintype; var r: rangetype ) :boolean;
		var
			p: position;
		begin
			p := FIRST(M);
			while P<> END(M) do begin
				if RETRIEVE(p, M).range;
				return (true)
			end;
			p := NEXT(p,M)
		end;
		return (false) { if d is not in domain }
	end; { COMPUTE }
END