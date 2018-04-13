unit F2exit;

interface

uses tipe;
procedure exit (var tabBahanMentah : Mentah; var tabBahanOlahan : Olahan; var tabInvenMentah : InvMentah; var tabInvenOlahan : InvOlahan; 
				var tabResepnya : Resepnya; var tabSimulasi : tSimulasi; reseptemp:tempresep);

implementation

procedure exit (var tabBahanMentah : Mentah; var tabBahanOlahan : Olahan; var tabInvenMentah : InvMentah; var tabInvenOlahan : InvOlahan; 
				var tabResepnya : Resepnya; var tabSimulasi : tSimulasi; reseptemp:tempresep);

var
	ext		: Text;
	i,j		: Integer;
	skip	: String;

begin
skip:=' ';
assign (ext,'BahanMentah.txt');
rewrite(ext);
	for i:=1 to tabBahanMentah.Neff do
		begin
			writeln(ext, tabBahanMentah.TabMentah[i].Nama);
			writeln(ext, tabBahanMentah.TabMentah[i].Harga);
			writeln(ext, tabBahanMentah.TabMentah[i].Kadaluarsa);
			writeln(ext, skip);
		end;
		close(ext);

assign(ext,'BahanOlahan.txt');
rewrite(ext);
	for i:=1 to tabBahanOlahan.Neff do
		begin
			writeln(ext, tabBahanOlahan.TabOlahan[i].Nama);
			writeln(ext, tabBahanOlahan.TabOlahan[i].Harga);
			writeln(ext, tabBahanOlahan.TabOlahan[i].NButuh);
				for j:=1 to tabBahanOlahan.TabOlahan[i].NButuh do
					begin
						writeln(ext, tabBahanOlahan.TabOlahan[i].bahan[j]);
					end;
			writeln(ext, skip);
		end;
		close(ext);

assign (ext,'InvMentah.txt');
rewrite(ext);
	for i:=1 to tabInvenMentah.Neff do
		begin
			writeln(ext, tabInvenMentah.TabInvMentah[i].Nama);
			writeln(ext, tabInvenMentah.TabInvMentah[i].Tgl.hari, tabInvenMentah.TabInvMentah[i].Tgl.bulan, tabInvenMentah.TabInvMentah[i].Tgl.tahun);
			writeln(ext, tabInvenMentah.TabInvMentah[i].Jumlah);
			writeln(ext, skip);
		end;
		close(ext);
		
assign (ext,'InvOlahan.txt');
rewrite(ext);
	for i:=1 to tabInvenOlahan.Neff do
		begin
			writeln(ext, tabInvenOlahan.TabInvOlahan[i].Nama);
			writeln(ext, tabInvenOlahan.TabInvOlahan[i].TglBuat.hari, tabInvenOlahan.TabInvOlahan[i].TglBuat.bulan, tabInvenOlahan.TabInvOlahan[i].TglBuat.tahun);
			writeln(ext, tabInvenOlahan.TabInvOlahan[i].Jumlah);
			writeln(ext, skip);
		end;
		close(ext);

assign (ext,'Resep.txt');
rewrite(ext);
	for i:=1 to tabResepnya.Neff do
		begin
			writeln(ext, tabResepnya.TabResep[i].Nama);
			writeln(ext, tabResepnya.TabResep[i].Harga);
			writeln(ext, tabResepnya.TabResep[i].NButuh);
			for j:=1 to tabResepnya.TabResep[i].Nbutuh do
				begin
					writeln(ext, tabResepnya.TabResep[i].Olah[j]);
				end;
		end;
		close(ext);
		
assign (ext,'Simulasi.txt');
rewrite(ext);
	for i:=1 to tabSimulasi.Neff do
		begin
			writeln(ext, tabSimulasi.Tab[i].Nomor);
			writeln(ext, tabSimulasi.Tab[i].Tgl.hari, tabSimulasi.Tab[i].Tgl.bulan, tabSimulasi.Tab[i].Tgl.tahun);
			writeln(ext, tabSimulasi.Tab[i].HariHidup);
			writeln(ext, tabSimulasi.Tab[i].Energi);
			writeln(ext, tabSimulasi.Tab[i].KapasitasInventory);
			writeln(ext, tabSimulasi.Tab[i].TotalBeliMentah);
			writeln(ext, tabSimulasi.Tab[i].TotalOlahBuat);
			writeln(ext, tabSimulasi.Tab[i].TotalOlahJual);
			writeln(ext, tabSimulasi.Tab[i].TotalResepJual);
			writeln(ext, tabSimulasi.Tab[i].TotalPemasukan);
			writeln(ext, tabSimulasi.Tab[i].TotalPengeluaran);
			writeln(ext, tabSimulasi.Tab[i].TotalPendapatan);
			writeln(ext, skip);
		end;
		close(ext);
		
end;
end.
