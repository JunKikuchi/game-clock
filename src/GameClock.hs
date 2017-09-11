module GameClock
  ( GameClock
  , gameClock
  , countDown
  , lookup
  , over
  ) where

import Prelude hiding (lookup)
import qualified Data.Map            as Map
import qualified GameClock.Clock     as Clock
import           GameClock.Clock.Sec

-- | ゲーム時計データ
newtype GameClock color = GameClock (Map.Map color Clock.Clock) deriving (Show, Eq)

-- | ゲーム時計作成
gameClock :: (Ord color, Enum color, Bounded color) => Clock.Clock -> GameClock color
gameClock clock = GameClock . Map.fromAscList . map (flip (,) clock) $ [minBound..maxBound]

-- | 秒数カウントダウン
countDown :: (Ord color) => Sec -> color -> GameClock color -> GameClock color
countDown ms color (GameClock gc) = GameClock $ Map.update countDown' color gc
  where
    countDown' clock = Just $ Clock.countDown ms clock

-- | 時計取得
lookup :: (Ord color) => color -> GameClock color -> Clock.Clock
lookup color (GameClock gc) = maybe Clock.empty id (Map.lookup color gc)

-- | 時間切れ判定
over :: (Ord color) => color -> GameClock color -> Bool
over color gc = Clock.over $ lookup color gc
