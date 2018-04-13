unit searching;

interface
	uses tipe;

	function searchMentah(a:InvMentah; cari:string):boolean;
	//Fungsi searchMentah menerima masukan array bahan mentah
	//kemudian mencari apakah bahan mentah (cari) ada di dalam array (inventori)

	function searchOlahan(a:InvOlahan; cari:string):boolean;
	//Fungsi searchOlahan menerima masukan array of bahan olahan
	//kemudian mencari apakah bahan olahan(cari) ada di dalam array (inventory)

	function searchSemua(a: resep; b:InvMentah; c:InvOlahan):boolean;
	{I.S.: Terdapat data resep, inventory bahan mentah dan inventory bahan olahan}
	{F.S.: Mengembalikan nilai true bila semua bahan yang diperlukan terdapat di inventory}

	procedure searchKurMentah(var a:InvMentah;cari:string);
	{I.S.: Tersedia array berisi bahan mentah dan nama bahan mentah yang dicari}
	{F.S.: Akan dicari letak bahan mentah kemudian mengurangi satu kuantitasnya akibat dipakai untuk membuat sesuatu}

	procedure searchKurOlahan(var a:InvOlahan;cari:string);
	{I.S.: Tersedia array berisi bahan olahan dan bahan olahan yang akan dikurangi kuantitasnya}
	{F.S.: Akan dicari letak bahan olahan kemudian mengurangi satu kuantitasnya akibat dipakai untuk memasak sesuatu}

	procedure kurangiSemua(a:resep; var b:InvMentah; var c:InvOlahan);
	{I.S.: Diberikan resep yang akan dibuat, inventori mentah dan inventori olahan}
	{F.S.: Mengurangi 1 dari masing-masing bahan yang dibutuhkan}
	{Prekondisi: Semua bahan yang dibutuhkan ada dalam inventori. Telah dicek dengan fungsi searchSemua}

	procedure cariIndeksResep(a:Resepnya; var indeks:integer; cari:string);
	{I.S.: Tersedia array of resep, resep yang dicari dan indeks awal}
	{F.S.: nilai indeks berubah sesuai dengan indeks resep yang dicari}

