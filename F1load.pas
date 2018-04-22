unit F1load;

interface

uses tipe;
procedure load (var tabBahanMentah : Mentah; var tabBahanOlahan : Olahan; var tabInvenMentah : InvMentah; var tabInvenOlahan : InvOlahan; 
				var tabResepnya : Resepnya; var tabSimulasi : tSimulasi);
{I.S. : Menerima inputan berupa sebuah variabel yang bertipekan bentukan yang tersedia di unit tipe}
{F.S. : Memuat semua data yang ada di file eksternal ke dalam array yang akan digunakan di program utama}

implementation

procedure load (var tabBahanMentah : Mentah; var tabBahanOlahan : Olahan; var tabInvenMentah : InvMentah; var tabInvenOlahan : InvOlahan; 
				var tabResepnya : Resepnya; var tabSimulasi : tSimulasi);
{I.S. : Menerima inputan berupa sebuah variabel yang bertipekan bentukan yang tersedia di unit tipe}
{F.S. : Memuat semua data yang ada di file eksternal ke dalam array yang akan digunakan di program utama}
//Kamus Lokal
var
	ext		: Text;
	j		: Integer;
	skip	: String;
//Algoritma
begin
skip:=' ';							//Inisiasi skip
	assign(ext, 'BahanMentah.txt'); //Assign file bahan mentah
	reset(ext); 					//Set file eksternal agar bisa dibaca
	tabBahanMentah.neff:=0; 		//Inisiasi nilai neff
	if EOF(ext) then				//Validasi file kosong, jika kosong mengeluarkan output file kosong
		begin
			writeln('File BahanMentah.txt kosong');	//Menuliskan pesan file kosong
		end
	else
		begin
		while not(EOF(ext)) do 	//Melakukan perulangan selama belum end of file
			begin
				inc(tabBahanMentah.neff); 												//Menambah nilai neff
				readln(ext, tabBahanMentah.tabMentah[tabBahanMentah.neff].Nama); 		//Memasukan data di file eksternal ke array
				readln(ext, tabBahanMentah.tabMentah[tabBahanMentah.neff].Harga); 		//Memasukan data di file eksternal ke array
				readln(ext, tabBahanMentah.tabMentah[tabBahanMentah.neff].Kadaluarsa);	//Memasukan data di file eksternal ke array
				readln(ext, skip);														//Memberi pembatas antar data
			end;
			writeln('File BahanMentah.txt terbaca'); //Menuliskan pesan bahwa file berhasil di load
		end;
	close(ext); //Close file eksternal
	
	assign(ext,'BahanOlahan.txt'); 	//Assign file bahan olahan
	reset(ext);						//Set file eksternal agar bisa dibaca
	tabBahanOlahan.neff:=0;			//Inisiasi nilai neff
	if EOF(ext) then				//Validasi file kosong, jika kosong mengeluarkan output file kosong
		begin
			writeln('File BahanOlahan.txt kosong');	//Menuliskan pesan file kosong
		end
	else
		begin
		while not (EOF(ext)) do //Melakukan perulangan selama belum end of file
			begin
				inc(tabBahanOlahan.neff); 											//Menambah nilai neff
				readln(ext, tabBahanOlahan.tabOlahan[tabBahanOlahan.neff].Nama); 	//Memasukan data di file eksternal ke array
				readln(ext, tabBahanOlahan.tabOlahan[tabBahanOlahan.neff].Harga); 	//Memasukan data di file eksternal ke array
				readln(ext, tabBahanOlahan.tabOlahan[tabBahanOlahan.neff].NButuh);	//Memasukan data di file eksternal ke array
					for j:=1 to tabBahanOlahan.tabOlahan[tabBahanOlahan.neff].NButuh do	//Melakukan perulangan
						begin
							readln(ext, tabBahanOlahan.tabOlahan[tabBahanOlahan.neff].bahan[j]); //Memasukan data di file eksternal ke array
						end;
				readln(ext, skip); 													//Memberi pembatas antar data
			end;
			writeln('File BahanOlahan.txt terbaca'); //Menuliskan pesan bahwa file berhasil di load
		end;
	close(ext); //Close file eksternal
	
	assign(ext,'InvMentah.txt');	//Assign file inventory mentah
	reset(ext); 					//Set file eksternal agar bisa dibaca
	tabInvenMentah.neff:=0;			//Inisiasi nilai neff
	if EOF(ext) then				//Validasi file kosong, jika kosong mengeluarkan output file kosong
		begin
			writeln('File BahanOlahan.txt kosong');	//Menuliskan pesan file kosong
		end
	else
		begin
		while not (EOF(ext)) do		//Melakukan perulangan selama belum end of file
			begin
				inc(tabInvenMentah.neff);												//Menambah nilai neff
				readln(ext, tabInvenMentah.TabInvMentah[tabInvenMentah.neff].Nama);		//Memasukan data di file eksternal ke array
				readln(ext, tabInvenMentah.TabInvMentah[tabInvenMentah.neff].Tgl.hari, 	//Memasukan data di file eksternal ke array
				tabInvenMentah.TabInvMentah[tabInvenMentah.neff].Tgl.bulan, 
				tabInvenMentah.TabInvMentah[tabInvenMentah.neff].Tgl.tahun);
				readln(ext, tabInvenMentah.TabInvMentah[tabInvenMentah.neff].Jumlah);	//Memasukan data di file eksternal ke array
				readln(ext, skip);														//Memberi pembatas antar data
			end;
			writeln('File InvMentah.txt sudah terbaca');	//Menuliskan pesan bahwa file berhasil di load
		end;
	close(ext); //Close file eksternal
	
	assign(ext,'InvOlahan.txt');	//Assign file inventory olahan
	reset(ext);						//Set file eksternal agar bisa dibaca
	tabInvenOlahan.neff:= 0;		//Inisiasi nilai neff
	if EOF(ext) then				//Validasi file kosong, jika kosong mengeluarkan output file kosong
		begin
			writeln('File InvOlahan.txt kosong');	//Menuliskan pesan file kosong
		end
	else
		begin
		while not(EOF(ext)) do		//Melakukan perulangan selama belum end of file
			begin
				inc(tabInvenOlahan.neff);
				readln(ext, tabInvenOlahan.TabInvOlahan[tabInvenOlahan.neff].Nama);			//Menambah nilai neff
				readln(ext, tabInvenOlahan.TabInvOlahan[tabInvenOlahan.neff].TglBuat.hari,	//Memasukan data di file eksternal ke array
				tabInvenOlahan.TabInvOlahan[tabInvenOlahan.neff].TglBuat.bulan,
				tabInvenOlahan.TabInvOlahan[tabInvenOlahan.neff].TglBuat.tahun);
				readln(ext, tabInvenOlahan.TabInvOlahan[tabInvenOlahan.neff].Jumlah);		//Memasukan data di file eksternal ke array
				readln(ext, skip);															//Memberi pembatas antar data
			end;
			writeln('File InvOlahan.txt terbaca'); 	//Menuliskan pesan bahwa file berhasil di load
		end;
	close(ext);	//Close file eksternal
	
	assign(ext,'Resep.txt');		//Assign file resep
	reset(ext);						//Set file eksternal agar bisa dibaca
	tabResepnya.neff:=0;			//Inisiasi nilai neff
	if EOF(ext) then				//Validasi file kosong, jika kosong mengeluarkan output file kosong
		begin
			writeln('File Resep.txt kosong');	//Menuliskan pesan file kosong
		end
	else
		begin
		while not(EOF(ext)) do		//Melakukan perulangan selama belum end of file
			begin
				inc(tabResepnya.neff);										//Menambah nilai neff
				readln(ext, tabResepnya.TabResep[tabResepnya.neff].Nama);	//Memasukan data di file eksternal ke array
				readln(ext, tabResepnya.TabResep[tabResepnya.neff].Harga);	//Memasukan data di file eksternal ke array
				readln(ext, tabResepnya.TabResep[tabResepnya.neff].NButuh);	//Memasukan data di file eksternal ke array
					for j:=1 to tabResepnya.TabResep[tabResepnya.neff].NButuh do	//Melakukan perulangan
						begin
							readln(ext, tabResepnya.TabResep[tabResepnya.neff].Olah[j]); //Memasukan data di file eksternal ke array
						end;
					readln(ext, skip);										//Memberi pembatas antar data
			end;
			writeln('File Resep.txt terbaca');	//Menuliskan pesan bahwa file berhasil di load
		end;
	close(ext);	//Close file eksternal

	assign(ext, 'Simulasi.txt');		//Assign file simulasi
	reset(ext);							//Set file eksternal agar bisa dibaca
	tabSimulasi.neff:=0;				//Inisiasi nilai neff
	if EOF(ext) then					//Validasi file kosong, jika kosong mengeluarkan output file kosong
		begin
			writeln('File Simulasi.txt kosong');		//Menuliskan pesan file kosong
		end
	else 
		begin
			while not(EOF(ext)) do		//Melakukan perulangan selama belum end of file
				begin
					inc(tabSimulasi.neff);												//Menambah nilai neff
					readln(ext, tabSimulasi.Tab[tabSimulasi.neff].Nomor);				//Memasukan data di file eksternal ke array
					readln(ext, tabSimulasi.Tab[tabSimulasi.neff].Tgl.hari,				//Memasukan data di file eksternal ke array
					tabSimulasi.Tab[tabSimulasi.neff].Tgl.bulan,
					tabSimulasi.Tab[tabSimulasi.neff].Tgl.tahun);
					readln(ext, tabSimulasi.Tab[tabSimulasi.neff].HariHidup);			//Memasukan data di file eksternal ke array
					readln(ext, tabSimulasi.Tab[tabSimulasi.neff].Energi);				//Memasukan data di file eksternal ke array
					readln(ext, tabSimulasi.Tab[tabSimulasi.neff].KapasitasInventory);	//Memasukan data di file eksternal ke array
					readln(ext, tabSimulasi.Tab[tabSimulasi.neff].TotalBeliMentah);		//Memasukan data di file eksternal ke array
					readln(ext, tabSimulasi.Tab[tabSimulasi.neff].TotalOlahBuat);		//Memasukan data di file eksternal ke array
					readln(ext, tabSimulasi.Tab[tabSimulasi.neff].TotalOlahJual);		//Memasukan data di file eksternal ke array
					readln(ext, tabSimulasi.Tab[tabSimulasi.neff].TotalResepJual);		//Memasukan data di file eksternal ke array
					readln(ext, tabSimulasi.Tab[tabSimulasi.neff].TotalPemasukan);		//Memasukan data di file eksternal ke array
					readln(ext, tabSimulasi.Tab[tabSimulasi.neff].TotalPengeluaran);	//Memasukan data di file eksternal ke array
					readln(ext, tabSimulasi.Tab[tabSimulasi.neff].TotalPendapatan);		//Memasukan data di file eksternal ke array
					readln(ext, skip);													//Memberi pembatas antar data
				end;
				writeln('File Simulasi.txt terbaca');	//Menuliskan pesan bahwa file berhasil di load
		end;
	close(ext);	//Close file eksternal
Writeln;
Writeln('~o SELAMAT DATANG DI ENGIS KITCHEN o~');	//Menuliskan pesan selamat datang
writeln;
end;
end.
