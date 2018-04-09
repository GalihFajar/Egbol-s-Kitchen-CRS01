unit F1load;

interface

uses tipe;
procedure load (var tabBahanMentah : Mentah; var tabBahanOlahan : Olahan; var tabInvenMentah : InvMentah; var tabInvenOlahan : InvOlahan; 
				var tabResepnya : Resepnya; var tabSimulasi : tSimulasi);

implementation

procedure load (var tabBahanMentah : Mentah; var tabBahanOlahan : Olahan; var tabInvenMentah : InvMentah; var tabInvenOlahan : InvOlahan; 
				var tabResepnya : Resepnya; var tabSimulasi : tSimulasi);

var
	ext		: Text;
	j		: Integer;
	skip	: String;

begin
skip:=' ';
	assign(ext, 'BahanMentah.txt'); //assign file bahan mentah
	reset(ext);
	tabBahanMentah.neff:=0;
	if EOF(ext) then
		begin
			writeln('File kosong');
		end
	else
		begin
		while not(EOF(ext)) do
			begin
				inc(tabBahanMentah.neff); //jika tidak kosong, neff naik
				readln(ext, tabBahanMentah.tabMentah[tabBahanMentah.neff].Nama); //input ke array
				readln(ext, tabBahanMentah.tabMentah[tabBahanMentah.neff].Harga);//sama
				readln(ext, tabBahanMentah.tabMentah[tabBahanMentah.neff].Kadaluarsa);//sama
				readln(ext, skip);//nyekip file eksternalnya 
			end;
			writeln('File BahanMentah.txt terbaca');
		end;
	close(ext);//close
	
	assign(ext,'BahanOlahan.txt'); //assign file bahan olahan
	reset(ext); //ngeset lah ya
	tabBahanOlahan.neff:=0; 
	if EOF(ext) then
		begin
			writeln('File kosong');//kalo kosong
		end
	else
		begin
		while not (EOF(ext)) do
			begin
				inc(tabBahanOlahan.neff); //kalo ga kosong, berarti neffnya nambah
				readln(ext, tabBahanOlahan.tabOlahan[tabBahanOlahan.neff].Nama); //input ke array
				readln(ext, tabBahanOlahan.tabOlahan[tabBahanOlahan.neff].Harga); 
				readln(ext, tabBahanOlahan.tabOlahan[tabBahanOlahan.neff].NButuh);
					for j:=1 to tabBahanOlahan.tabOlahan[tabBahanOlahan.neff].NButuh do
						begin
							readln(ext, tabBahanOlahan.tabOlahan[tabBahanOlahan.neff].bahan[j]);
						end;
				readln(ext, skip); //nyekip
			end;
			writeln('File BahanOlahan.txt terbaca');
		end;
	close(ext);
	
	assign(ext,'InvMentah.txt');
	reset(ext);
	tabInvenMentah.neff:=0;
	if EOF(ext) then
		begin
			writeln('File kosong');
		end
	else
		begin
		while not (EOF(ext)) do
			begin
				inc(tabInvenMentah.neff);
				readln(ext, tabInvenMentah.TabInvMentah[tabInvenMentah.neff].Nama);
				readln(ext, tabInvenMentah.TabInvMentah[tabInvenMentah.neff].Tgl.hari, tabInvenMentah.TabInvMentah[tabInvenMentah.neff].Tgl.bulan, tabInvenMentah.TabInvMentah[tabInvenMentah.neff].Tgl.tahun);
				readln(ext, tabInvenMentah.TabInvMentah[tabInvenMentah.neff].Jumlah);
				readln(ext, skip);
			end;
			writeln('File InventoryMentah.txt sudah terbaca');
		end;
	close(ext);
	
	assign(ext,'InvOlahan.txt');
	reset(ext);
	tabInvenOlahan.neff:= 0;
	if EOF(ext) then
		begin
			writeln('File Kosong');
		end
	else
		begin
		while not(EOF(ext)) do
			begin
				inc(tabInvenOlahan.neff);
				readln(ext, tabInvenOlahan.TabInvOlahan[tabInvenOlahan.neff].Nama);
				readln(ext, tabInvenOlahan.TabInvOlahan[tabInvenOlahan.neff].TglBuat.hari, tabInvenOlahan.TabInvOlahan[tabInvenOlahan.neff].TglBuat.bulan, tabInvenOlahan.TabInvOlahan[tabInvenOlahan.neff].TglBuat.tahun);
				readln(ext, tabInvenOlahan.TabInvOlahan[tabInvenOlahan.neff].Jumlah);
				readln(ext, skip);
			end;
			writeln('File InventoryOlahan.txt sudah terbaca');
		end;
	close(ext);
	
	assign(ext,'Resep.txt');
	reset(ext);
	tabResepnya.neff:=0;
	if EOF(ext) then
		begin
			writeln('File Kosong');
		end
	else
		begin
		while not(EOF(ext)) do
			begin
				inc(tabResepnya.neff);
				readln(ext, tabResepnya.TabResep[tabResepnya.neff].Nama);
				readln(ext, tabResepnya.TabResep[tabResepnya.neff].Harga);
				readln(ext, tabResepnya.TabResep[tabResepnya.neff].NButuh);
					for j:=1 to tabResepnya.TabResep[tabResepnya.neff].NButuh do
						begin
							readln(ext, tabResepnya.TabResep[tabResepnya.neff].Olah[j]);
						end;
					readln(ext, skip);
			end;
			writeln('File Resep.txt sudah terbaca');
		end;
	close(ext);

	assign(ext, 'Simulasi.txt');
	reset(ext);
	tabSimulasi.neff:=0;
	if EOF(ext) then
		begin
			writeln('File kosong');
		end
	else 
		begin
			while not(EOF(ext)) do
				begin
					inc(tabSimulasi.neff);
					readln(ext, tabSimulasi.Tab[tabSimulasi.neff].Nomor);
					readln(ext, tabSimulasi.Tab[tabSimulasi.neff].Tgl.hari, tabSimulasi.Tab[tabSimulasi.neff].Tgl.bulan, tabSimulasi.Tab[tabSimulasi.neff].Tgl.tahun);
					readln(ext, tabSimulasi.Tab[tabSimulasi.neff].HariHidup);
					readln(ext, tabSimulasi.Tab[tabSimulasi.neff].Energi);
					readln(ext, tabSimulasi.Tab[tabSimulasi.neff].KapasitasInventory);
					readln(ext, tabSimulasi.Tab[tabSimulasi.neff].TotalBeliMentah);
					readln(ext, tabSimulasi.Tab[tabSimulasi.neff].TotalOlahBuat);
					readln(ext, tabSimulasi.Tab[tabSimulasi.neff].TotalOlahJual);
					readln(ext, tabSimulasi.Tab[tabSimulasi.neff].TotalResepJual);
					readln(ext, tabSimulasi.Tab[tabSimulasi.neff].TotalPemasukan);
					readln(ext, tabSimulasi.Tab[tabSimulasi.neff].TotalPengeluaran);
					readln(ext, tabSimulasi.Tab[tabSimulasi.neff].TotalUang);
					readln(ext, skip);
				end;
				writeln('File Simulasi.txt terbaca');
		end;
	close(ext);
end;
end.
