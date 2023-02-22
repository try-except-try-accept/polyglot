

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

--Exercise 1 We need to first find the digits of a number. Define the functions
--toDigits :: Integer -> [Integer]
--toDigitsRev :: Integer -> [Integer]
--toDigits should convert positive Integers to a list of digits. (For 0 or negative inputs, toDigits should return
-- the empty list.) toDigitsRev should do the same, but with the digits reversed.
-- Example: toDigits 1234 == [1,2,3,4]
-- Example: toDigitsRev 1234 == [4,3,2,1]-
--Example: toDigits 0 == []
--Example: toDigits (-17) == []


-- find largest power of 10 that fits

digs 0 = []
digs x = digs (div x 10) ++ [mod x 10]