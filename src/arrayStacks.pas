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
	(*Array of Stacks*)
	procedure MAKENULL ( var S: STACK );
		begin
			S.top := maxlength + 1
		end; { MAKENULL }
	function EMPTY ( S: STACK ): boolean;
		begin
			if S.top > maxlength then
				return(true)
			else
				return(false)
		end; { EMPTY }
	function TOP ( var S: STACK ): elementtype;
		begin
			if EMPTY(S) then
				error('stack is empty')
			else
				return(S.elements[S.top])
		end; { TOP }
	procedure POP ( var S: STACK);
		begin
			if EMPTY(S) then
				error('stack is empty')
			else
				S.top := S.top + 1
		end; { POP }
	procedure PUSH ( X: elementtype; var S: STACK );
		begin 
			if S.top = 1 then
				error('stack is full')
			else begin
				S.top := S.top - 1;
				S.elements[S.top] := x
			end
		end; { PUSH }
	type
		celltype = record
			element: elementtype;
			next: ^celltype
		end
	type
		QUEUE = record
			front, rear: ^celltype
		end
END