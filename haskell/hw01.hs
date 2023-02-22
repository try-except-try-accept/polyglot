

-- everything is a definition
-- everything is immutable. no globals.
-- statically typed, lazy evaluation
-- a function with no params is known as a definition (calories below is a definition, not a variable)
-- multi-line string requires \ on each line
-- comments begin with --
-- ++ concat sequence
-- : prepend one item to list	 item : a
-- max x, y, min, succ, odd, even, mod
-- /= == %% ||
-- if statement must always have an else
-- !! subscription operator      sequence !! index
-- sequence funcs: head, tail, init, last, length, reverse, take, drop, maximum, minimum, sum, product, elem (in)
-- repeat i      -- infinite replication
-- cycle a

-- list comps / map 
--		[x*2 | x <- [1..10]]      			double each integer from 1 to 10 inclusive
--	    [x*2 | x <- [1..10], x*2 >= 12]     double each integer where result >= 12
--
-- filter:
--		funcName seqName = [conditionalStatement | iterableSource, predicate]
--		iterableSource e.g.   item <- seqName     equivalent to     item for item in seqName
--		predicate = some function that takes a single argument and returns type: bool
--
-- map:
-- 
-- map (operation) sequence


-- always give type dec for function

-- 		funcName :: Type - Type

-- funcName :: (paramClass param) => param -> returnType        use if param is a class, not a type

-- valid types: String, Int, Float, Bool, Char, [Type]

-- typecasting read "stringvalue" || Type


-- case statement sort of thing as function ("pattern matching")

--funcName :: paramClass - returnType

-- funcName :: (paramClass param) => param -> returnType
-- funcName case1 = result1
-- funcName case2 = result2
-- funcName case3 = result3

-- pattern matching list comprehension example

-- ghci> let xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]  
-- ghci> [a+b | (a,b) <- xs]  
-- [4,7,6,8,11,4]   

-- enumerate is not a built-in, but can be redefined very beautifully:

-- enumerate = zip [0..]   --   to enumerate is to zip with a 0 to infinity sequence



-- "guard" = pattern matching based on condition

-- funcName :: (paramType param) => param -> returnType
-- funcName param
--		|	param <logical test1> = result1
--		|	param <logical test2> = result2
--		|	otherwise = result3

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

toDigits num = [d | d <- convert num, d > 0]

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