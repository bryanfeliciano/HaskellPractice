import qualified Data.Set as S
import Data.Char
import Data.List
--two sum leetcode algorythm using "any" keyword
--applying any to lambda function 
-- /= just means not equal
twoSum::[Int]->Int->Bool
twoSum xs target = any(\x->target-x /=x && S.member(target-x)mySet)xs
    where mySet = S.fromList xs

--find the way to filter all odd and even elem from a list
findOutlier::[Int]->Int
findOutlier xs
         |[n]<-filter even xs = n
         |[n]<-filter odd  xs = n

--square and sum all elem within a list
squareSum :: [Integer] -> Integer
squareSum = sum . map (^2)

---replace alphabet elem with placement
alphabetPosition :: String -> String
alphabetPosition = unwords . filter ("" /= ) . map charReplace

charReplace :: Char -> [Char]
charReplace c =  maybe "" show (lookup (toLower c) dict)

dict = zip ['a'..'z'] [1..26]

---return all oddly appearing integers in a list
findOdd :: [Int] -> Int
findOdd xs = elim (sort xs)
elim [x] = x
elim (x:y:xs) = if x == y then elim xs else x

---Given a string of digits, you should replace any digit below 5 with '0' and any digit 5 and above with '1'. Return the resulting string.
fakeBin :: String -> String
fakeBin = map (\c -> if c < '5' then '0' else '1' )

---You will be given a number and you will need to return it as a string in Expanded Form. For example:
-- expandedForm 12    -- Should return '10 + 2'
-- expandedForm 42    -- Should return '40 + 2'
-- expandedForm 70304 -- Should return '70000 + 300 + 4'
-- NOTE: All numbers will be whole numbers greater than 0.
---intercalate xs xss is equivalent to (concat (intersperse xs xss)). It inserts the list xs in between the lists in xss and concatenates the result.
expandedForm :: Int -> String
expandedForm = intercalate " + " . map(\(n, c) ->  c : replicate n '0' ) . reverse . filter ((/='0') . snd) . zip [0..] . reverse . show