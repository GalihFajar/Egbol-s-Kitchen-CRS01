unit searching;

interface
	uses tipe;

	function searchMentah(a:InvMentah; num:integer; cari:string):boolean;
	//Fungsi searchMentah menerima masukan array bahan mentah dan nilai efektifnya
	//kemudian mencari apakah bahan mentah (cari) ada di dalam array (inventori)

	function searchOlahan(a:InvOlahan; num:integer; cari:string):boolean;
	//Fungsi searchOlahan menerima masukan array of bahan olahan dan nilai efektifnya
	//kemudian mencari apakah bahan olahan(cari) ada di dalam array (inventory)

	function searchSemua(a: resep; b:InvMentah; c:InvOlahan):boolean;
	{I.S.: Terdapat data resep, inventory bahan mentah dan inventory bahan olahan}
	{F.S.: Mengembalikan nilai true bila semua bahan yang diperlukan terdapat di inventory}

	procedure searchKurMentah(var a:InvMentah;num:integer;cari:string);
	{I.S.: Tersedia array berisi bahan mentah, nilai efektif array, nama bahan mentah yang dicari}
	{F.S.: Akan dicari letak bahan mentah kemudian mengurangi satu kuantitasnya akibat dipakai untuk membuat sesuatu}

	procedure searchKurOlahan(var a:InvOlahan;num:integer;cari:string);
	{I.S.: Tersedia array berisi bahan olahan, nilai efektifnya dan bahan olahan yang akan dikurangi kuantitasnya}
	{F.S.: Akan dicari letak bahan olahan kemudian mengurangi satu kuantitasnya akibat dipakai untuk memasak sesuatu}

	procedure kurangiSemua(a:resep; var b:InvMentah; var c:InvOlahan);
	{I.S.: Diberikan resep yang akan dibuat, inventori mentah dan inventori olahan}
	{F.S.: Mengurangi 1 dari masing-masing bahan yang dibutuhkan}
	{Prekondisi: Semua bahan yang dibutuhkan ada dalam inventori. Telah dicek dengan fungsi searchSemua}

	procedure cariIndeksResep(a:Resepnya; var indeks:integer; jum:integer; cari:string);
	{I.S.: Tersedia array of resep, resep yang dicari dan indeks awal}
	{F.S.: nilai indeks berubah sesuai dengan indeks resep yang dicari}

