unit f13; //Lihat Inventory

interface

uses tipe,f1load;

procedure SortingMentah(var Input: InvMentah);
procedure SortingOlahan(var Input: InvOlahan);
procedure TampilkanInventory(var tabInvenMentah : InvMentah; var tabInvenOlahan : InvOlahan);

implementation

procedure SortingMentah(var Input: InvMentah);

var
i,j,x:integer;
temp:string;

begin
    for i:=Input.neff downto 2 do begin
			for j:=1 to i-1 do begin
				if Input.TabInvMentah[j].Nama > Input.TabInvMentah[j+1].Nama then begin
					temp := Input.TabInvMentah[j+1].Nama;
					Input.TabInvMentah[j+1].Nama:=Input.TabInvMentah[j].Nama;
					Input.TabInvMentah[j].Nama :=temp;
					
					x := Input.TabInvMentah[j+1].Tgl.hari;
					Input.TabInvMentah[j+1].Tgl.hari:=Input.TabInvMentah[j].Tgl.hari;
					Input.TabInvMentah[j].Tgl.hari :=x;
					
					x := Input.TabInvMentah[j+1].Tgl.bulan;
					Input.TabInvMentah[j+1].Tgl.bulan:=Input.TabInvMentah[j].Tgl.bulan;
					Input.TabInvMentah[j].Tgl.bulan :=x;
					
					x := Input.TabInvMentah[j+1].Tgl.tahun;
					Input.TabInvMentah[j+1].Tgl.tahun:=Input.TabInvMentah[j].Tgl.tahun;
					Input.TabInvMentah[j].Tgl.tahun :=x;
					
					x := Input.TabInvMentah[j+1].Jumlah;
					Input.TabInvMentah[j+1].Jumlah:=Input.TabInvMentah[j].Jumlah;
					Input.TabInvMentah[j].Jumlah :=x;
				end;
			end;
	end;
end;

procedure SortingOlahan(var Input: InvOlahan);

var
i,j,x:integer;
temp:string;

begin
    for i:=Input.neff downto 2 do begin
			for j:=1 to i-1 do begin
				if Input.TabInvOlahan[j].Nama > Input.TabInvOlahan[j+1].Nama then begin
					temp := Input.TabInvOlahan[j+1].Nama;
					Input.TabInvOlahan[j+1].Nama:=Input.TabInvOlahan[j].Nama;
					Input.TabInvOlahan[j].Nama :=temp;
					
					x := Input.TabInvOlahan[j+1].TglBuat.hari;
					Input.TabInvOlahan[j+1].TglBuat.hari:=Input.TabInvOlahan[j].TglBuat.hari;
					Input.TabInvOlahan[j].TglBuat.hari :=x;
					
					x := Input.TabInvOlahan[j+1].TglBuat.bulan;
					Input.TabInvOlahan[j+1].TglBuat.bulan:=Input.TabInvOlahan[j].TglBuat.bulan;
					Input.TabInvOlahan[j].TglBuat.bulan :=x;
					
					x := Input.TabInvOlahan[j+1].TglBuat.tahun;
					Input.TabInvOlahan[j+1].TglBuat.tahun:=Input.TabInvOlahan[j].TglBuat.tahun;
					Input.TabInvOlahan[j].TglBuat.tahun :=x;
					
					x := Input.TabInvOlahan[j+1].Jumlah;
					Input.TabInvOlahan[j+1].Jumlah:=Input.TabInvOlahan[j].Jumlah;
					Input.TabInvOlahan[j].Jumlah :=x;
					
				end;
			end;
	end;
end;

procedure TampilkanInventory(var tabInvenMentah : InvMentah; var tabInvenOlahan : InvOlahan);

var
i:integer;

begin
SortingMentah(tabInvenMentah);
SortingOlahan(tabInvenOlahan);
writeln('Daftar Bahan Mentah Yang Tersedia Di Inventori :');
writeln;
	for i:=1 to tabInvenMentah.neff do begin
		writeln('Nama Bahan Mentah : ',tabInvenMentah.TabInvMentah[i].Nama);
		writeln('Tanggal Beli : ',tabInvenMentah.TabInvMentah[i].Tgl.hari,
				'/',tabInvenMentah.TabInvMentah[i].Tgl.bulan,
				'/',tabInvenMentah.TabInvMentah[i].Tgl.tahun);
		writeln('Jumlah : ',tabInvenMentah.TabInvMentah[i].Jumlah);
		writeln;
	end;
writeln('Daftar Bahan Olahan Yang Tersedia Di Inventori :');
writeln;
	for i:=1 to tabInvenOlahan.neff do begin
		writeln('Nama Bahan Olahan : ',tabInvenOlahan.TabInvOlahan[i].Nama);
		writeln('Tanggal Buat : ',tabInvenOlahan.TabInvOlahan[i].TglBuat.hari,
				'/',tabInvenOlahan.TabInvOlahan[i].TglBuat.bulan,
				'/',tabInvenOlahan.TabInvOlahan[i].TglBuat.tahun);
		writeln('Jumlah : ',tabInvenOlahan.TabInvOlahan[i].Jumlah);
		writeln;
	end;
	
end;
end.

