module GameClock.Clock.Unit
  ( Unit
  , roundDown
  , delay
  , timeLimit
  , considerationTime
  ) where

import GameClock.Clock.Sec

data Unit = RoundDown Sec
          | Delay Sec
          | TimeLimit Sec
          | ConsiderationTime Sec
          deriving (Show)

roundDown :: Sec -> Unit
roundDown = undefined

delay :: Sec -> Unit
delay = undefined

timeLimit :: Sec -> Unit
timeLimit = undefined

considerationTime :: Sec -> Unit
considerationTime = undefined
