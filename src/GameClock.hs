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

newtype GameClock color = GameClock (Map.Map color Clock.Clock) deriving (Show, Eq)

gameClock :: (Ord color, Enum color, Bounded color) => Clock.Clock -> GameClock color
gameClock clock = GameClock . Map.fromAscList . map (flip (,) clock) $ [minBound..maxBound]

countDown :: (Ord color) => Sec -> color -> GameClock color -> GameClock color
countDown ms color (GameClock gc) = GameClock $ Map.update countDown' color gc
  where
    countDown' clock = Just $ Clock.countDown ms clock

lookup :: (Ord color) => color -> GameClock color -> Maybe Clock.Clock
lookup color (GameClock gc) = Map.lookup color gc

over :: (Ord color) => color -> GameClock color -> Bool
over color gc = maybe minBound Clock.over $ lookup color gc
