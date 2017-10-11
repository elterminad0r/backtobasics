uses AnySort
 
procedure SortArrayInteger(var arr: array of Integer; count: Integer);
 
implementation
 
function CompareInt(const d1,d2): integer;
var
  i1 : integer absolute d1;
  i2 : integer absolute d2;
begin
  if i1=i2 then Result:=0
  else if i1<i2 then Result:=-1
  else Result:=1;
end;
 
procedure SortArrayInteger(var arr: array of Integer; count: Integer);
begin
  AnySort(arr, Count, sizeof(Integer), CompareInt);
end;
