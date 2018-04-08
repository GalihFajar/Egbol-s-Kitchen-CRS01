uses F16,tipe;

begin
  resepnya[1].nama := 'Pudding';
  resepnya[1].harga := 5000;
  resepnya[1].NButuh := 2;
  resepnya[1].olah[1] := 'Pisang';
  resepnya[1].olah[2] := 'Susu';
  TambahResep(resepnya);

  writeln(resepnya[2].nama);
  writeln(resepnya[2].harga);
  writeln(resepnya[2].nbutuh);
  writeln(resepnya[2].olah[1]);
  writeln(resepnya[2].olah[2]);
end.
