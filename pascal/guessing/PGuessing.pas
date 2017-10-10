program PGuessing;

uses
    SysUtils, Math;

var
    guess, target: integer;

begin
    randomize;
    target := random(128);
    guess := -1;

    while guess <> target do begin
        write('Enter your guess > ');
        readln(guess);

        if guess < target then begin
            writeln('Too low');
        end else if guess > target then begin
            writeln('Too high');
        end;
    end;


    writeln('You guessed it');
end.
