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
(*Pointer Implementation of List*)
	procedure INSERT ( x: elementtype; p: position; var L: LIST );
		{ INSERT places x at position p in list L }
		var
			q: position;
		begin
			if L.last >= maxlength then
				error('list is full')
			else if (p > L.last + 1) or (p < 1) then
				error('positiondoes not exist')
			else begin
				for q := L.last downto p do
					{ shift elements at p, p+1,...down one position }
					L.elements[q+1] := L.elemnts[q];
				L.last := L.last + 1;
				L.elements[p] := x
			end
		end; { INSERT }
	procedure DELETE ( p: position; var L: LIST );
		{ DELETE removes the element at position p of list L }
		var
			q: position;
		begin
			if (p > L.last) or (p < 1) then
				 error('position does not exisdt')
			else begin
				L.last := L.last - 1;
				for q := p to L.last do
					{ shift elements at p+1, p+2,...up one position }
					L.elements[q] := L.elemnts[q+1]
			end
		end; { DELETE }
	function Locate ( x: elementtype; L: LIST ): position;
		{ LOCATE returns the position of x on list L }
		var
			q: position;
		begin
			for q := 1 to L.last do
				if L.elements[q] = x then
					return(q);
			return(L.last + 1) { if not found }
		end; { LOCATE }
	type
		celltype = record
			element: elementtype;
			next: ^celltype
		end;
		LIST = ^celltype;
		position = ^celltype;
	function END ( L: LIST ): position;
		{ END returns a pointer to the last cell of L }
		var
			q: position;
		begin
			q :=L;
			while q^.next <> nil do
				q := q^.next;
			return (q)
		end; { END }
	procedure INSERT ( x: elementtype; p: position);
		var
			temp: position;
		begin
			temp: position;
			new(p^.next);
			p^.next^.element := x;
			p^.next^.next := temp
		end; { INSERT }
	procedure DELETE ( p: position );
		Begin
			p^.next := p^.next^.next
		end; { DELETE }
	function LOCATE ( x: elementtype; L: LIST ): position;
		var
			p: position;
		begin
			P := L;
			while p^.next <> nil do
				if p^.next^.element = x then
					return(p)
				else
					p := p^.next;
			return(p) { if not found }
		end; { LOCATE }
	function MAKENULL ( var L: List ): position;
		begin
		 new(L);
		 L^.next := nil;
		 return(L)
		end; { MAKENULL }
END