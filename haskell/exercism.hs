-- validate leap year  

isLeapYear :: Integer -> Bool
isLeapYear year
  | mod year 4 > 0 = False
  | mod year 100 > 0 || mod year 400 == 0 = True
  | otherwise = False
  
-- calculate age on given planet
  
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

