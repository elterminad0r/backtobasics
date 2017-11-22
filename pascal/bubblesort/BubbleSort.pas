program BubbleSort;

uses SysUtils;

type
    int_array = array of integer;

procedure swap_vars(var a, b: integer);
var
    t: integer;
begin
    t := b;
    b := a;
    a := t;
end;

function get_random_ints(highest, len: integer): int_array;
var
    ints: array of integer;
    i: integer;

begin
    SetLength(ints, len);
    for i := 0 to len - 1 do
        ints[i] := random(highest);
    get_random_ints := ints;
end;

function bubble(var arr: array of integer): boolean;
var
    i: integer;
    swapped: boolean = false;
begin
    for i := low(arr) to high(arr) - 1 do
        if arr[i] > arr[i + 1] then begin
            swap_vars(arr[i], arr[i + 1]);
            swapped := true;
        end;
    bubble := swapped;
end;

procedure bubblesort(var arr: array of integer);
begin
    while bubble(arr) do
        continue;
end;

var
    to_sort: array of integer;
    i: integer;
begin
    randomize;
    to_sort := get_random_ints(100, 100);
    bubblesort(to_sort);
    for i := low(to_sort) to high(to_sort) do
        write(to_sort[i], ' ');
    writeln();
end.
