import Control.Monad

compress :: (Eq a) => [a] -> [(a, Int)]
compress [] = []
compress [x] = [(x, 1)]
compress (x:xs)
    | x == y    = (x, yc + 1):ys
    | otherwise = (x, 1):(y, yc):ys
    where
        (y, yc):ys = compress xs

fmt_compress :: [(Char, Int)] -> [Char]
fmt_compress = (unwords . map (\(x, count) -> unwords [[x], show count]))

main = do
    comptext <- getLine
    (putStrLn . fmt_compress . compress) comptext
