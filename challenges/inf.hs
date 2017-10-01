send :: [Char] -> [Char]
send msg = "Izaak zegt " ++ send msg

> take 70 $ send "hallo"
"Izaak zegt Izaak zegt Izaak zegt Izaak zegt Izaak zegt Izaak zegt Izaa"
