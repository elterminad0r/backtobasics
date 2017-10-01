import Control.Applicative
import Control.Monad
import System.IO
import Data.List

beautiful :: [Bool] -> Bool
beautiful s = not $ isInfixOf [False, True, False] s

replaceNth :: Int -> a -> [a] -> [a]
replaceNth n newVal (x:xs)
   | n == 0 = newVal:xs
   | otherwise = x:replaceNth (n-1) newVal xs

--replaceNths :: [Int] -> [a] -> [a] -> [a]
--replaceNths [] _ a = a
--replaceNths _ [] a = a
--replaceNths (i:is) (r:rs) a = replaceNths is rs (replaceNth i r a)

findSubseqIndex :: (Eq a) => [a] -> [a] -> Int
findSubseqIndex [] t = -1
findSubseqIndex (l:ls) t
    | isPrefixOf t (l:ls) = 0
    | otherwise = 1 + findSubseqIndex ls t

minSteps :: [Bool] -> Int
minSteps s
    | beautiful s = 0
    | otherwise = let
                    i = findSubseqIndex s [False, True, False]
                    subs = [i..i+2]
                  in
                    1 + minimum [minSteps (replaceNth j (not $ s !! j) s) | j <- subs]

main :: IO ()
main = do
    --n_temp <- getLine
    --let n = read n_temp :: Int
    --b <- getLine
    --let bools_b = [i == '1' | i <- b]
    --putStrLn $ show $ minSteps bools_b
    putStrLn $ show $ minSteps [False, True, False, True, False]
