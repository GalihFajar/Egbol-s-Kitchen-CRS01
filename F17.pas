unit F17;

interface
	uses tipe;
	procedure upgradeInventori(var inventori : integer; var uang : longint; var energi : integer);
	
implementation
	procedure upgradeInventori(var inventori : integer; var uang : longint; var energi : integer);
		begin
			if (uang >= 50000 ) then
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
			
