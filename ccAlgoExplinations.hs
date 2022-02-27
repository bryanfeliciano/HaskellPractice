module CoveredIntervals where

import Data.List (sortBy, foldl')

-- This step isn't necessary to solve the problem, but we should probably sanitize the input data first.
-- This list comprehension will discard any sublists that don't match the pattern [l, r] (lists
-- without exactly two elements) and invalid intervals (where right element isn't larger than left).
-- We also convert the sublists into tuples, which is a more appropriate data structure for this
-- problem than nested lists.
cleanIntervals :: [[Int]] -> [(Int, Int)]
cleanIntervals xs = [(l, r) | [l, r] <- xs, r > l]

-- The next step is to sort the intervals in a particular way, so we can then detect any "covered" 
-- intervals and discard them from the list (in the following step).
sortIntervals :: [(Int, Int)] -> [(Int, Int)]
-- `sortBy` allows us to sort a list of values according to any binary sorting function that we specify.
-- Its signature is `(a -> a -> Ordering) -> [a] -> [a]`, where `(a -> a -> Ordering)` is our sorting
-- function. `Ordering` is a sum type with three possible values: LT, GT, or EQ.
sortIntervals = sortBy (\(l, r) (l', r') ->
  -- We use the `compare` function on the left values of the interval, then case-match on the 
  -- returned `Ordering` value:
  case compare l l' of
    -- If the intervals have different left values, we can simply return the same `Ordering` value:
    LT -> LT
    GT -> GT
    -- If the intervals have the same left value, we now need to compare them on their right values.
    -- However, we need to reverse the ordering now, so the larger interval precedes the smaller one.
    -- The reasoning behind this should be more clear once we get to the next step, when we fold over
    -- the sorted intervals. For now, note that in the example provided [[3,8],[1,4],[3,5],[1,2]] sorts
    -- to [[1,4],[1,2],[3,8],[3,5]], *not* [[1,2],[1,4],[3,5],[3,8]].
    -- We can achieve this by simply switching the order of the arguments we pass to a second 
    -- instance of `compare`:
    EQ -> compare r' r)
    -- Now whenever two intervals begin at the same left position, the wider interval will be treated
    -- as "Less Than" the smaller one, preceding it in our sorted results.

-- With the intervals sorted, we can now check if each interval is covered by the one that preceded it. 
-- Folds, or "catamorphisms", are frequently used to reduce structured data into a single summary value. 
-- However, they can also "rebuild" the structure that is being reduced, which is how map and filter 
-- functions work. We're going to use a fold to execute a complex filter on our list of intervals, 
-- returning a new list that omits any "covered" intervals. 
foldIntervals :: [(Int, Int)] -> [(Int, Int)]
-- If the input list is empty, we just return an empty list.
foldIntervals [] = []
-- For non-empty input, we'll fold using the strict version of Haskell's left fold, `foldl'`.
-- We want a left-associative fold for this problem, because our intervals are ordered from left to
-- right, and they need to be checked in that same order.
-- For performance reasons we choose `foldl'` over the lazy `foldl`, which is memory inefficient due
-- to its left-associativity. See Ch. 10 "Folding Lists" in Haskell Programming from First Principles
-- for a thorough explanation of left and right folds and their performance implications.

-- Take a look at the type signature for foldl':
-- foldl' :: Foldable t => (b -> a -> b) -> b -> t a -> b
-- It takes a binary reducer function of type `b -> a -> b`, an initial accumulator value (`b`),
-- and a "foldable" data structure (`t a`, which in our case is a list of tuples).

-- We'll define our reducer function `dropCovered` as a helper function inside a `where` block for
-- readability.
-- Our initial accumulator value will be the first interval in our list (`x`), enclosed in brackets. 
-- Our accumulator is in list format, since we are building a new list as we fold/filter the old one. 
-- Our "foldable" is the list of remaining intervals (`xs`).
foldIntervals (x:xs) = foldl' dropCovered [x] xs
  where
    -- `dropCovered` takes the accumulated list of "uncovered" intervals as its first parameter,
    -- followed by the next interval to be checked...
    dropCovered :: [(Int, Int)] -> (Int, Int) -> [(Int, Int)]
    -- We use pattern matching to deconstruct the head of the accumulated list, so we can check its
    -- left and right values (l, r) against the current interval's (l', r').
    dropCovered acc@((l, r) : _) (l', r')
      -- If the current interval's left value is GT/EQ that of the previous interval, and its right
      -- value is LT/EQ the previous interval's, this means it is fully covered. 
      -- We ignore this interval and return the accumulated list as it is.
      | l' >= l && r' <= r = acc 
      -- Otherwise, the interval isn't fully covered so we'll prepend it to the accumulator.
      | otherwise = (l', r') : acc
-- This `dropCovered` reducer function will be called repeatedly by `foldl'` until it reaches the end
-- of the list, then return the final accumulator value (our filtered list of uncovered intervals).

-- We now have all the functionality we need to solve the problem. We compose it all together with
-- the `length` function to get the final count of uncovered intervals.
countUncovered :: [[Int]] -> Int
countUncovered = length . foldIntervals . sortIntervals . cleanIntervals