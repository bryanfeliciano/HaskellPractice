lambda::Int->Int->Int->Bool
lambda = (\x y z-> if x^2+y^2==z^2 then True else False)

lambda2::[Int]->[Int]
lambda2 = \(x:xs)->xs ++ [x]

ifN:: Bool->(Int,Int)->Int
ifN True (x,_) = x
ifN False (_,y) = y

fstfunc::(Int,Int)->Int
fstfunc (x,y)= x

sndfunc::(Int,Int)->Int
sndfunc (x,y)= y

headfunc::[a]->a
headfunc (x:xs)=x

tailfunc::[a]->[a]
tailfunc (x:xs)= xs

beginsWith::Char->String->String
beginsWith c (x:xs)= if c == x then "True" else "False"

fifth::[Int]->Int
fifth (a:b:c:d:e:f:xs)= f

gcdfunc::Integer->Integer->Integer
gcdfunc 0 b = b
gcdfunc a b = gcd (b `mod` a)a

-- isSort::[a]->[a]
-- isSort [x:xs] = [x] isSort xs

-- msort :: Ord a => [a] -> [a]
-- msort [] = []
-- msort [a] = [a]
-- msort xs = merge (msort (firstHalf xs)) (msort (secondHalf xs))

-- firstHalf  xs = let { n = length xs } in take (div n 2) xs
-- secondHalf xs = let { n = length xs } in drop (div n 2) xs
---msort worked in my code editor but repl doesnt accept the import of merge

qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) =
  let smallerSorted = qsort [a | a <- xs, a <= x]
      biggerSorted = qsort [a | a <- xs, a > x]
  in  smallerSorted ++ [x] ++ biggerSorted