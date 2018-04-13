//Editor: Ammar (16517328)

unit F12Statistik;

interface
	uses tipe;
	
	procedure LihatStatistik(var simul:Simulasi;date:Tanggal;harihidup,energi,kapasitas,mentahbeli,olahbuat,olahjual,resepjual:integer;pemasukan,pengeluaran,uang:longint);
	{Spesifikasi procedure:
	* >menampilkan data statistik permainan}
	
	procedure AssignSimulasi(var simul:Simulasi;date:Tanggal;harihidup,energi,kapasitas,mentahbeli,olahbuat,olahjual,resepjual:integer;pemasukan,pengeluaran,uang:longint);
	{Spesifikasi procedure:
	* >assigment nilai-nilai yang digunakan ke variabel simulasi}
	
implementation

	//PROCEDURE AssignSimulasi
	procedure AssignSimulasi(var simul:Simulasi;date:Tanggal;harihidup,energi,kapasitas,mentahbeli,olahbuat,olahjual,resepjual:integer;pemasukan,pengeluaran,uang:longint);
	{Spesifikasi procedure:
	* >assigment nilai-nilai yang digunakan ke variabel simulasi}
	//ALGORITMA LOKAL
	begin
		//assignment
		simul.Tgl.hari:=date.hari;
		simul.Tgl.bulan:=date.bulan;
		simul.Tgl.tahun:=date.tahun;
		simul.HariHidup:=harihidup;
		simul.Energi:=energi;
		simul.KapasitasInventory:=kapasitas;
		simul.TotalBeliMentah:=mentahbeli;
		simul.TotalOlahBuat:=olahbuat;
		simul.TotalOlahJual:=olahjual;
		simul.TotalResepJual:=resepjual;
		simul.TotalPemasukan:=pemasukan;
		simul.TotalPengeluaran:=pengeluaran;
		simul.TotalUang:=uang;
	end;
	
	//PROCEDURE LihatStatistik
	procedure LihatStatistik(var simul:Simulasi;date:Tanggal;harihidup,energi,kapasitas,mentahbeli,olahbuat,olahjual,resepjual:integer;pemasukan,pengeluaran,uang:longint);
	{Spesifikasi procedure:
	* >menampilkan data statistik permainan}
	//KAMUS LOKAL
	
	//ALGORITMA LOKAL
	begin
		AssignSimulasi(simul,date,harihidup,energi,kapasitas,mentahbeli,olahbuat,olahjual,resepjual,pemasukan,pengeluaran,uang);
		writeln('Statistik simulasi Anda');
		writeln('Nomor Simulasi :', simul.Nomor);
		writeln('Tanggal : ',simul.Tgl.hari,'/',simul.Tgl.bulan,'/',(simul.Tgl.tahun mod 100));
		writeln('Hari hidup: ',simul.HariHidup);
		writeln('Energi: ',simul.Energi);
		writeln('Kapasitas Inventori: ',simul.KapasitasInventory);
		writeln('Total bahan mentah yang dibeli: ',simul.TotalBeliMentah);
		writeln('Total bahan olahan yang dibuat: ',simul.TotalOlahBuat);
		writeln('Total bahan olahan yang dijual: ',simul.TotalOlahJual);
		writeln('Total resep yang dijual: ', simul.TotalResepJual);
		writeln('Total pemasukan: ', simul.TotalPemasukan);
		writeln('Total pengeluaran: ',simul.TotalPengeluaran);
		writeln('Total uang: ', simul.TotalUang);
	end;
