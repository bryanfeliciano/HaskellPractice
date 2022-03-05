import qualified Data.Set as S
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