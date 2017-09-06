module GameClock.Clock
  ( Millisec
  , Clock
  , wordClock
  , countDown
  , isOver
  ) where

type Millisec = Int
data Clock    = Word Millisec deriving (Show)

wordClock :: Millisec -> Clock
wordClock = Word

countDown :: Millisec -> Clock -> Clock
countDown ms (Word c) = Word ms'
  where
    c'  = c - ms
    ms' = if c' >= 0 then c' else 0

isOver :: Clock -> Bool
isOver = undefined
