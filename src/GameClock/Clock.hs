module GameClock.Clock
  ( Clock
  , clock
  , countDown
  , over
  ) where

import           GameClock.Clock.Sec
import qualified GameClock.Clock.Unit as Unit

-- | 時計データ
newtype Clock = Clock [Unit.Unit] deriving (Show)

-- | 時計作成
clock :: [Unit.Unit] -> Clock
clock = Clock

-- | 秒数カウントダウン
countDown :: Sec -> Clock -> Clock
countDown = undefined

-- | 時間切れ判定
over :: Clock -> Bool
over = undefined
