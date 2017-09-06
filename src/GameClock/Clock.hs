module GameClock.Clock
  ( Sec
  , Clock
  , wordClock
  , countDown
  , isOver
  ) where

type Sec   = Int
data Clock = Word Sec deriving (Show)

wordClock :: Sec -> Clock
wordClock = Word

countDown :: Sec -> Clock -> Clock
countDown ms (Word c) = Word ms'
  where
    c'  = c - ms
    ms' = if c' >= 0 then c' else 0

isOver :: Clock -> Bool
isOver = undefined
