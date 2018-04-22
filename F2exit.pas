unit F2exit;

interface

uses tipe;
procedure exit (var tabBahanMentah : Mentah; var tabBahanOlahan : Olahan; var tabInvenMentah : InvMentah; var tabInvenOlahan : InvOlahan; 
				var tabResepnya : Resepnya; var tabSimulasi : tSimulasi);
{I.S. : Menerima inputan berupa sebuah variabel yang bertipekan bentukan yang tersedia di unit tipe}
{F.S. : Menuliskan data yang ada di array ke dalam file eksternal}

implementation

procedure exit (var tabBahanMentah : Mentah; var tabBahanOlahan : Olahan; var tabInvenMentah : InvMentah; var tabInvenOlahan : InvOlahan; 
				var tabResepnya : Resepnya; var tabSimulasi : tSimulasi);
{I.S. : Menerima inputan berupa sebuah variabel yang bertipekan bentukan yang tersedia di unit tipe}
{F.S. : Menuliskan data yang ada di array ke dalam file eksternal}

var
	ext		: Text;
	i,j		: Integer;
	skip	: String;

begin
skip:=' '; 						//Inisiasi skip
assign (ext,'BahanMentah.txt'); //Assign file bahan mentah
rewrite(ext);					//
	for i:=1 to tabBahanMentah.Neff do	//Melakukan perulangan sebanyak neff
		begin
			writeln(ext, tabBahanMentah.TabMentah[i].Nama); 		//Menuliskan isi dalam array ke file eksternal
			writeln(ext, tabBahanMentah.TabMentah[i].Harga);		//Menuliskan isi dalam array ke file eksternal
			writeln(ext, tabBahanMentah.TabMentah[i].Kadaluarsa);	//Menuliskan isi dalam array ke file eksternal
			writeln(ext, skip);										//Memberi batas antar data ke-neff
		end;
		close(ext);		//Menutup file eksternal

assign(ext,'BahanOlahan.txt');	//Assign file bahan olahan
rewrite(ext);					//
	for i:=1 to tabBahanOlahan.Neff do	//Melakukan perulangan sebanyak neff
		begin
			writeln(ext, tabBahanOlahan.TabOlahan[i].Nama);			//Menuliskan isi dalam array ke file eksternal
			writeln(ext, tabBahanOlahan.TabOlahan[i].Harga);		//Menuliskan isi dalam array ke file eksternal
			writeln(ext, tabBahanOlahan.TabOlahan[i].NButuh);		//Menuliskan isi dalam array ke file eksternal
				for j:=1 to tabBahanOlahan.TabOlahan[i].NButuh do	//Melakukan perulangan sebanyak neff
					begin
						writeln(ext, tabBahanOlahan.TabOlahan[i].bahan[j]);	//Menuliskan isi dalam array ke file eksternal
					end;
			writeln(ext, skip);										//Memberi batas antar data ke-neff
		end;
		close(ext);		//Menutup file eksternal

assign (ext,'InvMentah.txt');	//Assign file inventory mentah
rewrite(ext);					//
	for i:=1 to tabInvenMentah.Neff do	//Melakukan perulangan sebanyak neff
		begin
			writeln(ext, tabInvenMentah.TabInvMentah[i].Nama);			//Menuliskan isi dalam array ke file eksternal	
			writeln(ext, tabInvenMentah.TabInvMentah[i].Tgl.hari, ' ',	//Menuliskan isi dalam array ke file eksternal
			tabInvenMentah.TabInvMentah[i].Tgl.bulan, ' ',
			tabInvenMentah.TabInvMentah[i].Tgl.tahun);
			writeln(ext, tabInvenMentah.TabInvMentah[i].Jumlah);		//Menuliskan isi dalam array ke file eksternal
			writeln(ext, skip);											//Memberi batas antar data ke-neff
		end;
		close(ext);	//Menutup file eksternal
		
assign (ext,'InvOlahan.txt');	//Assign file inventory olahan
rewrite(ext);					//
	for i:=1 to tabInvenOlahan.Neff do	//Melakukan perulangan sebanyak neff
		begin
			writeln(ext, tabInvenOlahan.TabInvOlahan[i].Nama);				//Menuliskan isi dalam array ke file eksternal
			writeln(ext, tabInvenOlahan.TabInvOlahan[i].TglBuat.hari, ' ',	//Menuliskan isi dalam array ke file eksternal
			tabInvenOlahan.TabInvOlahan[i].TglBuat.bulan, ' ',
			tabInvenOlahan.TabInvOlahan[i].TglBuat.tahun);					//Menuliskan isi dalam array ke file eksternal
			writeln(ext, tabInvenOlahan.TabInvOlahan[i].Jumlah);			//Menuliskan isi dalam array ke file eksternal
			writeln(ext, skip);												//Memberi batas antar data ke-neff
		end;
		close(ext);	//Menutup file eksternal

