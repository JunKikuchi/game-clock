import           Test.Tasty

import qualified GameClockTest.ClockTest          as ClockTest
import qualified GameClockTest.ClockTest.UnitTest as UnitTest
import qualified GameClockTest.CountDownTest      as CountDownTest
import qualified GameClockTest.DecodeTest         as DecodeTest
import qualified GameClockTest.EncodeTest         as EncodeTest
import qualified GameClockTest.OverTest           as OverTest

main :: IO ()
main = defaultMain $ testGroup "GameClock" [UnitTest.tests, ClockTest.tests, tests]

tests :: TestTree
tests = testGroup "GameClock"
  [ CountDownTest.tests
  , OverTest.tests
  , EncodeTest.tests
  , DecodeTest.tests
  ]
