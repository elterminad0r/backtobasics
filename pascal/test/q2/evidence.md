# November Computing test
## Izaak van Dongen

Evidence of testing:
![screenshot](https://github.com/elterminad0r/backtobasics/blob/be2f9ed608914456e9f635f131ae4276d89e4852/pascal/test/q2/testing_primes.png)

This is a correct list of the primes less than 50 (verified by GHCi).

Program source:

```Pascal
program PPrimes;

var
    Count1, Count2: integer;
    Prime: string;
begin
    writeln('The first few prime numbers are:');
    for Count1 := 2 to 50 do begin
        Count2 := 2;
        Prime := 'Yes';
        while Count2 * Count2 <= Count1 do begin
            if Count1 mod Count2 = 0 then
                Prime := 'No';
            Count2 := Count2 + 1;
        end;
        if Prime = 'Yes' then
            writeln(Count1);
    end;
end.
```

To make this algorithm work up to a user-supplied upper bound, it would need to seek input from the user, and store this upper bound in a variable - maybe something like this:

```Pascal
var
    upper: integer;
begin
    write('Enter the upper bound for the prime sieve'); read(upper);
```
