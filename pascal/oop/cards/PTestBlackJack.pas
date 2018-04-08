{$MODE OBJFPC}

program PTestBlackJack;

uses UBlackJack, UPack, SysUtils;

var
    BHand: TBlackJackHand;
    CardPack: TPack;
    i: integer;
begin
    CardPack := TPack.Create;
    BHand := TBlackJackHand.create;
    for i := 1 to 4 do
        BHand.PushCard(CardPack.Deal);
    writeln(Format('Hand: %s has score: %d', [BHand.Display, BHand.GetScore]));
    CardPack.free;
    BHand.free;
end.
