questionnaire = do
  putStrLn "Write something!"
  s <- getLine
  putStrLn ("You wrote: " ++ s)

-- main = do
--   rsp <- simpleHTTP (getRequest "http://httpbin.org/base64/aGFza2VsbCBmb3IgZXZlcgo=")
--   body <- getResponseBody rsp
--   forM_ (words body) $ \w -> do
--      putStr "word: "
--      putStrLn w

-- `return` doesn't really return but converts to IO action
-- Last line is returned in a `do` block anyways
produceThree :: IO Int
produceThree = return 3

printThree :: IO ()
printThree = do
  three <- produceThree
  putStrLn (show three)

yesNoQuestion :: String -> IO Bool
yesNoQuestion question = do
  putStrLn question
  s <- getLine
  return (s == "Y")

-- Example with IO Types
alwaysFine :: IO Bool
alwaysFine = do
  putStrLn "What?" -- :: IO ()
  return 2         -- :: IO Int, produced value is discarded
  s <- getLine     -- getLine :: IO String, thus s :: String
  putStrLn s       -- putStrLn :: String -> IO (), thus putStrLn s :: IO ()
  let b = True     -- b :: Bool
  return b         -- :: IO Bool
                   -- Thus, alwaysFine :: IO Bool

-- Reading and summing n numbers
readAndSum :: Int -> IO Int
readAndSum 0 = return 0
readAndSum n = do
  i <- readLn            -- read one number
  s <- readAndSum (n-1)  -- recursion: read and sum rest of numbers
  return (i+s)           -- produce result

getLine

-- Helpful IO functions
-- when b op performs op if b is true
when :: Bool -> IO () -> IO ()
-- unless b op performs op if b is false
unless :: Bool -> IO () -> IO ()
-- do something many times, collect results
replicateM :: Int -> IO a -> IO [a]
-- do something many times, throw away the results
replicateM_ :: Int -> IO a -> IO ()
-- do something for every list element
mapM :: (a -> IO b) -> [a] -> IO [b]
-- do something for every list element, throw away the results
mapM_ :: (a -> IO b) -> [a] -> IO ()
-- the same, but arguments flipped
forM  :: [a] -> (a -> IO b) -> IO [b]
forM_ :: [a] -> (a -> IO b) -> IO ()

readFile :: FilePath -> IO String

-- Operators are just values
choice :: IO x -> IO x -> IO x
choice a b =
  do putStr "a or b? "
     x <- getLine
     case x of "a" -> a
               "b" -> b
               _ -> do putStrLn "Wrong!"
                       choice a b
-- Prelude> choice (putStrLn "A!!!!") (putStrLn "B!!!!")
-- a or b? z
-- Wrong!
-- a or b? a
-- A!!!!

-- IORef for Mutablility
sumList :: [Int] -> IO Int
sumList xs = do r <- newIORef 0                       -- initialize r to 0
                forM_ xs (\x -> modifyIORef r (x+))   -- for every xs, add it to r
                readIORef r                           -- get last value of r
-- Prelude> :m +Data.IORef
-- Prelude Data.IORef> myRef <- newIORef "banana"
-- Prelude Data.IORef> readIORef myRef
-- "banana"
-- Prelude Data.IORef> writeIORef myRef "apple"
-- Prelude Data.IORef> readIORef myRef
-- "apple"
-- Prelude Data.IORef> modifyIORef myRef reverse
-- Prelude Data.IORef> readIORef myRef
-- "elppa"
