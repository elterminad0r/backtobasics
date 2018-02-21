program PPrimes;

var
    Count1, Count2: integer;
    Prime: string;
begin
    writeln('The first few prime numbers are:');
    for Count1 := 2 to 50 do begin
        Count2 := 2;
        Prime := 'Yes';
        while Count2 * Count2 <= Count1 do begin
            if Count1 mod Count2 = 0 then
                Prime := 'No';
            Count2 := Count2 + 1;
        end;
        if Prime = 'Yes' then
            writeln(Count1);
    end;
end.
