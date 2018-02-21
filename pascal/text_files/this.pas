{$MODE OBJFPC}

program this;

uses SysUtils;

var
    tim_p: textfile;
    f_line: string;

const
    tim: string = 'zop.txt';

begin
    assignfile(tim_p, tim);
    reset(tim_p);
    while not eof(tim_p) do begin
        readln(tim_p, f_line);
        writeln(f_line);
    end;
    closefile(tim_p);
end.
