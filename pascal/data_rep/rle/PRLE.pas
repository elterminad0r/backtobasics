{$MODE DELPHI}

program PRLE;

uses sysutils;

type
    TDFile = file of byte;

procedure write_d(var dfile: TDFile; var lch, ch, cnt: byte);
begin
    write(dfile, cnt);
    write(dfile, lch);
    lch := ch;
    cnt := 1;
end;

procedure rlecompress(var d_file, o_file: TDFile);
var
    last_ch, curr_ch, curr_cnt: byte;
begin
    if not eof(d_file) then begin
        read(d_file, last_ch);
        curr_cnt := 1;
        while not eof(d_file) do begin
            read(d_file, curr_ch);
            if curr_ch <> last_ch then
                write_d(o_file, last_ch, curr_ch, curr_cnt)
            else begin
                if curr_cnt = 254 then begin
                    write_d(o_file, last_ch, curr_ch, curr_cnt);
                    curr_cnt := 0;
                end;
                curr_cnt := curr_cnt + 1;
            end;
        end;
        write_d(o_file, last_ch, curr_ch, curr_cnt);
    end;
end;

var
    d_file, o_file: TDFile;
begin
    AssignFile(d_file, 'input.txt');
    reset(d_file);

    assignfile(o_file, 'output.dat');
    rewrite(o_file);
    
    rlecompress(d_file, o_file);
end.
