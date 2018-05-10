module Microwave
where

appearanceToSeconds :: Integral a => a -> a
appearanceToSeconds a = y + 60*x
  where (x,y) = divMod a 100

secondsToAppearance :: Integral a => a -> a
secondsToAppearance a = y + 100*x
  where (x,y) = divMod a 60

intersectAscending :: Ord a => [a] -> [a] -> [a]
intersectAscending [] _ = []
intersectAscending _ [] = []
intersectAscending (x:xs) (y:ys)
  | x < y     = intersectAscending xs (y:ys)
  | y < x     = intersectAscending (x:xs) ys
  | otherwise = x : intersectAscending xs ys

isValidLooks :: Integral a => a -> Bool
isValidLooks x = x >= 100 && mod x 100 < 60

before :: (a -> Bool) -> [a] -> [a]
before f [] = []
before f (x:xs)
  | f x       = []
  | otherwise = x : before f xs
  
looksAnHourOrMore :: Integral a => a -> Bool
looksAnHourOrMore a = a >= 6000

microwave :: Integral a => [a] -> [a]
microwave nums = map secondsToAppearance $ validSecondsWithAMatch
  where validLooksNums = filter isValidLooks $ before looksAnHourOrMore nums
        validSeconds = map appearanceToSeconds validLooksNums
        validSecondsWithAMatch = intersectAscending nums validSeconds

squares = map (\x -> x*x) [1..]
cubes = map (\x -> x*x*x) [1..]
primes = 2 : oddPrimes
  where oddPrimes = 3 : filter checkPrime (iterate (+ 2) 5)
        checkPrime n = f n oddPrimes
        f n (p:ps)
          | p*p > n      = True
          | mod n p == 0 = False
          | otherwise    = f n ps
fibonaccis = map fst $ iterate f (1,2)
  where f (a,b) = (b,a+b)
powers n = map (\x -> x^n) [1..]
