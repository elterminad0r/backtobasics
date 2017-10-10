program ex4;

uses
    SysUtils, Math;

var
    curr_power: integer = 1;
    i: integer = 0;
    target: integer;

begin
    write('Enter target integer > '); readln(target);
    if target <= 0 then begin
        writeln('Invalid input');
    end else begin
        while curr_power < target do begin
            curr_power := curr_power * 2;
            i := i + 1;
        end;
        writeln('2 ^ ', i, ' = ', curr_power);
    end;
end.
