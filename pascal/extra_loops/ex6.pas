program ex6;

uses
    SysUtils, Math;

var
    undertens: integer = 0;
    overnineties: integer = 0;
    rand, total: integer;

begin
    randomize;
    while (undertens < 10) or (overnineties < 10) do begin
        rand := random(100) + 1;
        total := total + 1;
        if rand <= 10 then
            undertens := undertens + 1;
        if rand > 90 then
            overnineties := overnineties + 1;
    end;
    writeln('Took ', total);
end.
