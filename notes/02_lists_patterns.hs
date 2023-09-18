import Data.List (sort)

-- Tail Recursion!
fibonacci :: Integer -> Integer
fibonacci = fibonacci' 0 1

fibonacci' :: Integer -> Integer -> Integer -> Integer
fibonacci' a b 1 = b
fibonacci' a b n = fibonacci' b (a + b) (n - 1)

-- Guards (content pattern matching)
guessAge :: String -> Int -> String
guessAge "Griselda" age
    | age < 47 = "Too low!"
    | age > 47 = "Too high!"
    | otherwise = "Correct!"
guessAge "Hansel" age
    | age < 12 = "Too low!"
    | age > 12 = "Too high!"
    | otherwise = "Correct!"
guessAge name age = "Wrong name!"

-- Lists
-- [[1,2],[3,4]] :: [[Int]]    -- a list of lists
-- [1..7] :: [Int]             -- range syntax, value [1,2,3,4,5,6,7]
-- head, init (take all but last), take (first n), drop (drop first n), tail (drop 1)
-- (++) concat, (!!) index, reverse, null (isempty), length

sortedList = sort [1, 3, 5, 2, 4, 1]

-- Maybe Monad
-- Maybe = Just <val> | Nothing
-- Can pattern match Maybe
perhapsMultiply :: Int -> Maybe Int -> Int
perhapsMultiply i Nothing = i
perhapsMultiply i (Just j) = i * j -- Note how j denotes the value inside the Just

-- Either Int Bool 	Left 0, Left 1, Right False, Right True,
-- Kind of like Result<T, E> in Rust
-- Typically Left used for failure, Right for error (Reverse of Result<T, E>)

-- Case-of can always be written as a let-in or where helper
-- Useful for conciseness and shared helper functions
sentenceType :: String -> String
sentenceType sentence = case last sentence of
    '.' -> "statement"
    '?' -> "question"
    '!' -> "exclamation"
    _ -> "not a sentence"

sentenceType' sentence = classify (last sentence)
  where
    classify '.' = "statement"
    classify '?' = "question"
    classify '!' = "exclamation"
    classify _ = "not a sentence"
