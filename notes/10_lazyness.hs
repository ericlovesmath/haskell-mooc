_ = take 5 (repeat 1) -- Returns [1, 1, 1, 1, 1], same as replicate 5 1
_ = take 21 $ cycle "asdf" -- Returns "asdfasdfasdfasdfasdfa"

-- [0..] is syntax sugar for enumFrom 0
enumFrom' n = n : enumFrom' (n+1)

everySecond :: [a] -> [a]
everySecond [] = []
everySecond (x:y:xs) = x : everySecond xs

-- foldl' will not support lazyness, but collapses immediately
-- this prevents space leak

foldl'Int :: (Int -> Int -> Int) -> Int -> [Int] -> Int
foldl'Int f z [] = z
foldl'Int f 0 (x:xs) = foldl'Int f (f 0 x) xs
foldl'Int f z (x:xs) = foldl'Int f (f z x) xs

-- seq a b
-- Returns b, but forces a to evaluate (converts a to WHNF)
-- Useful for performance, avoiding lazyness
foldl' :: (a -> b -> a) -> a -> [b] -> a
foldl' f z [] = z
foldl' f z (x:xs) = let z' = f z x
                    in seq z' (foldl f z' xs) -- Forces z' to eval first

-- Newtype creates a wrapper, memory has no indirection layer like `data`
-- 0 Cost abstractions
-- However, newtype is strict: Type x is WHNF <=> x is WHNF

-- if we use data, Cents undefined is in WHNF
Prelude> data Money = Cents Int
Prelude> seq (Cents undefined) True
True
-- if we use newtype, Cents undefined isn't in WHNF, and trying
-- to make it so trips up in undefined
Prelude> newtype Money = Cents Int
Prelude> seq (Cents undefined) True
*** Exception: Prelude.undefined

-- Best to use newtype whenever you have a single-field single-constructor datatype
-- Also often used when you need to define a different type class instance for a type
newtype Inverted = Inverted Int
  deriving (Show, Eq)

instance Ord Inverted where
  compare (Inverted i) (Inverted j) = compare j i

-- Tying the Knot: Designing cyclic data (like cycle)
let xs = 1 : 2 : xs in xs -- Or use `where`

-- Debug.Trace prints message when evaluation is forced
Prelude> import Debug.Trace
Prelude Debug.Trace> trace "a" True
a
True
Prelude Debug.Trace> trace "a" False || trace "b" True
a
b
True
Prelude Debug.Trace> trace "a" True || trace "b" True
a
True

-- traceShowId just runs `show` on var
Prelude Debug.Trace> head (filter (>100) (map (\x -> traceShowId (3^x)) [0..]))
1
3
9
27
81
243
243
