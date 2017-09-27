program POddNums;

var
    start, stop: integer;
begin
    write('Enter start: ');
    readln(start);
    write('Enter stop: ');
    readln(stop);

    if start mod 2 = 0 then
        start := start + 1;

    while start <= stop do begin
        write(start, ' ');
        start := start + 2;
    end;

    writeln;
end.
