unit f13;
//Lihat Inventory

interface

// Unit yang dipergunakan oleh unit ini
uses tipe;

// Prosedur yang tersedia di unit ini
procedure SortingMentah(var Input: InvMentah);
procedure SortingOlahan(var Input: InvOlahan);
procedure TampilkanInventory(var tabInvenMentah : InvMentah; var tabInvenOlahan : InvOlahan);

implementation

// IMPLEMENTASI
procedure SortingMentah(var Input: InvMentah);

// KAMUS
var
  i,j,x:integer;	// Variabel i dan j berupa integer dipergunakan untuk pengulangan sedangkan variabel x dipergunakan sebagai penyimpanan nilai sementara untuk penukaran nilai
  temp:string;		// Variabel temp dipergunakan sebagai penyimpanan nilai sementara untuk penukaran nilai

// ALGORITMA
begin
  
  // Melakukan pengulangan sebanyak Jumlah variabel Input dikurangi dengan 1
  for i:=Input.neff downto 2 do
  begin
    
  	// Melakukan pengulangan sebanyak nilai variabel i dikurangi dengan 1
    for j:=1 to i-1 do
    begin
      
      if Input.TabInvMentah[j].Nama > Input.TabInvMentah[j+1].Nama then
      begin
      
      	// Menukar variabel yang berisi Nama Bahan Mentah
        temp := Input.TabInvMentah[j+1].Nama;
        Input.TabInvMentah[j+1].Nama:=Input.TabInvMentah[j].Nama;
        Input.TabInvMentah[j].Nama :=temp;

      	// Menukar variabel yang berisi Tanggal Pembelian Bahan
        x := Input.TabInvMentah[j+1].Tgl.hari;
        Input.TabInvMentah[j+1].Tgl.hari:=Input.TabInvMentah[j].Tgl.hari;
        Input.TabInvMentah[j].Tgl.hari :=x;

      	// Menukar variabel yang berisi Tanggal Pembelian Bahan
        x := Input.TabInvMentah[j+1].Tgl.bulan;
        Input.TabInvMentah[j+1].Tgl.bulan:=Input.TabInvMentah[j].Tgl.bulan;
        Input.TabInvMentah[j].Tgl.bulan :=x;

      	// Menukar variabel yang berisi Tanggal Pembelian Bahan
        x := Input.TabInvMentah[j+1].Tgl.tahun;
        Input.TabInvMentah[j+1].Tgl.tahun:=Input.TabInvMentah[j].Tgl.tahun;
        Input.TabInvMentah[j].Tgl.tahun :=x;

      	// Menukar variabel yang berisi Jumlah Bahan Mentah
        x := Input.TabInvMentah[j+1].Jumlah;
        Input.TabInvMentah[j+1].Jumlah:=Input.TabInvMentah[j].Jumlah;
        Input.TabInvMentah[j].Jumlah :=x;
      
      end;
    end;
  end;
end;

// IMPLEMENTASI
procedure SortingOlahan(var Input: InvOlahan);

// KAMUS
var
  i,j,x:integer;	// Variabel i dan j berupa integer dipergunakan untuk pengulangan sedangkan variabel x dipergunakan sebagai penyimpanan nilai sementara untuk penukaran nilai
  temp:string;		// Variabel temp dipergunakan sebagai penyimpanan nilai sementara untuk penukaran nilai

