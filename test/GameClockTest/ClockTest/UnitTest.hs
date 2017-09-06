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
  [
  ]

countDown_ConsiderationTime = testGroup "countDown (ConsiderationTime)"
  [
  ]
