program PRPS;

uses SysUtils, Math;

function index_of(arr: array of string; item: string): integer;
var
    i: integer;
    success: boolean = false;
begin
    for i := 0 to length(arr) do begin
        if (not success) and (arr[i] = item) then begin
            index_of := i;
            success := true;
        end;
    end;
    if (not success) then begin
        index_of := -1;
    end;
end;

function get_choice: string;
var
    choice: string;
begin
    write('Make a choice from rock, paper, scissors > ');
    readln(choice);
    get_choice := LowerCase(choice);
end;

procedure compare_choices(choices: array of string; a: string; b: string);
var
    ia, ib: integer;
begin
    ia := index_of(choices, a);
    ib := index_of(choices, b);
    if ia = -1 then begin
        writeln('Player 1 invalid choice');
    end else if ib = -1 then begin
        writeln('Player 2 invalid choice');
    end else if ia = ib then begin
        writeln('Draw!');
    end else if (ia + 1) mod 3 = ib then begin
        writeln('Player 2 wins');
    end else begin
        writeln('Player 1 wins');
    end;
end;

var
    choices : array [0..2] of string = ('rock', 'paper', 'scissors');
    comp_choice, u_choice: string;

begin
    randomize;
    writeln('Computer is considered player one, you are player two');
    u_choice := get_choice;
    comp_choice := choices[random(3)];
    writeln('Computer chose ', comp_choice);
    compare_choices(choices, comp_choice, u_choice);
end.
