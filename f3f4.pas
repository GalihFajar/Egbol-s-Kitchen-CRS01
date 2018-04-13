unit f3Simulasi;


interface
procedure simulasi(var tabBahanMentah : Mentah; var tabBahanOlahan : Olahan; var tabInvenMentah : InvMentah; var tabInvenOlahan : InvOlahan; 
				var tabResepnya : Resepnya; var tabSimulasi : tSimulasi; reseptemp : tempresep);

implementation 

procedure simulasi(var tabBahanMentah : Mentah; var tabBahanOlahan : Olahan; var tabInvenMentah : InvMentah; var tabInvenOlahan : InvOlahan; 
				var tabResepnya : Resepnya; var tabSimulasi : tSimulasi; reseptemp:tempresep);
var
	n	: string;
	date: Tanggal;
begin
write('>>');
readln(n);
while not(n='Stop') do
	begin
		begin
			case n of
			{'Beli bahan'		: 	begin
										belibahan(tSimulasi.Tgl, tabInvenMentah,tabBahanMentah);
									end;}
			{'Olah bahan'		: 	begin
										olahBahan(tabInvenMentah,tabInvenOlahan,tabBahanOlahan,tabInvenOlahan.TglBuat, moni, energi);
									end;}
			{'Jual olahan'		:	begin
										jualOlahan(tabInvenOlahan,}
			//8 belum
			{('Makan'			:	begin
										makan(energi,countmakan,emax);
									end;}
			{'Istirahat'		:	begin
										istirahat(energi,countist,emax);
									end;}
			//11 belum
			'Lihat statistik'	: 	begin
										Lihatstatistik(tabSimulasi);
									end;
			'Tampilkan inventory':	begin
										TampilkanInventory(tabInvenMentah,tabInvenOlahan);
									end;
			'Tampilkan resep'	:	begin
										TampilkanResep(tabResepnya);
									end;
			'Cari resep'		:	begin
										CariResep(tabResepnya);
									end;
			'Tambah resep'		:	begin
										TambahResep(tabInvenMentah,tabInvenOlahan,tempresep);
									end;
			//f17 belom
		end;	
		write('>>');
		readln(n);
	end;
		Lihatstatistik(tabSimulasi);

end.

