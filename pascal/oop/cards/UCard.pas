{$MODE OBJFPC}

unit UCard;

interface

uses SysUtils;

const
    suits: array[0..3] of string = ('Spades', 'Clubs', 'Hearts', 'Diamonds');
    ranks: array[0..12] of string =
                        ('Ace', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven',
                         'Eight', 'Nine', 'Ten', 'Jack', 'Queen', 'King');

function proper_mod(a, b: integer): integer;

type
    TCard = class
        private
            Rank, Suit: Integer;
        public
            constructor Create(r, s: integer);
            function GetRank: integer;
            function GetSuit: integer;
            function GetScore: integer;
            function GetRankAsString: string;
            function GetSuitAsString: string;
            function GetName: string;
    end;

    type TDealResult = (DEAL_SUCCESS, DEAL_FAIL);

    type TPack = class
        private
            cards: array[0..51] of TCard;
            bottom, ncards: integer;
        public
            constructor Create;
            procedure Populate;
            procedure Shuffle;
            function Deal(var card: TCard): TDealResult;
            function ReturnCard(card: TCard): TDealResult;
    end;

implementation

function proper_mod(a, b: integer): integer;
begin
    proper_mod := a mod b;
    if proper_mod < 0 then
        proper_mod := proper_mod + b;
end;

constructor TPack.Create;
begin
    bottom := 0;
    ncards := 52;
    Populate;
    Shuffle;
end;

procedure TPack.Populate;
var
    i: integer;
begin
    for i := 0 to 51 do begin
        cards[i] := TCard.create(i mod 13, i div 13);
    end;
end;

procedure TPack.Shuffle;
var
    i, ind_a, ind_b: integer;
    temp: TCard;
begin
    for i := ncards - 1 downto 1 do begin
        ind_a := proper_mod(random(i) + bottom, 52);
        ind_b := proper_mod(i, 52);
        temp := cards[ind_b];
        cards[ind_b] := cards[ind_a];
        cards[ind_a] := temp;
    end;
end;

function TPack.Deal(var card: TCard): TDealResult;
begin
    if ncards = 0 then
        result := DEAL_FAIL
    else begin
        result := DEAL_SUCCESS;
        card := cards[proper_mod(bottom + ncards, 52)];    
        dec(ncards);
    end;
end;

function TPack.ReturnCard(card: TCard): TDealResult;
begin
    if ncards = 52 then
        result := DEAL_FAIL
    else begin
        result := DEAL_SUCCESS;
        cards[bottom] := card;
        bottom := proper_mod(bottom - 1, 52);
        inc(ncards)
    end;
end;

constructor TCard.Create(r, s: integer);
begin
    Rank := r;
    Suit := s;
end;

function TCard.GetRank: integer;
begin
    result := Rank;
end;

function TCard.GetSuit: integer;
begin
    result := Suit;
end;

function TCard.GetScore: integer;
begin
    result := Rank * 4 + Suit;
end;

function TCard.GetRankAsString: string;
begin
    result := ranks[Rank];
end;

function TCard.GetSuitAsString: string;
begin
    result := suits[Suit];
end;

function TCard.GetName: string;
begin
    result := Format('%s of %s', [ranks[Rank], suits[Suit]]);
end;

initialization

begin
    randomize;
end;

end.

