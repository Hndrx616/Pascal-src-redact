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
(*Double Linked List*)
	procedure INSERT ( x: elementtype; p: position; var L: LIST );
		begin
			if p = 0 then begin
				{ insert at first position }
				if move(available, L) then
					SPACE[L].element := x
			end
			else { insert at postion other than first }
				if move(available, SPACE[p].next) then
					{ cell for x now pointed to by SPACE[p].next }
					SPACE[SPACE[p].next].element := x
		end; { INSERT }
	procedure DELETE ( p:position; var L:LIST );
		begin
			if p = 0 then
				move(L, available)
			elementsmove(SPACE[p].next, available)
		end; { DELETE }
	procedure initialze
		{ initialize links SPACE into on available list }
		var
			i: integer;
		begin
			for i := maxsize - 1 downto 1 do
				SPACE[i].next := i + 1;
			available := 1;
			SPACE[maxsize].next := 0 { mark end of available list }
		end; { initialize }
	type
		celltype = record
			element: elementtype;
			next,previous: ^celltype
		end;
		position = ^celltype;
	procedure DELETE ( var p: position );
		begin
			if p^.previous <> nil then
				{deleted cell not the first}
			if p^.next <> nil then
				{deleted cell not the last}
				p^.next^.previous := p^.previous
		end; { DELETE }
END