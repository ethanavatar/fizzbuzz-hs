module Main where
import System.Environment
import System.IO

fizzbuzz :: Int -> [String]
fizzbuzz n = map fizzbuzz' [1..n]
    where fizzbuzz' x = case (x `mod` 3, x `mod` 5) of
            (0, 0) -> "FizzBuzz"
            (0, _) -> "Fizz"
            (_, 0) -> "Buzz"
            _      -> show x

main :: IO ()
main = do
    args <- getArgs
    case args of
        (x:_) -> mapM_ putStrLn $ fizzbuzz $ read x
        _     -> hPutStrLn stderr "Usage: fizzbuzz <number>"