program clock;

uses SysUtils;

procedure display_clock(time: integer);
begin
    writeln(time div 60:2, ':', time mod 60:2);
end;


function lcm(a, b: integer): integer;
var ac, bc: integer;
begin
    ac := a;
    bc := b;
    while ac <> bc do begin
        ac := (ac + a) mod 1440;
        bc := (bc + b) mod 1440;
    end;
    lcm := ac;
end;

var
    min1, min2: integer;
begin
    write('Enter how many mins/h clock 1 produces: '); readln(min1);
    write('Enter how many mins/h clock 2 produces: '); readln(min2);
    writeln('They meet at: ');
    display_clock(lcm(min1, min2) mod 1440);
end.
