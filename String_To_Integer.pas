program String_To_Integer; // Alpha Test

// Dibuat Oleh : Galih Fajar
// Ver : 03/04/2018

{DESKRIPSI PROGRAM}
  {Program menerima masukan berupa string(string diekspektasikan merupakan sebuah set bilangan) dan mengonversi string tersebut menjad integer.}


var
  masukan : string; // Masukan berupa string.
  i : longint; // Counter.
  temp : longint; // Temporal.
begin
  read(masukan);
  temp := 0;
  for i := 1 to length(masukan) do begin
    if (i <> length(masukan)) then
      temp := (temp + ((ord(masukan[i])) - 48)) * 10 // Mengonversi char menjadi ASCII lalu diubah sedemikian rupa sehingga menyerupai integer aslinya.
    else
      temp := temp + ((ord(masukan[i])) - 48);
  end;
  writeln(temp); // Testing
end.
