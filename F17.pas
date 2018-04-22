unit F17;

interface
	uses tipe;
	procedure upgradeInventori(var inventori : integer; var uang : longint; var energi : integer);
	{I.S. Tersedia variabel inventori, uang dan energi}
	{F.S. Jika berhasil, inventori bertambah, uang berkurang, dan energi berkurang}
implementation
	procedure upgradeInventori(var inventori : integer; var uang : longint; var energi : integer);
	{I.S. Tersedia variabel inventori, uang dan energi}
	{F.S. Jika berhasil, inventori bertambah, uang berkurang, dan energi berkurang}
	begin
		if (uang >= 50000 ) then //Validasi uang, jika mencukupi akan diupgrade.
			begin
				writeln('Upgrade berhasil!'); 
				uang := uang - 50000;
				inventori := inventori + 25;
				energi := energi - 1;
			end
			else
				writeln('Uang tidak mencukupi.')
	end;

end.
			