// ALGORITMA
begin
  
  // Melakukan pengulangan sebanyak Jumlah variabel Input dikurangi dengan 1
  for i:=Input.neff downto 2 do
  begin
    
  	// Melakukan pengulangan sebanyak nilai variabel i dikurangi dengan 1
    for j:=1 to i-1 do
    begin
      
      if Input.TabInvOlahan[j].Nama > Input.TabInvOlahan[j+1].Nama then
      begin
      
      	// Menukar variabel yang berisi Nama Bahan Olahan
        temp := Input.TabInvOlahan[j+1].Nama;
        Input.TabInvOlahan[j+1].Nama:=Input.TabInvOlahan[j].Nama;
        Input.TabInvOlahan[j].Nama :=temp;

        // Menukar variabel yang berisi Tanggal Pembuatan Bahan
        x := Input.TabInvOlahan[j+1].TglBuat.hari;
        Input.TabInvOlahan[j+1].TglBuat.hari:=Input.TabInvOlahan[j].TglBuat.hari;
        Input.TabInvOlahan[j].TglBuat.hari :=x;

        // Menukar variabel yang berisi Tanggal Pembuatan Bahan
        x := Input.TabInvOlahan[j+1].TglBuat.bulan;
        Input.TabInvOlahan[j+1].TglBuat.bulan:=Input.TabInvOlahan[j].TglBuat.bulan;
        Input.TabInvOlahan[j].TglBuat.bulan :=x;

        // Menukar variabel yang berisi Tanggal Pembuatan Bahan
        x := Input.TabInvOlahan[j+1].TglBuat.tahun;
        Input.TabInvOlahan[j+1].TglBuat.tahun:=Input.TabInvOlahan[j].TglBuat.tahun;
        Input.TabInvOlahan[j].TglBuat.tahun :=x;

        // Menukar variabel yang berisi Jumlah Bahan Olahan
        x := Input.TabInvOlahan[j+1].Jumlah;
        Input.TabInvOlahan[j+1].Jumlah:=Input.TabInvOlahan[j].Jumlah;
        Input.TabInvOlahan[j].Jumlah :=x;

      end;
    end;
  end;
end;

// IMPLEMENTASI
procedure TampilkanInventory(var tabInvenMentah : InvMentah; var tabInvenOlahan : InvOlahan);

// KAMUS
var
  i:integer;	// Variabel i berupa integer dipergunakan untuk pengulangan

// ALGORITMA
begin
  
  SortingMentah(tabInvenMentah);	// Mengaktifkan prosedur SortingMentah dengan input tabInvenMentah
  SortingOlahan(tabInvenOlahan);	// Mengaktifkan prosedur SortingOlahan dengan input tabInvenOlahan

  writeln('Daftar Bahan Mentah Yang Tersedia Di Inventori :');		//  Menuliskan 'Daftar Bahan Mentah Yang Tersedia Di Inventori :' di layar
  writeln;															//  Menuliskan newline di layar
  
  // Melakukan pengulangan sebanyak Jumlah Bahan Mentah
  for i:=1 to tabInvenMentah.neff do
  begin
    
    writeln('Nama Bahan Mentah : ',tabInvenMentah.TabInvMentah[i].Nama);	// Menuliskan Nama Bahan Mentah di layar
    writeln('Tanggal Beli : ',tabInvenMentah.TabInvMentah[i].Tgl.hari,		// Menuliskan Tanggal Pembelian di layar
   			'/',tabInvenMentah.TabInvMentah[i].Tgl.bulan,							
   			'/',tabInvenMentah.TabInvMentah[i].Tgl.tahun);							
    writeln('Jumlah : ',tabInvenMentah.TabInvMentah[i].Jumlah);				// Menuliskan Jumlah Bahan Mentah di layar
    writeln;																// Menuliskan newline di layar
  
  end;
  
  writeln('Daftar Bahan Olahan Yang Tersedia Di Inventori :');		// Menuliskan 'Daftar Bahan Olahan Yang Tersedia Di Inventori :' di layar
  writeln;															// Menuliskan newline di layar
  
  // Melakukan pengulangan sebanyak Jumlah Bahan Olahan
  for i:=1 to tabInvenOlahan.neff do
  begin
    
    writeln('Nama Bahan Olahan : ',tabInvenOlahan.TabInvOlahan[i].Nama);			// Menuliskan Nama Bahan Olahan di layar
    writeln('Tanggal Buat : ',tabInvenOlahan.TabInvOlahan[i].TglBuat.hari,			// Menuliskan Tanggal Pembuatan di layar
    		'/',tabInvenOlahan.TabInvOlahan[i].TglBuat.bulan,
    		'/',tabInvenOlahan.TabInvOlahan[i].TglBuat.tahun);
    writeln('Jumlah : ',tabInvenOlahan.TabInvOlahan[i].Jumlah);						// Menuliskan Jumlah Bahan Olahan di layar
    writeln;																		// Menuliskan newline di layar
  
  end;
end;
end.