program IntegerToString;

var
  i : integer;
  temp : string;
  bilangan : integer;
  x : integer;
begin
  read(bilangan);
  temp := ' ';
  x := bilangan;
  while (x > 0) do
    begin
      temp := chr(x mod 10 + 48) + temp;
      x := x div 10;
    end;
  writeln(temp);
end.
