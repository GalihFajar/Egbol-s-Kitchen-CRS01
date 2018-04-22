unit evaluate;
{Unit ini digunakan untuk mengevaluasi kondisi inventori. Bila jumlah/kuantitas bahan=0 Maka bahan dihapus dari inventori}
{Akan ditambahkan fungsi evaluasi kadaluarsa kalau sudah ada sistem penanggalan}

interface
	
	uses tipe;

	procedure evaluateInvOlahan(var a:InvOlahan; b:Tanggal);
	{I.S.: Tersedia array berisi inventori Olahan}
	{F.S.: mendelete bahan olahan yang kadaluarsa}

	procedure evaluateInvMentah(var a:InvMentah; b:Tanggal;c:mentah);
	{I.S.: Tersedia array berisi inventori Mentah}
	{F.S.: mendelete bahan Mentah yang kadaluarsa}

	function isKadaluarsaOlahan(a:InventoryOlahan;b:Tanggal):boolean;
	{I.S.: Tersedia suatu tipe bahan olahan dan tanggal HARI INI}
	{F.S.: Memberikan output true ketika bahan olahan kadaluarsa dan false ketika belum kadaluarsa}

	function isKadaluarsaMentah(a:InventoryMentah;b:Tanggal;c:Mentah):boolean;
	{I.S.: Tersedia suatu tipe bahan mentah dan tanggal HARI INI}
	{F.S.: Memberikan output true ketika bahan mentah kadaluarsa dan false ketika belum kadaluarsa}

	function isKabisat(a:integer):boolean;
	{I.S.: Tersedia suatu bilangan yang menyatakan tahun}
	{F.S.: Mengembalikan nilai true ketika tahun kabisat dan false ketika tidak}


