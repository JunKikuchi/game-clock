module GameClock.Clock.Unit
  ( Unit
  , roundDown
  , delay
  , timeLimit
  , considerationTime
  , countDown
  ) where

import GameClock.Clock.Sec

data Unit = RoundDown Sec         -- 切り捨て
          | Delay Sec             -- 秒読み
          | TimeLimit Sec         -- 持ち時間
          | ConsiderationTime Sec -- 考慮時間
          deriving (Show, Eq)

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
