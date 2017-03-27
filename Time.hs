module Main (main) where

import Control.Monad
import Criterion.Main
import Criterion.Types
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
           [ [ bench ("Int:" ++ show i) (whnf add'Int (- i))
             | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
             ]
           , [ bench ("Integer:" ++ show i) (whnf add'Integer (- i))
             | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
             ]
           ])
    ,  bgroup
         "Subtraction"
         (concat
            [ [ bench ("Int:" ++ show i) (whnf subtract'Int i)
              | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
              ]
            , [ bench ("Integer:" ++ show i) (whnf subtract'Integer i)
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
    add'Integer :: Integer -> ()
    add'Integer 0 = ()
    add'Integer a = add'Integer (a + 1)
    add'Int :: Int -> ()
    add'Int 0 = ()
    add'Int a = add'Int (a + 1)
