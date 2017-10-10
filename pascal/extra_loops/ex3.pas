program ex3;

uses
    SysUtils, Math;

var
    start, interest, years: real;

begin
    write('Enter starting money > '); readln(start);
    write('Enter interest in percent > '); readln(interest);
    write('Enter number of years to invest > '); readln(years);
    writeln('You will have £', start * power(1 + interest / 100, years):6:2);
end.
