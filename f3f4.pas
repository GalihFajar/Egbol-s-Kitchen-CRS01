unit f3f4;

interface

	uses tipe,F1load,f2exit,f5,f6,f7,f8,f9,f10,f11tidur,f12statistik,f13,f14,f15,f16,f17;

	procedure simulasi(var tabBahanMentah : Mentah; var tabBahanOlahan : Olahan; var tabInvenMentah : InvMentah; var tabInvenOlahan : InvOlahan;
				var tabResepnya : Resepnya; var tabSimulasi : tSimulasi);

implementation

	procedure simulasi(var tabBahanMentah : Mentah; var tabBahanOlahan : Olahan; var tabInvenMentah : InvMentah; var tabInvenOlahan : InvOlahan;
				var tabResepnya : Resepnya; var tabSimulasi : tSimulasi);
				
	const
	emax:integer=10;
	
	var
	i : integer;
	n: string;						//Variabel yang menampung perintah
	noSim : integer; 				//Variabel yang menunjukkan nomor simulasi
	date: Tanggal;					//Variabel menampung tanggal simulasi
	energi : integer;				//Variabel yang menampung energi chef
	duid,pengeluaran,pemasukan:longint;			//Variabel yang menampung masalah keuangan restoran
	countist,countmakan,aktivitas:integer;		//Variabel untuk meampung jumlah istirahat, makan dan tidur
	hhidup:integer;					//Variabel yang menampung hari hidup
	SumBeliMentah, SumOlahBuat, sumOlahJual, sumResepJual, invenmax	:	Integer;
	
	begin
	//Assignment variabel untuk simulasi
	write('Masukkan nomor simulasi: '); readln(noSim);
	
	date.Hari := tabSimulasi.tab[noSim].Tgl.hari; 
	date.Bulan:=tabSimulasi.tab[noSim].Tgl.Bulan;
	date.Tahun:=tabSimulasi.tab[noSim].Tgl.Tahun;
	hhidup:=tabSimulasi.tab[noSim].HariHidup;
	for i:=1 to hhidup do
	begin
		date:=GantiHari(date);
	end;
	energi:=tabSimulasi.tab[noSim].energi;
	
	pemasukan:=tabSimulasi.tab[noSim].TotalPemasukan;
	pengeluaran:=tabSimulasi.tab[noSim].TotalPengeluaran;
	duid:=100000+pemasukan-pengeluaran;
	countmakan:=0;
	countist:=0;
	aktivitas:=1;
	SumBeliMentah:=tabSimulasi.tab[noSim].TotalBeliMentah;
	SumOlahBuat:=tabSimulasi.tab[noSim].TotalOlahBuat;
	sumOlahJual:=tabSimulasi.tab[noSim].TotalOlahJual;
	sumResepJual:=tabSimulasi.tab[noSim].TotalResepJual;	
	invenmax:=tabSimulasi.tab[noSim].KapasitasInventory;
	
	write('>>');
	readln(n);
	while not(n='Stop') and (hhidup<=10) do
	begin
		case n of
			'Beli bahan'		: 	begin
										belibahan(date, duid, energi, tabInvenMentah, tabBahanMentah, pengeluaran, invenmax, sumbelimentah);
										aktivitas:=0;
										writeln('Energi anda : ', energi);
										writeln('Uang anda : ', duid);
										writeln('Tanggal : ', date.Hari, date.Bulan, date.Tahun);
										writeln('Hari hidup : ', hhidup);
									end;
			'Olah bahan'		: 	begin
										olahBahan(tabInvenMentah,tabInvenOlahan, tabBahanOlahan, date, energi, invenmax, sumOlahbuat);
										aktivitas:=0;
										writeln('Energi anda : ', energi);
										writeln('Uang anda : ', duid);
										writeln('Tanggal : ', date.Hari, date.Bulan, date.Tahun);
										writeln('Hari hidup : ', hhidup);
									end;
			'Jual olahan'		:	begin
										jualOlahan(tabInvenOlahan, date, tabBahanOlahan, pemasukan, duid, energi, sumolahjual);
										aktivitas:=0;
										writeln('Energi anda : ', energi);
										writeln('Uang anda : ', duid);
										writeln('Tanggal : ', date.Hari, date.Bulan, date.Tahun);
										writeln('Hari hidup : ', hhidup);
									end;
			'Jual resep'		:	begin
										jualResep(date, tabResepnya, tabInvenMentah, tabInvenOlahan, tabBahanMentah, duid, pemasukan, energi, sumresepjual);
										aktivitas:=0;
										writeln('Energi anda : ', energi);
										writeln('Uang anda : ', duid);
										writeln('Tanggal : ', date.Hari, date.Bulan, date.Tahun);
										writeln('Hari hidup : ', hhidup);
									end;
			'Makan'				:	begin
										makan(energi,countmakan,emax);
										aktivitas:=0;
										writeln('Energi anda : ', energi);
										writeln('Uang anda : ', duid);
										writeln('Tanggal : ', date.Hari, date.Bulan, date.Tahun);
										writeln('Hari hidup : ', hhidup);
									end;
			'Istirahat'			:	begin
										istirahat(energi,countist,emax);
										aktivitas:=0;
										writeln('Energi anda : ', energi);
										writeln('Tanggal : ', date.Hari, date.Bulan, date.Tahun);
										writeln('Hari hidup : ', hhidup);
									end;
			'Tidur'				:	begin
										Tidur(date, tabInvenOlahan, tabInvenMentah, tabBahanMentah, energi, hhidup, countmakan, countist, aktivitas);
										writeln('Energi anda : ', energi);
										writeln('Tanggal : ', date.Hari, date.Bulan, date.Tahun);
										writeln('Hari hidup : ', hhidup);
									end;
			'Lihat statistik'	: 	begin
										LihatStatistik(tabSimulasi.Tab[noSim],date,hhidup,energi,invenmax,SumBeliMentah,SumOlahBuat,sumOlahJual,sumResepJual,pemasukan,pengeluaran);
									end;
			'Tampilkan inventory':	begin
										TampilkanInventory(tabInvenMentah,tabInvenOlahan);
										aktivitas:=0;
									end;
			'Tampilkan resep'	:	begin
										TampilkanResep(tabResepnya);
										aktivitas:=0;
									end;
			'Cari resep'		:	begin
										CariResep(tabResepnya);
										aktivitas:=0;
									end;
			'Tambah resep'		:	begin
										TambahResep(tabBahanMentah,tabBahanOlahan,tabResepnya);
										aktivitas:=0;
									end;
			'Upgrade Inventory'	:	begin
										upgradeInventori(invenmax, duid, energi);
										aktivitas:=0;
									end;
		end;
		write('>>');
		readln(n);
	end;
	
	tabSimulasi.tab[noSim].HariHidup			:=hhidup;
	tabSimulasi.tab[noSim].energi				:=energi;
	tabSimulasi.tab[noSim].KapasitasInventory	:=invenmax;
	tabSimulasi.tab[noSim].TotalBeliMentah		:=SumBeliMentah;
	tabSimulasi.tab[noSim].TotalOlahBuat		:=SumOlahBuat;
	tabSimulasi.tab[noSim].TotalOlahJual		:=sumOlahJual;
	tabSimulasi.tab[noSim].TotalResepJual		:=sumResepJual;	
	tabSimulasi.tab[noSim].TotalPemasukan		:=pemasukan;
	tabSimulasi.tab[noSim].TotalPengeluaran		:=pengeluaran;
	tabSimulasi.tab[noSim].TotalPendapatan		:=tabSimulasi.tab[noSim].TotalPemasukan - tabSimulasi.tab[noSim].TotalPengeluaran;
	tabSimulasi.tab[noSim].TotalPengeluaran		:=pengeluaran;
	LihatStatistik(tabSimulasi.Tab[noSim],date,hhidup,energi,invenmax,SumBeliMentah,SumOlahBuat,sumOlahJual,sumResepJual,pemasukan,pengeluaran);

end;
end.
