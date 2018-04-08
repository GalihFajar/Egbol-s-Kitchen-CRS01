unit f9;

interface
	procedure makan(var energi:integer;var countmakan:integer; Emax:integer);
	{I.S.: tersedia energi awal chef, jumlah makan, dan energi maksimal}
	{F.S.: Menambah energi sebanyak 3 bila belum makan sebanyak 3 kali}

implementation

	procedure makan(var energi:integer;var countmakan:integer; Emax:integer);
	{I.S.: tersedia energi awal chef, jumlah makan, dan energi maksimal}
	{F.S.: Menambah energi sebanyak 3 bila belum makan sebanyak 3 kali}
	begin
		if (countmakan>=3) then
		writeln('Anda sudah makan 3 kali hari ini, makan lagi besok')	//Bila sudah makan 3 kali tidak dapat makan lagi
		else					//countmakan<3
		begin
			energi:=energi+3;				//Energi bertambah 3
			countmakan:=countmakan+1;		//Menambah countmakan dengan 1
		end;

		if (energi>Emax) then
		energi:=Emax;			//Bila energi melebihi emax maka energi diubah menjadi emax
	end;

end.