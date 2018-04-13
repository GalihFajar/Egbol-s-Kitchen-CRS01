unit f7;
{Unit ini berisi prosedur untuk menjalankan fungsi jualOlahan}

interface
	uses tipe,evaluate;

	procedure jualOlahan(var a:InvOlahan; b:Tanggal; c:Olahan; var pemasukan:longint; var uang:longint; var energi:integer);
	{I.S.: Tersedia inventori olahan, tanggal simulasi, pemasukan, uang dan energi chef}
	{F.S.: Menjual bahan olahan yang ada diinventori, menambah pemasukan dan uang serta mengurangi energi chef}

implementation
	
	procedure jualOlahan(var a:InvOlahan; b:Tanggal; c:Olahan; var pemasukan:longint; var uang:longint; var energi:integer);
	{I.S.: Tersedia inventori olahan, tanggal simulasi, pemasukan, uang dan energi chef}
	{F.S.: Menjual bahan olahan yang ada diinventori, menambah pemasukan dan uang serta mengurangi energi chef}
	//KAMUS LOKAL
	var
	dijual:string;				//Variabel yang menampung bahan olahan yang akan dijual
	u,v:integer;				//Variabel yang digunakan untuk perulangan
	ketemu1,ketemu2:boolean;	//Variabel boolean untuk perulangan
	jumlah:integer; 			//variabel untuk jumlah bahan olahan yang akan dijual
	//ALGORITMA LOKAL
	begin
		if (energi=0) then		//Saat energi habis tidak bisa melakukan aktivitas
			writeln('Energi anda habis. Istirahatlah, makan atau tidur terlebih dahulu untuk memulihkan energi')
		else					//Masih memiliki energi (Energi>0)
			begin
				write('Masukkan bahan olahan yang akan dijual: ');				//Meminta inputan bahan olahan yang akan dijual
				readln(dijual);													//Membaca bahan olahan

				u:=1;					//Inisialisasi variabel perulangan
				ketemu1:=false;	

				while (u<=a.Neff) and (not ketemu1) do 			//Perulangan untuk mencari bahan olahan di dalam inventori
				begin
					if (a.TabInvOlahan[u].Nama=dijual) then		//Barang olahan telah ditemukan di invetori
						begin
							ketemu1:=True;						//Variabel perulangan menjadi true
							if (isKadaluarsaOlahan(a.TabInvOlahan[u],b)) then		//Cek kadaluarsa
								begin
									writeln('Bahan olahan yang akan anda jual sudah kadaluarsa');		//Pesan kesalahan ketika kadaluarsa
								end
							else if (a.TabInvOlahan[u].jumlah=0) then				//Cek Jumlah inventori
								begin
									writeln('Bahan olahan yang ingin anda jual habis');	//Pesan ketika bahan habis
								end
							else			//Tidak kadaluarsa dan tidak habis
								begin
									repeat
										write('Masukkan jumlah bahan olahan yang akan dijual (maksimal kuantitas penjualan : ',a.TabInvOlahan[u].jumlah ,'): ');
										//Meminta masukan kuantitas bahan olahan yang akan dijual
										readln(jumlah); //membaca kuantitas bahan olahan
									until ((jumlah<=a.TabInvOlahan[u].jumlah) and (jumlah>0));		//Mengulangi sampai inputan jumlah valid

									a.TabInvOlahan[u].jumlah:=a.TabInvOlahan[u].jumlah-jumlah;	//Mengurangi jumlah di inventori dengan jumlah yang dijual
									energi:=energi-1;											//Mengurangi energi dengan 1

									v:=1;			//Inisialisasi variabel perulangan kedua
									ketemu2:=false;

									while (v<=c.Neff) and (not ketemu2) do 			//Mencari harga bahan olahan dari array Olahan(berisi informasi tentang kadaluarsa, harga dan resep bahan olahan)
									begin
										if (c.TabOlahan[v].Nama=dijual) then		//Telah ditemukan indeks bahan olahannya
											begin
												ketemu2:=True;										//Variabel perulangan berubah menjadi true
												uang:=uang+jumlah*c.TabOlahan[v].Harga;				//Menambah uang dengan harga jual dikali kuantitas yang dijual
												pemasukan:=pemasukan+jumlah*c.TabOlahan[v].Harga;	//Menambah pemasukan
											end
										else
											v:=v+1;							//Increment variabel perulangan 2
									end;

								end;
						end
					else
						u:=u+1;		//Increment variabel perulangan pertama
				end;

				if (not ketemu1) then		//Bahan olahan tidak ditemukan di inventori
				writeln('Bahan olahan tidak ditemukan di inventori, buat bahan olahan terlebih dahulu'); //Pesan kesalahan

			end;

		evaluateInvOlahan(a,b);		//Mengevaluasi inventori bahan olahan, menghapus bahan yang sudah habis/kadaluarsa
	end;

end.