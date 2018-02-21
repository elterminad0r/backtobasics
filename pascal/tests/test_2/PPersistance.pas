program PPersistance;

uses SysUtils;

var
    Value, Count: integer;
    Operation: string;
begin
    write('Enter integer (0-99): ');
    readln(Value);
    write('Calculate additive or multiplicative persistence (a or m)? ');
    readln(Operation);
    Count := 0;
    while Value > 9 do begin
        if Operation = 'a' then
            Value := (Value div 10) + (Value mod 10)
        else
            Value := (Value div 10) * (Value mod 10);
        Count := Count + 1;
    end;
    write('The persistence is: ');
    writeln(Count);
end.
