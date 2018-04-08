{$MODE OBJFPC}

program PSimpleCardGame;

uses UCard, UHand, UPack, SysUtils;

var
    card_pack: TPack;
    hand_a, hand_b: THand;
    a_score, b_score, i: integer;

begin
    a_score := 0;
    b_score := 0;

    card_pack := TPack.create;
    hand_a := THand.create;
    hand_b := THand.create;

    try
        while true do begin
            hand_a.PushCard(card_pack.Deal);
            hand_b.PushCard(card_pack.Deal);
        end;
    except on E: ECardError do
        writeln('Stopping dealing because: ', E.Message);
    end;

    writeln(Format('hand A: %s', [hand_a.Display]));
    writeln(Format('hand B: %s', [hand_b.Display]));

    writeln('Points being distributed:');

    for i := 0 to hand_b.GetSize - 1 do begin
        if hand_a.ViewCard(i).GetScore > hand_b.ViewCard(i).GetScore then begin
            inc(a_score);
            write('A');
        end else begin
            inc(b_score);
            write('B');
        end;
    end;

    writeln;
    writeln(Format('Player A scored %d, player B scored %d', [a_score, b_score]));
    card_pack.free;
    hand_a.free;
    hand_b.free;
end.
