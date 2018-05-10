module A
where

isSquare :: Integer -> Bool
isSquare 1 = True
isSquare n = f 1 n where
  f a b
    | succ a == b = False
    | m*m == n    = True
    | m*m < n     = f m b
    | otherwise   = f a m
    where m = div (a+b) 2
    
squares :: [Integer]
squares =  map (\x -> x*x) [1..]

smallerthan :: Ord a => a -> [a] -> [a]
smallerthan n (x:xs)
  | x < n     = x : smallerthan n xs
  | otherwise = []

isCool :: Integer -> Bool
isCool x = (x >= 100) &&
           (s < 60) &&
           (isSquare $ 60*m + s)
  where s = mod x 100
        m = div x 100

coolSquares :: [Integer]
coolSquares = filter isCool $ smallerthan 6000 squares

isCold :: Integer -> Bool
isCold x = (x >= 10000) &&
           (s < 60) &&
           (m < 60) &&
           (isSquare $ h*60*60 + m*60 + s)
  where s = mod x 100
        hm = div x 100
        m = mod hm 100
        h = div hm 100
        
coldSquares :: [Integer]
coldSquares = filter isCold squares
    