module GameClockTest.CountDownTest (tests) where

import Test.Tasty
import Test.Tasty.HUnit
import GameClock
import qualified GameClock.Clock as Clock

clock = Clock.suddenDeath 3 60

tests = testGroup "countDown"
  [ testCase "ゼロ秒"           $ countDown 0 True (gameClock clock) @?= (gameClock clock)
  , testCase "切り捨て秒数未満" $ countDown 1 True (gameClock clock) @?= (gameClock clock)
  , testCase "切り捨て秒数以上" $ GameClock.lookup True  (countDown 30 True (gameClock clock)) @?= (Clock.suddenDeath 3 30)
  , testCase "切り捨て秒数以上" $ GameClock.lookup False (countDown 30 True (gameClock clock)) @?= (Clock.suddenDeath 3 60)
  ]
