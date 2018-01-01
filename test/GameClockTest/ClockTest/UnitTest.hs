module GameClockTest.ClockTest.UnitTest (tests) where

import qualified GameClockTest.ClockTest.UnitTest.CountDownTest as CountDownTest
import qualified GameClockTest.ClockTest.UnitTest.OverTest      as OverTest
import           Test.Tasty

tests :: TestTree
tests = testGroup "GameClock.Clock.Unit"
  [ CountDownTest.tests
  , OverTest.tests
  ]
