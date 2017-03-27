{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE BangPatterns #-}

module Main (main) where

import Control.DeepSeq
import Control.Exception (evaluate)
import Control.Monad
import Control.Monad.ST
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
           [ [ bench ("Int " ++ show i) (whnf count i)
             | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
             ]
           , [ bench ("Integer " ++ show i) (whnf count'Int i)
             | i <- [1, 10, 100, 1000, 10000, 100000, 1000000]
             ]
           ])
    ]
  where
    count :: Integer -> ()
    count 0 = ()
    count a = count (a - 1)
    count'Int :: Int -> ()
    count'Int 0 = ()
    count'Int a = count'Int (a + (-1))
