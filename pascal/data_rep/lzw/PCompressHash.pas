program PCompressHash;
{ demonstrations of LZW compression
  Amend the main program to study the algorithms
  This version uses a TDictionary hash table for the dictionary
  to make looking up codes much more efficient
   }

{$MODE DELPHI}

uses
  SysUtils,Generics.Collections;

type
  KeyList = array of word; // 16-bit unsigned integers
  //NB better compression could probably be achieved by using smaller integers
  // eg 12-bit or 14-bit. This would involve working at the level of bytes

const
  DICTMAX = 16384; //Maximum Dictionary size:
  // experiment with this to explore effect on compression ratio

procedure menu(var option: integer);

begin
  writeln('This program demonstrates the LZW compression algorithm');
  writeln;
  writeln('1. Demonstration of how the dictionary is built and used');
  writeln('2. Compress to array of integers and then decompress');
  writeln('3. Compress a text file');
  writeln('4. Decompress a text file');
  writeln('9. Exit');
  repeat
    readln(option)
  until option in [1 .. 9];
end;

function LZW(s: string): string;
// compresses s using LZW: displays workings including dictionary entries and
// final list of integers
var
  Dict:TDictionary<string,word>;//hash table with string as key, integer as value
  l: integer;
  i, DictLength: word; // 16-bit unsigned
  current: string;
  ch: char;

begin
  Dict:=TDictionary<string,word>.Create; //create dictionary

  // initialise dictionary with ASCII chars 0-255
  for i := 0 to 255 do
    Dict.Add(chr(i),i);
  DictLength := 256;

  current := '';
  result := '';

  for l := 1 to length(s) do
  begin
    ch := s[l];

    // lookup (current string + next char in s)  in Dictionary
    if  Dict.ContainsKey(current+ch) then // if current+ch is found in dictionary
      // append ch to current and go round again,
      // trying to match one more character
      current := current + ch

    else // not found
    begin
      // append the position of the longest matching entry to the result,
      // formatted to look pretty
      Dict.TryGetValue(current,i); //get code corresponding to current
      result := result + inttostr(i) + ':' + current + #10#13;
      if DictLength < DICTMAX - 1 then // if the dictionary is not full
      // add a new entry for the string that failed to match
      begin
        Dict.Add(current + ch,DictLength);
        writeln('Entry ', DictLength, ': ', current+ch);
        inc(DictLength);
      end;
      // reset current to the character that failed to match
      current := ch;
    end; // else
  end; // for

  // add final string to result
  Dict.TryGetValue(current,i);
  result := result + inttostr(i) + ':' + current + #10#13;

  Dict.Free;
end;

function LZW2(s: string): KeyList;
// compresses s using LZW: outputs array of integers

var
  Dict:TDictionary<string,word>;
  l: integer;
  i, n, DictLength: word; // 16-bit unsigned
  current: string;
  ch: char;

begin
  Dict:=TDictionary<string,word>.Create;
  // initialise dictionary with ASCII chars 0-255

  for i := 0 to 255 do
     Dict.Add(chr(i),i);
  DictLength := 256;

  current := '';
  setlength(result, length(s));
  // (number of keys required cannot exceed length of s)
  n := 0;

  for l := 1 to length(s) do
  begin
    ch := s[l];

    // lookup (current string + next char in s)  in Dictionary
    if  Dict.ContainsKey(current+ch) then // if current+ch is found in dictionary
      // append ch to current and go round again,
      // trying to match one more character
      current := current + ch

    else // not found
    begin
      // append the position of the longest matching entry to the array
      Dict.TryGetValue(current,i);//get code corresponding to current
      inc(n);
      result[n - 1] := i;
      if DictLength < DICTMAX - 1 then // if the dictionary is not full
      // add a new entry for the string that failed to match
      begin
        Dict.Add(current + ch,DictLength);
        inc(DictLength);
      end;
      // reset current to the character that failed to match
      current := ch;
    end; // else
  end; // for

  // add final code to result
  inc(n);
  Dict.TryGetValue(current,i);
  result[n - 1] := i;
  setlength(result, n); // chop off unused portion of array

  Dict.Free;
end;

function deLZW(LZWList: KeyList): string;
// decompresses LZWList
var

  entry, lastentry: string;
  Dict: array [0 .. DICTMAX - 1] of string;
  //array is fine here because no need to lookup strings

  i, DictLength, prevcode, currentcode: word; // 16-bit unsigned
  ch: char;

