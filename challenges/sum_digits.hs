import Control.Monad
import Data.List
import Data.Char

fromDigits :: [Int] -> Int
fromDigits [] = 0
fromDigits (x:xs) = x + 10 * fromDigits xs

isBeautiful :: [Int] -> Int -> Bool
isBeautiful n k = diff `mod` k == 0
    where diff = abs (fromDigits n) (fromDigits $ reverse n)

result :: [[Int]] -> [Char]
result [] = "none found"
result (x:xs) = unwords $ map (intToDigit) x

main :: IO ()
main = do
    i_j_k <- getLine
    let (i:j:k:[]) = map (read) $ words i_j_k :: [Int]
    putStrLn $ result [x | x <- [i..j], isBeautiful xk
