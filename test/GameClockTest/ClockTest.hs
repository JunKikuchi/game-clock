module GameClockTest.ClockTest (tests) where

import qualified GameClockTest.ClockTest.CountDownTest as CountDownTest
import qualified GameClockTest.ClockTest.OverTest      as OverTest
import           Test.Tasty

tests :: TestTree
tests = testGroup "GameClock.Clock"
  [ CountDownTest.tests
  , OverTest.tests
  ]
