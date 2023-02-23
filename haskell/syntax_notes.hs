

-- everything is a function
-- everything is immutable. no globals. no side-effects
-- statically typed, lazy evaluation
-- a function with no params is known as a definition (calories below is a definition, not a variable)
-- multi-line string requires \ on each line
-- comments begin with --
-- ++ concat sequence
-- : prepend one item to list	 item : a
-- max, min, succ, odd, even, mod
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

-- 		funcName :: paramType -> returnType

-- multiple params:

-- 	    funcName :: param1Type -> param2Type -> returnType   // in actuality anything can only take 1 param (curried function)

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


-- this works sort of like an enum / record

-- data ParentClass : ChildClass1 |  ChildClass2 | ChildClass3 | ChildClass4 deriving (funcName)

-- deriving signals inherited behaviour from other types?


-- using case is perhaps better than guard conditions:

-- case expression of pattern -> result  
--                    pattern -> result  


-- import Module.Type     // imports all module's functions directly

-- import qualified Module.Type as Type   // alias functions to force using Type.funcName ?

-- learn to use map and filter properly
--
-- map funcName sequence
-- filter funcName sequence
-- filter (operator compValue) sequence
--
-- e.g. map Char.toLower sentence


-- when function is passed as arguments you can combine multiple functions with the dot operator (function composition)

-- example :

-- filter (not . isSpace) xs          // finds all non-space elements of xs


-- where name = expression    // allows you to define a name inside a function to avoid repetition



-- umbrella types in function declarations --- weird

-- funcName :: paramType -> Maybe returnType  (allows null to be returned)

-- most combine with use of Just keyword when returning strict type value...          Just returnType