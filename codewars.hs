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

-- basicOp :: Char -> (Int -> Int -> Int) 
-- basicOp x
--   | x == '+' = (+)
--   | x == '-' = (-)
--   | x == '*' = (*)
--   | x == '/' = div

--is the elem within the arr?
-- check :: Eq a => [a] -> a -> Bool
-- check [] a = False
-- check (x:xs) a = 
--   if x == a then
--     True
--   else
--     check xs a

--count of elem in string
--remember using length works with the filter method
-- getCount :: String -> Int
-- getCount = length . filter (`elem` "aeiou")

--- if elem is in list more than once return (  otherwise return )
--- targeted length of elem and then used a helper function
--     duplicateEncode :: String -> String
-- duplicateEncode xs = map encode xs' where
--   xs' = map toLower xs
--   encode c = if length (filter (== c) xs') > 1 then ')' else '('

---keep sum of pos on x and neg on xs
-- countPositivesSumNegatives :: Maybe [Int] -> [Int]
-- countPositivesSumNegatives Nothing = []
-- countPositivesSumNegatives (Just []) = []
-- countPositivesSumNegatives (Just xs) = [length pos, sum neg]
--     where pos = filter (>0) xs
--           neg = filter (<0) xs