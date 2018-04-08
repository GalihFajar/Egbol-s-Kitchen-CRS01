const
  delimiter = '|';

var
  i : integer;
  j : integer;
  k : integer;
  m : integer;
  kata : string;
  temp : string;
  pisang : string;

begin
  read(kata);
  j := 0;
  i := 1;
  while (temp[i] <>' ') do begin
    j := i;
    temp[i] := kata[i];
    if (kata[i] = delimiter) then
      begin
        m := j;
      end;
    i := i + 1;
  end;
  for k := 1 to m-2 do begin
    pisang[k] := temp[k]
  end;
  writeln(pisang);
end.



















pisang | 10000
