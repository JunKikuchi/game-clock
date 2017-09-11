module GameClock.Clock.Unit
  ( Unit(..)
  , countDown
  , over
  ) where

import GameClock.Clock.Sec

-- | 時計ユニットデータ
data Unit = RoundDown Sec         -- 切り捨て
          | Byoyomi Sec           -- 秒読み
          | Delay Sec             -- ディレイ
          | TimeLimit Sec         -- 持ち時間
          | ConsiderationTime Sec -- 考慮時間
          deriving (Show, Eq)

-- | 秒数カウントダウン
countDown :: Sec -> Unit -> (Sec, Unit)
countDown s (RoundDown 0) = (s, RoundDown 0)
countDown s (RoundDown r) = (s', RoundDown r)
  where s' = (s `div` r) * r
countDown s (Byoyomi c)
  | s <= c    = (0, Byoyomi c)
  | otherwise = (s - c, Byoyomi 0)
countDown s (Delay c) = (s', Delay c)
  where s' = if s <= c then 0 else s
countDown s (TimeLimit t)
  | s <= t    = (0, TimeLimit (t - s))
  | otherwise = (s - t, TimeLimit 0)
countDown s (ConsiderationTime c) = (s', ConsiderationTime 0)
  where s' = if s <= c then 0 else (s - c)

-- | 時間切れ判定
over :: Unit -> Bool
over (RoundDown _) = True
over (Byoyomi s) = s == 0
over (Delay _) = True
over (TimeLimit s) = s == 0
over (ConsiderationTime s) = s == 0
