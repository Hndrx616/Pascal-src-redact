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
(*Mappings*)
	function addone ( i: integer ): integer;
		begin
			return ((i mod maxlength) + 1)
		end; { addone }
	procedure MAKENULL ( war Q: QUEUE );
		begin
			Q.front := 1;
			Q.rear := maxlength
		end; { MAKENULL }
	function EMPTY ( var Q: QUEUE ): boolean;
		begin
			if addone(Q.rear) = Q.front then
				return(true)
			else
				return (false)
		end; { EMPTY }
	function FRONT ( var Q: QUEUE ) : elementtype;
		begin
			if EMPTY(Q) then
				error('queue is empty')
			else
				return(Q.elements[Q.front])
		end; { FRONT }
	procedure ENQUEUE ( x: elementtype; var Q: QUEUE );
		begin
			if addone(addone(Q.rear)) = Q.front then
				error('queue is full')
			else begin
				Q.rear := addone(Q.rear);
				Q.elements[Q.rear] := x
			end
		end; { ENQUEUE }
	procedure DEQUEUE ( var Q: QUEUE );
		begin
			if EMPTY(Q) then
				error('queue is empty')
			else
				Q.front := addone(Q.front)
		end; { DEQUEUE }
END