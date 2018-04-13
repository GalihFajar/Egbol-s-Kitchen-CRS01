unit f15;
//Cari Resep

interface

uses tipe,f1load;

procedure CariResep(var Input: resepnya);

implementation

procedure CariResep(var Input: resepnya);

// KAMUS
var
  i,j:integer;
  search:string;
  status:boolean;

// ALGORITMA
begin
  write('Masukkan Nama Resep Yang Akan Dicari : ');
  readln(search);
  writeln;
  writeln('Hasil Pencarian Resep :');
  for i:=1 to Input.neff do
  begin
    if search=Input.TabResep[i].Nama then
    begin
      writeln;
      status:=true;
      writeln('Nama Resep : ',Input.TabResep[i].Nama);
      writeln('Harga Jual : ',Input.TabResep[i].Harga);
      writeln('Banyak Bahan : ',Input.TabResep[i].NButuh);
      for j:=1 to Input.TabResep[i].NButuh do
      begin
        writeln('Nama Bahan Ke-',j,' : ',Input.TabResep[i].Olah[j]);
      end;
    end;
  end;
  if status=false then
  begin
    writeln;
    writeln('Resep Tidak Ditemukan');
    writeln;
  end
  else begin
    writeln;
  end;
end;
end.