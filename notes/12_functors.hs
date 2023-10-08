class Functor f where
  fmap :: (a -> b) -> f a -> f b

instance Functor Maybe where
  -- In this instance, the type of fmap is:
  -- fmap :: (a -> b) -> Maybe a -> Maybe b
  fmap f Nothing = Nothing
  fmap f (Just x) = Just (f x)

-- fmap is equivalent to infix <$>

-- Functor Map Axioms:
-- fmap id === id
-- fmap (f . g) === fmap f . fmap g

class Foldable (t :: * -> *) where
  foldr :: (a -> b -> b) -> b -> t a -> b
