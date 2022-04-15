-- Only 2 excercises from chapter 8 of get programming with haskell--
myReverse' [] = []
myReverse' (x:[]) = [x]
myReverse' (x:xs) = (myReverse' xs) ++ [x]

fastFib _ _ 0 = 0
fastFib _ _ 1 = 1
fastFib x y 3 = x + y
fastFib x y c = fastFib (x + y) x (c - 1)