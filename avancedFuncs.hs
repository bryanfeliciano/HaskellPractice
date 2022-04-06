-- import Data.List hiding (insert)
-- import Test.QuickCheck

-- data Tree a = Leaf | Node (Tree a) a (Tree a)
--     deriving Show

-- -- Exercise 1
-- inv_tup_tree = aux (0,0)
--  where
--   aux (l,r) = Node (aux $ (l+1,r)) (l,r) (aux $ (l,r+1))
  
-- cut :: Integer -> Tree a -> Tree a
-- cut 0 _ = Leaf
-- cut n Leaf = Leaf
-- cut n (Node l v r) = Node (cut (n-1) l) v (cut (n-1) r)

-- -- Exercise 2
-- insert :: (Ord a) => a -> Tree a -> Tree a
-- insert v Leaf = Node Leaf v Leaf
-- insert v (Node l vt r)
--  | v <= vt = Node (insert v l) vt r
--  | v > vt  = Node l vt (insert v r)
 
-- inorder :: Tree a -> [a]
-- inorder Leaf = []
-- inorder (Node l v r) = (inorder l) ++ [v] ++ (inorder r)

-- prop_IIS xs = length xs > 5 ==> sort xs === xs'
--  where 
--   types = xs :: [Int]
--   xs' = inorder $ foldr insert Leaf xs