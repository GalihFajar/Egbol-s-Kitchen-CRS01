unit F5; 	   
// unit untuk fungsi 5, membeli bahan mentah dari supermarket
// Versi : 13 April 2018		   

interface 

	uses tipe; 		   // menggunakan unit yang berisi tipe
	
	procedure belibahan ( t : tanggal ; var uang : longint; var energi : longint; var bahan : InvMentah ; var bmentah : Mentah );
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
	
	procedure belibahan ( t : tanggal ; var uang : longint; var energi : longint; var bahan : InvMentah ; var bmentah : Mentah );
		var // kamus lokal
			i : integer;
			max : integer;
			sama : boolean;
			kuantitas : integer;
			harga : integer;
		begin // Algoritma lokal
			if ( energi = 0 ) then
				begin
					writeln('Energi anda habis. Istirahatlah, makan atau tidur terlebih dahulu untuk memulihkan energi');
				end
			else
				begin
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
			
			if ( uang > harga ) then
				begin
					writeln('Pembelian Sukses');
				end
			else
				begin
					writeln('Pembelian gagal, silahkan coba lagi');
				end;
			
			if ( uang > harga ) then
				begin
					bahan.TabInvMentah[max].Tgl := t;
					bahan.TabInvMentah[max].Jumlah := kuantitas;
					energi := energi-1;
					uang := uang - harga;
				end;   
			end;				
							
		end;

end.				
			
			
		
