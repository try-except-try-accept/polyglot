
--Exercise 1 We need to first find the digits of a number. Define the functions
--toDigits :: Integer -> [Integer]
--toDigitsRev :: Integer -> [Integer]
--toDigits should convert positive Integers to a list of digits. (For 0 or negative inputs, toDigits should return
-- the empty list.) toDigitsRev should do the same, but with the digits reversed.
-- Example: toDigits 1234 == [1,2,3,4]
-- Example: toDigitsRev 1234 == [4,3,2,1]-
--Example: toDigits 0 == []
--Example: toDigits (-17) == []



intToDigitList :: Integer -> [Integer]
intToDigitList 0 = []
intToDigitList x = intToDigitList (div x 10) ++ [mod x 10] -- recursively div x by 10 until 0, concat with mod x 10

convert :: Integer -> [Integer]
convert x 
 | x <= 0 = []
 | otherwise = intToDigitList x

toDigits num = [d | d <- convert num]

toDigitsRev num = reverse (toDigits num)


-- Exercise 2 Once we have the digits in the proper order, we need to
-- double every other one. Define a function

revEnumerate seq = zip (reverse [0..length seq-1]) seq

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther digits = [if (mod i 2) == 1 then d * 2 else d | (i, d) <- (revEnumerate digits)] 


-- Exercise 3 The output of doubleEveryOther has a mix of one-digit
-- and two-digit numbers. Define the function
sumDigits :: [Integer] -> Integer

sumDigits numbers = sum [sum (toDigits num) | num <- numbers]


-- Exercise 4 Define the function

validate :: Integer -> Bool

--that indicates whether an Integer could be a valid credit card number.
--This will use all functions defined in the previous exercises.

getCheckDigit :: Integer -> Integer

getCheckDigit ccNum = sumDigits (doubleEveryOther (toDigits ccNum))

validate ccNum = (mod (getCheckDigit ccNum) 10) == 0