program PCircle;

uses
    SysUtils, Math;

var
    radius, diam, circ, area: real;
begin
    writeln('Program to calculate the circumference and area of a circle');
    write('Enter circle radius > ');
    readln(radius);
    diam := radius * 2;
    circ := PI * diam;
    area := PI * power(radius, 2);
    writeln('The circumference of the circle = ', circ:5:3);
    writeln('The area of the circle = ', area:5:3);
    readln;
end.
