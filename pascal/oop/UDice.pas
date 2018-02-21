{$MODE OBJFPC}

unit UDice;

interface

type
    TDice = class
        value, sides: integer;
        constructor Create(numsides: integer);
        procedure Roll;
        function GetValue: integer;
    end;

implementation

constructor TDice.Create(numsides: integer);
begin
    sides := numsides;
end;

function TDice.GetValue: integer;
begin
    result := value;
end;

procedure TDice.Roll;
begin
    value := random(sides) + 1;
end;

end.
