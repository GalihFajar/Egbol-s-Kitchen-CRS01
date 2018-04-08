unit F16;
//Unit F16-tambahResep
//Dibuat Oleh : Galih Fajar Fitra Ady/16517258
//Versi : 08/04/2018
//Try

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
  procedure TambahResep(var masukan : tempResep); //Prosedur utama menambah resep.
  procedure TambahBahan(max: integer;batas : integer;var masukan : tempResep); //Prosedur menambah bahan mentah.
  function CekUjung(masukan : tempResep):integer; //Prosedur cek jumlah resep yang tersedia.
implementation

  procedure TambahBahan(max: integer;batas : integer;var masukan : tempResep);
    var
      i : integer;
    begin
      for i := 1 to batas do
        begin
          write('Bahan ',i,' : ');readln(masukan[max].Olah[i]); //Memasukan data bahan mentah ke array bahan mentah.
        end;
    end;

  function CekUjung(masukan : tempResep):integer;
    var
      i : integer;
    begin
      CekUjung := 0;
      i := 1;
      repeat
        if(masukan[i].Nama <> '') then
          CekUjung := CekUjung + 1
        else
          CekUjung := CekUjung;
        i := i + 1;
      until(masukan[i].Nama = '') //Menambah NEff sampai array kosong.
    end;

  procedure TambahResep(var masukan : tempResep);
    var
      max : integer;
    begin
      max := (CekUjung(masukan)) + 1;
      write('Nama Resep : ');readln(masukan[max].Nama); //Menerima input pengguna berupa nama resep.
      write('Harga : ');readln(masukan[max].Harga); // Menerima input pengguna berupa harga resep (Belum dapat menaksir harga dari konstanta harga bahan mentah).
      repeat
        write('Jumlah : ');readln(masukan[max].NButuh); //Menerima jumlah bahan yang dibutuhkan sampai memenuhi syarat.
      until ((masukan[max].NButuh >= 2) and (masukan[max].NButuh <= 20));

      TambahBahan(max,masukan[max].NButuh,masukan); //Menerima input pengguna berupa nama bahan yang diperlukan (Belum dapat memvalidasi apakah bahan mentah ada dallam list atau tidak).
    end;
end.
