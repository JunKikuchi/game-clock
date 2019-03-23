module GameClock
  ( GameClock
  , gameClock
  , fromList
  , toList
  , countdown
  , lookup
  , over
  ) where

import qualified Data.Map            as Map
import           Data.Maybe          (fromMaybe)
import           GameClock.Clock     (Clock)
import qualified GameClock.Clock     as Clock
import           GameClock.Clock.Sec (Sec)
import           Prelude             hiding (lookup)

-- | ゲーム時計データ
newtype GameClock color = GameClock (Map.Map color Clock) deriving (Show, Eq)

-- | ゲーム時計作成
gameClock :: (Ord color, Enum color, Bounded color) => Clock -> GameClock color
gameClock clock = GameClock . Map.fromAscList . map (flip (,) clock) $ [minBound..maxBound]

-- | Color と Clock リストからゲーム時計作成
fromList :: (Ord color, Enum color, Bounded color) => [(color, Clock)] -> GameClock color
fromList = GameClock . Map.fromAscList

-- | Color と Clock のリスト
toList :: (Ord color, Enum color, Bounded color) => GameClock color -> [(color, Clock)]
toList (GameClock clock) = Map.toList clock

-- | 秒数カウントダウン
countdown :: (Ord color) => Sec -> color -> GameClock color -> GameClock color
countdown ms color (GameClock gc) = GameClock $ Map.update countdown' color gc
  where
    countdown' clock = Just $ Clock.countdown ms clock

-- | 時計取得
lookup :: (Ord color) => color -> GameClock color -> Clock
lookup color (GameClock gc) = fromMaybe Clock.empty (Map.lookup color gc)

-- | 時間切れ判定
over :: (Ord color) => color -> GameClock color -> Bool
over color gc = Clock.over $ lookup color gc
