program PBoxVolume;

var
    length, height, width, volume : integer;

begin
    write('Enter length: ');
    readln(length);
    write('Enter width: ');
    readln(width);
    write('Enter height: ');
    readln(height);
    volume := length * width * height;
    writeln('The volume of the box is ', volume);
    readln;
end.
