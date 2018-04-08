{$MODE OBJFPC}

unit UBlackJack;

interface

uses UHand, SysUtils;

const
    BlackJackScores: array[0..12] of integer = (11, 2, 3, 4, 5, 6, 7, 8 , 9,
                                                10, 10, 10, 10);

type
    TBlackJackHand = class(THand)
    public
        function GetScore: integer;
    end;

implementation

function TBlackJackHand.GetScore: integer;
var
    aces: integer = 0;
    i: integer;
begin
    result := 0;
    for i := 0 to size - 1 do begin
        result := result + BlackJackScores[cards[i].GetRank];
        if cards[i].GetRank = 0 then
            inc(aces);
    end;

    if result > 21 then begin
        writeln('needs to subtract aces ', result);
        if (result - 11) div 10 <= aces then begin
            writeln('subtracting ', (result - 11) div 10);
            result := result - (result - 11) div 10 * 10;
        end;
    end;
end;

end.
