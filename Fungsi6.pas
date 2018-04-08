unit Fungsi6;
// unit untuk mengolah bahan mentah menjadi bahan olahan, mengurangi bahan mentah -> menambah inventori bahan olahan -> mengurangi energi chef
// Versi : 7 April 2018
//

interface
	
	uses tipe; // menggunakan unit tipe
	
	procedure olahBahan ( var invenmentah : InvMentah ; var involah : InvOlahan ; var olah : Olahan);
	function CekUjung( masukan : InvOlahan ):integer; 

implementation
	
	 function CekUjung(masukan : InvOlahan):integer; // fungsi Cekujung
		var
			i : integer;
		begin
			CekUjung := 0;
			i := 1;
				repeat
					if(masukan.TabInvOlahan[i].Nama <> '') then
						CekUjung := CekUjung + 1
					else
						CekUjung := CekUjung;
						i := i + 1;
				until(masukan.TabInvOlahan[i].Nama = '') //Menambah NEff sampai array kosong.
		end;
   
	procedure olahBahan ( var invenmentah : InvMentah ; var involah : InvOlahan ; var olah : Olahan);
		var
			i : integer;
			max : integer;
			indeks : integer;
			sama : boolean;
			j : integer;
			
		begin
			max := CekUjung(involah) + 1;
			writeln('Bahan Olahan yang akan dibuat'); readln(involah.TabInvOlahan[max].Nama);
			indeks:=0;
			sama:=false;
			involah.TabInvOlahan[max].Jumlah := 0;
			for i:=1 to 20 do
				begin
					if ( involah.TabInvOlahan[max].Nama = olah.TabOlahan[i].Nama ) and ( indeks = 0 ) and ( sama = false ) then 
						begin
							indeks := i;
							sama := true;
						end;
				end;
			
			if ( sama = true ) then
				begin
					{involah[max].TglBuat := tanggal;} // belum ada tanggal
					involah.TabInvOlahan[max].Jumlah := involah.TabInvOlahan[max].Jumlah + 1; // menambah jumlah bahan olahan
				end;
			
			for i:=1 to olah.TabOlahan[indeks].Nbutuh do
				begin
					for j:=1 to 20 do
						begin
							if ( olah.TabOlahan[indeks].bahan[i] = invenmentah.TabInvMentah[j].Nama ) then
								begin
									invenmentah.TabInvMentah[j].Jumlah := invenmentah.TabInvMentah[j].Jumlah - 1 ;
								end;
						end;
				end;
		end;
end.
							
							






