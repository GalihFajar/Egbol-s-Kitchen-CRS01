unit f8;

interface
	uses searching,tipe,evaluate;
	procedure jualResep(t:tanggal; a:resepnya; var b:InvMentah; var c:InvOlahan; d:mentah; var uang:longint;var pemasukan:longint;var energi:integer; var banyakResep:integer);
	{I.S.: tersedia resep yang ingin dibuat, daftar resep, inventory bahan mentah, inventori bahan olahan, uang dan energi}
	{F.S.: Resep berhasil dibuat bila bahan mentah dan olahan ada. Menambah pemasukan dan mengurangi energi, Menambah jumlah penjualan resep total}

implementation
	procedure jualResep(t:tanggal; a:resepnya; var b:InvMentah; var c:InvOlahan; d:mentah; var uang:longint;var pemasukan:longint;var energi:integer; var banyakResep:integer);
	{I.S.: tersedia resep yang ingin dibuat, daftar resep, inventory bahan mentah, inventori bahan olahan, uang dan energi}
	{F.S.: Resep berhasil dibuat bila bahan mentah dan olahan ada. Menambah pemasukan dan mengurangi energi, Menambah jumlah penjualan resep total}
	//KAMUS LOKAL
	var
	indeks:integer;
	dibuat:string;
	//ALGORITMA LOKAL
	begin
		if (energi=0) then				//Validasi jumlah energi. Energi harus ada untuk dapat melakukan aksi jual resep
			writeln('Energi anda habis. Istirahatlah, makan atau tidur terlebih dahulu untuk memulihkan energi')		//Pesan kesalahan
		else							// Energi >0
			begin
				write('Masukkan Resep Yang akan dibuat: ');		//Input masukan resep yang akan dibuat
				readln(dibuat);									//Baca resep

				indeks:=1;										//Assign variabel perulangan
				cariIndeksResep(a,indeks,dibuat);				//Memanggil prosedur cariresep untuk mencari informasi resep di dalam array resep
				if (indeks>a.Neff) then							//Validasi, bila indeks melebihi Neff array resep, maka resep tidak ditemukan
					writeln('Resep Tidak ditemukan, ulangi perintah dengan resep yang tepat')	//Pesan kesalahan
				else
				begin
					if (not searchSemua(a.TabResep[indeks],b,c)) then		//Mencari semua bahan yang dibutuhkan untuk membuat resep, True bila semua bahan ditemukan di dalam inventori
					begin
						writeln('Bahan yang diperlukan tidak lengkap, pastikan bahan mentah dan bahan olahan ada di dalam inventori'); //Pesan kesalahan bila bahan mentah/olahan tidak ditemukan
						energi:=energi-1;
					end
					else		//Semua bahan telah ditemukan
					begin
						kurangiSemua(a.TabResep[indeks],b,c);		//Mengurangi kuantitas semua bahan dengan 1
						uang:=uang+a.TabResep[indeks].harga;		//Menambah uang
						pemasukan:=pemasukan+a.TabResep[indeks].harga;	//Menambah pemasukan
						energi:=energi-1;							//Mengurangi energi
						banyakResep:=banyakResep+1;
						writeln('Resep berhasil dibuat dan dijual');
					end;
				end;
			end;
		evaluateInvOlahan(c,t);			//Evaluasi inventori olahan, bila jumlah bahan olahan=0 (habis) maka bahan dihapus dari array
		evaluateInvMentah(b,t,d);		//Evaluasi inventori mentah, bila jumlah bahan mentah=0 (habis) maka bahan dihapus dari array
	end;

end.
