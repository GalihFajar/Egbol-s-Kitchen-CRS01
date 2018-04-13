program testing;

uses F1load,f8,tipe;

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

begin
	uang:=100;
	pemasukan:=0;
	load(d,f,b,c,a,e);
	write(' '); readln(energi);
	writeln(energi);
	jualResep(a,b,c,uang,pemasukan,energi);
	
	writeln(uang);
	writeln(pemasukan);
	writeln(energi);
end.
