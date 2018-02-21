program from_asc;

uses
    SysUtils;

type
    handler_func = procedure(v: string);

procedure split_apply(digs: string; handler: handler_func);
var
    c: char;
    num: string = '';
begin
    for c in digs do
        if c <> ' ' then
            num := num + c
        else begin
            handler(num);
            num := '';
        end;
    handler(num);
end;

procedure printasc(v: string);
begin
    write(chr(strtoint(v)), ' ');
end;

var
    ascs: string;
begin
    readln(ascs);
    split_apply(ascs, @printasc);
    writeln;
end.
