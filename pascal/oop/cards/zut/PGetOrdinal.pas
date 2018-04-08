{$MODE OBJFPC}

program PGetOrdinal;

uses SysUtils;

const
    nums: array[0..12] of string = ('two', 'three', 'four', 'five', 'six',
                                    'seven', 'eight', 'nine', 'ten', 'jack',
                                    'queen', 'king', 'ace');

function get_ordinal(name: string): integer;
var
    i: integer;
begin
    for i := 0 to 12 do
        if nums[i] = name then
            exit(i);
    raise Exception.Create(Format('Unrecognised card "%s"', [name]));
end;

begin
    writeln(get_ordinal('three'));
    writeln(get_ordinal('six'));
    writeln(get_ordinal('ace'));
    writeln(get_ordinal('queen'));
    writeln(get_ordinal('edwin'));
end.
