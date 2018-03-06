{$MODE OBJFPC}

program PSimpleCardGame;

uses UCard, SysUtils;

var
    card_pack: TPack;
    card_a, card_b: TCard;
    a_score, b_score, i: integer;
    cards_remain: boolean = true;

begin
    a_score := 0;
    b_score := 0;

    card_pack := TPack.create;

    while cards_remain do begin
        if DEAL_FAIL in [card_pack.Deal(card_a), card_pack.Deal(card_b)] then begin
            writeln('Deck is empty!');
            cards_remain := false;
        end else begin
            write(format('cards drawn: A::%20s and B::%20s >> ', [card_a.getname, card_b.getname]));
            if card_a.GetScore > card_b.GetScore then begin
                inc(a_score);
                writeln('Point for player A');
            end else begin
                inc(b_score);
                writeln('Point for player B');
            end;
        end;
    end;
    writeln(Format('Player A scored %d, player B scored %d', [a_score, b_score]));
    card_pack.free;
end.
