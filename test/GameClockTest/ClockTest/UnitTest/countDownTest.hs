module GameClockTest.ClockTest.UnitTest.CountDownTest (tests) where

import Test.Tasty
import Test.Tasty.HUnit
import GameClock.Clock.Unit

tests :: TestTree
tests = testGroup "countdown"
  [ _RoundDown
  , _Byoyomi
  , _Delay
  , _TimeLimit
  , _ConsiderationTime
  ]

_RoundDown :: TestTree
_RoundDown = testGroup "RoundDown (切り捨て)"
  [ testCase "ゼロの場合"         $ countdown   0 (RoundDown  0) @?= (  0, RoundDown  0)
  , testCase "ゼロの場合"         $ countdown   0 (RoundDown 60) @?= (  0, RoundDown 60)
  , testCase "小さい場合"         $ countdown  30 (RoundDown 60) @?= (  0, RoundDown 60)
  , testCase "同じ場合"           $ countdown  60 (RoundDown 60) @?= ( 60, RoundDown 60)
  , testCase "大きい場合切り捨て" $ countdown  90 (RoundDown 60) @?= ( 60, RoundDown 60)
  , testCase "大きい場合切り捨て" $ countdown 120 (RoundDown 60) @?= (120, RoundDown 60)
  , testCase "大きい場合切り捨て" $ countdown 150 (RoundDown 60) @?= (120, RoundDown 60)
  ]

_Byoyomi :: TestTree
_Byoyomi = testGroup "Byoyomi"
  [ testCase "秒読み時間内"       $ countdown  30 (Byoyomi 60) @?= ( 0, Byoyomi 60)
  , testCase "秒読みぴったり"     $ countdown  60 (Byoyomi 60) @?= ( 0, Byoyomi 60)
  , testCase "秒読み時間オーバー" $ countdown  90 (Byoyomi 60) @?= (30, Byoyomi  0)
  , testCase "秒読み時間オーバー" $ countdown 120 (Byoyomi 60) @?= (60, Byoyomi  0)
  ]

_Delay :: TestTree
_Delay = testGroup "Delay"
  [ testCase "ディレイ時間内"       $ countdown  30 (Delay 60) @?= (  0, Delay 60)
  , testCase "ディレイ時間ぴったり" $ countdown  60 (Delay 60) @?= (  0, Delay 60)
  , testCase "ディレイ時間オーバー" $ countdown  90 (Delay 60) @?= ( 90, Delay 60)
  , testCase "ディレイ時間オーバー" $ countdown 120 (Delay 60) @?= (120, Delay 60)
  , testCase "ディレイ時間オーバー" $ countdown 150 (Delay 60) @?= (150, Delay 60)
  ]

_TimeLimit :: TestTree
_TimeLimit = testGroup "TimeLimit (持ち時間)"
  [ testCase "持ち時間減少"     $ countdown 10 (TimeLimit 60) @?= ( 0, TimeLimit 50)
  , testCase "持ち時間使い切り" $ countdown 60 (TimeLimit 60) @?= ( 0, TimeLimit  0)
  , testCase "持ち時間オーバー" $ countdown 90 (TimeLimit 60) @?= (30, TimeLimit  0)
  ]

_ConsiderationTime :: TestTree
_ConsiderationTime = testGroup "ConsiderationTime (考慮時間)"
  [ testCase "考慮時間内"       $ countdown 10 (ConsiderationTime 60) @?= ( 0, ConsiderationTime 0)
  , testCase "考慮時間ぴったり" $ countdown 60 (ConsiderationTime 60) @?= ( 0, ConsiderationTime 0)
  , testCase "考慮時間オーバー" $ countdown 90 (ConsiderationTime 60) @?= (30, ConsiderationTime 0)
  ]
