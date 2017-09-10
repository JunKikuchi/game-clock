module GameClock.Clock
  ( Clock
  , clock
  , countDown
  , over
  ) where

import           GameClock.Clock.Sec
import qualified GameClock.Clock.Unit as Unit

newtype Clock = Clock [Unit.Unit] deriving (Show)

clock :: [Unit.Unit] -> Clock
clock = Clock

countDown :: Sec -> Clock -> Clock
countDown = undefined

over :: Clock -> Bool
over = undefined
