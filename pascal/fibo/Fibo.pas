program Fibo;

uses SysUtils;

function fib(n: integer): integer;
var
    a: integer = 0;
    b: integer = 0;
    c: integer = 1;
    _: integer;
begin
    for _ := 1 to n do begin
        a := b;
        b := c;
        c := a + b;
    end;
    fib := b;
end;

begin 
    writeln(fib(strtoint(ParamStr(1))));
end.
