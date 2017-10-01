import Control.Monad
import Data.List

findPassword :: [Char] -> [[Char]] -> [[[Char]]]
findPassword [] _ = [[[]]]
findPassword attempt passes = concat [map (pass:) (findPassword (drop (length pass) attempt) passes) | pass <- passes, pass `isPrefixOf` attempt]

simplify :: [[[Char]]] -> [Char]
simplify [] = "WRONG PASSWORD"
simplify (x:xs) = unwords x

main :: IO ()

main = do
    t_s <- getLine
    let t = read t_s :: Int
    forM_ [0..t - 1]  (\i -> do
        n_s <- getLine
        let n = read n_s :: Int
        passes_s <- getLine
        let passes = words passes_s
        attempt <- getLine
        putStrLn $ simplify $ findPassword attempt passes
        )
