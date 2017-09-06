module GameClock.Clock.Unit
  ( Unit
  , roundDown
  , delay
  , timeLimit
  , considerationTime
  , countDown
  ) where

import GameClock.Clock.Sec

data Unit = RoundDown Sec
          | Delay Sec
          | TimeLimit Sec
          | ConsiderationTime Sec
          deriving (Show)

roundDown :: Sec -> Unit
roundDown = RoundDown

delay :: Sec -> Unit
delay = Delay

timeLimit :: Sec -> Unit
timeLimit = TimeLimit

considerationTime :: Sec -> Unit
considerationTime = ConsiderationTime

countDown :: Sec -> Unit -> (Sec, Unit)
countDown = undefined
