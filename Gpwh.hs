module Gpwh where
    
import Data.List

--get programming with haskell excercises--
--chapter 2--
--increment ,square and double--

inc' :: Int -> Int ->Int
inc' x y = x + y

sqr' :: Num a => a -> a
sqr' num' = num' * num'

doub' :: Num a => a -> a
doub' z = z * 2

ifEven' :: Integral a => a -> a
ifEven' n 
    |(n `mod` 2 == 0) = n - 2
    |otherwise = 3 * n + 1

-------------------Chapter 3---------------------------
--lambda's and lexicon--
--hint provided: start from the bottom--
    --rewritting lambdas--
    -- counter x = let x = x + 1
    -- in
    -- let x = x + 1
    -- in
    -- x

counter x = (\x -> x + 1)

--------------Chapter 4---------------------------
        --First class functions--

ifEven myFunction x = if even x then myFunction x else x

inc n = n + 1
double n = n*2
square n = n^2

cube n = n^3

negate' n = negate n

ifEvenInc n = ifEven inc n
ifEvenDouble n = ifEven double n
ifEvenSquare n = ifEven square n
ifEvenCube n = ifEven cube n
ifEvenNegate n = ifEven negate' n

names = [("Ian", "Curtis"),
         ("Bernard","Sumner"),
         ("Peter", "Hook"),
         ("Stephen","Morris")]

-- sortNames n = sort n (only sorts first elem)
--use SortBy in conbination with comparelast names

-- compareNames :: (Ord a1, Ord a2) => (a1, a2) -> (a1, a2) -> Ordering
-- compareNames name1 name2 
--         |(firstName1 > firstName2) = GT
--         |(firstName1 < firstName2)  = LT
--         |(lastName1 > lastName2) = GT
--         |(lastName1 < lastName2)  = LT
--         |otherwise = EQ
--            where 
--              firstName1 = fst name1
--              firstName2 = fst name2
--              lastName1 = snd name1
--              lastName2 = snd name2


addressLetter name location = locationFunction name
    where locationFunction = getLocationFunction location


sfOffice name = if lastName < "L" then nameText ++ " - PO Box 1234 - San Francisco, CA, 94111" else nameText ++ " - PO Box 1010 - San Francisco, CA, 94109"
 where 
     lastName = snd name
     nameText = (fst name) ++ " " ++ lastName
nyOffice name = nameText ++ ": PO Box 789 - New York, NY, 10013"
 where nameText = (fst name) ++ " " ++ (snd name)

getLocationFunction location = 
    case location of
       "ny" -> nyOffice
       "sf" -> sfOffice
       "reno" -> renoOffice
        _ -> (\name -> (fst name)
