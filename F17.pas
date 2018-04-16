unit F17;

interface
	uses tipe;
	procedure upgradeInventori(var inventori : integer; var cuan : longint; var nengyuan : integer);
	
implementation
	procedure upgradeInventori(var inventori : integer; var cuan : longint; var nengyuan : integer);
		begin
			if (cuan >= 50000 ) then
				begin
				writeln('Upgrade berhasil!');
				cuan := cuan - 50000;
				inventori := inventori + 25;
				nengyuan := nengyuan - 1;
				end
			else
				writeln('Uang tidak mencukupi.')
		end;

end.
			
