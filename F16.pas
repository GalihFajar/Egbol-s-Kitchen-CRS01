unit F16;
//Unit F16-tambahResep

{Deskripsi Program}
{Program berfungsi untuk menambah resep ke array resep yang telah ada}


interface
  uses tipe;
  
  procedure tambahResep(x : Mentah; y : Olahan ;var masukan : resepnya); //Prosedur utama menambah resep.
   
implementation
   uses math;
   
function searchMentah(a:Mentah; cari:string):boolean;
 {Fungsi menerima masukan bertipe mentah dan nama bahan mentah bertipe string.
  Fungsi mengeluarkan nilai true apabila bahan mentah terdapat pada array bahan mentah yang telah disediakan, dan menghasilkan nilai false bila sebaliknya.}

{KAMUS LOKAL}   
  var
  ulangan1:integer; //Variabel pengulangan.
  
{ALGORITMA LOKAL}
  begin
    ulangan1:=1;      //Inisiasasi variabel pengulangan.
    searchMentah:=False;  //Inisiasasi variabel boolean.
    while (ulangan1<=a.Neff) and (not searchMentah) do  //Mengulangi ketika indeks<=neff dan belum ditemukan
    begin
      if (a.TabMentah[ulangan1].Nama=cari) then  //Bila Nama inventori mentah sudah sama dengan yang dicari maka return True untuk variabel perulangan (looping berhenti)
      searchMentah:=True  //Apabila ditemukan, return true 
      else    
      ulangan1:=ulangan1+1;     //Apabila tidak ditemukan, variabel pengulangan + 1.
    end;
  end;

function searchOlahan(a:Olahan;cari:string):boolean;
 {Fungsi menerima masukan bertipe olahan dan nama bahan olahan bertipe string.
 *Fungsi mengeluarkan nilai true apabila bahan olahan terdapat pada array bahan olahan yang telah disediakan, dan menghasilkan nilai false bila sebaliknya.}

{KAMUS LOKAL}
 var
  ulangan2:integer; 
  
{ALGORITMA LOKAL}  
  begin
    ulangan2:=1;      //Inisiasi variabel pengulangan.
    searchOlahan:=False;  //Inisiasi variabel boolean untuk perulangan
    while (ulangan2<=a.Neff) and (not searchOlahan) do  //Mengulangi ketika indeks<=neff dan belum ditemukan
    begin
      if (a.TabOlahan[ulangan2].Nama=cari) then  //Bila Nama inventori olahan sudah sama dengan yang dicari maka return True untuk variabel perulangan (looping berhenti)
      searchOlahan:=True //Apabila ditemukan, return true.
      else   
      ulangan2:=ulangan2+1;   //Apabila tidak ditemukan, variabel pengulangan + 1.
    end;
  end;
  
 function posisiMentah(a:Mentah; cari:string):integer;
  {Fungsi menerima masukan bertipa mentah dan nama bahan mentah bertipe string.
  *Fungsi mengembalikan keluaran berupa indeks (bertipe integer) posisi nama bahan mentah tersebut dalam array.}
  
  {KAMUS LOKAL}
  var
	ulangan1:integer; //Variabel pengulangan.
	searchMentah : boolean; //Variabel validasi.

  {ALGORITMA LOKAL}
  begin
    ulangan1:=1;      //Inisiasi variabel pengulangan.
    searchMentah:=False;  //Inisiasi variabel validasi.
    while (ulangan1<=a.Neff) and (not searchMentah) do  //Mengulangi ketika indeks<=neff dan belum ditemukan
    begin
      if (a.TabMentah[ulangan1].Nama=cari) then  //Bila Nama inventori mentah sudah sama dengan yang dicari maka return True untuk variabel perulangan (looping berhenti)
      begin
      searchMentah:=True; //Jika ditemukan, variabel validasi menjadi true.
      posisiMentah := ulangan1; //Mengembalikan integer yang menyatakan posisi bahan mentah dalam array.
      end 
      else    
      ulangan1:=ulangan1+1;     //Jika tidak ditemukan, variabel ulangan + 1.
    end;
  end;

function posisiOlahan(a:Olahan;cari:string):integer;
 {Fungsi menerima masukan bertipe olahan dan nama bahan mentah bertipe string.
  *Fungsi mengembalikan keluaran berupa indeks (bertipe integer) posisi nama bahan mentah tersebut dalam array.}
  
  
  {KAMUS LOKAL}
  var
	ulangan2:integer; //variabel pengulangan.
	searchOlahan : boolean; //variabel validasi.
  {ALGORITMA LOKAL}
  begin
    ulangan2:=1;      //Inisiasi variabel pengulangan.
    searchOlahan:=False;  //Inisiasi variabel validasi.
    while (ulangan2<=a.Neff) and (not searchOlahan) do  //Mengulangi ketika indeks<=neff dan belum ditemukan
    begin
      if (a.TabOlahan[ulangan2].Nama=cari) then  //Bila Nama inventori olahan sudah sama dengan yang dicari maka return True untuk variabel perulangan (looping berhenti)
      begin
		searchOlahan:=True; //Jika ditemukan, variabel validasi menjadi true.
		posisiOlahan := ulangan2 //Mengembalikan nilai indeks.
      end else  
      ulangan2:=ulangan2+1;   //Jika tidak ditemukan, variabel pengulangan + 1
    end;
  end;

  
