program testing;

uses F1load,f8,tipe,evaluate,F2exit,F5,F6,f7,f9,f10,F11Tidur,f13,f14,f15,searching;

var
a:resepnya;
b:InvMentah;
c:InvOlahan;
d:Mentah;
e:tSimulasi;
f:Olahan;
energi:integer;
uang:longint;
pemasukan:longint;
t:tanggal;

begin
	uang:=100;
	pemasukan:=0;
	write('Masukin tanggal cok: '); readln(t.hari);
	write('Masukin bulan cok: ');	readln(t.bulan);
	write('Masukin tahun cok: '); readln(t.tahun);

	load(d,f,b,c,a,e);
	write(' '); readln(energi);
	writeln(energi);
	jualResep(t,a,b,c,d,uang,pemasukan,energi);

	
	writeln(uang);
	writeln(pemasukan);
	writeln(energi);
end.