assign (ext,'Resep.txt');	//Assign file resep
rewrite(ext);				//
	for i:=1 to tabResepnya.Neff do		//Melakukan perulangan sebanyak neff
		begin
			writeln(ext, tabResepnya.TabResep[i].Nama);		//Menuliskan isi dalam array ke file eksternal
			writeln(ext, tabResepnya.TabResep[i].Harga);	//Menuliskan isi dalam array ke file eksternal
			writeln(ext, tabResepnya.TabResep[i].NButuh);	//Menuliskan isi dalam array ke file eksternal
			for j:=1 to tabResepnya.TabResep[i].Nbutuh do	//Melakukan perulangan
				begin
					writeln(ext, tabResepnya.TabResep[i].Olah[j]);	//Menuliskan isi dalam array ke file eksternal
				end;
			writeln(ext, skip);	//Memberi batas antar data ke-neff
		end;
		close(ext);	//Menutup file eksternal
		
assign (ext,'Simulasi.txt');	//Assign file simulasi
rewrite(ext);					//
	for i:=1 to tabSimulasi.Neff do	//Melakukan perulangan sebanyak neff
		begin
			writeln(ext, tabSimulasi.Tab[i].Nomor);				//Menuliskan isi dalam array ke file eksternal
			writeln(ext, tabSimulasi.Tab[i].Tgl.hari, ' ',		//Menuliskan isi dalam array ke file eksternal
			tabSimulasi.Tab[i].Tgl.bulan, ' ',
			tabSimulasi.Tab[i].Tgl.tahun);
			writeln(ext, tabSimulasi.Tab[i].HariHidup);			//Menuliskan isi dalam array ke file eksternal
			writeln(ext, tabSimulasi.Tab[i].Energi);			//Menuliskan isi dalam array ke file eksternal
			writeln(ext, tabSimulasi.Tab[i].KapasitasInventory);//Menuliskan isi dalam array ke file eksternal
			writeln(ext, tabSimulasi.Tab[i].TotalBeliMentah);	//Menuliskan isi dalam array ke file eksternal
			writeln(ext, tabSimulasi.Tab[i].TotalOlahBuat);		//Menuliskan isi dalam array ke file eksternal
			writeln(ext, tabSimulasi.Tab[i].TotalOlahJual);		//Menuliskan isi dalam array ke file eksternal
			writeln(ext, tabSimulasi.Tab[i].TotalResepJual);	//Menuliskan isi dalam array ke file eksternal
			writeln(ext, tabSimulasi.Tab[i].TotalPemasukan);	//Menuliskan isi dalam array ke file eksternal
			writeln(ext, tabSimulasi.Tab[i].TotalPengeluaran);	//Menuliskan isi dalam array ke file eksternal
			writeln(ext, tabSimulasi.Tab[i].TotalPendapatan);	//Menuliskan isi dalam array ke file eksternal
			writeln(ext, skip);									//Memberi batas antar data ke-neff
		end;
		close(ext);	//Menutup file eksternal

writeln;
writeln(' /$$$$$$$$ /$$                           /$$                       /$$$$$$$$');
writeln('|__  $$__/| $$                          | $$                      | $$_____/');
writeln('   | $$   | $$$$$$$   /$$$$$$  /$$$$$$$ | $$   /$$  /$$$$$$$      | $$     /$$$$$$   /$$$$$$');
writeln('   | $$   | $$__  $$ |____  $$| $$__  $$| $$  /$$/ /$$_____/      | $$$$$ /$$__  $$ /$$__  $$');
writeln('   | $$   | $$  \ $$  /$$$$$$$| $$  \ $$| $$$$$$/ |  $$$$$$       | $$__/| $$  \ $$| $$  \__/');
writeln('   | $$   | $$  | $$ /$$__  $$| $$  | $$| $$_  $$  \____  $$      | $$   | $$  | $$| $$');
writeln('   | $$   | $$  | $$|  $$$$$$$| $$  | $$| $$ \  $$ /$$$$$$$/      | $$   |  $$$$$$/| $$');
writeln('   |__/   |__/  |__/ \_______/|__/  |__/|__/  \__/|_______/       |__/    \______/ |__/');
writeln;
writeln;
writeln('		 /$$$$$$$  /$$                     /$$');
writeln('		| $$__  $$| $$                    |__/');
writeln('		| $$  \ $$| $$  /$$$$$$  /$$   /$$ /$$ /$$$$$$$   /$$$$$$');
writeln('		| $$$$$$$/| $$ |____  $$| $$  | $$| $$| $$__  $$ /$$__  $$');
writeln('		| $$____/ | $$  /$$$$$$$| $$  | $$| $$| $$  \ $$| $$  \ $$');
writeln('		| $$      | $$ /$$__  $$| $$  | $$| $$| $$  | $$| $$  | $$');
writeln('		| $$      | $$|  $$$$$$$|  $$$$$$$| $$| $$  | $$|  $$$$$$$');
writeln('		|__/      |__/ \_______/ \____  $$|__/|__/  |__/ \____  $$');
writeln('   			                  /$$  | $$               /$$  \ $$');
writeln('	      				         |  $$$$$$/              |  $$$$$$/');
writeln('	              				  \______/                \______/');		
end;
end.
