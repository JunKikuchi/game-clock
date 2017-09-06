module GameClock
  ( GameClock
  , gameClock
  , countDown
  , lookup
  , isOver
  ) where

import Prelude hiding (lookup)
import qualified Data.Map            as Map
import qualified GameClock.Clock     as Clock
import           GameClock.Clock.Sec

newtype GameClock color = GameClock (Map.Map color Clock.Clock)

gameClock :: (Ord color, Enum color, Bounded color) => Clock.Clock -> GameClock color
gameClock clock = GameClock. Map.fromAscList . map (flip (,) clock) $ [minBound..maxBound]

countDown :: (Ord color) => Sec -> color -> GameClock color -> GameClock color
countDown ms color (GameClock gc) = GameClock $ Map.update countDown' color gc
  where
    countDown' clock = Just $ Clock.countDown ms clock

lookup :: (Ord color) => color -> GameClock color -> Maybe Clock.Clock
lookup color (GameClock gc) = Map.lookup color gc

isOver :: (Ord color) => color -> GameClock color -> Bool
isOver color gc = maybe minBound Clock.isOver $ lookup color gc
