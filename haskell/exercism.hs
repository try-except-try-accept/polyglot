-- forbidden from using for pangrams task
--import qualified Data.Set as Set
import Data.Char

-------------------------------------------------------------
-- validate leap year  
-------------------------------------------------------------

isLeapYear :: Integer -> Bool
isLeapYear year
  | mod year 4 > 0 = False
  | mod year 100 > 0 || mod year 400 == 0 = True
  | otherwise = False
  
-------------------------------------------------------------
-- calculate age on given planet
-------------------------------------------------------------
  
data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune
              deriving (Eq)

  
secondsPerYear = 31557600

yearsOn :: Planet -> Float -> Float
yearsOn planet years
            | planet == Mercury = years / 0.2408467 
            | planet == Venus = years /  0.61519726
            | planet == Mars = years /  1.8808158
            | planet == Jupiter = years /  11.862615
            | planet == Saturn = years / 29.447498 
            | planet == Uranus = years / 84.016846 
            | planet == Neptune = years / 164.79132
            | otherwise = years

ageOn :: Planet -> Float -> Float
ageOn planet seconds = yearsOn planet (seconds / secondsPerYear)

-------------------------------------------------------------
-- validate pangram
-------------------------------------------------------------

getAsLowerCaseChars :: String -> String

-- old attempt
-- getAsLowercaseChars string = [Char.toLower c | c <- string, Char.isAlpha c]

getAsLowerCaseChars string =  map toLower (filter isAlpha string)

isPangram :: String -> Bool

-- not allowed to use Set
--isPangram text = length (Set.fromList (getAsLowercaseChars text)) == 26

-- old attempt
-- alphabet = ['a'..'z']
--isPangram text = length [letter | letter <- alphabet, elem letter (getAsLowercaseChars text)] == 26


isPangram text = length (filter (`elem` (getAsLowerCaseChars text)) ['a'..'z']) == 26


-------------------------------------------------------------
-- lackadaisical teenager bob
-------------------------------------------------------------

isQuestion :: String -> Bool
isYelled :: String -> Bool
isBlank :: String -> Bool
isQuestion xs = last xs == '?'
isYelled xs = xs /= "?" && all isUpper letters && not (null letters) where letters = (filter isAlpha xs)
isBlank xs = length xs == 0

processResponse :: String -> String
processResponse xs
    | isBlank xs = "Fine. Be that way!" --if you address him without actually saying anything.
    | isQuestion xs && isYelled xs = "Calm down, I know what I'm doing!" --if you yell a question at him.
    | isQuestion xs = "Sure." --if you ask him a question, such as "How are you?".
    | isYelled xs = "Whoa, chill out!" --if you YELL AT HIM (in all capitals).	    
    | otherwise = "Whatever." --to anything else.
	
extractNeeded :: String -> String
extractNeeded xs = filter (not . isSpace) xs

responseFor :: String -> String
responseFor xs = processResponse (extractNeeded xs)


-------------------------------------------------------------
-- collatz conjecture
-------------------------------------------------------------

process :: Integer -> Integer -> Maybe Integer

process n i
	| n <= 0 = Nothing
    | n == 1 = Just i
    | even n = process (div n 2) (i+1)
	| otherwise = process (succ (n * 3)) (i+1)

-- seems like a default param value here would be helpful to avoid having to make a second function?
collatz :: Integer -> Maybe Integer
collatz n = process n 0    
    
-------------------------------------------------------------
-- DNA to RNA
-------------------------------------------------------------


convert :: Char -> Char
convert n = case n of
    'G' -> 'C' 
    'C' -> 'G'
    'T' -> 'A'
    'A' -> 'U'

toRNA :: String -> Either Char String
toRNA xs
    | null invalid = Right (map convert xs)
    | otherwise = Left (head invalid)
    where invalid = filter (not . (`elem` "GCTA")) xs 