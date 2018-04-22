unit f3f4;

interface

	uses tipe,F1load,f2exit,f5,f6,f7,f8,f9,f10,f11tidur,f12statistik,f13,f14,f15,f16,f17,sysutils,evaluate;

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
	x : string;
	
	begin
	//Assignment variabel untuk simulasi
	write('Masukkan nomor simulasi: '); 
	readln(noSim);
	while (nosim<=0) or (nosim>tabSimulasi.neff) do
		begin
			writeln('Inputan masih belum benar');
			readln(nosim);
		end;
		
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
	duid:=pemasukan-pengeluaran;
	countmakan:=0;
	countist:=0;
	aktivitas:=1;
	SumBeliMentah:=tabSimulasi.tab[noSim].TotalBeliMentah;
	SumOlahBuat:=tabSimulasi.tab[noSim].TotalOlahBuat;
	sumOlahJual:=tabSimulasi.tab[noSim].TotalOlahJual;
	sumResepJual:=tabSimulasi.tab[noSim].TotalResepJual;	
	invenmax:=tabSimulasi.tab[noSim].KapasitasInventory;
	
	LihatStatistik(tabSimulasi.Tab[noSim],date,hhidup,energi,invenmax,SumBeliMentah,SumOlahBuat,sumOlahJual,sumResepJual,pemasukan,pengeluaran);
	writeln;
	writeln('Fitur-fitur yang tersedia');
	writeln('1. Beli Bahan');
	writeln('Membeli bahan mentah');
	writeln('2. Olah Bahan');
	writeln('Mengolah Bahan Mentah Menjadi Bahan Olahan');
	writeln('3. Jual Olahan');
	writeln('Menjual bahan olahan yang telah dibuat');
	writeln('4. Jual Resep');
	writeln('Menjual resep yang tersedia');
	writeln('5. Makan');
	writeln('Menambah energi sebanyak 3');
	writeln('6. Istirahat');
	writeln('Menambah energi sebanyak 1');
	writeln('7. Tidur');
	writeln('Membuat energi menjadi 10, namun berganti hari');
	writeln('8. Lihat Statistik');
	writeln('Menampilkan statistik');
	writeln('9. Lihat Inventory');
	writeln('Menampilkan isi dari inventory');
	writeln('10. Lihat Resep');
	writeln('Menampilkan resep yang tersedia');
	writeln('11. Cari Resep');
	writeln('Mencari bahan-bahan yang dibutuhkan oleh sebuah resep');
	writeln('12. Tambah Resep');
	writeln('Menambah resep');
	writeln('13. Upgrade Inventory');
	writeln('Menambah kapasitas inventory');
	writeln('14. Stop');
	writeln('Menghentikan Simulasi.');
	writeln('Masukan perintah');
	writeln;
	write('>>');
	readln(n);
	x := LowerCase(n);
	while not(x='stop') and (hhidup<10) do
	begin
		case x of
			'beli bahan'		: 	begin
										writeln;
										belibahan(date, duid, energi, tabInvenMentah, tabBahanMentah, pengeluaran, invenmax, sumbelimentah);
										aktivitas:=0;
										writeln('Energi anda : ', energi);
										writeln('Uang anda   : ', duid);
										writeln('Tanggal     : ', date.Hari, '/', date.Bulan, '/', date.Tahun);
										writeln('Hari hidup  : ', hhidup);
										writeln;
									end;
			'olah bahan'		: 	begin
										writeln;
										olahBahan(tabInvenMentah,tabInvenOlahan, tabBahanOlahan, date, energi, invenmax, sumOlahbuat);
										aktivitas:=0;
										writeln('Energi anda : ', energi);
										writeln('Uang anda   : ', duid);
										writeln('Tanggal     : ', date.Hari, '/', date.Bulan, '/', date.Tahun);
										writeln('Hari hidup  : ', hhidup);
										evaluateInvMentah(tabInvenMentah,date,tabBahanMentah);
										evaluateInvOlahan(tabInvenOlahan,date);
										writeln;
									end;
			'jual olahan'		:	begin
										writeln;
										jualOlahan(tabInvenOlahan, date, tabBahanOlahan, pemasukan, duid, energi, sumolahjual);
										aktivitas:=0;
										writeln('Energi anda : ', energi);
										writeln('Uang anda   : ', duid);
										writeln('Tanggal     : ', date.Hari, '/', date.Bulan, '/', date.Tahun);
										writeln('Hari hidup  : ', hhidup);
										writeln;
									end;
			'jual resep'		:	begin
										writeln;
										jualResep(date, tabResepnya, tabInvenMentah, tabInvenOlahan, tabBahanMentah, duid, pemasukan, energi, sumresepjual);
										aktivitas:=0;
										writeln('Energi anda : ', energi);
										writeln('Uang anda   : ', duid);
										writeln('Tanggal     : ', date.Hari, '/', date.Bulan, '/', date.Tahun);
										writeln('Hari hidup  : ', hhidup);
										writeln;
									end;
			'makan'				:	begin
										writeln;
										makan(energi,countmakan,emax);
										aktivitas:=0;
										writeln('Energi anda : ', energi);
										writeln('Uang anda   : ', duid);
										writeln('Tanggal     : ', date.Hari, '/', date.Bulan, '/', date.Tahun);
										writeln('Hari hidup  : ', hhidup);
										writeln;
									end;
			'istirahat'			:	begin
										writeln;
										istirahat(energi,countist,emax);
										aktivitas:=0;
										writeln('Energi anda : ', energi);
										writeln('Tanggal     : ', date.Hari, '/', date.Bulan, '/', date.Tahun);
										writeln('Hari hidup  : ', hhidup);
										writeln;
									end;
			'tidur'				:	begin
										writeln;
										Tidur(date, tabInvenOlahan, tabInvenMentah, tabBahanMentah, energi, hhidup, countmakan, countist, aktivitas);
										writeln('Energi anda : ', energi);
										writeln('Tanggal     : ', date.Hari, '/', date.Bulan, '/', date.Tahun);
										writeln('Hari hidup  : ', hhidup);
										writeln;
									end;
			'lihat statistik'	: 	begin
										LihatStatistik(tabSimulasi.Tab[noSim],date,hhidup,energi,invenmax,SumBeliMentah,SumOlahBuat,sumOlahJual,sumResepJual,pemasukan,pengeluaran);
										writeln;
									end;
			'tampilkan inventory':	begin
										writeln;
										TampilkanInventory(tabInvenMentah,tabInvenOlahan);
										aktivitas:=0;
										writeln;
									end;
			'tampilkan resep'	:	begin
										writeln;
										TampilkanResep(tabResepnya);
										aktivitas:=0;
									end;
			'cari resep'		:	begin
										writeln;
										CariResep(tabResepnya);
										aktivitas:=0;
										writeln;
									end;
			'tambah resep'		:	begin
										writeln;
										TambahResep(tabBahanMentah,tabBahanOlahan,tabResepnya);
										aktivitas:=0;
										writeln;
									end;
			'upgrade inventory'	:	begin
										writeln;
										upgradeInventori(invenmax, duid, energi);
										aktivitas:=0;
										writeln;
									end;
		end;
		write('>>');
		readln(n);
		x := LowerCase(n);
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
