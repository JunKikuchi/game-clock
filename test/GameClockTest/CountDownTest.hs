module GameClockTest.CountDownTest (tests) where

import Test.Tasty
import Test.Tasty.HUnit
import GameClock
import qualified GameClock.Clock as Clock

clock :: Clock.Clock
clock = Clock.suddenDeath 3 60

tests :: TestTree
tests = testGroup "countdown"
  [ testCase "ゼロ秒"           $ countdown 0 True (gameClock clock) @?= (gameClock clock)
  , testCase "切り捨て秒数未満" $ countdown 1 True (gameClock clock) @?= (gameClock clock)
  , testCase "切り捨て秒数以上" $ GameClock.lookup True  (countdown 30 True (gameClock clock)) @?= (Clock.suddenDeath 3 30)
  , testCase "切り捨て秒数以上" $ GameClock.lookup False (countdown 30 True (gameClock clock)) @?= (Clock.suddenDeath 3 60)
  ]
