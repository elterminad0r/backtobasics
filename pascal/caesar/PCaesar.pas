program PCaesar;

uses
    SysUtils;

procedure caesar(var plain: string; shift: integer);
var
    i, _: integer;
begin
    for i := 1 to length(plain) do
        if plain[i] in ['A'..'Z', 'a'..'z'] then
            for _ := 1 to shift do
                if plain[i] = 'Z' then
                    plain[i] := 'A'
                else if plain[i] = 'z' then
                    plain[i] := 'a'
                else
                    inc(plain[i]);
end;

var
    user_plain: string;
    user_shift: integer;
begin
    while true do begin
        write('Enter plaintext: '); readln(user_plain);
        write('Enter shift: '); readln(user_shift);
        caesar(user_plain, user_shift);
        writeln(user_plain);
   end;
end.
