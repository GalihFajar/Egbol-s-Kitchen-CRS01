//Editor: Ammar (16517328)

unit F12Statistik;

interface
	uses tipe;
	
	procedure LihatStatistik(simul:Simulasi;date:Tanggal;harihidup,energi,kapasitas,mentahbeli,olahbuat,olahjual,resepjual:integer;pemasukan,pengeluaran:longint);
	{Spesifikasi procedure:
	* >menampilkan data statistik permainan}

implementation
	
	//PROCEDURE LihatStatistik
	procedure LihatStatistik(simul:Simulasi;date:Tanggal;harihidup,energi,kapasitas,mentahbeli,olahbuat,olahjual,resepjual:integer;pemasukan,pengeluaran:longint);
	{Spesifikasi procedure:
	* >menampilkan data statistik permainan}
	//KAMUS LOKAL
	
	//ALGORITMA LOKAL
	begin
		writeln('Statistik simulasi Anda');
		writeln('Nomor Simulasi :', simul.Nomor);
		writeln('Tanggal : ',date.hari,'/',date.bulan,'/',(date.tahun mod 100));
		writeln('Hari hidup: ',harihidup);
		writeln('Energi: ',energi);
		writeln('Kapasitas Inventori: ',kapasitas);
		writeln('Total bahan mentah yang dibeli: ',mentahbeli);
		writeln('Total bahan olahan yang dibuat: ',olahbuat);
		writeln('Total bahan olahan yang dijual: ',olahjual);
		writeln('Total resep yang dijual: ', resepjual);
		writeln('Total pemasukan: ', pemasukan);
		writeln('Total pengeluaran: ',pengeluaran);
		writeln('Total uang: ', pemasukan-pengeluaran);
	end;

end.
