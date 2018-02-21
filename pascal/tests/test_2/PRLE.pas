{$MODE OBJFPC}

program PRLE;

uses SysUtils;

function RLECompress(data: string): string;
var
    CurrChar: char;
    Count, i: integer;
begin
    result := '';
    if length(data) = 0 then
        exit;
    Count := 1;
    CurrChar := data[1];
    for i := 2 to length(data) do
        if data[i] = CurrChar then
            Count := Count + 1
        else begin
            result := result + Format('%s %d ', [CurrChar, Count]);
            CurrChar := data[i];
            Count := 1;
        end;
    result := result + Format('%s %d', [CurrChar, Count]);
end;

var
    data: string;
begin
    write('Original text: ');
    readln(data);
    write('"Compressed" text: ');
    writeln(RLECompress(data));
end.
