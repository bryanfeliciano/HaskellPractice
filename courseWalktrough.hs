import Data.Char
import Data.List

rejectNonalphabethic :: String -> Maybe String
rejectNonalphabethic string =
    case (myAll isAlpha string) of
        False -> Nothing
        True -> Just string

myAll :: (a -> Bool) -> [a] -> Bool
myAll pred = foldr (\x y -> pred x && y) True

myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny pred (x:xs) =
    case (pred x) of
        True -> True
        False -> myAny pred xs
