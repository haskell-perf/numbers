module Main (main) where

import Control.Monad
import Criterion.Main
import Criterion.Types
import System.Directory
import Data.Scientific

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
           [ [ bench ("Int:" ++ show i) (whnf add'Int (-i))
             | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
             ]
           , [ bench ("Integer:" ++ show i) (whnf add'Integer (-i))
             | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
             ]
           , [ bench ("Rational:" ++ show i) (whnf add'Rational (-i))
             | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
             ]
           , [ bench ("Double:" ++ show i) (whnf add'Double (-i))
             | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
             ]
           , [ bench ("Scientific:" ++ show i) (whnf add'Scientific (-i))
             | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
             ]
           ])
    , bgroup
        "Subtraction"
        (concat
           [ [ bench ("Int:" ++ show i) (whnf subtract'Int i)
             | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
             ]
           , [ bench ("Integer:" ++ show i) (whnf subtract'Integer i)
             | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
             ]
           , [ bench ("Rational:" ++ show i) (whnf subtract'Rational i)
             | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
             ]
           , [ bench ("Double:" ++ show i) (whnf subtract'Double i)
             | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
             ]
           , [ bench ("Scientific:" ++ show i) (whnf subtract'Scientific i)
             | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
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
