program ex5;

uses
    SysUtils;

var
    can: real = 1;
    i: integer = 0;

begin
    while can > 0.5 do begin
        can := can * 0.98;
        i := i + 1;
    end;
    writeln('After ', i, ' seconds');
end.
