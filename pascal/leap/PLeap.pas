program PLeap;

var
    year: integer;
    isleap: boolean;

begin
    write('Enter year > ');
    readln(year);
    isleap := (year mod 400 = 0) or ((year mod 100 <> 0) and (year mod 4 = 0));
    writeln('Leap year: ', isleap);
end.
