program PDice;

uses SysUtils, UDice;

var
    die: TDice;
    com: string;
begin
    randomize;
    die := TDice.Create(6);
    die.Roll;

    while true do begin
        write(Format('Die shows %d - press enter to roll or "k" to keep > ', [die.GetValue]));
        readln(com);
        if com <> 'k' then
            die.Roll;
    end;

    die.Free;
end.
