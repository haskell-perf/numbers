{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Main (main) where

import Control.Monad
import Criterion.Main
import Criterion.Types
import Data.Char
import Data.Scientific
import System.Directory

main :: IO ()
main = do
  let fp = "out.csv"
  exists <- doesFileExist fp
  when exists (removeFile fp)
  defaultMainWith
    defaultConfig {csvFile = Just fp}
    [ bgroup
        "Addition"
        (concat
           [ [ bench ("Int:" ++ scale i) (whnf add'Int (-i))
             | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
             ]
           , [ bench ("Integer:" ++ scale i) (whnf add'Integer (-i))
             | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
             ]
           , [ bench ("Rational:" ++ scale i) (whnf add'Rational (-i))
             | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
             ]
           , [ bench ("Double:" ++ scale i) (whnf add'Double (-i))
             | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
             ]
           , [ bench ("Scientific:" ++ scale i) (whnf add'Scientific (-i))
             | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
             ]
           ])
    , bgroup
        "Subtraction"
        (concat
           [ [ bench ("Int:" ++ scale i) (whnf subtract'Int i)
             | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
             ]
           , [ bench ("Integer:" ++ scale i) (whnf subtract'Integer i)
             | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
             ]
           , [ bench ("Rational:" ++ scale i) (whnf subtract'Rational i)
             | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
             ]
           , [ bench ("Double:" ++ scale i) (whnf subtract'Double i)
             | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
             ]
           , [ bench ("Scientific:" ++ scale i) (whnf subtract'Scientific i)
             | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
             ]
           ])
    , bgroup
        "Integer division"
        (concat
           [ [ bench ("Int:" ++ scale i) (whnf div'Int i)
             | i <- [1000,10000, 100000, 1000000, 10000000]
             ]
           , [ bench ("Integer:" ++ scale i) (whnf div'Integer i)
             | i <- [1000,10000, 100000, 1000000, 10000000]
             ]
           ])
    , bgroup
        "Decimal division"
        (concat
           [ [ bench ("Rational:" ++ scale i) (whnf div'Rational i)
             | i <- [10, 100, 1000]
             ]
           , [ bench ("Double:" ++ scale i) (whnf div'Double i)
             | i <- [10, 100, 1000]
             ]
           , [ bench ("Scientific:" ++ scale i) (whnf div'Scientific i)
             | i <- [10, 100, 1000]
             ]
           ])
    ]
  where
    subtract'Integer :: Integer -> ()
    subtract'Integer 0 = ()
    subtract'Integer a = subtract'Integer (a - 1)
    subtract'Int :: Int -> ()
    subtract'Int 0 = ()
    subtract'Int a = subtract'Int (a - 1)
    subtract'Rational :: Rational -> ()
    subtract'Rational 0 = ()
    subtract'Rational a = subtract'Rational (a - 1)
    subtract'Double :: Double -> ()
    subtract'Double 0 = ()
    subtract'Double a = subtract'Double (a - 1)
    subtract'Scientific :: Scientific -> ()
    subtract'Scientific 0 = ()
    subtract'Scientific a = subtract'Scientific (a - 1)
    add'Integer :: Integer -> ()
    add'Integer 0 = ()
    add'Integer a = add'Integer (a + 1)
    add'Int :: Int -> ()
    add'Int 0 = ()
    add'Int a = add'Int (a + 1)
    add'Rational :: Rational -> ()
    add'Rational 0 = ()
    add'Rational a = add'Rational (a + 1)
    add'Double :: Double -> ()
    add'Double 0 = ()
    add'Double a = add'Double (a + 1)
    add'Scientific :: Scientific -> ()
    add'Scientific 0 = ()
    add'Scientific a = add'Scientific (a + 1)
    div'Rational :: Int -> Rational
    div'Rational i = go i (fromIntegral i)
      where
        go 0 (!c) = c
        go i (!c) = go (i - 1) (c / 2)
    div'Scientific :: Int -> Scientific
    div'Scientific i = go i (fromIntegral i)
      where
        go 0 (!c) = c
        go i (!c) = go (i - 1) (c / 2)
    div'Double :: Int -> Double
    div'Double i = go i (fromIntegral i)
      where
        go 0 (!c) = c
        go i (!c) = go (i - 1) (c / 2)
    div'Int :: Int -> Int
    div'Int i = go i (fromIntegral i)
      where
        go 0 (!c) = c
        go i (!c) = go (i - 1) (div c 2)
    div'Integer :: Int -> Integer
    div'Integer i = go i (fromIntegral i)
      where
        go 0 (!c) = c
        go i (!c) = go (i - 1) (div c 2)

-- | Show without any % 1 or .0 extensions.
scale :: Show a => a -> String
scale = takeWhile isDigit . show
