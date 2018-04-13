unit F17;

interface
	uses tipe;
	procedure upgradeInventori(var inventori : Simulasi);
	
implementation
	procedure upgradeInventori(var inventori : Simulasi);
		begin
			inventori.KapasitasInventory := inventori.KapasitasInventory + 25;
		end;

end.
			
