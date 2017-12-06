program PSetComp;

uses
    regexpr;

var
    SCompRe: TRegExpr;

begin
    SCompRe := TRegExpr.Create;
    SCompRe.Expression := '\{(.*?) *\| *x *(in|notin) *([NZQP]) *\^? *([^}]*?) *\}';
    if SCompRe.Exec('{x | x in Z ^ a = b}') then
        writeln(SCompRe.Match[1], ' ', SCompRe.Match[2], ' ', SCompRe.Match[3], ' ', SCompRe.Match[4])
    else
        writeln('no match');
end.
