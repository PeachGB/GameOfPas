program life;
uses
sysUtils, crt;

const
   ROWS	= 35;
   COLS	= 35;

type
   cell	= 0 .. 1;
   grid	= array[0 .. ROWS-1, 0 .. COLS-1] of cell;

function countNeighbours(a : grid;index,jindex : integer):integer;
var i,j,n	: integer;
begin
   n:=0;
   for i:= -1 to 1 do
      for j:= -1 to 1 do
	 begin
	    if (a[index+i][jindex+j]=1) then n:= n+1;
	 end;
   countNeighbours:= n;
end;

procedure gridState(var a :grid);
var
   i,j,n: integer;
   begin
      for i:= 0 to ROWS do
	 for j:= 0 to COLS do
	       begin
		  n:= countNeighbours(a,i,j);
		  
		  if (a[i][j]=1) and (n=2) then a[i][j]:=1
		  else if (a[i][j]=1) and (n=3) then a[i][j]:=1
		  else if (a[i][j]=0) and (n=3) then a[i][j]:=1
		  else if (a[i][j]=1)then a[i][j]:=0
		          	  else continue;
	       end;
   end;

procedure fillArrayCentRand(var a : grid;sqArea:integer);
var
   i, j : integer;
    
begin
   for i:=0 to ROWS do
      for j:=0 to COLS do
      begin
	 a[i][j]:=0;
      end;
      for i:=(ROWS DIV 2)-(sqArea DIV 2) to (ROWS DIV 2)+(sqArea DIV 2) do
	 for j:=(ROWS DIV 2)-(sqArea DIV 2) to (ROWS DIV 2)+(sqArea DIV 2) do
	 begin
	    a[i][j]:= Random(2);
	 end;
   
end;


procedure fillArrayRand(var a: grid );
var
   i, j : integer;
    
begin
   for i:=0 to ROWS do
   begin
      for j:=0 to COLS do
	 begin
	    a[i][j]:=random(2);
	 end;
   end;
end;

procedure printArray(var a : grid);
var
   i,j : integer;
begin
   for i:=0 to ROWS do
   begin
      for j:=0 to COLS do
      begin
	 write(a[i][j]);
      end;
     
      writeln('');
   end;
end;

var
   main_grid : grid;
   main_cell : cell;
begin
   randomize();
   fillarrayCentRand(main_grid,10);
   printarray(main_grid);
   while True do
      begin
	 clrscr();
	 gridState(main_grid);
	 printarray(main_grid);
	 sleep(120);
	 
      end
end.
