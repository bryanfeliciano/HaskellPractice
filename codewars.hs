-- import Data.Char
---simple use of built in functions
-- makeUpperCase :: [Char] -> [Char]
-- makeUpperCase str = map toUpper str

---remove whitespaces function using the filter method
-- noSpace :: String -> String
-- noSpace = filter (/=' ')

-- | Takes a non-empty list and returns
--   both maximum and minimum value
--- Toying with the concepts of using multiple inputs within a case
---fold' is better but foldr is best
-- minMax :: (Ord a) => [a] -> (a, a)
-- minMax []     = error "empty list"
-- minMax (x:xs) = foldl (\(mn,mx) a -> (min mn a,max mx a)) (x,x) xs

--Turn positive integers into negative integers--
-- makeNegative :: (Num a, Ord a) => a -> a
-- makeNegative n
--   | n <= 0 = n
--   | otherwise = -n

---remove an element from a str---
---you can also use the filter method for a simpler way "filter(\x "elem you want to remove")"---
-- remove :: [Char] -> [Char]
-- remove xs = [ x | x <- xs, not (x `elem` ",.?!-:;\"\'") ]

--removing non consecutives from lists--
--example using the succesor operator--
-- firstNonConsecutive :: (Eq a,Enum a) => [a] -> Maybe a
-- firstNonConsecutive (x:y:xs) = if succ x == y then firstNonConsecutive (y:xs) else Just y
-- firstNonConsecutive _ = Nothing

--how to find out if a element has a said lenght and discard them using filter--
-- friend :: [String] -> [String]
-- friend = filter (\s -> length s == 4)

---targeting differences in a list with filter and not elem---
-- difference :: Eq a => [a] -> [a] -> [a]
-- difference xs ys = filter (`notElem` ys) xs

---simpler cc function
-- maskify :: String -> String
-- maskify str = (take len (repeat '#'))++ last
--        where last = (reverse . take 4 . reverse) str
--             len = length (drop 4 str)

--ask about these types of functions in class
-- findEvenIndex :: [Int] -> Int
-- findEvenIndex arr = if null is then -1 else head is
--   where is = [ i | i <- [0..length arr], sum (drop (i + 1) arr) == sum (take i arr) ]

--sort only odds in a list 
-- go [] _ = []
-- go xs [] = xs
-- go (x:xs) (o:os)
--   | odd x = o : go xs os
--   | otherwise = x : go xs (o:os) 
-- sortArray :: [Int] -> [Int]
-- sortArray [] = []
-- sortArray xs = go xs sortedOdds
--   where sortedOdds = sort . filter odd $ xs