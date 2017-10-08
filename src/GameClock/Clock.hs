module GameClock.Clock
  ( Clock
  , clock
  , empty
  , suddenDeath
  , byoyomi
  , countdown
  , over
  ) where

import           GameClock.Clock.Sec
import qualified GameClock.Clock.Unit as Unit

-- | 時計データ
newtype Clock = Clock [Unit.Unit] deriving (Show, Eq)

-- | 時計作成
clock :: [Unit.Unit] -> Clock
clock = Clock

-- | 空の時計作成
empty :: Clock
empty = clock []

-- | 差し切り時計（サドンデス）作成
suddenDeath rd tl = clock [Unit.RoundDown rd, Unit.TimeLimit tl]

-- | 秒読み時計作成
byoyomi rd tl dl = clock [Unit.RoundDown rd, Unit.TimeLimit tl, Unit.Byoyomi dl]

-- | 秒数カウントダウン
countdown :: Sec -> Clock -> Clock
countdown s (Clock us) = Clock (countdown' s us)
  where
    countdown' s []     = []
    countdown' s (u:us) = let (s', u') = Unit.countdown s u in u':countdown' s' us

-- | 時間切れ判定
over :: Clock -> Bool
over (Clock us) = all id $ map Unit.over us
