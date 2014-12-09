-- Lab 4: Introduction to Haskell
import Data.List

double x = x + x

sumOfSquares x y = x*x + y*y

absVal x = if x >= 0 then x else -x

-- 'onlyEvens' returns a new list 
onlyEvens [] = []
onlyEvens (x:xs) = if (mod x 2 == 0) 
                   then x : onlyEvens xs
                   else onlyEvens xs

celsiusToFahrenheit t = (t * (9 / 5)) + 32

join [] = ""
join (x:xs) = x ++ join xs

numCommonSorted [] _ = 0
numCommonSorted _ [] = 0
numCommonSorted (x:xs) (y:ys)
	| x == y 	= 1 + numCommonSorted xs ys
	| x < y 	= numCommonSorted xs (y:ys)
	| x > y 	= numCommonSorted (x:xs) ys

numCommon a b = numCommonSorted (sort a) (sort b)

apply f x = f x

makeConstantFunction x = (\_ -> x)

listReverse [] = []
listReverse (x:xs) = listReverse xs ++ [x]

listReverseHelper [] acc = acc
listReverseHelper (x:xs) acc = listReverseHelper xs ([x] ++ acc)

listReverse2 l = listReverseHelper l []

myMap _ [] = []
myMap f (x:xs) = (f x) : (myMap f xs)

myFilter _ [] = []
myFilter f (x:xs) = if (f x) then x : (myFilter f xs) else (myFilter f xs)

myFoldl f [x,y] = (f x y)
myFoldl f (x:y:xs) = myFoldl f $ (f x y) : xs

