import Control.Applicative
import Control.Monad
import System.IO

isPrime :: Int -> Bool
isPrime n = not $ any (\x -> n `mod` x == 0) [2..n-1]

largestFactor :: Int -> Int
largestFactor n = _largestFactor n n
    where  _largestFactor :: Int -> Int -> Int
           _largestFactor a b
              | (a `mod` b == 0) && isPrime b = b
              | otherwise = _largestFactor a (b - 1)

main :: IO ()
main = do
    t_temp <- getLine
    let t = read t_temp :: Int
    forM_ [1..t] $ \a0  -> do
        n_temp <- getLine
        let n = read n_temp :: Int
        putStrLn $ show $ largestFactor n

notDivisible :: Int -> [Int] -> Bool
notDivisible n divisors = not $ any (\x -> n `mod` x == 0) divisors

primesTo :: Int -> [Int]
primesTo n = _primesTo n [3, 2] 5
      where _primesTo :: Int -> [Int] -> Int -> [Int]
            _primesTo n primes curr
               | curr > n = primes
               | notDivisible curr primes = _primesTo n (curr:primes) (curr + 2)
               | otherwise = _primesTo n primes (curr + 2)

getMultipleLines :: Int -> IO [String]

getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)    
        let ret = (x:xs)    
        return ret          

