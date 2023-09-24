import Data.Array

-- zip :: [a] -> [b] -> [(a, b)]    -- two lists to list of pairs
-- unzip :: [(a, b)] -> ([a], [b])  -- list of pairs to pair of lists
-- partition :: (a -> Bool) -> [a] -> ([a], [a])    -- elements that satisfy and don't satisfy a predicate
-- foldr   -- Used over foldl
swap (x, y) = (y, x)

-- Type Classes == Rust Traits

f :: (Eq a) => (a -> a) -> a -> Bool -- Implements Eq
f g x = x == g x

bothPairsEqual :: (Eq a, Eq b) => a -> a -> b -> b -> Bool
bothPairsEqual left1 left2 right1 right2 = left1 == left2 && right1 == right2

-- Common Type Classes: Eq, Ord, Num, Integral, Fractional, Floating, Foldable
comparing :: (Ord a) => (b -> a) -> b -> b -> Ordering
comparing f x y = compare (f x) (f y)

-- show :: Show a => a -> String
-- read :: Read a => String -> a
-- read "3" :: Double

-- Importing with conflicting namespaces
-- import qualified Data.Map as Map
-- Type Map becomes Map.Map

-- Array, Indexable by even Booleans! (Ix Type Class)
-- array :: Ix i => (i, i) -> [(i, e)] -> Array i e

-- Takes array (minIndex, maxIndex)
myArray :: Array Int String
myArray = array (7, 11) [(7, "seven"), (8, "eight"), (9, "nine"), (10, "ten"), (11, "ELEVEN")]
myArray' = listArray (7,11) ["seven", "eight", "nine", "ten", "ELEVEN"]

-- Lookup with (!), update with (//)
-- myArray ! 8 == "eight"
-- myArray // [(8,"ocho"),(9,"nueve")], Because of immutability