begin
  // initialise dictionary
  for i := 0 to 255 do
    Dict[i] := chr(i);
  DictLength := 256;

  result := '';

  prevcode := LZWList[0];
  result := result + Dict[prevcode];
  lastentry := result;

  for i := 1 to length(LZWList) - 1 do
  begin
    currentcode := LZWList[i];
    if currentcode < DictLength then
      entry := Dict[currentcode]
    else
      entry := lastentry + lastentry[1];
    result := result + entry;
    ch := entry[1];
    if DictLength < DICTMAX then
    begin
      Dict[DictLength] := Dict[prevcode] + ch;
      inc(DictLength);
    end;
    prevcode := currentcode;
    lastentry := entry;
  end;

end;

procedure TextToLZWFile(filename: string);
//compresses text file (filename) to file of word: 'filename.lzw'

var
  infile: textfile;
  lzwfile: file of word;
  s, line: string;
  Dict:TDictionary<string,word>;
  l: integer;
  i, DictLength, code: word; // 16-bit unsigned
  current: string;
  ch: char;

begin
  assignfile(infile, filename);
  reset(infile);
  while not eof(infile) do
  begin
    readln(infile, line);
    s := s + line + #13#10;
  end;

  assignfile(lzwfile, filename + '.lzw');
  rewrite(lzwfile);

  Dict:=TDictionary<string,word>.Create;

  // initialise dictionary with ASCII chars 0-255
  for i := 0 to 255 do
     Dict.Add(chr(i),i);
  DictLength := 256;

  current := '';

  for l := 1 to length(s) do
  begin
    ch := s[l];
    // lookup (current string + next char in s)  in Dictionary
    if  Dict.ContainsKey(current+ch) then // if current+ch is found in dictionary
      current := current + ch
    else // not found
    begin
      Dict.TryGetValue(current,code);//lookup current (longest match) in dictionary
      write(lzwfile, code); //write the integer code to the file

      if DictLength < DICTMAX - 1 then // add unmatched string to dictionary
      begin
        Dict.Add(current + ch,DictLength);
        inc(DictLength);
      end;
      current := ch;

    end;
  end;

  // add final key to file
  Dict.TryGetValue(current,code);

  write(lzwfile, code);
  closefile(lzwfile);
  Dict.Free;
end;

procedure LZWFileToText(filename: string);
//decompresses filename.lzw (file of word) to 'filename.txt'
var
  lzwfile: file of word;
  outfile: textfile;
  s, entry, lastentry: string;
  Dict: array [0 .. DICTMAX - 1] of string;

  i, DictLength, prevcode, currentcode: word; // 16-bit unsigned
  ch: char;

begin
  // initialise dictionary
  for i := 0 to 255 do
    Dict[i] := chr(i);
  DictLength := 256;

  s := '';
  assignfile(lzwfile, filename);
  reset(lzwfile);
  read(lzwfile, prevcode);
  s := s + Dict[prevcode];
  lastentry := s;
  while not eof(lzwfile) do
  begin
    read(lzwfile, currentcode);
    if currentcode < DictLength then
      entry := Dict[currentcode]
    else
      entry := lastentry + lastentry[1];
    s := s + entry; //this is slow? better to write to file in chunks?
    ch := entry[1];
    if DictLength < DICTMAX then
    begin
      Dict[DictLength] := Dict[prevcode] + ch;
      inc(DictLength);

    end;
    prevcode := currentcode;
    lastentry := entry;

  end;
  closefile(lzwfile);
  assignfile(outfile, filename + '.txt');
  rewrite(outfile);
  write(outfile, s);
  closefile(outfile);
end;

var
  filename, raw, line: string;

  i,choice: integer;
  LZWList: KeyList;

begin
 repeat
    menu(choice);
    case choice of
      1:
        begin
          writeln('Enter text to compress:');
          readln(raw);
          writeln(LZW(raw)); // display workings of the algorithm
        end;
      2:
        begin
          writeln('Enter text to compress:');
          readln(raw);
          LZWList := LZW2(raw); // convert raw to an array of word
          writeln('Integer codes after compression:');
          for i := 0 to length(LZWList) - 1 do // display array of word
            writeln(inttostr(LZWList[i]));
          writeln('Decompressed text:');
          writeln(deLZW(LZWList)); // decompress and display array of word
        end;
      3:
        begin
          write('Enter full name of file to be compressed (include .txt extension): ');
          readln(filename);
          TextToLZWFile(filename);
          // compresses filename(textfile) to file of word
          writeln('Check to see how much the file size has decreased.');
          writeln('The compressed file has an extra .lzw extension');
        end;
      4:
        begin
          write('Enter full name of file to be decompressed (include .txt.lzw extension: ');
          readln(filename);
          LZWFileToText(filename);
          // decompresses filename (file of word) to textfile
          writeln('The original file has been restored with an extra .txt extension');

        end;

    end;
  until choice = 9;

end.
