unit f14;
//Lihat Resep

interface

// Unit yang dipergunakan oleh unit ini
uses tipe;

// Prosedur yang tersedia di unit ini
procedure TampilkanResep(var Input: resepnya);

implementation

// IMPLEMENTASI
procedure TampilkanResep(var Input: resepnya);

// KAMUS
var
  i,j,x:integer;					// Variabel i dan j berupa integer dipergunakan untuk pengulangan sedangkan variabel x dipergunakan sebagai penyimpanan nilai sementara untuk penukaran nilai
  n:longint;						// Variabel n dipergunakan sebagai penyimpanan nilai sementara untuk penukaran nilai
  temp:string;						// Variabel temp dipergunakan sebagai penyimpanan nilai sementara untuk penukaran nilai
  tukar:Array [1..20] of String;	// Variabel tukar dipergunakan sebagai penyimpanan nilai sementara untuk penukaran nilai

// ALGORITMA
begin

  // Melakukan pengulangan sebanyak jumlah resep dikurangi dengan 1
  for i:=Input.neff downto 2 do
  begin

  	// Melakukan pengulangan sebanyak nilai variabel i dikurangi dengan 1
    for j:=1 to i-1 do
    begin

      if Input.TabResep[j].Nama > Input.TabResep[j+1].Nama then		// Melakukan perbandingan antara dua buah Nama Resep
      begin

      	// Menukar variabel yang berisi Nama Resep
        temp := Input.TabResep[j+1].Nama;
        Input.TabResep[j+1].Nama:=Input.TabResep[j].Nama;
        Input.TabResep[j].Nama :=temp;

        // Menukar variabel yang berisi Harga Resep
        n := Input.TabResep[j+1].Harga;
        Input.TabResep[j+1].Harga:=Input.TabResep[j].Harga;
        Input.TabResep[j].Harga :=n;

        // Menukar variabel yang berisi banyak bahan yang dibutuhkan oleh resep
        x := Input.TabResep[j+1].NButuh;
        Input.TabResep[j+1].NButuh:=Input.TabResep[j].NButuh;
        Input.TabResep[j].NButuh :=x;

        // Menukar variabel yang berisi bahan-bahan yang dibutuhkan oleh resep
        tukar := Input.TabResep[j+1].Olah;
        Input.TabResep[j+1].Olah:=Input.TabResep[j].Olah;
        Input.TabResep[j].Olah :=tukar;
      
      end;
    end;
  end;

  writeln('Daftar Resep Yang Tersedia :');		//	Menuliskan 'Daftar Resep Yang Tersedia :' di layar
  writeln;										//	Menuliskan newline di layar

  // Melakukan pengulangan sebanyak Jumlah Resep
  for i:=1 to Input.neff do
  begin

    writeln('Nama Resep : ',Input.TabResep[i].Nama);		// Menuliskan Nama Resep di layar
    writeln('Harga Jual : ',Input.TabResep[i].Harga);		// Menuliskan Harga Jual di layar
    writeln('Banyak Bahan : ',Input.TabResep[i].NButuh);	// Menuliskan Banyak Bahan yang dibutuhkan oleh Resep di layar
  
    // Melakukan pengulangan sebanyak Jumlah Bahan yang dibutuhkan oleh Resep
    for j:=1 to Input.TabResep[i].NButuh do
    begin

      writeln('Nama Bahan Ke-',j,' : ',Input.TabResep[i].Olah[j]);	// Menuliskan Nama Bahan yang dibutuhkan oleh Resep di layar
    
    end;
    
    writeln;	// Menuliskan newline di layar
  
  end;
end;
end.