{$MODE OBJFPC}

program PTicketMachine;

type
    TState = (0, 20, 40, 50, 60, 70, 80, 90);
    TCoin  = (20, 50);

function CheckCoin(currentstate: TState; coin: TCoin): TState;
begin
    case currentstate of
         0: case coin of
                20:
                50:
        end;

        20: result := 
        40: result := 
        50: result := 
        60: result := 
        70: result := 
        80: result := 
        90: result := 
