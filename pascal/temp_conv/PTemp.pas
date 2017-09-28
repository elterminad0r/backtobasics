program PTemp;

function f_to_c(fahr: real): real;
begin
    f_to_c := (fahr - 32) * 5 / 9;
end;

var
    fahr, cels: real;
begin
    write('Enter the temperature in Fahrenheit: ');
    readln(fahr);
    cels := f_to_c(fahr);
    writeln('The temperature in degrees celsius is ', cels:5:2);
    readln;
end.
