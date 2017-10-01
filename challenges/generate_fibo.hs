import System.Environment
import Control.Monad

fibs :: [Int]
fibs = 1:1:(zipWith (+) fibs $ tail fibs)

main :: IO ()
main = do
    args <- getArgs
    let n = read $ head args :: Int
    mapM_ (putStrLn . show) $ take n fibs
