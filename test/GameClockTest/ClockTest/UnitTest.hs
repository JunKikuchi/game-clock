module GameClockTest.ClockTest.UnitTest (tests) where

import Test.Tasty
import Test.Tasty.HUnit
import GameClock.Clock.Unit

tests :: TestTree
tests = testGroup "GameClock.Clock.Unit"
  [ countDown_RoundDown
  , countDown_Delay
  , countDown_TimeLimit
  , countDown_ConsiderationTime
  ]

countDown_RoundDown = testGroup "countDown (RoundDown)"
  [ testCase "小さい場合"         $ countDown  30 (roundDown 60) @?= (  0, roundDown 60)
  , testCase "同じ場合"           $ countDown  60 (roundDown 60) @?= ( 60, roundDown 60)
  , testCase "大きい場合切り捨て" $ countDown  90 (roundDown 60) @?= ( 60, roundDown 60)
  , testCase "大きい場合切り捨て" $ countDown 120 (roundDown 60) @?= (120, roundDown 60)
  , testCase "大きい場合切り捨て" $ countDown 150 (roundDown 60) @?= (120, roundDown 60)
  ]

countDown_Delay = testGroup "countDown (Delay)"
  [ testCase "小さい場合" $ countDown  30 (delay 60) @?= ( 0, delay 60)
  , testCase "同じ場合"   $ countDown  60 (delay 60) @?= (60, delay 60)
  , testCase "大きい場合" $ countDown  90 (delay 60) @?= (30, delay 60)
  , testCase "大きい場合" $ countDown 120 (delay 60) @?= (60, delay 60)
  , testCase "大きい場合" $ countDown 150 (delay 60) @?= (90, delay 60)
  ]

countDown_TimeLimit = testGroup "countDown (TimeLimit)"
  [ testCase "持ち時間減少"     $ countDown 10 (timeLimit 60) @?= ( 0, timeLimit 50)
  , testCase "持ち時間使い切り" $ countDown 60 (timeLimit 60) @?= ( 0, timeLimit  0)
  , testCase "持ち時間オーバー" $ countDown 90 (timeLimit 60) @?= (30, timeLimit  0)
  ]

countDown_ConsiderationTime = testGroup "countDown (ConsiderationTime)"
  [ testCase "考慮時間内"       $ countDown 10 (considerationTime 60) @?= ( 0, considerationTime 0)
  , testCase "考慮時間ぴったり" $ countDown 60 (considerationTime 60) @?= ( 0, considerationTime 0)
  , testCase "考慮時間オーバー" $ countDown 90 (considerationTime 60) @?= (30, considerationTime 0)
  ]
