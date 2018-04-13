//Editor: Ammar (16517328)

unit F12Statistik;

interface
	uses tipe;
	
	procedure LihatStatistik(simul:Simulasi);
	{Spesifikasi procedure:
	* >menampilkan data statistik permainan}
	
implementation
	
	//PROCEDURE LihatStatistik
	procedure LihatStatistik(simul:Simulasi);
	{Spesifikasi procedure:
	* >menampilkan data statistik permainan}
	//KAMUS LOKAL
	
	//ALGORITMA LOKAL
	begin
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
