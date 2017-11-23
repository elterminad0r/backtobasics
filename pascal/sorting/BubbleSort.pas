{$MODE OBJFPC}

program BubbleSort;

uses SysUtils, SortUtils;

function bubble(arr: int_array): boolean;
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

procedure bubblesort(arr: int_array);
begin
    while bubble(arr) do
        continue;
end;

begin
    test_sort(@bubblesort, 100);
end.
