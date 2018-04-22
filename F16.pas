unit F16;
//Unit F16-tambahResep
//Dibuat Oleh : Galih Fajar Fitra Ady/16517258


{Deskripsi Program}
{Program berfungsi untuk menambah resep ke array resep yang telah ada}

{Kekurangan Program (Versi 07/04/2018)}
{ > Harga resep masih berupa input manual dari pengguna.
  > Program belum dapat memvalidasi apakah bahan mentah tersedia dalam inventori atau tidak.
}
{What's New}
{
  > Input String Bug Fixed.
}

interface
  uses tipe;
  procedure tambahResep(x : Mentah; y : Olahan ;var masukan : resepnya); //Prosedur utama menambah resep.
  procedure TambahBahan(max: integer;batas : integer;x : Mentah; y : Olahan; var masukan : resepnya); //Prosedur menambah bahan mentah.
 
implementation
   uses math;
   
  function searchMentah(a:Mentah; cari:string):boolean;
  //Fungsi searchMentah menerima masukan array bahan mentah
  //kemudian mencari apakah bahan mentah (cari) ada di dalam array (inventori)
  //KAMUS LOKAL
  var
  ulangan1:integer; //variabel untuk looping internal fungsi
  //ALGORITMA LOKAL
  begin
    ulangan1:=1;      //Inisialisasi awal variabel untuk perulangan
    searchMentah:=False;  //Inisialisasi variabel boolean untuk perulangan
    while (ulangan1<=a.Neff) and (not searchMentah) do  //Mengulangi ketika indeks<=neff dan belum ditemukan
    begin
      if (a.TabMentah[ulangan1].Nama=cari) then  //Bila Nama inventori mentah sudah sama dengan yang dicari maka return True untuk variabel perulangan (looping berhenti)
      searchMentah:=True else     //Telah ditemukan, return true
      ulangan1:=ulangan1+1;     //Increment variabel perulangan
    end;
  end;

  function searchOlahan(a:Olahan;cari:string):boolean;
  //Fungsi searchOlahan menerima masukan array bahan olahan
  //kemudian mencari apakah bahan olahan(cari) ada di dalam array (inventory)
  //KAMUS LOKAL
  var
  ulangan2:integer; //variabel untuk looping internal fungsi
  //ALGORITMA LOKAL
  begin
    ulangan2:=1;      //Inisialisasi awal variabel untuk perulangan
    searchOlahan:=False;  //Inisialisasi variabel boolean untuk perulangan
    while (ulangan2<=a.Neff) and (not searchOlahan) do  //Mengulangi ketika indeks<=neff dan belum ditemukan
    begin
      if (a.TabOlahan[ulangan2].Nama=cari) then  //Bila Nama inventori olahan sudah sama dengan yang dicari maka return True untuk variabel perulangan (looping berhenti)
      searchOlahan:=True else   //Telah ditemukan, return true
      ulangan2:=ulangan2+1;   //Increment variabel perulangan
    end;
  end;
  
  function posisiMentah(a:Mentah; cari:string):integer;
  //Fungsi searchMentah menerima masukan array bahan mentah
  //kemudian mencari apakah bahan mentah (cari) ada di dalam array (inventori)
  //KAMUS LOKAL
  var
  ulangan1:integer;
  searchMentah : boolean; //variabel untuk looping internal fungsi
  //ALGORITMA LOKAL
  begin
    ulangan1:=1;      //Inisialisasi awal variabel untuk perulangan
    searchMentah:=False;  //Inisialisasi variabel boolean untuk perulangan
    while (ulangan1<=a.Neff) and (not searchMentah) do  //Mengulangi ketika indeks<=neff dan belum ditemukan
    begin
      if (a.TabMentah[ulangan1].Nama=cari) then  //Bila Nama inventori mentah sudah sama dengan yang dicari maka return True untuk variabel perulangan (looping berhenti)
      begin
      searchMentah:=True;
      posisiMentah := ulangan1;
      end 
      else     //Telah ditemukan, return true
      ulangan1:=ulangan1+1;     //Increment variabel perulangan
    end;
  end;

  function posisiOlahan(a:Olahan;cari:string):integer;
  //Fungsi searchOlahan menerima masukan array bahan olahan
  //kemudian mencari apakah bahan olahan(cari) ada di dalam array (inventory)
  //KAMUS LOKAL
  var
  ulangan2:integer; //variabel untuk looping internal fungsi
  searchOlahan : boolean;
  //ALGORITMA LOKAL
  begin
    ulangan2:=1;      //Inisialisasi awal variabel untuk perulangan
    searchOlahan:=False;  //Inisialisasi variabel boolean untuk perulangan
    while (ulangan2<=a.Neff) and (not searchOlahan) do  //Mengulangi ketika indeks<=neff dan belum ditemukan
    begin
      if (a.TabOlahan[ulangan2].Nama=cari) then  //Bila Nama inventori olahan sudah sama dengan yang dicari maka return True untuk variabel perulangan (looping berhenti)
      begin
		searchOlahan:=True;
		posisiOlahan := ulangan2
      end else   //Telah ditemukan, return true
      ulangan2:=ulangan2+1;   //Increment variabel perulangan
    end;
  end;

  
    function searchSemuaV1(input : string; x : Mentah; y : Olahan):boolean;
  	{I.S.: Terdapat data resep, inventory bahan mentah dan inventory bahan olahan}
  	{F.S.: Mengembalikan nilai true bila semua bahan yang diperlukan terdapat di inventory}
  	//KAMUS LOKAL
  	var
  	 //Variabel untuk looping
    temp1 : boolean;
    temp2 : boolean;
  	//ALGORITMA LOKAL
  	begin
  		temp1 := searchMentah(x,input);
      temp2 := searchOlahan(y,input);
      searchSemuaV1 := temp1 or temp2;
  	end;
  	
  	function cekHarga( masukan : resepnya; parameter : integer; parameterOlah : integer; a : mentah; b : olahan) : longint;	
		var
			j : integer;
			i : integer;
			hargaTotal : longint;
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
