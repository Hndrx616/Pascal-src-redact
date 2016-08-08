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
(*Array Implementation of Mapping*)
	type
		MAPPING = array[domaintype] of rangetype;
	type
		elementtupe = record
			domain: domaintype;
			range: rangetype
		end;
	procedure MAKENULL ( var M: MAPPING );
		var
			i; domaintype;
		begin
			for i := firstvalue to lastvalue do
				M[i] := undefined
		end; { MAKENULL }
	procedure ASSIGN ( var M: MAPPING;
			d: domaintype; r: rangetype );
		begin
			M[d] := r
		end; { ASSIGN }
	function COMPUTE ( var M: MAPPING;
			d: domaintype; var r: rangetype ) : boolean;
		begin
			if M[d] = undefined then
				return (false)
			else begin
				r := M[d];
				return (true)
			end
		end; { COMPUTE }
END