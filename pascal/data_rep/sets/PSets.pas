program PSets;

type
    int_set = set of 0..255;

function read_set: int_set;
var
    elems, user_num: integer;
    user_set: int_set = [];
    _: integer;
begin
    write('How many elements will you enter?> '); readln(elems);
    for _ := 1 to elems do begin
        write('Enter number> '); readln(user_num);
        include(user_set, user_num);
    end;
    read_set := user_set;
end;

procedure writeset(s: int_set);
var
    i: integer;
begin
    write('{');
    for i in s do begin
        write(i);
        write(',');
    end;
    writeln('}');
end;

procedure writecart(a, b: int_set);
var
    ai, bi: integer;
begin
    write('{');
    for ai in a do
        for bi in b do
            write('(', ai, ',', bi, '),');
    writeln('}');
end;

function card(s: int_set): integer;
var
    t: integer = 0;
    _: integer;
begin
    for _ in s do
        t := t + 1;
    card := t;
end;

procedure menu(a, b: int_set);
var
    action: string;
begin
    while true do begin
        write('union, diff, int, card, cart, rep> '); readln(action);
        if action = 'union' then
            writeset(a + b)
        else if action = 'diff' then
            writeset(a - b)
        else if action = 'int' then
            writeset(a * b)
        else if action = 'rep' then begin
            writeset(a); writeset(b);
        end else if action = 'cart' then
            writecart(a, b)
        else if action = 'card' then
            writeln(card(a), ', ', card(b))
        else
            writeln('unrecognised command');
    end;
end;

var
    a, b: int_set;
begin
    a := read_set; b := read_set;
    menu(a,b);
end.
