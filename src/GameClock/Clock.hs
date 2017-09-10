module GameClock.Clock
  ( Clock
  , clock
  , empty
  , suddenDeath
  , byoyomi
  , countDown
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
suddenDeath rd tl = clock [Unit.roundDown rd, Unit.timeLimit tl]

-- | 秒読み時計作成
byoyomi rd tl dl = clock [Unit.roundDown rd, Unit.timeLimit tl, Unit.byoyomi dl]

-- | 秒数カウントダウン
countDown :: Sec -> Clock -> Clock
countDown s (Clock us) = Clock (countDown' s us)
  where
    countDown' s []     = []
    countDown' s (u:us) = let (s', u') = Unit.countDown s u in u':countDown' s' us

-- | 時間切れ判定
over :: Clock -> Bool
over (Clock us) = all id $ map Unit.over us
