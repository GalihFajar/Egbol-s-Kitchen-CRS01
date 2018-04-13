unit f15;
//Cari Resep

interface

// Unit yang dipergunakan oleh unit ini
uses tipe,f1load;

// Prosedur yang tersedia di unit ini
procedure CariResep(var Input: resepnya);

implementation

// IMPLEMENTASI
procedure CariResep(var Input: resepnya);

// KAMUS
var
  i,j:integer; 		// Variabel i dan j berupa integer dipergunakan untuk pengulangan
  search:string; 	// Variabel search berupa string dipergunakan sebagai input nama resep yang dicari
  status:boolean; 	// Variabel status berupa boolean bernilai True jika Nama Resep ditemukan

// ALGORITMA
begin

  write('Masukkan Nama Resep Yang Akan Dicari : '); // Menuliskan 'Masukkan Nama Resep Yang Akan Dicari : ' di layar
  readln(search); 									// Membaca nama resep yang dicari dari input pengguna
  writeln; 											// Menuliskan newline di layar
  writeln('Hasil Pencarian Resep :'); 				// Menuliskan 'Hasil Pencarian Resep :' di layar

  // Melakukan pengulangan sebanyak jumlah resep
  for i:=1 to Input.neff do
  begin

    if search=Input.TabResep[i].Nama then			// Melakukan perbandingan antara input pengguna dengan Nama Resep yang terdapat di file eksternal
    begin

      writeln;												// Menuliskan newline di layar
      status:=true;											// Nilai True diassign ke variabel status
      writeln('Nama Resep : ',Input.TabResep[i].Nama);		// Menuliskan Nama Resep di layar
      writeln('Harga Jual : ',Input.TabResep[i].Harga);		// Menuliskan Harga Jual di layar
      writeln('Banyak Bahan : ',Input.TabResep[i].NButuh);	// Menuliskan Banyak Bahan di layar

      // Melakukan pengulangan sebanyak jumlah bahan yang dibutuhkan resep tersebut
      for j:=1 to Input.TabResep[i].NButuh do
      begin

        writeln('Nama Bahan Ke-',j,' : ',Input.TabResep[i].Olah[j]);	// Menuliskan Nama Bahan di layar
      
      end;
    end;
  end;

  if status=false then 					// Mengecek apakah status bernilai False
  begin

    writeln;							// Menuliskan newline di layar
    writeln('Resep Tidak Ditemukan');	// Menuliskan 'Resep Tidak Ditemukan' di layar
    writeln;							// Menuliskan newline di layar
  
  end
  else begin

    writeln;							// Menuliskan newline di layar
  
  end;
end;
end.