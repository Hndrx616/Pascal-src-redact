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
(*Cursor Implementation of List*)
	var
		SPACE: array [1..maxlength] of record
			element: elementtype;
			next: integer
		end
	function move ( var p, q:integer ): boolean
		{ move puts cell pointed to by p ahead of cell pointed to by q }
		var
			temp: integer;
		begin
			if p = 0 then begin { cell non existent }
				writeln('cell does not exist')
				return(false)
			end
			else begin
				temp := q;
				q := p;
				p := SPACE[q].next;
				SPACE[q].next := temp;
				return(true)
			end
		end; { move} 
END