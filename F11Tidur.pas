//Editor F11 - Ammar 16517328 (4/13/2018)
//Fungsi F11 selesai


unit F11Tidur;

interface
	uses tipe,evaluate;
	
	function HariMaks(date:Tanggal):integer;
	{I.S. tipe data tanggal pada hari tertentu}
	{F.S. hari terbesar dalam bulan tersebut}
	
	function GantiHari(date:Tanggal):Tanggal;
	{I.S. tanggal tertentu}
	{F.S. ganti tanggal ke hari esoknya dengan memanfaatkan fungsi HariMaks}
	
	procedure Tidur(var date:Tanggal; var invOl:InvOlahan; var invMen:InvMentah; raw:Mentah; energi:integer;var harihidup:integer);
	{Spesifikasi
	* > parameter dengan tipe Tanggal, InvOlahan, InvMentah, Mentah dan integer
	* > mengubah tanggal ke hari esoknya dengan fungsi GantiHari
	* > menghapus makanan kadaluarsa dengan memanfaatkan fungsi evaluateInvOlahan dan evaluateInvMentah
	* > mengubah energi (integer) ke 10 }
	
implementation

	//FUNCTION HariMaks
	function HariMaks(date:Tanggal):integer;
	{I.S. tipe data tanggal pada hari tertentu}
	{F.S. hari terbesar dalam bulan tersebut}
	//ALGORITMA
	begin
		if (date.bulan <> 2) then
			begin
				if ((date.bulan=1) or (date.bulan=3) or (date.bulan=5) or (date.bulan=7) or (date.bulan=8) or (date.bulan=10) or (date.bulan=12)) then //bulan bulan dengan tanggal maksimal 31
					begin
						HariMaks:=31;
					end
				else //bulan dengan tanggal maksimal 30
					begin
						HariMaks:=30;
					end;
			end
		else //bulan februari
			begin
				if (isKabisat(date.tahun)) then HariMaks:=29 //jika kabisat, tanggal maksimal 29
				else HariMaks:=28; //jika bukan kabisat, tanggal maksimal 28
			end;
	end;
	
	
	//FUNCTION GantiHari
	function GantiHari(date:Tanggal):Tanggal;
	{I.S. tanggal tertentu}
	{F.S. ganti tanggal ke hari esoknya dengan memanfaatkan fungsi HariMaks}
	//KAMUS LOKAL
	var
		datex:Tanggal;
	//ALGORITMA
	begin
		//pengisian nilai ke variabel lokal
		datex.hari:=date.hari;
		datex.bulan:=date.bulan;
		datex.tahun:=date.tahun;
		
		datex.hari:=datex.hari+1; //penambahan tanggal
		if (datex.hari>HariMaks(datex)) then //jika hari melebihi jumlah hari maksimal dalam bulan terkait
			begin
				datex.hari:=1; //hari diubah ke tanggal 1
				datex.bulan:=datex.bulan+1; //bulan ditambah 1
			end;
		if (datex.bulan>12) then //jika bulan melebihi bulan ke-12
			begin
				datex.bulan:=1; //bulan diubah ke bulan 1
				datex.tahun:=date.tahun+1; //tahun ditambah
			end;
		//return values
		GantiHari.hari:=datex.hari; 
		GantiHari.bulan:=datex.bulan;
		GantiHari.tahun:=datex.tahun;
	end;
	
	//PROCEDURE Tidur
	procedure Tidur(var date:Tanggal; var invOl:InvOlahan; var invMen:InvMentah; raw:Mentah; energi:integer; var harihidup:integer);
	{Spesifikasi
	* > parameter dengan tipe Tanggal, InvOlahan, InvMentah, Mentah dan integer
	* > mengubah tanggal ke hari esoknya dengan fungsi GantiHari
	* > menghapus makanan kadaluarsa dengan memanfaatkan fungsi evaluateInvOlahan dan evaluateInvMentah
	* > mengubah energi (integer) ke 10 }
	begin
		date:=GantiHari(date); //ganti hari ke esoknya
		energi:=10; //mengubah energi ke 10
		evaluateInvOlahan(InvOl,date); //menghapus bahan makanan yang kadaluarsa dari inventori olahan
		evaluateInvMentah(InvMen,date,raw); //menghapus bahan makanan yang kadaluarsa dari inventori mentah
		harihidup:=harihidup+1;
	end;

end.