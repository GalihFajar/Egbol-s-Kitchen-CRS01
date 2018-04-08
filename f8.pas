unit f8;


//kontil wkwk hahaha
interface
	uses searching,tipe;
	procedure jualResep(dibuat:string; a:resepnya; var b:InvMentah; var c:InvOlahan; var uang:longint;var pemasukan:longint;var energi:integer);
	{I.S.: tersedia resep yang ingin dibuat, daftar resep, inventory bahan mentah, inventori bahan olahan, uang dan energi}
	{F.S.: Resep berhasil dibuat bila bahan mentah dan olahan ada. Menambah pemasukan dan mengurangi energi}

implementation
	procedure jualResep(dibuat:string; a:resepnya; var b:InvMentah; var c:InvOlahan; var uang:longint;var pemasukan:longint;var energi:integer);
	{I.S.: tersedia resep yang ingin dibuat, daftar resep, inventory bahan mentah, inventori bahan olahan, uang dan energi}
	{F.S.: Resep berhasil dibuat bila bahan mentah dan olahan ada. Menambah pemasukan dan mengurangi energi}
	//KAMUS LOKAL
	var
	indeks:integer;
	//ALGORITMA LOKAL
	begin
		if (energi=0) then
			writeln('Energi anda habis. Istirahatlah, makan atau tidur terlebih dahulu untuk memulihkan energi')
		else
			begin
				indeks:=1;
				cariIndeksResep(a,indeks,a.Neff,dibuat);
				if (indeks>a.Neff) then
					writeln('Resep Tidak ditemukan, ulangi perintah dengan resep yang tepat')
				else
				begin
					if (not searchSemua(a.TabResep[indeks],b,c)) then
						writeln('Bahan yang diperlukan tidak lengkap, pastikan bahan mentah dan bahan olahan ada di dalam inventori')
					else
					begin
						kurangiSemua(a.TabResep[indeks],b,c);
						uang:=uang+a.TabResep[indeks].harga;
						pemasukan:=pemasukan+a.TabResep[indeks].harga;
						energi:=energi-1;
					end;
				end;
			end;
	end;

end.
