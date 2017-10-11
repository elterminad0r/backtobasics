program PrimeFactors;

uses
    fgl, SysUtils;

type TIntegerList = specialize TFPGList<Integer>;

function unique_factor_product(target: integer): integer;
var
    primes: TIntegerList;
    i: integer;
    product: integer = 1;
    pindex: integer;
    is_prime: boolean;

begin
    primes := TIntegerList.create;
    for i := 2 to target do begin
        if target mod i = 0 then begin
            is_prime := true;
            for pindex := 0 to primes.count - 1 do begin
                if i mod primes.get(pindex) = 0 then begin
                    is_prime := false;
                    break;
                end;
            end;
            if is_prime then begin
                writeln('Factor encountered: ', i);
                product := product * i;
                primes.add(i);
            end;
        end;
    end;
    unique_factor_product := product;
end;

var
    target_no, uniq: integer;
begin
    writeln('Initialised');
    write('Enter target number > '); readln(target_no);
    uniq := unique_factor_product(target_no);
    writeln('Unique product is ', uniq);
end.
