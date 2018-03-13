{$MODE OBJFPC}

unit UCard;

interface

uses SysUtils;

const
    suits: array[0..3] of string = ('Spades', 'Clubs', 'Hearts', 'Diamonds');
    char_suits: array[0..3] of string = ('♠', '♣', '♥', '♦');
    ranks: array[0..12] of string =
                        ('Ace', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven',
                         'Eight', 'Nine', 'Ten', 'Jack', 'Queen', 'King');
    char_ranks: array[0..12] of char = ('A', '2', '3', '4', '5', '6', '7',
                                        '8', '9', 'T', 'J', 'Q', 'K');

type
    ECardError = class(Exception);

    TKeyArray = array[0..51] of integer;

    TCard = class
        private
            Rank, Suit: Integer;
        public
            constructor Create(r, s: integer);
            function GetRank: integer;
            function GetSuit: integer;
            function GetScore: integer;
            function GetAltScore: integer;
            function GetName: string;
            function GetShortName: string;
    end;

    TCardArray = array[0..51] of TCard;
    TCardKeyFunc = function(card: TCard): integer;

    type TPack = class
        private
            cards: TCardArray;
            bottom, ncards: integer;
        public
            constructor Create;
            destructor Free;
            function GetSize: integer;
            procedure Populate;
            procedure Shuffle;
            function Deal: TCard;
            procedure ReturnCard(card: TCard);
    end;

    type THand = class
        private
            cards: TCardArray;
            size: integer;
            procedure Sort(cardbuf: TCardArray; keybuf, keys: TKeyArray; lower, upper: integer);
            procedure Merge(cardbuf: TCardArray; keybuf, keys: TKeyArray; lower, mid, upper: integer);
        public
            constructor Create;
            function GetSize: integer;
            function Display: string;
            procedure AddCard(card: TCard);
            function Discard(i: integer): TCard;
            function ViewCard(i: integer): TCard;
            function TopCard: TCard;
            procedure SwapCards(i, j: integer);
            procedure Sort(keyfunc: TCardKeyFunc);
            procedure SortByRank;
            procedure SortBySuit;
    end;

function proper_mod(a, b: integer): integer;

implementation

{global functions}

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

destructor TPack.Free;
var
    i: integer;
begin
    for i := 0 to 51 do
        cards[i].free;
end;

function TPack.GetSize: integer;
begin
    result := ncards;
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

function TPack.Deal: TCard;
begin
    if ncards = 0 then
        raise ECardError.create('can''t deal card as pack is empty')
    else begin
        result := cards[proper_mod(bottom + ncards, 52)];    
        dec(ncards);
    end;
end;

procedure TPack.ReturnCard(card: TCard);
begin
    if ncards = 52 then
        raise ECardError.create('can''t return card as pack is full')
    else begin
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

function TCard.GetAltScore: integer;
begin
    result := Suit * 4 + Rank;
end;

function TCard.GetName: string;
begin
    result := Format('%s of %s', [ranks[Rank], suits[Suit]]);
end;

function TCard.GetShortName: string;
begin
    result := Format('%s%s', [char_ranks[Rank], char_suits[Suit]]);
end;

constructor THand.Create;
begin
    size := 0;
end;

function THand.GetSize: integer;
begin
    result := size;
end;

function THand.Display: string;
var
    i: integer;
begin
    result := 'Pack(';
    if size > 0 then
        result := result + cards[0].GetShortName;
    for i := 1 to size - 1 do
        result := result + ', ' + cards[i].GetShortName;
    result := result + ')';
end;

procedure THand.AddCard(card: TCard);
begin
    if size > 51 then
        raise ECardError.create('can''t add card to hand as it is full');
    cards[size] := card;
    inc(size);
end;

function THand.Discard(i: integer): TCard;
begin
    if size = 0 then
        raise ECardError.create('can''t discard as hand is empty')
    else begin
        result := cards[size - 1];
        dec(size);
    end;
end;

function THand.ViewCard(i: integer): TCard;
begin
    if (i >= size) or (i < 0) then
        raise ECardError.create('can''t view card outside of range')
    else
        result := cards[i];
end;

function THand.TopCard: TCard;
begin
    result := ViewCard(size - 1);
end;

procedure THand.SwapCards(i, j: integer);
var
    tmp_card: TCard;
begin
    if (i >= size) or (j >= size) then
        raise ECardError.create('can''t swap card outside of range')
    else
        tmp_card := cards[i];
        cards[i] := cards[j];
        cards[j] := tmp_card;
end;

procedure THand.Sort(cardbuf: TCardArray; keybuf, keys: TKeyArray; lower, upper: integer);
var
    mid: integer;
begin
    if upper - lower > 1 then begin
        mid := (lower + upper) div 2;
        Sort(cardbuf, keybuf, keys, lower, mid);
        Sort(cardbuf, keybuf, keys, mid, upper);
        Merge(cardbuf, keybuf, keys, lower, mid, upper);
    end;
end;

procedure THand.Merge(cardbuf: TCardArray; keybuf, keys: TKeyArray; lower, mid, upper: integer);
var
    i, j, k: integer;

begin
    i := lower;
    j := mid;
    k := 0;
    while (i < mid) and (j < upper) do
        if keys[i] <= keys[j] then begin
            keybuf[k] := keys[i];
            cardbuf[k] := cards[i];
            inc(i);
            inc(k);
        end else begin
            keybuf[k] := keys[j];
            cardbuf[k] := cards[j];
            inc(j);
            inc(k);
        end;

    for i := i to mid - 1 do begin
        keybuf[k] := keys[i];
        cardbuf[k] := cards[i];
        inc(k);
    end;

    for j := j to upper - 1 do begin
        keybuf[k] := keys[j];
        cardbuf[k] := cards[j];
        inc(k);
    end;

    for i := 0 to k do begin
        keys[lower + i] := keybuf[i];
        cards[lower + i] := cardbuf[i];
    end;
end;

procedure THand.Sort(keyfunc: TCardKeyFunc);
var
    cardbuf: TCardArray;
    keybuf, keys: TKeyArray;
    i: integer;
begin
    for i := 0 to 51 do
        keys[i] := keyfunc(cards[i]);
    Sort(cardbuf, keybuf, keys, 0, 52);
end;

function _GetScore(card: TCard): integer;
begin
    result := card.GetScore;
end;

procedure THand.SortByRank;
begin
    Sort(@_GetScore);
end;

function _GetAltScore(card: TCard): integer;
begin
    result := card.GetAltScore;
end;

procedure THand.SortBySuit;
begin
    Sort(@_GetAltScore);
end;

initialization

begin
    randomize;
end;

end.
