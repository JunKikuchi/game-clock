import Test.Tasty

import qualified GameClockTest.ClockTest.UnitTest as UnitTest
import qualified GameClockTest.ClockTest as ClockTest

main = defaultMain $ testGroup "GameClock" [UnitTest.tests, ClockTest.tests]
