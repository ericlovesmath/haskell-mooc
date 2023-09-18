import Data.List (tails)

-- Type constructors can be mapped and filtered too
_ = map Just [1, 2, 3] == [Just 1, Just 2, Just 3]

-- From Data.List
-- tails, takeWhile, dropWhile, filter, elem (contains), zipWith
-- : is Cons for list
tails "echo" = ["echo", "cho", "ho", "o", ""]
const anything _ = anything
id anything = anything

-- Partial Applications in map
_ = map (drop 1) ["Hello", "World!"] == ["ello", "orld!"]
_ = map (* 2) [1, 2, 3]
_ = map (2 *) [1, 2, 3]

-- Prefix vs Infix
_ = 6 `div` 2 == div 6 2
_ = (+ 1) `map` [1, 2, 3] == map (+ 1) [1, 2, 3]

-- Lambdas
_ = filter (\x -> 1 + x > 7) [1, 10, 100]

-- . = function composition

-- $ = function application, same as @ in OCaml

_ = reverse (map head (map reverse (["Haskell", "pro"] ++ ["dodo", "lyric"])))
_ = (reverse . map head . map reverse) (["Haskell", "pro"] ++ ["dodo", "lyric"])
_ = reverse . map head . map reverse $ ["Haskell", "pro"] ++ ["dodo", "lyric"]
_ = reverse . map (head . reverse) $ ["Haskell", "pro"] ++ ["dodo", "lyric"]
_ = reverse . map last $ ["Haskell", "pro"] ++ ["dodo", "lyric"]

-- Pattern Decomposition with Cons
sumFirstTwo :: [Integer] -> Integer
sumFirstTwo (a : b : _) = a + b
sumFirstTwo _ = 0

-- Tail Recursion isn't as encouraged in Haskell
-- TL;DR infinite lists and lazyness
doubleList [] = []
doubleList (x : xs) = 2 * x : doubleList xs

doubleList' xs = go [] xs
  where
    go result [] = result
    go result (x : xs) = go (result ++ [2 * x]) xs

-- List Comprehension!
_ = [2 * i | i <- [1, 2, 3]]
_ = [i | i <- [1 .. 7], even i]
_ = [f x | x <- lis, p x] == map f (filter p lis)
_ = [first ++ " " ++ last | first <- ["John", "Mary"], last <- ["Smith", "Cooper"]]
_ = [reversed | word <- ["this", "is", "a", "string"], let reversed = reverse word]
_ = [char | (char : _) <- words string]

-- Typed Holes: Replace function with leading _ to see types that fit there
