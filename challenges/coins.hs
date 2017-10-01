import Control.Applicative
import Control.Monad
import System.IO
import Data.List
import Data.Map

_coinChange :: Int -> [Int] -> Int
_coinChange x c
    | x == 0 = 1
    | x < 0 = 0
    | otherwise = sum [_coinChange (x - (c !! i)) (drop i c) | i <- [0..length c - 1]]

coinChange :: Int -> [Int] -> Int
coinChange x c = r !! x
    where r :: Map (Int, [Int]) Int
          r = Map.fromList [((0, drop i c), 1) | i <- [0..length c - 1]]
          r = Map.insert
          coins :: Int -> [Int] -> Int
          coins n c = sum [r !! (n - coin) | coin <- c, n - coin >= 0]

mapManual =
    Map.insert 2 "two" . 
    Map.insert 4 "four" .
    Map.insert 1 "one" .
    Map.insert 3 "three" $ Map.empty

main :: IO ()
main = do
    n_temp <- getLine
    let n_t = words n_temp
    let n = read $ n_t!!0 :: Int
    let m = read $ n_t!!1 :: Int
    c_temp <- getLine
    let c = map read $ words c_temp :: [Int]
    -- Print the number of ways of making change for 'n' units using coins having the values given by 'c'
    putStrLn $ show $ coinChange n $ sort c

getMultipleLines :: Int -> IO [String]

getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)    
        let ret = (x:xs)    
        return ret          


