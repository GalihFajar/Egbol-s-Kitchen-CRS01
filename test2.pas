uses F16,tipe,searching;
var
  a : InvMentah;
  b : InvOlahan;
begin
  a.Neff := 20;
  b.Neff := 20;
  a.TabInvMentah[1].nama := 'Cecak';
  a.TabInvMentah[2].nama := 'Egbol';
  a.TabInvMentah[3].nama := 'Anu Egbol';

  b.TabInvOlahan[1].nama := 'Cecak Goreng';
  b.TabInvOlahan[2].nama := 'Egbol Goreng';
  b.TabInvOlahan[3].nama := 'Anu Egbol Goreng';

  daftarresep.TabResep[1].nama := 'Pudding';
  daftarresep.TabResep[1].harga := 5000;
  daftarresep.TabResep[1].NButuh := 2;
  daftarresep.TabResep[1].olah[1] := 'Pisang';
  daftarresep.TabResep[1].olah[2] := 'Susu';
  TambahResep(a,b,daftarresep);
  writeln(b.tabinvolahan[2].nama);
  writeln(searchMentah(a,'Anu Egbol'));
  writeln(searchMentah(a,'Sahabat Egbol'));
  writeln(searchOlahan(b,'Egbol Goreng'));


  writeln(daftarresep.TabResep[2].nama);
  writeln(daftarresep.TabResep[2].harga);
  writeln(daftarresep.TabResep[2].nbutuh);
  writeln(daftarresep.TabResep[2].olah[1]);
  writeln(daftarresep.TabResep[2].olah[2]);
end.
