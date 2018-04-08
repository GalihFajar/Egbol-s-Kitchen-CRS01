program Project1;

{$APPTYPE CONSOLE}

uses
  Classes;

var
  List: TStrings;
begin
  List := TStringList.Create;
  try
    ExtractStrings([':'], [], PChar('word:doc,txt,docx'), List);
    WriteLn(List.Text);
    ReadLn;
  finally
    List.Free;
  end;
end.
