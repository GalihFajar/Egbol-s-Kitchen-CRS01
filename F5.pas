unit F5; 	   
// unit untuk fungsi 5, membeli bahan mentah dari supermarket
// Versi : 13 April 2018		   

interface 

	uses tipe; 		   // menggunakan unit yang berisi tipe
	
	procedure belibahan ( t : tanggal ; var uang : longint; var energi : integer; var bahan : InvMentah ; var bmentah : Mentah ; var pengeluaran : longint ; invMax:integer ;var  totalbel : integer );
	{I.S.: tersedia uang, tanggal, daftar bahan mentah, inventori bahan mentah}
	{F.S.: Resep berhasil dibuat bila bahan yang ingin dibeli ada di daftar bahan mentah. Menambah inventori bahan mentah dan mengurangi energi & uang}
	function CekUjung(masukan : InvMentah):integer;
	{ Fungsi untuk mengecek indeks terakhir dari sebuah array , kemudian akan ditambahkan indeks baru}
implementation

	 function CekUjung(masukan : InvMentah):integer;
		var
			i : integer;
		begin
			CekUjung := 0;
			i := 1;
				repeat
					if(masukan.TabInvMentah[i].Nama <> '') then
						CekUjung := CekUjung + 1
					else
						CekUjung := CekUjung;
						i := i + 1;
				until(masukan.TabInvMentah[i].Nama = '') //Menambah NEff sampai array kosong.
		end;
	
	procedure belibahan ( t : tanggal ; var uang : longint; var energi : integer; var bahan : InvMentah ; var bmentah : Mentah ; var pengeluaran : longint ; invMax:integer ;var  totalbel : integer);
	{I.S.: tersedia uang, tanggal, daftar bahan mentah, inventori bahan mentah}
	{F.S.: Resep berhasil dibuat bila bahan yang ingin dibeli ada di daftar bahan mentah. Menambah inventori bahan mentah dan mengurangi energi & uang}
		var // kamus lokal
			i : integer;
			max : integer;
			sama : boolean;
			kuantitas : integer;
			harga : integer;
			indeks : integer;
			jumlah : integer;
		begin // Algoritma lokal
			jumlah := 0;
			for i:= 1 to bahan.neff do
				begin
					jumlah := jumlah + bahan.TabInvMentah[i].Jumlah;
				end;

			if ( energi = 0 ) then
				begin
					writeln('Energi anda habis. Istirahatlah, makan atau tidur terlebih dahulu untuk memulihkan energi'); // Jika energi kosong, maka akan menampilkan output seperti ini, dan tidak melanjutkan proses
				end
			else if ( invMax < jumlah) then
				begin
					writeln('Inventory anda penuh');
				end
			else // jika energi > 0 dan kapasitas inventory > jumlah item bahan mentah
				begin
					max := CekUjung(bahan) + 1; // menggunakan fungsi cek ujung kemudian menambahkan satu array lagi untuk diisi
					sama := false; // assign boolean untuk membantu validasi
					harga := 0; // assign harga awal
					indeks := 0;
					write('Nama Bahan : ');read(bahan.TabInvMentah[max].Nama); // menerima masukan bahan untuk array max
					for i:=1 to bmentah.neff do
						begin
							if ( bahan.TabInvMentah[max].Nama = bmentah.TabMentah[i].Nama ) and ( sama = false ) and ( invMax > jumlah) then // pengecekan apakah bahan yang ingin dibeli sama ada di list bahan mentah atau tidak
								begin
									sama := true; 
									harga := bmentah.TabMentah[i].harga;
									indeks := i;
								end;
						end; // untuk mengecek apakah bahan mentah ada di data atau tidak
				
					if ( sama = false ) then // jika bahan yang ingin dibeli tidak ada di list bahan mentah
 						begin
							writeln('Nama bahan tidak ada');
							energi := energi-1;		
						end
					else // sama = true, ada nama bahan yang diinput user didalam data bahanmentah
						begin
							write('Kuantitas : ');read(kuantitas);
								if ( (kuantitas + jumlah) > InvMax ) then 
									begin
										writeln('Inventory anda tidak cukup');
									end
								else
									begin
										write('Total Harga : ');writeln(kuantitas*harga);
										if ( uang >= kuantitas*harga ) then // jika uang yang dimiliki tidak cukup untuk membeli bahan
											begin
												writeln('Pembelian Sukses');
												bahan.TabInvMentah[max].Nama := bmentah.TabMentah[indeks].Nama;
												bahan.TabInvMentah[max].Tgl := t;
												bahan.TabInvMentah[max].Jumlah := kuantitas;
												uang := uang - (kuantitas*harga);
												pengeluaran := pengeluaran + (kuantitas*harga);
												energi := energi-1;	
												bahan.neff := bahan.neff+1;
												totalbel := totalbel + kuantitas;
											end
										else // ( uang < harga )
											begin 
												writeln('Pembelian gagal, silahkan coba lagi, uang anda kurang');
												energi := energi-1;		
											end;
								end;
						end;
					end;

		end;
end.				
			
			
		
