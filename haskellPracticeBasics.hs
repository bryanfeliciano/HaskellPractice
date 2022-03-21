-- elem' :: (Eq a)=> a->[a]->Bool
-- elem' _ [] = False
-- elem' x (y:ys) = if x == y then True else elem' x ys

-- nub' :: (Eq a) => [a]->[a]
-- nub' [] = []
-- nub' (x:xs)
--      |x `elem` xs = nub' xs
--      |otherwise = x:nub' xs

-- isAsc :: [Int]->Bool
-- isAsc [] = True 
-- isAsc [x] = True 
-- isAsc (x:y:xs)
--    |(x<y) = False 
--    |otherwise = isAsc xs