function searchSemuaV1(input : string; x : Mentah; y : Olahan):boolean;
  {Fungsi menerima masukan berupa nama bahan mentah/nama bahan olahan bertipe string.
  * Fungsi akan menembalikan nilai true apabila terdapat nama bahan mentah atau nama bahan olahan dalam array bahan mentah atau bahan olahan, dan mengembalikan nilai false apabila sebaliknya.}
  
 {KAMUS LOKAL}
 var	 
  temp1 : boolean;
  temp2 : boolean;
  
  {ALGORITMA LOKAL}
 begin
  temp1 := searchMentah(x,input); // Mencari apakah bahan mentah/bahan olahan terdapat pada array mentah.
  temp2 := searchOlahan(y,input); //Mencari apakah bahan mentah/bahan olahan terdapat pada array olahan.
  searchSemuaV1 := temp1 or temp2; //Apabila bahan yang dimaksud terdapat pada array mentah atau array olahan, mengembalikan nilai true.
 end;
  	
function cekHarga( masukan : resepnya; parameter : integer; parameterOlah : integer; a : mentah; b : olahan) : longint;
	{Fungsi menerima masukan berupa resep.
	* Fungsi mengembalikan nilai berupa harga minimum (12,5 % lebih mahal dari harga penyusun.}
	var
		j : integer; //Variabel indeks bahan mentah/bahan olahan pada array bahan mentah/bahan olahan.
		i : integer; //Variabel indeks bahan penyusun pada array resep.
		hargaTotal : longint; //Variabel harga total.
	begin
		hargaTotal := 0;
		for i := 1 to parameterOlah do
		begin
			if (searchMentah(a,masukan.TabResep[parameter].Olah[i])) then 
				begin
					j := posisiMentah(a,masukan.TabResep[parameter].Olah[i]);
					hargaTotal := hargaTotal + a.TabMentah[j].Harga;
				end 
				else if (searchOlahan(b,masukan.TabResep[parameter].Olah[i])) then
					begin
						j := posisiOlahan(b,masukan.TabResep[parameter].Olah[i]);
						hargaTotal := hargaTotal + b.TabOlahan[j].Harga;
					end;
		end;
		cekHarga := ceil((112.5/100) * hargaTotal);
end;
			
  procedure TambahBahan(max: integer;batas : integer;x : Mentah; y : Olahan; var masukan : resepnya);
    var
      i : integer;
    begin
      for i := 1 to batas do
        begin
          write('Bahan ',i,' : ');readln(masukan.TabResep[max].Olah[i]); //Memasukan data bahan mentah ke array bahan mentah.
          if(searchSemuaV1(masukan.TabResep[max].Olah[i],x,y) = False) then
            begin
              writeln	('Bahan tidak ada, ulangi masukan.');
              repeat
                write('Bahan ',i,' : ');readln(masukan.TabResep[max].Olah[i]);
                if (searchSemuaV1(masukan.TabResep[max].Olah[i],x,y) = False) then
                  writeln('Bahan tidak ada, ulangi masukan.')
              until (searchSemuaV1(masukan.TabResep[max].Olah[i],x,y) = True);
              //if (searchSemuaV1(masukan.TabResep[max].Olah[i],x,y) = True)
            end;
        end;
    end;

  procedure tambahResep(x : Mentah; y : Olahan ;var masukan : resepnya);
    var
      max : integer;
      harga : longint;
    begin
      masukan.Neff := masukan.Neff + 1;
      max := masukan.Neff;
      write('Nama Resep : ');readln(masukan.TabResep[max].Nama); //Menerima input pengguna berupa nama resep.   
      repeat
        write('Jumlah Bahan Penyusun : ');readln(masukan.TabResep[max].NButuh); //Menerima jumlah bahan yang dibutuhkan sampai memenuhi syarat.
        if ((masukan.TabResep[max].NButuh) < 2) then
			writeln('Minimal 2 bahan penyusun.');
      until ((masukan.TabResep[max].NButuh >= 2) and (masukan.TabResep[max].NButuh <= 20));
      TambahBahan(max,masukan.TabResep[max].NButuh,x,y,masukan); //Menerima input pengguna berupa nama bahan yang diperlukan (Belum dapat memvalidasi apakah bahan mentah ada dallam list atau tidak).
      harga := cekHarga(masukan,max,masukan.TabResep[max].Nbutuh,x,y);
      repeat
		write('Harga (minimal ',harga,' ) : '); readln(masukan.TabResep[max].Harga);
		if((masukan.TabResep[max].Harga) < harga) then
		writeln('Harga tidak valid, ulangi masukan.');
	  until ((masukan.TabResep[max].Harga) >= harga)
    end;


end.
