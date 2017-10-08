module GameClockTest.ClockTest.CountDownTest (tests) where

import Test.Tasty
import Test.Tasty.HUnit
import GameClock.Clock

tests :: TestTree
tests = testGroup "countdown"
  [ suddenDeathTest1
  , suddenDeathTest2
  , byoyomiTest
  ]

suddenDeathTest1 :: TestTree
suddenDeathTest1 = testGroup "suddenDeath 3 60"
  [ testCase "ゼロ秒"           $ countdown  0 (suddenDeath 3 60) @?= (suddenDeath 3 60)
  , testCase "切り捨て秒数未満" $ countdown  1 (suddenDeath 3 60) @?= (suddenDeath 3 60)
  , testCase "切り捨て秒数以上" $ countdown 30 (suddenDeath 3 60) @?= (suddenDeath 3 30)
  , testCase "持ち時間以上"     $ countdown 90 (suddenDeath 3 60) @?= (suddenDeath 3  0)
  ]

suddenDeathTest2 :: TestTree
suddenDeathTest2 = testGroup "suddenDeath 0 60"
  [ testCase "ゼロ秒"           $ countdown  0 (suddenDeath 0 60) @?= (suddenDeath 0 60)
  , testCase "切り捨て秒数以上" $ countdown 30 (suddenDeath 0 60) @?= (suddenDeath 0 30)
  , testCase "持ち時間以上"     $ countdown 90 (suddenDeath 0 60) @?= (suddenDeath 0  0)
  ]

byoyomiTest :: TestTree
byoyomiTest = testGroup "byoyomi 3 60 5"
  [ testCase "ゼロ秒"           $ countdown  0 (byoyomi 3 60 5) @?= (byoyomi 3 60 5)
  , testCase "切り捨て秒数以上" $ countdown 30 (byoyomi 3 60 5) @?= (byoyomi 3 30 5)
  , testCase "秒読み以内"       $ countdown 63 (byoyomi 3 60 5) @?= (byoyomi 3  0 5)
  , testCase "秒読み以内"       $ countdown 65 (byoyomi 3 60 5) @?= (byoyomi 3  0 5)
  , testCase "秒読み以内"       $ countdown  5 (byoyomi 3  0 5) @?= (byoyomi 3  0 5)
  , testCase "秒読みオーバー"   $ countdown 90 (byoyomi 3 60 5) @?= (byoyomi 3  0 0)
  ]
