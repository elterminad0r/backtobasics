program PLoop;

uses SysUtils;

var
    i: integer;
    c: char;
    input: string;
begin
    for i := 1 to 100 do
        writeln(i);
    for c := 'A' to 'Z' do
        writeln(c);
    repeat
        write('Enter the integer 7 > ');
        readln(input);
    until input = '7'
end.
