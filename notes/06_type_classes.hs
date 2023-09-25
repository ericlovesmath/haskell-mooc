-- Note: Instance of Type Classes is almost identical to Impl-ing a Trait in Rust

data Color = Black | White

-- impl Eq for Color
instance Eq Color where
    Black == Black = True
    White == White = True
    _ == _ = False

class Size a where
    size :: a -> Int

instance Size Int where
    size = abs

instance Size [a] where
    size = length

-- Weird note: Type Classes only check for the most top level. This means:
--     1) Size (Either a a) is not ok as types are duplicated
--     2) Size (Either String a) is not ok as String isn't top level
--     3) Size [[a]] is not ok as [a] isn't top level

class Example a where
  example :: a           -- the main example for the type `a`
  examples :: [a]        -- a short list of examples
  examples = [example]   -- ...defaulting to just the main example

instance Example Int where
  example = 1
  examples = [0,1,2]

instance Example Bool where
  example = True

{-
class  (Eq a) => Ord a  where
  compare              :: a -> a -> Ordering
  (<), (<=), (>=), (>) :: a -> a -> Bool
  max, min             :: a -> a -> a

  compare x y | x == y    = EQ
              | x <= y    = LT
              | otherwise = GT

  x <= y  = compare x y /= GT
  x <  y  = compare x y == LT
  x >= y  = compare x y /= LT
  x >  y  = compare x y == GT

  max x y | x <= y    =  y
          | otherwise =  x
  min x y | x <= y    =  x
          | otherwise =  y
-}

-- Minimal Complete Ord: == and <=
-- Use :info to get info on Type Class

-- Classes can have hierarchy
class Size a => SizeBoth a where
  sizeBoth :: a -> a -> Int
  sizeBoth x y = size x + size y
