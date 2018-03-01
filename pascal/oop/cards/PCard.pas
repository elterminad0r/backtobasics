{$MODE OBJFPC}

program PCard;

uses UCard, SysUtils;

var
    s, r, i: integer;
    cards: array[0..51] of TCard;

begin
    for s := 0 to 3 do
        for r := 0 to 12 do begin
            cards[s * 13 + r] := TCard.create(r, s);
        end;

    for i := 0 to 51 do
        writeln(Format('Card #%02d is called ''%20s'' and has score %02d', [i, cards[i].GetName, cards[i].GetScore]));

    for i := 0 to 51 do
        cards[i].Free;

end.
