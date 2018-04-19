program utama;

uses tipe,F1load,f2exit,f3f4;

var
	MentahU	: Mentah;
	OlahanU	: Olahan;
	InvenMentah: InvMentah;
	InvenOlahan: InvOlahan;
	tabSim: tSimulasi;
	resepp: Resepnya; 
	perintah:string;
	
begin
load(MentahU,OlahanU,InvenMentah,InvenOlahan,resepp,tabSim);
repeat
	begin
	write('>');
	readln(perintah);
	writeln();
	if (perintah='startSimulasi') then
		simulasi(MentahU,OlahanU,InvenMentah,InvenOlahan,resepp,tabSim)
	else if (perintah<>'exit') then
		writeln('Perintah Tidak tepat, Silahkan mulai simulasi atau exit program');
	end;
until (perintah='exit');
	exit(MentahU, OlahanU, InvenMentah, InvenOlahan, resepp, tabSim);
end.
