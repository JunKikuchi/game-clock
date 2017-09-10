module GameClockTest.ClockTest.OverTest (tests) where

import Test.Tasty
import Test.Tasty.HUnit
import GameClock.Clock

tests = testGroup "over"
  [ suddenDeathTest
  , byoyomiTest
  ]

suddenDeathTest = testGroup "suddenDeath"
  [ testCase "持ち時あり" $ over (suddenDeath 3 60) @?= False
  , testCase "持ち時なし" $ over (suddenDeath 3  0) @?= True
  ]

byoyomiTest = testGroup "byoyomi"
  [ testCase "持ち時あり秒読みあり" $ over (byoyomi 3 60 5) @?= False
  , testCase "持ち時なし秒読みあり" $ over (byoyomi 3  0 5) @?= False
  , testCase "持ち時あり秒読みなし" $ over (byoyomi 3 60 0) @?= False
  , testCase "持ち時なし秒読みなし" $ over (byoyomi 3  0 0) @?= True
  ]
