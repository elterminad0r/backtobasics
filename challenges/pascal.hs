import Control.Monad

pascal :: [Int] -> Int -> [[Int]]
pascal row 1 = [row]
pascal row n = row:(pascal next_row (n-1))
    where next_row = zipWith (+) (0:row) $ row ++ [0]

main = do
    n <- readLn
    mapM_ (putStrLn . unwords . map show) $ pascal [1] n
