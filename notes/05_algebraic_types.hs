-- impl Show trait, Tuple Enums like Rust
data Card = Joker | Heart Int | Club Int | Spade Int | Diamond Int
  deriving Show

data Either a b = Left a | Right b

-- Recursive Types
data List a = Empty | Node a (List a)
  deriving Show
data Tree a = Node' a (Tree a) (Tree a) | Empty'

-- Record
data Person = MkPerson { name :: String, age :: Int, town :: String, state :: String, profession :: String}
  deriving Show
-- MkPerson "Jane Doe" 21 "Houston" "Texas" "Engineer"
-- MkPerson {name = "Jane Doe", town = "Houston", profession = "Engineer", state = "Texas", age = 21}
-- profession (MkPerson "Jane Doe" 21 "Houston" "Texas" "Engineer") == "Engineer"
-- Free accessor functions automade

-- Alias, not new type
type String = [Char]
