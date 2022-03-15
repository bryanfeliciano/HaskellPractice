import Data.List
import Data.Char 

power::Int->Int->Int
power m n
    | (n `mod` 2 == 0) = 1
    | otherwise = -1

twoPower = power 2

collatz :: Int -> Int
collatz n | even n    = n `div` 2
          | otherwise = 3 * n + 1

---did this since the compiler didnt like me using the cons op after n`div`2 or 3*n+1
collatzList :: Int -> [Int]
collatzList n | n <= 0    = error "Collatz.collatzList: n must be positive"
              | n == 1    = 1 : []
              | otherwise = n : collatzList (collatz n)

primes ::Int->[Int]
primes n = prim[2..n]
   where 
    prim(x':xs)= x' : prim [x|x <- xs, x `mod` x' > 0]
---this function works but then it breaks with non-exhaustive pattern,still correct output---

encode :: Eq a => [a] -> [(a, Int)]
encode = map (\x -> (head x, length x)) . group
---found the group op in data.list while looking for a way to store eq items together

uppercase m = words (map (toUpper) m)
---uppercase all elements
shiftedchar c n = chr((mod ((ord c - ord 'A') + n) 26) + ord 'A')
---map trough to find the index of the char and add n
shiftedword w n = map (`shiftedchar` n) w

caeser m n = unwords(map (`shiftedword` n) (uppercase m))
---call function like this -> caeser "haskell" 0