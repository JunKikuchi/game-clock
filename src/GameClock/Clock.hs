module GameClock.Clock
  ( Millisec
  , Clock
  , countDown
  , isOver
  ) where

type Millisec = Int
type Clock = Millisec

countDown :: Millisec -> Clock -> Clock
countDown ms c = if c' >= minBound then c' else minBound
  where
    c' = c - ms

isOver :: Clock -> Bool
isOver = undefined
