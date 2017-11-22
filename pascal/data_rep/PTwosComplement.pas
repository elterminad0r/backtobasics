program PTwosComplement;

uses SysUtils;

function _from_t_comp(from: string; i: integer): integer;
begin
    if i = 1 then
        _from_t_comp := -1 * strtoint(from[i])
    else
        _from_t_comp := strtoint(from[i]) + 2 * _from_t_comp(from, i - 1);
end;

function from_t_comp(from: string): integer;
begin
    from_t_comp := _from_t_comp(from, length(from));
end;

function to_binary(from: integer): string;
begin
    if from = 0 then
        to_binary := '0'
    else
        to_binary := to_binary(from div 2) + inttostr(from mod 2);
end;

function _flip(from: string; i: integer): string;
begin
    if i = 0 then
        _flip := ''
    else
        _flip := _flip(from, i - 1) + inttostr(1 - strtoint(from[i]));
end;

function _complement(from: string; i: integer): string;
begin
    if i = 0 then
        _complement := ''
    else if from[i] = '1' then
        _complement := _flip(from, i - 1) + '1'
    else
        _complement := _complement(from, i - 1) + '0';
end;

function complement(from: string): string;
begin
    complement := _complement(from, length(from));
end;

function to_t_comp(from: string): string;
begin
    if from[1] = '-' then
        to_t_comp := complement(to_binary(abs(strtoint(from))))
    else
        to_t_comp := to_binary(strtoint(from));
end;

procedure menu;
var
    operation, operand: string;
begin
    write('Would you like to convert /from/ or /to/ two''s complement? '); readln(operation);
    write('What is your operand? '); readln(operand);
    if operation = 'from' then
        writeln(from_t_comp(operand))
    else if operation = 'to' then
        writeln(to_t_comp(operand))
    else
        writeln('unrecognised operation');
end;

begin
    while true do menu;
end.
