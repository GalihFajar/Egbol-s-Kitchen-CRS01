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
  function CekUjung(masukan : resepnya):integer; //Prosedur cek jumlah resep yang tersedia.
implementation
    
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
            end;
        end;
    end;

  function CekUjung(masukan : resepnya):integer;
    var
      i : integer;
    begin
      CekUjung := 0;
      i := 1;
      repeat
        if(masukan.TabResep[i].Nama <> '') then
          CekUjung := CekUjung + 1
        else
          CekUjung := CekUjung;
        i := i + 1;
      until(masukan.TabResep[i].Nama = '') //Menambah NEff sampai array kosong.
    end;

  procedure tambahResep(x : Mentah; y : Olahan ;var masukan : resepnya);
    var
      max : integer;
    begin
      masukan.Neff := masukan.Neff + 1;
      max := masukan.Neff;
      write('Nama Resep : ');readln(masukan.TabResep[max].Nama); //Menerima input pengguna berupa nama resep.
      write('Harga : ');readln(masukan.TabResep[max].Harga); // Menerima input pengguna berupa harga resep (Belum dapat menaksir harga dari konstanta harga bahan mentah).
      repeat
        write('Jumlah : ');readln(masukan.TabResep[max].NButuh); //Menerima jumlah bahan yang dibutuhkan sampai memenuhi syarat.
      until ((masukan.TabResep[max].NButuh >= 2) and (masukan.TabResep[max].NButuh <= 20));

      TambahBahan(max,masukan.TabResep[max].NButuh,x,y,masukan); //Menerima input pengguna berupa nama bahan yang diperlukan (Belum dapat memvalidasi apakah bahan mentah ada dallam list atau tidak).
    end;


end.
