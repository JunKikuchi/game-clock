module GameClockTest.ClockTest (tests) where

import Test.Tasty
import qualified GameClockTest.ClockTest.CountDownTest as CountDownTest

tests :: TestTree
tests = testGroup "GameClock.Clock"
  [ CountDownTest.tests
  ]
