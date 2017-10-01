import Control.Applicative
import Control.Monad
import System.IO

ways :: Int -> Int
ways n = dyn !! n
         where dyn = 1:1:2:[sum [dyn !! (i - j) | j <- [1, 2, 3]] | i <- [3..n]]

main :: IO ()
main = do
    s_temp <- getLine
    let s = read s_temp :: Int
    forM_ [1..s] $ \a0  -> do
        n_temp <- getLine
        let n = read n_temp :: Int
        print $ ways n
