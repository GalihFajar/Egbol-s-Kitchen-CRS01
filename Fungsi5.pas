unit Fungsi5; 	   
// unit untuk fungsi 5, membeli bahan mentah dari supermarket
// Versi : 7 April 2018 
// Kekurangan :	belum bisa validasi uang
//			  : meng assign tanggal beli		   

interface 

	uses tipe; 		   // menggunakan unit yang berisi tipe
	
	procedure belibahan ( var bahan : InvMentah ; var bmentah : Mentah );
	function CekUjung(masukan : InvMentah):integer;

implementation

	 function CekUjung(masukan : InvMentah):integer;
		var
			i : integer;
		begin
			CekUjung := 0;
			i := 1;
				repeat
					if(masukan.TabInvMentah[i].Nama <> '') then
						CekUjung := CekUjung + 1
					else
						CekUjung := CekUjung;
						i := i + 1;
				until(masukan.TabInvMentah[i].Nama = '') //Menambah NEff sampai array kosong.
		end;
	
	procedure belibahan ( var bahan : InvMentah ; var bmentah : Mentah );
		var // kamus lokal
			i : integer;
			max : integer;
			sama : boolean;
			kuantitas : integer;
			harga : integer;
		begin // Algoritma lokal
			max := CekUjung(bahan) + 1;
			sama := false;
			harga := 0;
			writeln('NamaBahan');readln(bahan.TabInvMentah[max].Nama); // menerima masukan bahan untuk array max
				for i:=1 to 20 do
					begin
						if ( bahan.TabInvMentah[max].Nama = bmentah.TabMentah[i].Nama ) and ( sama = false ) then
							begin
								sama := true;
								harga := bmentah.TabMentah[i].harga;
							end;
					end; // untuk mengecek apakah bahan mentah ada di data atau tidak
				
			if ( sama = false ) then
				begin
					writeln('Nama bahan tidak ada');
				end
			else // sama = true, ada nama bahan yang diinput user didalam data bahanmentah
				begin
					writeln('Kuantitas : ');readln(kuantitas);
					writeln('Total Harga : ');writeln(kuantitas*harga);
				end;
			
			{if ( uang > totalharga ) then
				begin
					writeln('Pembelian Sukses');
				end
			else
				begin
					writeln('Pembelian gagal, silahkan coba lagi');
				end;
			
			if ( uang > totalharga ) then
				begin
					bahan[max].Tgl := tanggal;
					bahan[max].Jumlah := kuantitas;
				end; }  // belum ada type uang dan tanggal simulasi
		end;				
							
end.					
			
			
		
