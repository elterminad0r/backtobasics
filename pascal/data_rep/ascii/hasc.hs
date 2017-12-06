import System.Environment
import Control.Monad
import Data.Char

asc :: [Char] -> [Char]
asc = unwords . (map (show . ord))

main = do
    words <- getArgs
    forM_ words $ putStrLn . asc
