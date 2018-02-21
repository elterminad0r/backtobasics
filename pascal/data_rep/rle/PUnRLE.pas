{$MODE DELPHI}

program PUnRLE;

uses SysUtils;

type
    TDFile = file of byte;

procedure decompress(var d_file, o_file: TDFile);
var
    ch, cnt: byte;
    i: integer;
begin
    while not eof(d_file) do begin
        read(d_file, cnt);
        read(d_file, ch);
        for i := 1 to cnt do
            write(o_file, ch);
    end;
end;

var
    d_file, o_file: TDFile;
begin
    AssignFile(d_file, 'output.dat');
    reset(d_file);

    assignfile(o_file, 'decomp.txt');
    rewrite(o_file);
    
    decompress(d_file, o_file);
end.
