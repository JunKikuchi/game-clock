module GameClockTest.ClockTest (tests) where

import Test.Tasty
import qualified GameClockTest.ClockTest.CountDownTest as CountDownTest
import qualified GameClockTest.ClockTest.OverTest as OverTest

tests :: TestTree
tests = testGroup "GameClock.Clock"
  [ CountDownTest.tests
  , OverTest.tests
  ]
