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
	(*Stacks*)
	procedure EDIT;
		var
			S: STACK;
			c: char;
		begin
			MAKENULL(S);
			while not eoln do begin
				read(c);
				if c = '#' then
					POP(S)
				else if c = '@' then
					MAKENULL(S)
				else { c is an ordinary character }
					PUSH(c, S)
			end;
			print S in reverse order
		end;
	type
		STACK = record
			top: integer;
			elements: array[1...maxlength] of elementtype
		end;
END