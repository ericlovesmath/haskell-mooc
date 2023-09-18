-- :type "asdf" to view type in ghci
-- :quit, :load <file>, :reload
-- Types: Int (i64), Integer (isize), Double, Bool, String/[Char]

-- `div` is integer div, / is float div
-- show <anything> turnes into string
-- Recursion doesn't require keyword

module ModuleName where

charListAddition = "as" ++ "df"

_ = putStrLn charListAddition

-- /= is !=
price = if "a" /= "milk" then 1 else 2

phi :: Double
phi = (sqrt 5 + 1) / 2

polynomial :: Double -> Double
polynomial x = x ^ 2 - x - 1

f x = polynomial $ polynomial x

main = do
    print (polynomial phi)
    print (f phi)

-- Local Defs

circleArea :: Double -> Double
circleArea r = pi * rsquare
  where
    pi = 3.1415926
    rsquare = r * r

circleArea' r =
    let pi = 3.1415926
        rsquare = r * r
     in pi * rsquare

-- Pattern Matching

greet :: String -> String -> String
greet "Finland" name = "Hei, " ++ name
greet "Italy" name = "Ciao, " ++ name
greet "England" name = "How do you do, " ++ name
greet _ name = "Hello, " ++ name
