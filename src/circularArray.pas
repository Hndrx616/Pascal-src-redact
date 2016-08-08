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
(*Circular Array*)
	procedure MAKENULL ( var Q: QUEUE );
		begin
			new(Q.front);	{ create header cell }
			Q.front^.next :=nil;
			Q.rear := Q.front { header is both first and last call }
		end; { MAKENULL }	
	function EMPTY ( Q: QUEUE): boolean;
		begin
			if Q.front = Q.rear then
				return(true)
			else
				return(false)
		end; { EMPTY }
	function FRONT ( Q: QUEUE ): elementtype;
		begin
			if EMPTY(Q) then
				error('queue is empty')
			else
				return(Q.front^.next^.element)
		end; { FRONT }
	procedure ENQUEUE ( x: elementtype; var Q: QUEUE );
		begin
			new(Q.rear^.next); { add new cell to rear of que }
			Q.rear := Q.rear^.next;
			Q.rear^.element := x;
			Q.rear^.next := nil
		end; { ENQUEUE }
	procedure DEQUEUE ( var Q: QUEUE );
		begin
			if EMPTY(Q) then
				error('queue is empty')
			else
				Q.front := Q.front^.next
		end; { DEQUEUE }
	type
		QUEUE = record
			elements: array[1...maxlength] of elementtype;
			front, rear: integer
		end;
END