module Gphw2 where

import Data.List
------chapter 5-----
--url and api builder examples--

-- genApiRequestBuilder hostBuilder apiKey resource = (\id ->
--                                                     hostBuilder apiKey
--                                                     resource id)

-- exampleUrlBuilder = getRequestUrl "http://example.com"
-- myExampleUrlBuilder = exampleUrlBuilder "1337hAsk3ll"

-- exampleUrlBuilder = getRequestUrl "http://example.com" ? ? ?
-- myExampleUrlBuilder = exampleUrlBuilder "1337hAsk3ll" ? ?
--  myExampleUrlBuilder resource id

--excercise 5.3
-- exampleBuilder = getRequestUrl "http://example.com" "1337hAsk3ll" "books"

-- write a function binaryPartialApplication that takes a binary function and one argument and returns a
-- new function waiting for the missing argument.

binaryPartialApplication f = (\x -> f x)

-----------------Chapter 6-------------------------
-- Quick check 6.1 --
-- backwardsInfinity = reverse [1..] <-- do not run this --

-- Q6.1 Haskell has a function called repeat that takes a value and repeats it infinitely.
-- Using the functions you’ve learned so far, implement your own version of repeat.

-- repeatVal x = repeat x

-- Q6.2 Write a function subseq that takes three arguments: a start position, an end position, and a list. 
--The function should return the subsequence between the start and end. 

-- Q6.3 Write a function inFirstHalf that returns True if an element is in the first half of a
-- list, and otherwise returns False.
--(pseudo-code)--
--use length op /2 to split the list in two
-- use the fst op to look for the element

-------------chapter 7----------------

