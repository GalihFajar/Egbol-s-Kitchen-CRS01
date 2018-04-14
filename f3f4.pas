unit f3f4;

interface

uses tipe,F1load,f2exit,f5,f6,f7,f8,f9,f10,f11tidur,f12statistik,f13,f14,f15,f16,f17;

procedure simulasi(var tabBahanMentah : Mentah; var tabBahanOlahan : Olahan; var tabInvenMentah : InvMentah; var tabInvenOlahan : InvOlahan;
				var tabResepnya : Resepnya; var tabSimulasi : tSimulasi; duid : LongInt; power:Integer; countmakan:Integer; countist:Integer;
					harihidup:Integer; simul:Simulasi);

implementation

procedure simulasi(var tabBahanMentah : Mentah; var tabBahanOlahan : Olahan; var tabInvenMentah : InvMentah; var tabInvenOlahan : InvOlahan;
				var tabResepnya : Resepnya; var tabSimulasi : tSimulasi; duid : LongInt; power:Integer; countmakan:Integer; countist:Integer;
					harihidup:Integer; simul:Simulasi);
var
	n	: string;
	date: Tanggal;
	emax : integer;
	energi : integer;
begin
write('>>');
readln(n);
while not(n='Stop') do
	begin
		begin
			case n of
			'Beli bahan'		: 	begin
										belibahan(date,duid,power, tabInvenMentah,tabBahanMentah,tabSimulasi.Tab[simul.nomor].TotalPengeluaran);
									end;
			'Olah bahan'		: 	begin
										olahBahan(tabInvenMentah,tabInvenOlahan, tabBahanOlahan,date, power);
									end;
			'Jual olahan'		:	begin
										jualOlahan(tabInvenOlahan, date, tabBahanOlahan,tabSimulasi.tab[simul.nomor].TotalPemasukan, duid, power);
									end;
			'Jual resep'		:	begin
										jualResep(date, tabResepnya, tabInvenMentah, tabInvenOlahan, tabBahanMentah, duid, tabSimulasi.tab[simul.nomor].TotalPemasukan, power);
									end;
			'Makan'				:	begin
										makan(power,countmakan,emax);
									end;
			'Istirahat'			:	begin
										istirahat(energi,countist,emax);
									end;
			'Tidur'				:	begin
										Tidur(date, tabInvenOlahan, tabInvenMentah, tabBahanMentah, power, harihidup);
									end;
			//'Lihat statistik'	: 	begin
			//							Lihatstatistik(simul, date, harihidup, power, capacity);
			//						end;
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
										TambahResep(tabInvenMentah,tabInvenOlahan,tabResepnya);
									end;
			'Upgrade Inventory'	:	begin
										upgradeInventori(simul);
									end;
		end;
		
	end;
		write('>>');
		readln(n);
		{Lihatstatistik(tabSimulasi);}

end;
end;
end.
