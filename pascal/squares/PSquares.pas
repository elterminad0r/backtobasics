program PSquares;

uses
    SysUtils;

var
    i: integer;

{ Naive way to implement power

function power(base: integer; exponent: integer): integer;
var
    value: integer = 1;
    i: integer;
begin
    for i := 0 to exponent do begin
        value := value * base;
    end;

    power := value;
end;
}

function power(base: integer; exponent: integer): integer;
begin
    if exponent <= 0 then begin
        power := 1;
    end
    else begin
        power := base * power(base, exponent - 1);
    end;
end;

begin
    for i := 1 to 10 do begin
        write(power(i, 2), ' ');
    end;
    writeln;
end.
