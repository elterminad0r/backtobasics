{$MODE OBJFPC}

program SelectionSort;

uses SysUtils, SortUtils;

procedure find_minmax(arr: int_array; lower, upper: integer; out min, max: integer);
var
    i: integer;
begin
    min := lower;
    max := upper;
    if min > max then
        swap_vars(min, max);
    for i := lower to upper do
        if arr[i] < arr[min] then
            min := i
        else if arr[i] > arr[max] then
            max := i;
end;

procedure selection_sort(arr: int_array);
var
    lower, upper, min, max: integer;
begin
    lower := low(arr);
    upper := high(arr);
    while upper > lower do begin
        find_minmax(arr, lower, upper, min, max);
        swap_vars(arr[max], arr[upper]);
        if min = upper then
            swap_vars(arr[max], arr[lower])
        else
            swap_vars(arr[min], arr[lower]);
        lower := lower + 1;
        upper := upper - 1;
    end;
end;

begin
    test_sort(@selection_sort, 100);
end.
