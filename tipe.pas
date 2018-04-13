unit tipe;
//Editor terakhir : egbol (8/4/2018, 09.26)

interface
	const MaxE : Integer = 10;
	type bahanMentah = record
		Nama		: String;
		Harga		: LongInt;
		Kadaluarsa	: Integer;
	end;

	type Mentah = record
		TabMentah	: Array [1..20] of bahanMentah;
		Neff		: Integer;
	end;

	type bahanOlahan = record
		Nama	: String;
		Harga	: LongInt;
		NButuh	: Integer;
		bahan 	: Array [1..20] of String;
	end;

	type Olahan = record
		TabOlahan	: Array [1..20] of bahanOlahan;
		Neff		: Integer;
	end;

	type Tanggal = record
		hari	: Integer;
		bulan	: Integer;
		tahun	: Integer;
	end;

	type InventoryMentah = record
		Nama	: String;
		Tgl		: Tanggal;
		Jumlah	: Integer;
	end;

	type InvMentah = record
		TabInvMentah	: Array [1..20] of InventoryMentah;
		Neff			: Integer;
	end;

	type InventoryOlahan = record
		Nama	: String;
		TglBuat	: Tanggal;
		Jumlah	: Integer;
	end;

	type InvOlahan = record
		TabInvOlahan	: Array [1..20] of InventoryOlahan;
		Neff			: Integer;
	end;

	type Resep = record
		Nama	: String;
		Harga	: LongInt;
		Nbutuh	: Integer;
		Olah	: Array [1..20] of String;
	end;

	type Resepnya = record
		TabResep 	: Array [1..20] of Resep;
		Neff		: Integer;
	end;

	type tempresep = array [1..20] of Resep;

	type Simulasi = record
		Nomor				: Integer;
		Tgl					: Tanggal;
		HariHidup			: Integer;
		Energi				: Integer;
		KapasitasInventory	: Integer;
		TotalBeliMentah		: Integer;
		TotalOlahBuat		: Integer;
		TotalOlahJual		: Integer;
		TotalResepJual		: Integer;
		TotalPemasukan		: LongInt;
		TotalPengeluaran	: LongInt;
		TotalPendapatan		: LongInt;
	end;

	type tSimulasi = record
		Tab		: Array [1..20] of Simulasi;
		Neff	: Integer;
	end;

var
	daftarresep : resepnya;

implementation

end.
