unit f14; //Lihat Resep

interface

uses tipe,f1load;

procedure TampilkanResep(var Input: resepnya);

implementation

procedure TampilkanResep(var Input: resepnya);

var
  i,j,x:integer;
  n:longint;
  temp:string;
  tukar:Array [1..20] of String;

begin
  for i:=Input.neff downto 2 do
  begin
    for j:=1 to i-1 do
    begin
      if Input.TabResep[j].Nama > Input.TabResep[j+1].Nama then
      begin
        temp := Input.TabResep[j+1].Nama;
        Input.TabResep[j+1].Nama:=Input.TabResep[j].Nama;
        Input.TabResep[j].Nama :=temp;

        n := Input.TabResep[j+1].Harga;
        Input.TabResep[j+1].Harga:=Input.TabResep[j].Harga;
        Input.TabResep[j].Harga :=n;

        x := Input.TabResep[j+1].NButuh;
        Input.TabResep[j+1].NButuh:=Input.TabResep[j].NButuh;
        Input.TabResep[j].NButuh :=x;

        tukar := Input.TabResep[j+1].Olah;
        Input.TabResep[j+1].Olah:=Input.TabResep[j].Olah;
        Input.TabResep[j].Olah :=tukar;
      end;
    end;
  end;

  writeln('Daftar Resep Yang Tersedia :');
  writeln;
  for i:=1 to Input.neff do
  begin
    writeln('Nama Resep : ',Input.TabResep[i].Nama);
    writeln('Harga Jual : ',Input.TabResep[i].Harga);
    writeln('Banyak Bahan : ',Input.TabResep[i].NButuh);
    for j:=1 to Input.TabResep[i].NButuh do
    begin
      writeln('Nama Bahan Ke-',j,' : ',Input.TabResep[i].Olah[j]);
    end;
    writeln;
  end;
end;
end.