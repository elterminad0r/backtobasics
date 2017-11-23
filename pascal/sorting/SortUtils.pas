{$MODE OBJFPC}

unit SortUtils;

interface

type
    int_array = array of integer;
    sort_proc = procedure(arr: int_array);

procedure swap_vars(var a, b: integer);
function get_random_ints(highest, len: integer): int_array;
procedure show_array(arr: int_array);
function is_sorted(arr: int_array): boolean;
procedure test_sort(proc: sort_proc; num: integer);

implementation

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

procedure show_array(arr: int_array);
var
    i: integer;
begin
    for i := low(arr) to high(arr) do
        write(arr[i], ' ');
    writeln;
end;

function is_sorted(arr: int_array): boolean;
var
    i: integer;
begin
    for i := low(arr) to high(arr) - 1 do
        if arr[i] > arr[i + 1] then
            exit(False);
    exit(True);
end;

procedure test_sort(proc: sort_proc; num: integer);
var
    to_sort: array of integer;
begin
    randomize;
    to_sort := get_random_ints(100, num);
    proc(to_sort);
    show_array(to_sort);
    writeln('Sorted: ', is_sorted(to_sort));
end;

end.
