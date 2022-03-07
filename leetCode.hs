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