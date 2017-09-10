module GameClock.Clock
  ( Clock
  , clock
  , suddenDeath
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

-- | 差し切り時計（サドンデス）作成
suddenDeath rd tl = clock [Unit.roundDown rd, Unit.timeLimit tl]

-- | 秒数カウントダウン
countDown :: Sec -> Clock -> Clock
countDown s (Clock us) = Clock (countDown' s us)
  where
    countDown' s []     = []
    countDown' s (u:us) = let (s', u') = Unit.countDown s u in u':countDown' s' us

-- | 時間切れ判定
over :: Clock -> Bool
over = undefined