implementation

	function searchMentah(a:InvMentah; cari:string):boolean;
	//Fungsi searchMentah menerima masukan array bahan mentah
	//kemudian mencari apakah bahan mentah (cari) ada di dalam array (inventori)
	//KAMUS LOKAL
	var
	ulangan1:integer; //variabel untuk looping internal fungsi
	//ALGORITMA LOKAL
	begin
		ulangan1:=1;			//Inisialisasi awal variabel untuk perulangan
		searchMentah:=False;	//Inisialisasi variabel boolean untuk perulangan
		while (ulangan1<=a.Neff) and (not searchMentah) do	//Mengulangi ketika indeks<=neff dan belum ditemukan
		begin
			if (a.TabInvMentah[ulangan1].Nama=cari) then	//Bila Nama inventori mentah sudah sama dengan yang dicari maka return True untuk variabel perulangan (looping berhenti)
			searchMentah:=True else			//Telah ditemukan, return true
			ulangan1:=ulangan1+1;			//Increment variabel perulangan
		end;
	end;

	function searchOlahan(a:InvOlahan;cari:string):boolean;
	//Fungsi searchOlahan menerima masukan array bahan olahan
	//kemudian mencari apakah bahan olahan(cari) ada di dalam array (inventory)
	//KAMUS LOKAL
	var
	ulangan2:integer; //variabel untuk looping internal fungsi
	//ALGORITMA LOKAL
	begin
		ulangan2:=1;			//Inisialisasi awal variabel untuk perulangan
		searchOlahan:=False;	//Inisialisasi variabel boolean untuk perulangan
		while (ulangan2<=a.Neff) and (not searchOlahan) do	//Mengulangi ketika indeks<=neff dan belum ditemukan
		begin
			if (a.TabInvOlahan[ulangan2].Nama=cari) then	//Bila Nama inventori olahan sudah sama dengan yang dicari maka return True untuk variabel perulangan (looping berhenti)
			searchOlahan:=True else		//Telah ditemukan, return true
			ulangan2:=ulangan2+1;		//Increment variabel perulangan
		end;
	end;

	procedure searchKurMentah(var a:InvMentah;cari:string);
	{I.S.: Tersedia array bahan mentah dan nama bahan mentah yang dicari}
	{F.S.: Akan dicari bahan mentah sesuai masukan kemudian mengurangi satu kuantitasnya akibat dipakai untuk membuat sesuatu}
	//KAMUS LOKAL
	var
	ketemu:boolean;	//variabel searching
	ulangan3:integer; //variabel looping internal prosedur
	//ALGORITMA LOKAL
	begin
		ulangan3:=1;		//Inisialisasi awal variabel perulangan
		ketemu:=False;		//Inisialisasi awal variabel boolean perulangan
		while (not ketemu) and (ulangan3<=a.Neff) do		//Saat belum ketemu dan var perulangan masih <= indeks dilakukan perulangan
		begin
			if (a.TabInvMentah[ulangan3].Nama=cari) then //Nama bahan mentah sama dengan yang dicari
			begin
				a.TabInvMentah[ulangan3].Jumlah:=a.TabInvMentah[ulangan3].jumlah-1;		//Mengurangi jumlah bahan mentah di invetori dengan 1
				ketemu:=True;					//Bahan telah ditemukan dan dikurangi
			end else
			ulangan3:=ulangan3+1;		//Increment variabel perulangan
		end;
	end;

	procedure searchKurOlahan(var a:InvOlahan;cari:string);
	{I.S.: Tersedia array berisi bahan olahan dan bahan olahan yang akan dikurangi kuantitasnya}
	{F.S.: Akan dicari bahan olahan sesuai masukan kemudian mengurangi satu kuantitasnya akibat dipakai untuk memasak sesuatu}
	//KAMUS LOKAL
	var
	ketemu:boolean;		//Variabel untuk searching
	ulangan4:integer;	//Variabel counter looping internal prosedur
	//ALGORITMA
	begin
		ulangan4:=1;		//Inisialisasi awal variabel perulangan
		ketemu:=false;		//Inisialisasi awal variabel boolean perulangan
		while (not ketemu) and (ulangan4<=a.Neff) do		//Saat belum ketemu dan var perulangan masih <= indeks dilakukan perulangan
		begin
			if (a.TabInvOlahan[ulangan4].nama=cari) then	//Nama bahan mentah sama dengan yang dicari
			begin
				a.TabInvOlahan[ulangan4].jumlah:=a.TabInvOlahan[ulangan4].jumlah-1;		//Mengurangi jumlah bahan mentah di invetori dengan 1
				ketemu:=True;			//Bahan telah ditemukan dan dikurangi
			end else
			ulangan4:=ulangan4+1;		//Increment variabel perulangan
		end;
	end;

	procedure cariIndeksResep(a:Resepnya; var indeks:integer; cari:string);
	{I.S.: Tersedia array of resep, resep yang dicari dan indeks awal}
	{F.S.: nilai indeks berubah sesuai dengan indeks resep yang dicari}
	//KAMUS LOKAL
	var
	ketemu:boolean;		//Variabel untuk searching, true bila ditemukan dan false bila sebaliknya
	//ALGORITMA	LOKAL
	begin
		indeks:=1;		//Inisialisasi awal variabel perulangan
		ketemu:=False;	//Inisialisasi awal variabel boolean perulangan
		while (not ketemu) and (indeks<=a.Neff) do		//Perulangan ketika belum ditemukan dan indeks masih kurang dari neff
		begin
			if (a.TabResep[indeks].nama=cari) then		//Resep ditemukan
			ketemu:=True 								//Mengubah boolean perulangan
			else
			indeks:=indeks+1;							//Menambah indeks bila belum ditemukan
		end;
		//Program ini mengeluarkan indeks sebagai output. Bila Indeks<=neff maka indeks masih valid(Resep ditemukan). Bila indeks>Neff maka resep tidak ditemukan
	end;

	function searchSemua(a: resep; b:InvMentah; c:InvOlahan):boolean;
	{I.S.: Terdapat data resep, inventory bahan mentah dan inventory bashan olahan}
	{F.S.: Mengembalikan nilai true bila semua bahan yang diperlukan terdapat di inventory}
	//KAMUS LOKAL
	var
	ulangan5:integer; 	//Variabel untuk looping
	bool:boolean;		//Variabel untuk menampung nilai fungsi setiap saat
	//ALGORITMA LOKAL
	begin
		bool:=True;		//Inisialisasi awal boolean
		for ulangan5:=1 to a.Nbutuh do		//Looping untuk mencari bahan, mulai dari bahan pertama sampai bahan terkhir (Sesuai dengan Nbutuh)
		begin
			bool:=(bool and (searchMentah(b,a.Olah[ulangan5]) or searchOlahan(c,a.Olah[ulangan5])));	//Bahan harus ditemukan di salah satu inventori mentah atau inventori olahan
		end;
		searchSemua:=bool;		//Return nilai fungsi sesuai dengan nilai bool
	end;

	procedure kurangiSemua(a:resep; var b:InvMentah; var c:InvOlahan);
	{I.S.: Diberikan resep yang akan dibuat, inventori mentah dan inventori olahan}
	{F.S.: Mengurangi 1 dari masing-masing bahan yang dibutuhkan}
	{Prekondisi: Semua bahan yang dibutuhkan ada dalam inventori. Telah dicek dengan fungsi searchSemua}
	//KAMUS LOKAL
	var
	ulangan6:integer;	//Variabel perulangan
	//ALGORITMA LOKAL
	begin
		ulangan6:=1;	//Inisialisasi awal variabel perulangan, First Element
		while (ulangan6<=a.Nbutuh) do
		begin
			searchKurMentah(b,a.Olah[ulangan6]);		//Mencari dan mengurangi bahan dengan 1
			searchKurOlahan(c,a.Olah[ulangan6]);		//Mencari dan mengurangi bahan dengan 1
			ulangan6:=ulangan6+1;						//Next element
		end;
	end;

end.
