program analyser;

uses SysUtils, Process;

var
    file_name: string;
    res: ansistring;

begin
    write('What text file would you like analysed? > ');
    readln(file_name);
    writeln('Analysing (lines|words|letters)');
    if RunCommand('/usr/bin/env', ['wc', file_name], res) then
        writeln(res)
    else
        writeln('failed');
end.
