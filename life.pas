program life;
uses

sysUtils, crt;
type
   cell	= 0 .. 1;
   grid	= array[0 .. 19, 0 .. 19] of cell;

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
      for i:= 0 to 19 do
	 for j:= 0 to 19 do
	       begin
		  //live celln<2 dies.
		  n:= countNeighbours(a,i,j);
		  
		  if(a[i][j]=1)and(n<2) then a[i][j]:= 0
		     //live celln= 2|3 lives
		  else if (a[i][j]=1) and ((n=2)or(n=3)) then a[i][j]:=1
			//live celln>3 dies.
		  else if (a[i][j]=1) and (n>3) then a[i][j]:=0
		     
		     //dead celln=3 live
		  else if (a[i][j]=0) and (n=3) then a[i][j]:=1
		  else continue;
	       end;
   end;
procedure fillArrayRand(var a: grid );
var
   i, j : integer;
    
begin
   for i:=0 to 19 do
   begin
      for j:=0 to 19 do
	 begin
	    a[i][j]:=random(2);
	 end;
   end;
end;

procedure printArray(var a : grid);
var
   i,j : integer;
begin
   for i:=0 to 19 do
   begin
      for j:=0 to 19 do
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
   fillarrayRand(main_grid);
   printarray(main_grid);
   while True do
      begin
	 clrscr();
	 gridState(main_grid);
	 printarray(main_grid);
	 sleep(120);
	 
      end
end.
