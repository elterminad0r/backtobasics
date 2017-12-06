program pasc;

procedure ascii(w: string);
var
    c: char;
begin
    for c in w do
        write(ord(c), ' ');
    writeln;
end;

var
    i: integer;
begin
    for i := 1 to ParamCount do
        ascii(ParamStr(i));
end.
