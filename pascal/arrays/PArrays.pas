program PArrays;

var
    arr_1: array[1..2] of array[1..2] of integer = ((1, 2), (3, 4));
    arr_2: array[1..2, 1..2] of integer = ((1, 2), (3, 4));

begin
    writeln(arr_1[1][1]);
    writeln(arr_1[1, 1]);
    writeln(arr_2[1][1]);
    writeln(arr_2[1, 1]);
end.
