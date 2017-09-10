import Test.Tasty

import qualified GameClockTest.ClockTest.UnitTest as UnitTest
import qualified GameClockTest.ClockTest as ClockTest
import qualified GameClockTest.CountDownTest as CountDownTest

main = defaultMain $ testGroup "GameClock" [UnitTest.tests, ClockTest.tests, tests]

tests :: TestTree
tests = testGroup "GameClock"
  [ CountDownTest.tests
  ]
