program PCards;

uses SysUtils, Math;

var
    suits: array [0..3] of string = ('Clubs', 'Spades', 'Hearts', 'Diamonds');
    cards: array [0..12] of string = ('Two', 'Three', 'Four', 'Five', 'Six', 'Seven',
                                      'Eight', 'Nine', 'Ten', 'Jack', 'Queen', 'King',
                                      'Ace');

procedure card_with_val(id: integer);
var
    suit_pos, card_pos: integer;
begin
    suit_pos := id div 13;
    card_pos := id mod 13;
    writeln('The card is the ', cards[card_pos], ' of ', suits[suit_pos]);
end;

var id: integer;
    stop: string;
begin
    randomize;
    if ParamCount = 0 then begin
        id := random(52);
        card_with_val(id);
    end
    else if ParamStr(1) = '--test' then begin
        for id := 0 to 51 do begin
            card_with_val(id);
        end;
    end
    else if ParamStr(1) = '--interactive' then begin
        repeat
            id := random(52);
            card_with_val(id);
            readln(stop);
        until stop = 'q';
    end
    else begin
        writeln('Unrecognised option ', ParamStr(1));
    end;
end.
