program testing;

uses F1load,f8,tipe,evaluate,F2exit,F5,F6,f7,f9,f10,F11Tidur,f13,f14,f15,searching,F16,F12Statistik;

var
a:resepnya;
b:InvMentah;
c:InvOlahan;
d:Mentah;
e:tSimulasi;
f:Olahan;
g:simulasi;
energi:integer;
uang:longint;
pemasukan,pengeluaran:longint;
t:tanggal;
countmakan,countist:integer;
emax,aktivitas:integer;
hhidup,kapasitas:integer;
TotalJualOlahan,TotalJualResep:integer;


begin
	uang:=10000;
	pemasukan:=0;
	pengeluaran:=0;
	hhidup:=1;
	kapasitas:=25;
	countmakan:=0; countist:=0; emax:=10;
	TotalJualResep:=0;
	TotalJualOlahan:=0;
	write('Masukin tanggal cok: '); readln(t.hari);
	write('Masukin bulan cok: ');	readln(t.bulan);
	write('Masukin tahun cok: '); readln(t.tahun);

	load(d,f,b,c,a,e);
	write('masukin energi: '); readln(energi);
	writeln(energi);

	writeln('====Testing F8====');
	jualResep(t,a,b,c,d,uang,pemasukan,energi,TotalJualResep);
	writeln('Uang: ',uang);
	writeln('pemasukan: ',pemasukan);
	writeln('energi: ',energi);
	writeln();	

	writeln('====Testing F5====');
	belibahan(t,uang,energi,b,d,pengeluaran,e);
	writeln('Uang: ',uang);
	writeln('pengeluaran: ',pengeluaran);
	writeln('energi: ',energi);
	writeln();

	writeln('====testing F6====');
	olahBahan(b,c,f,t,energi,e);
	writeln('energi: ',energi);
	writeln();

	writeln('====Testing F7====');
	jualOlahan(c,t,f,pemasukan,uang,energi,TotalJualOlahan);
	writeln('Uang: ',uang);
	writeln('pemasukan: ',pemasukan);
	writeln('energi: ',energi);
	writeln();

	writeln('====Testing F9====');
	makan(energi,countmakan,emax);
	writeln('countmakan: ',countmakan);
	writeln('energi: ',energi);
	writeln();

	writeln('====Testing F10====');
	istirahat(energi,countist,emax);
	writeln('countist: ',countist);
	writeln('energi: ',energi);
	writeln();

	writeln('====Testing F13====');
	TampilkanInventory(b,c);
	writeln();

	writeln('====Testing F14====');
	TampilkanResep(a);
	writeln();

	writeln('====Testing F15====');
	CariResep(a);
	writeln();

	writeln('====Testing F16====');
	tambahResep(d,f,a);
	TampilkanResep(a);

	writeln('====Testing F11====');
	aktivitas:=0;
	Tidur(t,c,b,d,energi,hhidup,countmakan,countist,aktivitas);
	writeln('energi: ',energi);
	writeln('tanggal: ',t.hari);
	writeln('Bulan: ',t.bulan);
	writeln('Tahun: ',t.tahun);
	writeln(aktivitas,' ini aktivitas(tidur)');

	
	writeln(uang);
	writeln(pemasukan);
	writeln(energi);
end.
