isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome [] = True
isPalindrome [_] = True
isPalindrome (x:xs)
    | x == last xs = isPalindrome $ init xs
    | otherwise = False

main = do
    print $ isPalindrome "izaak"
    print $ isPalindrome "dfslakhjfasldjhfwj"
    print $ isPalindrome "arera"
    print $ isPalindrome "racecar"
    print $ isPalindrome "amanaplanacanalpanama"
