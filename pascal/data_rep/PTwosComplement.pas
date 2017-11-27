{$MODE OBJFPC}

program PTwosComplement;

uses SysUtils, Math;

function _from_t_comp(from: string; i: integer): integer;
begin
    if i = 0 then
        _from_t_comp := 0
    else if from[i] in ['0', '1'] then
        if i = 1 then
            _from_t_comp := -1 * strtoint(from[i])
        else
            _from_t_comp := strtoint(from[i]) + 2 * _from_t_comp(from, i - 1)
    else
        _from_t_comp := _from_t_comp(from, i - 1);
end;

function from_t_comp(from: string): real;
begin
    if pos('.', from) <> 0 then
        from_t_comp := _from_t_comp(from, length(from))
                      * power(2, pos('.', from) - length(from))
    else
        from_t_comp := _from_t_comp(from, length(from));
end;

function _frac_to_binary(from: real): string;
begin
    if from = 0.0 then
        _frac_to_binary := '0'
    else
        if from >= 0.5 then
            _frac_to_binary := '1' + _frac_to_binary(2 * from - 1)
        else
            _frac_to_binary := '0' + _frac_to_binary(2 * from);
end;

function to_binary(from: integer): string;
begin
    if from = 0 then
        to_binary := '0'
    else
        to_binary := to_binary(from div 2) + inttostr(from mod 2);
end;

function to_binary(from: real): string;
begin
    to_binary := to_binary(trunc(from)) + '.' + _frac_to_binary(from - trunc(from));
end;

function _flip(from: string; i: integer): string;
begin
    if i = 0 then
        _flip := ''
    else if from[i] in ['0', '1'] then
        _flip := _flip(from, i - 1) + inttostr(1 - strtoint(from[i]))
    else
        _flip := _flip(from, i - 1) + from[i];
end;

function _complement(from: string; i: integer): string;
begin
    if i = 0 then
        _complement := ''
    else if from[i] = '1' then
        _complement := _flip(from, i - 1) + '1'
    else if from[i] = '0' then
        _complement := _complement(from, i - 1) + '0'
    else
        _complement := _complement(from, i - 1) + from[i];
end;

function complement(from: string): string;
begin
    complement := _complement(from, length(from));
end;

function to_t_comp(from: string): string;
begin
    try
        if from[1] = '-' then
            to_t_comp := complement(to_binary(abs(strtofloat(from))))
        else
            to_t_comp := to_binary(strtofloat(from));
    except
        on EConvertError do
            to_t_comp := 'invalid float';
    end;
end;

procedure menu;
var
    operation, operand: string;
begin
    write('Would you like to convert /from/ or /to/ two''s complement? ');
    readln(operation);
    if not ((operation = 'from') or (operation = 'to')) then
        writeln('unrecognised command')
    else begin
        write('What is your operand? '); readln(operand);
        if operation = 'from' then
            writeln(FormatFloat('0.##########################################',
                                from_t_comp(operand)))
        else if operation = 'to' then
            writeln(to_t_comp(operand));
    end;
end;

begin
    while true do menu;
end.
