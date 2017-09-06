module GameClockTest.ClockTest.UnitTest (tests) where

import Test.Tasty
import qualified GameClockTest.ClockTest.UnitTest.CountDownTest as CountDownTest

tests :: TestTree
tests = testGroup "GameClock.Clock.Unit"
  [ CountDownTest.tests
  ]
