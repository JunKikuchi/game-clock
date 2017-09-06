import Test.Tasty

import qualified GameClockTest.ClockTest.UnitTest as UnitTest

main = defaultMain $ testGroup "GameClock" [UnitTest.tests]
