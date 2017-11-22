program PWord;

var
    theword: string;
    i: integer;
begin
    theword := 'izaak van dongen';
    for i := length(theword) downto 1 do
        write(theword[i]);
    write(#13#10);
end.
