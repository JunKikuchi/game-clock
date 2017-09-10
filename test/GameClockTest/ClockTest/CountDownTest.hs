module GameClockTest.ClockTest.CountDownTest (tests) where

import Test.Tasty
import Test.Tasty.HUnit
import GameClock.Clock

tests = testGroup "countDown"
  [ suddenDeathTest
  ]

suddenDeathTest = testGroup "suddenDeathTest"
  [ testCase "ゼロ秒"           $ countDown  0 (suddenDeath 3 60) @?= (suddenDeath 3 60)
  , testCase "切り捨て秒数未満" $ countDown  1 (suddenDeath 3 60) @?= (suddenDeath 3 60)
  , testCase "切り捨て秒数以上" $ countDown 30 (suddenDeath 3 60) @?= (suddenDeath 3 30)
  , testCase "持ち時間以上"     $ countDown 90 (suddenDeath 3 60) @?= (suddenDeath 3  0)
  ]
