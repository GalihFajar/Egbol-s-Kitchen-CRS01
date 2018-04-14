unit F6;
// unit untuk mengolah bahan mentah menjadi bahan olahan, mengurangi bahan mentah -> menambah inventori bahan olahan -> mengurangi energi chef
// Versi : 13 April 2018
//

interface
	
	uses tipe; // menggunakan unit tipe
	
	procedure olahBahan ( var invenmentah : InvMentah ; var involah : InvOlahan ; var olah : Olahan ; t : tanggal ; var energi : integer);
	{I.S.: tersedia uang, tanggal, daftar bahan olahan, inventori bahan mentah}
	{F.S.: Bahan olahan berhasil dibuat, menambah inventori bahan mentah, energi berkurang }
	function CekUjung( masukan : InvOlahan ):integer; 
	{ Fungsi untuk mengecek indeks terakhir dari sebuah array , kemudian akan ditambahkan indeks baru}

implementation
	
	 function CekUjung(masukan : InvOlahan):integer; // fungsi Cekujung
		var
			i : integer;
		begin
			CekUjung := 0;
			i := 1;
				repeat
					if(masukan.TabInvOlahan[i].Nama <> '') then
						CekUjung := CekUjung + 1
					else
						CekUjung := CekUjung;
						i := i + 1;
				until(masukan.TabInvOlahan[i].Nama = '') //Menambah NEff sampai array kosong.
		end;
   
	procedure olahBahan ( var invenmentah : InvMentah ; var involah : InvOlahan ; var olah : Olahan ; t : tanggal ;  var energi : integer);
	{I.S.: tersedia uang, tanggal, daftar bahan olahan, inventori bahan mentah}
	{F.S.: Bahan olahan berhasil dibuat, menambah inventori bahan mentah, energi berkurang }
		var
			i : integer;
			max : integer;
			indeks : integer;
			sama : boolean;
			j : integer;
			
		begin
			if ( energi = 0 ) then
				begin
					writeln('Energi anda habis. Istirahatlah, makan atau tidur terlebih dahulu untuk memulihkan energi'); // Jika energi kosong, maka akan menampilkan output seperti ini, dan tidak melanjutkan proses
				end
			else
				begin
					max := CekUjung(involah) + 1; // menggunakan fungsi cek ujung kemudian menambahkan satu array lagi untuk diisi
					writeln('Bahan Olahan yang akan dibuat'); readln(involah.TabInvOlahan[max].Nama); // Mengisi array untuk nama bahan olahan yang ingin dibuat
					indeks:=0; 
					sama:=false; // assign boolean untuk membantu validasi
					involah.TabInvOlahan[max].Jumlah := 0; // asumsikan bahan olahan yang ingin dibuat ada 0
				for i:=1 to olah.neff do
					begin // validasi apakah bahan yang ingin dibuat ada di daftar bahan olahan
						if ( involah.TabInvOlahan[max].Nama = olah.TabOlahan[i].Nama ) and ( indeks = 0 ) and ( sama = false ) then 
							begin
								indeks := i;
								sama := true;
							end;
					end;
						
			
				if ( sama = true ) then // jika bahan ada di daftar bahan olahan
					begin
						involah.TabInvOlahan[max].TglBuat := t; // assign tanggal saat bahan olahan dibuat
						involah.TabInvOlahan[max].Jumlah := involah.TabInvOlahan[max].Jumlah + 1; // menambah jumlah bahan olahan
						
						for i:=1 to olah.TabOlahan[indeks].Nbutuh do // loop di dalam array bahan olahan
							begin
								for j:=1 to 20 do // untuk mencari dalam array bahan yang dibutuhkan untuk resep
									begin
										if ( olah.TabOlahan[indeks].bahan[i] = invenmentah.TabInvMentah[j].Nama ) then // mencari bahan yang dibutuhkan untuk bahan olahan
											begin
												invenmentah.TabInvMentah[j].Jumlah := invenmentah.TabInvMentah[j].Jumlah - 1 ; // jika ada, mengurangi bahan mentah -1
											end;
									end;
							end;
					end
				else // jika bahan yang ingin dibuat tidak ada di daftar bahan olahan
					begin
						writeln('Bahan yang ingin dibuat tidak ada di daftar');
					end; 
			energi := energi-1;			
			end;
		end;
end.
							
							






