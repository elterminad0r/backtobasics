program ex7;

function is_perf_square(n: integer): boolean;
var i: integer;
begin
    for i := 1 to n do begin
        if i * i = n then begin
            is_perf_square := True;
            exit;
        end;
        if i * i > n then
            break;
    end;
    is_perf_square := False;
end;

var
    total: int64 = 0;
    i: integer = 0;
    count: integer = 0;
begin
    while count < 5 do begin
        i := i + 1;
        total := total + i;
        if is_perf_square(total) then begin
            count := count + 1;
            writeln(total);
        end;
    end;
end.
