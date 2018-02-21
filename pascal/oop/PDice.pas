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
        write(Format('Die shows %d - enter "roll" to roll > ', [die.GetValue]));
        readln(com);
        if com = 'roll' then
            die.Roll;
    end;
end.
