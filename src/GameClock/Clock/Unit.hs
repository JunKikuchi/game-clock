module GameClock.Clock.Unit
  ( Unit
  , roundDown
  , timeLimit
  , delay
  , considerationTime
  ) where

import GameClock.Clock.Sec

data Unit = RoundDown Sec
          | TimeLimit Sec
          | Delay Sec
          | ConsiderationTime Sec
          deriving (Show)

roundDown :: Sec -> Unit
roundDown = undefined

timeLimit :: Sec -> Unit
timeLimit = undefined

delay :: Sec -> Unit
delay = undefined

considerationTime :: Sec -> Unit
considerationTime = undefined
