unit evaluate;
{Unit ini digunakan untuk mengevaluasi kondisi inventori. Bila jumlah/kuantitas bahan=0 Maka bahan dihapus dari inventori}
{Akan ditambahkan fungsi evaluasi kadaluarsa kalau sudah ada sistem penanggalan}

interface
	
	uses tipe;

	procedure evaluateInvOlahan(var a:InvOlahan; b:Tanggal);
	{I.S.: Tersedia array berisi inventori Olahan}
	{F.S.: mendelete bahan olahan yang kadaluarsa}

	procedure evaluateInvMentah(var a:InvMentah; b:Tanggal;c:mentah);
	{I.S.: Tersedia array berisi inventori Mentah}
	{F.S.: mendelete bahan Mentah yang kadaluarsa}


implementation
	
	procedure geserMentah(var a:InvMentah; indeks:integer);
	{I.S.: Diberikan inventori mentah kemudian menghapus elemen sesuai indeks dan menggeser elemen selanjutnya}
	{F.S.: Elemen ke-indeks inventori dihapus dan elemen dibawahnya geser ke atas}
	//KAMUS LOKAL
	var
	u1:integer; //variabel pengulangan
	//ALGORITMA LOKAL
	begin
		for u1:=indeks to a.neff do
		begin
			a.TabInvMentah[u1]:=a.TabInvMentah[u1+1];
		end;
		a.neff:=a.neff-1;
	end;


	procedure geserOlahan(var a:InvOlahan; indeks:integer);
	{I.S.: Diberikan inventori olahan kemudian menghapus elemen sesuai indeks dan menggeser elemen selanjutnya}
	{F.S.: Elemen ke-indeks inventori dihapus dan elemen dibawahnya geser ke atas}
	//KAMUS LOKAL
	var
	u2:integer; //variabel pengulangan
	//ALGORITMA LOKAL
	begin
		for u2:=indeks to a.neff do
		begin
			a.TabInvOlahan[u2]:=a.TabInvOlahan[u2+1];
		end;
		a.neff:=a.neff-1;
	end;


	function isKabisat(a:integer):boolean;
	{I.S.: Tersedia suatu bilangan yang menyatakan tahun}
	{F.S.: Mengembalikan nilai true ketika tahun kabisat dan false ketika tidak}
	//ALGORITMA LOKAL
	begin
		if (a mod 400=0) then
		isKabisat:=False
		else if (a mod 4=0) then
		isKabisat:=True
		else
		isKabisat:=False;
	end;


	function isKadaluarsaOlahan(a:InventoryOlahan;b:Tanggal):boolean;
	{I.S.: Tersedia suatu tipe bahan olahan dan tanggal hari ini}
	{F.S.: Memberikan output true ketika bahan olahan kadaluarsa dan false ketika belum kadaluarsa}
	//KAMUS LOKAL
	var
	selisih:longint;
	//ALGORITMA LOKAL
	begin
		selisih:=0;
		if (a.TglBuat.bulan=b.bulan) then
			begin
				selisih:=b.hari-a.TglBuat.hari;
			end
		else if ((b.bulan=1) or (b.bulan=2) or (b.bulan=4) or (b.bulan=6) or (b.bulan=8) or (b.bulan=9) or (b.bulan=11)) then
			begin
				selisih:=(b.hari+31)-a.TglBuat.hari;
			end
		else if (b.bulan=3) then 
			begin
				if (isKabisat(b.tahun)) then
				selisih:=b.hari+29-a.TglBuat.hari
				else
				selisih:=b.hari+28-a.TglBuat.hari;
			end
		else
		selisih:=b.hari+30-a.TglBuat.hari;

		if (selisih>3) then
		isKadaluarsaOlahan:=True
		else isKadaluarsaOlahan:=False;

	end;


	function isKadaluarsaMentah(a:InventoryMentah;b:Tanggal;c:Mentah):boolean;
	{I.S.: Tersedia suatu tipe bahan mentah dan tanggal hari ini}
	{F.S.: Memberikan output true ketika bahan mentah kadaluarsa dan false ketika belum kadaluarsa}
	//KAMUS LOKAL
	var
	u4:integer;
	found:boolean;
	selisih:longint;
	//ALGORITMA LOKAL
	begin
		u4:=1; //indeks awal pencarian masa kadaluarsa bahan mentah
		found:=False;
		while (u4<=c.Neff) and (not found) do
		begin
			if (a.Nama=c.TabMentah[u4].Nama) then
			begin
				found:=True;
			end else
			u4:=u4+1;
		end;

		selisih:=0;
		if (a.Tgl.bulan=b.bulan) then
			begin
				selisih:=b.hari-a.Tgl.hari;
			end
		else if ((b.bulan=1) or (b.bulan=2) or (b.bulan=4) or (b.bulan=6) or (b.bulan=8) or (b.bulan=9) or (b.bulan=11)) then
			begin
				selisih:=(b.hari+31)-a.Tgl.hari;
			end
		else if (b.bulan=3) then 
			begin
				if (isKabisat(b.tahun)) then
				selisih:=b.hari+29-a.Tgl.hari
				else
				selisih:=b.hari+28-a.Tgl.hari;
			end
		else
		selisih:=b.hari+30-a.Tgl.hari;

		if (selisih>c.TabMentah[u4].kadaluarsa) then
		isKadaluarsaMentah:=True
		else isKadaluarsaMentah:=False;

	end;


	procedure evaluateInvOlahan(var a:InvOlahan; b:Tanggal);
	{I.S.: Tersedia array berisi inventori Olahan}
	{F.S.: mendelete bahan olahan yang kadaluarsa}
	//KAMUS LOKAL
	var
	u3:integer; //variabel counter pengulangan
	begin
		u3:=1;
		while (u3<=a.neff) do
		begin
			if (isKadaluarsaOlahan(a.TabInvOlahan[u3],b)) or (a.TabInvOlahan[u3].jumlah=0) then
			begin
				geserOlahan(a,u3);
			end
			else
				u3:=u3+1;
		end;
	end;


	procedure evaluateInvMentah(var a:InvMentah; b:Tanggal;c:mentah);
	{I.S.: Tersedia array berisi inventori Mentah}
	{F.S.: mendelete bahan Mentah yang kadaluarsa}
	//KAMUS LOKAL
	var
	u6:integer; //variabel counter pengulangan
	begin
		u6:=1;
		while (u6<=a.neff) do
		begin
			if (isKadaluarsaMentah(a.TabInvMentah[u6],b,c)) or (a.TabInvMentah[u6].jumlah=0) then
			begin
				geserMentah(a,u6);
			end
			else
				u6:=u6+1;
		end;
	end;
end.