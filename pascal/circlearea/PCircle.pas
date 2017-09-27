program PCircle;

uses
    SysUtils;

var
    radius, diam, circ: real;
begin
    writeln('Program to calculate the circumference of a circle');
    write('Enter circle radius > ');
    readln(radius);
    diam := radius * 2;
    circ := PI * diam;
    writeln('The circumference of the circle = ', circ:5:3);
    readln;
end.
