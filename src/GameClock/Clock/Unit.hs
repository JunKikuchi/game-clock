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
countDown s (RoundDown r) = (s', RoundDown r)
  where s' = (s `div` r) * r
countDown s (Delay c) = (s', Delay c)
  where s' = if s <= c then 0 else (s - c)
countDown s (TimeLimit t)
  | s <= t    = (0, TimeLimit (t - s))
  | otherwise = (s - t, TimeLimit 0)
countDown s (ConsiderationTime c) = (s', ConsiderationTime 0)
  where s' = if s <= c then 0 else (s - c)