implementation

	function searchMentah(a:InvMentah;num:integer;cari:string):boolean;
	//Fungsi searchMentah menerima masukan array bahan mentah dan nilai efektifnya
	//kemudian mencari apakah bahan mentah (cari) ada di dalam array (inventori)
	//KAMUS LOKAL
	var
	ulangan1:integer; //variabel untuk looping internal fungsi
	//ALGORITMA LOKAL
	begin
		for ulangan1:=1 to num do
		begin
			if (a.TabInvMentah[ulangan1].Nama=cari) then
			searchMentah:=True else
			searchMentah:=False;
		end;
	end;

	function searchOlahan(a:InvOlahan;num:integer;cari:string):boolean;
	//Fungsi searchOlahan menerima masukan array bahan olahan dan nilai efektifnya
	//kemudian mencari apakah bahan olahan(cari) ada di dalam array (inventory)
	//KAMUS LOKAL
	var
	ulangan2:integer; //variabel untuk looping internal fungsi
	//ALGORITMA LOKAL
	begin
		for ulangan2:=1 to num do
		begin
			if (a.TabInvOlahan[ulangan2].Nama=cari) then
			searchOlahan:=True else
			searchOlahan:=False;
		end;
	end;

	procedure searchKurMentah(var a:InvMentah;num:integer;cari:string);
	{I.S.: Tersedia array bahan mentah, nilai efektif array, nama bahan mentah yang dicari}
	{F.S.: Akan dicari letak bahan mentah kemudian mengurangi satu kuantitasnya akibat dipakai untuk membuat sesuatu}
	//KAMUS LOKAL
	var
	ketemu:boolean;	//variabel searching
	ulangan3:integer; //variabel looping internal prosedur
	//ALGORITMA LOKAL
	begin
		ulangan3:=1;
		ketemu:=False;
		while (not ketemu) and (ulangan3<=num) do
		begin
			if (a.TabInvMentah[ulangan3].Nama=cari) then //Nama bahan mentah sama dengan yang dicari
			begin
				a.TabInvMentah[ulangan3].Jumlah:=a.TabInvMentah[ulangan3].jumlah-1;		//Mengurangi jumlah bahan mentah di invetori dengan 1
				ketemu:=True;					//Bahan telah ditemukan dan dikurangi
			end else
			ulangan3:=ulangan3+1;
		end;
	end;

	procedure searchKurOlahan(var a:InvOlahan;num:integer;cari:string);
	{I.S.: Tersedia array berisi bahan olahan, nilai efektifnya dan bahan olahan yang akan dikurangi kuantitasnya}
	{F.S.: Akan dicari letak bahan olahan kemudian mengurangi satu kuantitasnya akibat dipakai untuk memasak sesuatu}
	//KAMUS LOKAL	
	var
	ketemu:boolean;		//Variabel untuk searching
	ulangan4:integer;	//Variabel counter looping internal prosedur
	//ALGORITMA
	begin
		ulangan4:=1;
		ketemu:=false;
		while (not ketemu) and (ulangan4<=num) do
		begin
			if (a.TabInvOlahan[ulangan4].nama=cari) then
			begin
				a.TabInvOlahan[ulangan4].jumlah:=a.TabInvOlahan[ulangan4].jumlah-1;
				ketemu:=True;
			end else
			ulangan4:=ulangan4+1;
		end;
	end;

	procedure cariIndeksResep(a:Resepnya; var indeks:integer; jum:integer; cari:string);
	{I.S.: Tersedia array of resep, resep yang dicari dan indeks awal}
	{F.S.: nilai indeks berubah sesuai dengan indeks resep yang dicari}
	//KAMUS LOKAL
	var
	ketemu:boolean;		//Variabel untuk searching, true bila ditemukan dan false bila sebaliknya
	//ALGORITMA	LOKAL
	begin
		indeks:=1;
		ketemu:=False;
		while (not ketemu) and (indeks<=jum) do
		begin
			if (a.TabResep[indeks].nama=cari) then
			ketemu:=True
			else
			indeks:=indeks+1;
		end;
	end;

	function searchSemua(a: resep; b:InvMentah; c:InvOlahan):boolean;
	{I.S.: Terdapat data resep, inventory bahan mentah dan inventory bahan olahan}
	{F.S.: Mengembalikan nilai true bila semua bahan yang diperlukan terdapat di inventory}
	//KAMUS LOKAL
	var
	ulangan5:integer; //Variabel untuk looping
	//ALGORITMA LOKAL
	begin
		ulangan5:=1;
		searchSemua:=True;
		while (searchSemua) and (ulangan5<=a.Nbutuh) do
		begin
			searchSemua:=searchMentah(b,b.Neff,a.Nama) or searchOlahan(c,c.Neff,a.Nama);
			ulangan5:=ulangan5+1;
		end;
	end;

	procedure kurangiSemua(a:resep; var b:InvMentah; var c:InvOlahan);
	{I.S.: Diberikan resep yang akan dibuat, inventori mentah dan inventori olahan}
	{F.S.: Mengurangi 1 dari masing-masing bahan yang dibutuhkan}
	{Prekondisi: Semua bahan yang dibutuhkan ada dalam inventori. Telah dicek dengan fungsi searchSemua}
	//KAMUS LOKAL
	var
	ulangan6:integer;
	//ALGORITMA LOKAL
	begin
		ulangan6:=1;
		while (ulangan6<=a.Nbutuh) do
		begin
			searchKurMentah(b,b.Neff,a.Olah[ulangan6]);
			searchKurOlahan(c,c.Neff,a.Olah[ulangan6]);
			ulangan6:=ulangan6+1;
		end;
	end;

end.