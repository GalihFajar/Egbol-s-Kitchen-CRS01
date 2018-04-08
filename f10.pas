unit f10;

interface
	procedure istirahat(var energi:integer; var countist:integer; Emax:integer);
	{I.S.: Tersedia masukan energi, countist sebagai penghitung jumlah istirahat dalam satu hari dan Emax sebagai energi maksimal}
	{F.S.: Menambah energi chef dengan satu bila belum istirahat sebanyak 6 kali. Energi maksimal adalah 10}

implementation
	procedure istirahat(var energi:integer; var countist:integer; Emax:integer);
	{I.S.: Tersedia masukan energi, countist sebagai penghitung jumlah istirahat dalam satu hari dan Emax sebagai energi maksimal}
	{F.S.: Menambah energi chef dengan satu bila belum istirahat sebanyak 6 kali. Energi maksimal adalah 10}
	//ALGORITMA LOKAL
	begin
		if (countist>=6) then
		writeln('Anda sudah istirahat sebanyak 6 kali, Tidurlah agar energi pulih esok hari') //Bila sudah istirahat sebanyak 6 kali tidak dapat istirahat lagi, dianjurkan tidur
		else
		begin
			energi:=energi+1;		//Bila belum istirahat sebanyak 6 kali, menambah energi dengan 1
			countist:=countist+1;	//Menambah jumlah istirahat
		end;

		if (energi>Emax) then
		energi:=Emax;				//Bila energi melebihi emax maka energi diubah menjadi emax
	end;

end.