implementation
	
	procedure geserMentah(var a:InvMentah; indeks:integer);
	{I.S.: Diberikan inventori mentah kemudian menghapus elemen sesuai indeks dan menggeser elemen selanjutnya}
	{F.S.: Elemen ke-indeks inventori dihapus dan elemen dibawahnya geser ke atas}
	//KAMUS LOKAL
	var
	u1:integer; //variabel pengulangan
	//ALGORITMA LOKAL
	begin
		for u1:=indeks to a.neff do		//Perulangan untuk menggeser array dimulai dari indeks masukan(Indeks yang ingin dihapus)
		begin
			a.TabInvMentah[u1]:=a.TabInvMentah[u1+1];		//Menggeser array, indeks berikutnya di geser ke indeks sekarang (indeks sekarang dihapus/digantikan)
		end;
		a.neff:=a.neff-1;				//mengurangi Neff (karena pada indeks awal element dihapus dan digantikan dengan indeks selanjutnya)
	end;


	procedure geserOlahan(var a:InvOlahan; indeks:integer);
	{I.S.: Diberikan inventori olahan kemudian menghapus elemen sesuai indeks dan menggeser elemen selanjutnya}
	{F.S.: Elemen ke-indeks inventori dihapus dan elemen dibawahnya geser ke atas}
	//KAMUS LOKAL
	var
	u2:integer; //variabel pengulangan
	//ALGORITMA LOKAL
	begin
		for u2:=indeks to a.neff do		//Perulangan untuk menggeser elemen dimulai dengan elemen yang akan dihapus
		begin
			a.TabInvOlahan[u2]:=a.TabInvOlahan[u2+1];	//Mengganti elemen array dengan elemen berikutnya (Elemen pertama indeks terhapus)
		end;
		a.neff:=a.neff-1;		//Mengurangi neff akibat penghapusan
	end;


	function isKabisat(a:integer):boolean;
	{I.S.: Tersedia suatu bilangan yang menyatakan tahun}
	{F.S.: Mengembalikan nilai true ketika tahun kabisat dan false ketika tidak}
	//ALGORITMA LOKAL
	begin
		if (a mod 400=0) then		//Bila merupakan tahun abad, maka bukan kabisat
		isKabisat:=False
		else if (a mod 4=0) then	//Bila tahun habis dibagi 4 tetapi bukan tahun abad maka merupakan tahun kabisat
		isKabisat:=True
		else
		isKabisat:=False;			//Sisanya bukan tahun kabisat
	end;


	function isKadaluarsaOlahan(a:InventoryOlahan;b:Tanggal):boolean;
	{I.S.: Tersedia suatu tipe bahan olahan dan tanggal hari ini}
	{F.S.: Memberikan output true ketika bahan olahan kadaluarsa dan false ketika belum kadaluarsa}
	//KAMUS LOKAL
	var
	selisih:longint;		//Merupakan variabel untuk menampung
	//ALGORITMA LOKAL
	begin
		selisih:=0;		//Inisialisasi variabel selisih
		if (a.TglBuat.bulan=b.bulan) then		//Kasus pertama bila bulannya sama
			begin
				selisih:=b.hari-a.TglBuat.hari;		//Selisih tanggal adalah tanggal simulasi dikurangi dengan tanggal pembuatan bahan olahan
			end
		else if ((b.bulan=1) or (b.bulan=2) or (b.bulan=4) or (b.bulan=6) or (b.bulan=8) or (b.bulan=9) or (b.bulan=11)) then //Kasus kedua bila bulan yang bulan sebelumya berjumlah 31 hari
			begin
				selisih:=(b.hari+31)-a.TglBuat.hari; //Selisih tanggal adalah tanggal simulasi ditambah 31(hari di bulan sebelumnya) dikurangi tanggal pembuatan bahan olahan
			end
		else if (b.bulan=3) then 					//Kasus ketiga ketika bulan maret
			begin									//Karena bulan sebelum maret adalah bulan februari dan memiliki 2 kasus lagi tergantung tahun maka kasus dipisah menjadi 2
				if (isKabisat(b.tahun)) then		//Bila tahun kabisat
				selisih:=b.hari+29-a.TglBuat.hari 	//selisih tanggal adalah tanggal simulasi ditambah dengan 29 kemudian dikurangi dengan tanggal pembuatan bahan olahan
				else								//Bukan tahun kabisat
				selisih:=b.hari+28-a.TglBuat.hari;	//Selisih tanggal adalah tanggal simulasi ditambah dengan 28 kemudian dikurangi dengan tanggal pembuatan bahan olahan
			end
		else				//Kasus lainnya selain kasus diatas ialah bulan yang bulan sebelumnya berjumlah 30 Hari
		selisih:=b.hari+30-a.TglBuat.hari;	//Selisih hari adalah tanggal simulasi ditambah 30 kemudian dikurangi tanggal pembuatan bahan olahan

		if (selisih>3) then			//Karena masa kadaluarsa bahan olahan adalah 3 hari, maka bila selisih hari lebih dari 3 bahan sudah kadaluarsa
		isKadaluarsaOlahan:=True 	//Bahan sudah kadaluarsa
		else isKadaluarsaOlahan:=False;			//Bila masih kurang dari 3 hari maka belum kadaluarsa

	end;


	function isKadaluarsaMentah(a:InventoryMentah;b:Tanggal;c:Mentah):boolean;
	{I.S.: Tersedia suatu tipe bahan mentah dan tanggal hari ini}
	{F.S.: Memberikan output true ketika bahan mentah kadaluarsa dan false ketika belum kadaluarsa}
	//KAMUS LOKAL
	var
	u4:integer;			//variabel perulangan untuk mencari masa kadaluarsa bahan mentah
	found:boolean;		//Variabel boolean untuk mencari masa kadaluarsa bahan mentah
	selisih:longint;	//Selisih untuk menyatakan selisih hari
	//ALGORITMA LOKAL
	begin
		u4:=1; //indeks awal pencarian masa kadaluarsa bahan mentah
		found:=False;		//Variabel boolean untuk searching masa kadaluarsa bahan mentah
		while (u4<=c.Neff) and (not found) do		//Ketika u4 masih kurang dari neff dan belum ditemukan perulangan berjalan
		begin
			if (a.Nama=c.TabMentah[u4].Nama) then	//bahan mentah ditemukan di dalam data Bahan mentah
			begin
				found:=True;		//Bahan telah ditemukan (U4 menyatakan indeks letak bahan mentah)
			end else
			u4:=u4+1;				//Ketika belum ditemukan, u4 ditambah (increment)
		end;

		selisih:=0;					//Inisialisasi variabel selisih
		if (a.Tgl.bulan=b.bulan) then		//Kasus pertama bila bulannya sama
			begin
				selisih:=b.hari-a.Tgl.hari;		//Selisih tanggal adalah tanggal simulasi dikurangi dengan tanggal pembelian bahan mentah
			end
		else if ((b.bulan=1) or (b.bulan=2) or (b.bulan=4) or (b.bulan=6) or (b.bulan=8) or (b.bulan=9) or (b.bulan=11)) then	//Kasus kedua bila bulan yang bulan sebelumya berjumlah 31 hari
			begin
				selisih:=(b.hari+31)-a.Tgl.hari;	//Selisih tanggal adalah tanggal simulasi ditambah 31(hari di bulan sebelumnya) dikurangi tanggal pembelian bahan mentah
			end
		else if (b.bulan=3) then 					//Kasus ketiga ketika bulan maret
			begin									//Karena bulan sebelum maret adalah bulan februari dan memiliki 2 kasus lagi tergantung tahun maka kasus dipisah menjadi 2
				if (isKabisat(b.tahun)) then	//Bila tahun kabisat
				selisih:=b.hari+29-a.Tgl.hari 		//selisih tanggal adalah tanggal simulasi ditambah dengan 29 kemudian dikurangi dengan tanggal pembelian bahan mentah
				else							//Bukan tahun kabisat
				selisih:=b.hari+28-a.Tgl.hari;		//Selisih tanggal adalah tanggal simulasi ditambah dengan 28 kemudian dikurangi dengan tanggal pembelian bahan Mentah
			end
		else		//Kasus lainnya selain kasus diatas ialah bulan yang bulan sebelumnya berjumlah 30 Hari
		selisih:=b.hari+30-a.Tgl.hari;	//Selisih hari adalah tanggal simulasi ditambah 30 kemudian dikurangi tanggal pembuatan bahan olahan

		if (selisih>c.TabMentah[u4].kadaluarsa) then		//u4 adalah indeks yang menunjukkan referensi bahan mentah di daftar bahan mentah, Bila selisih melebihi masa kadaluarsa bahan mentah maka sudah kadaluarsa
		isKadaluarsaMentah:=True 							//Return true ketika kadaluarsa
		else isKadaluarsaMentah:=False;						//Return false ketika belum kadaluarsa

	end;


	procedure evaluateInvOlahan(var a:InvOlahan; b:Tanggal);
	{I.S.: Tersedia array berisi inventori Olahan}
	{F.S.: mendelete bahan olahan yang kadaluarsa maupun yang habis (jumlah=0)}
	//KAMUS LOKAL
	var
	u3:integer; //variabel counter pengulangan
	begin
		u3:=1;		//inisialisasi awal variabel perulangan
		while (u3<=a.neff) do	//Perulangan selama u3 masih kurang dari neff
		begin
			if (isKadaluarsaOlahan(a.TabInvOlahan[u3],b)) or (a.TabInvOlahan[u3].jumlah<=0) then		//Bahan kadaluarsa atau jumlahnya 0
			begin
				geserOlahan(a,u3);		//Menghapus elemen array ke u6 dan menggeser semua elemen array
			end
			else
				u3:=u3+1;				//Next element
		end;
	end;


	procedure evaluateInvMentah(var a:InvMentah; b:Tanggal;c:mentah);
	{I.S.: Tersedia array berisi inventori Mentah}
	{F.S.: mendelete bahan Mentah yang kadaluarsa maupun yang habis (jumlah=0)}
	//KAMUS LOKAL
	var
	u6:integer; //variabel counter pengulangan
	begin
		u6:=1;		//Inisialisasi awal variabel pengulangan
		while (u6<=a.neff) do		//pengulangan ketika u6 masih kurang dari neff
		begin
			if (isKadaluarsaMentah(a.TabInvMentah[u6],b,c)) or (a.TabInvMentah[u6].jumlah<=0) then		//Bahan mentah kadaluarsa atau jumlahnya 0
			begin
				geserMentah(a,u6);		//Menghapus elemen array ke u6 dan menggeser semua elemen array
			end
			else
				u6:=u6+1;				//Next element
		end;
	end;
end.