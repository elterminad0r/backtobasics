program PBaseConv;

uses
    SysUtils;

const
    digits: string = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

function _from_base(plain: string; base, i, total: integer): integer;
begin
    if i > length(plain) then
        _from_base := total
    else
        _from_base := _from_base(plain, base, i + 1, total * base + pos(plain[i], digits) - 1);
end;

function from_base(plain: string; base: integer): integer;
begin
    from_base := _from_base(plain, base, 1, 0);
end;

function to_base(num, base: integer): string;
begin
    if num = 0 then
        to_base := ''
    else
        to_base := to_base(num div base, base) + digits[(num mod base) + 1];
end;

procedure menu;
var
    num: string;
    start_base, end_base: integer;
begin
    write('Enter the number to convert> '); readln(num);
    write('Enter the base to convert from> '); readln(start_base);
    write('Enter the base to convert to> '); readln(end_base);
    writeln(num, '_', start_base, ' = ', to_base(from_base(num, start_base), end_base), '_', end_base);
end;

begin
    while true do
        menu;
end.
