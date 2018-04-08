program Parse_String; //Alpha Test

//Dibuat Oleh : Galih Fajar
// Ver 03/04/2018

{DESKRIPSI PROGRAM}
  {Program memisahkan sebuah string menjadi string lain sebanyak jumlah pembagi '|'.}

var
  simpan : array [1..100] of string; //array yang menyimpan string yang telah terpisah.
  temp : string; //Konstruktor string yang ingin dipisah.
  kata : string; //Input
  i  : integer;
  j : integer;

begin
  readln(kata);
  temp := '';
  j := 1;
  kata := kata + '|'; //Menambah '|' di akhir kata agar mudah dipisahkan.
  for i := 1 to length(kata) do begin
    if (kata[i] = '|') then
      begin
        simpan[j] := temp; //Menyimpan string ke-n ke dalam array ke-n;
        j := j + 1; //Menambah indeks.
        temp := ''; //Konstruktor di-reset.
      end
    else if ((kata[i] <> '|') and (kata[i] <> ' ')) then
      begin
        temp := temp + kata[i]; //Konstruksi string.
      end
    else if ((kata[i] = ' ') and (kata[i] <> '|')) then
      begin
        temp := temp;
      end;
  end;
  writeln(simpan[1]);
  writeln(simpan[2]); //Testing.
  writeln(simpan[3]);
  writeln(simpan[4]);
end.


{Kelemahan Program}
  { > Program belum dirancang untuk memisahkan string menjadi integer.
    > Spasi masih ikut terkonstruksi.
  }
