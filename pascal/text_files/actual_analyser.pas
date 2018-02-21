{$MODE OBJFPC}

program actual_analyser;

uses SysUtils;

const
    whitespace: set of char = [' ', #9];

procedure get_stats(var f: textfile);
var
    chars: integer = 0;
    words: integer = 0;
    lines: integer = 0;
    ch: char;
    ln_: string;
    was_word: boolean = false;
begin
    while not eof(f) do begin
        readln(f, ln_);
        lines := lines + 1;
        words := words + 1;
        chars := chars + 1;
        for ch in ln_ do begin
            chars := chars + 1;
            if not (ch in whitespace) then
                was_word := true
            else if was_word then begin
                was_word := false;
                words := words + 1;
            end;
        end;
    end;
    writeln(chars, ' characters, ', words, ' words, ', lines, ' lines');
end;

var
    u_file: textfile;
    uf_name: string;

begin
    write('Which file should be analysed? > ');
    readln(uf_name);
    assignfile(u_file, uf_name);
    reset(u_file);
    get_stats(u_file);
    closefile(u_file);
end.
