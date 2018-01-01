module GameClockTest.ClockTest.UnitTest.OverTest (tests) where

import           GameClock.Clock.Unit
import           Test.Tasty
import           Test.Tasty.HUnit

tests :: TestTree
tests = testGroup "over"
  [ _RoundDown
  , _Byoyomi
  , _Delay
  , _TimeLimit
  , _ConsiderationTime
  ]

_RoundDown :: TestTree
_RoundDown = testGroup "RoundDown"
  [testCase "常にTrue" $ over (RoundDown 60) @?= True]

_Byoyomi :: TestTree
_Byoyomi = testGroup "Byoyomi"
  [ testCase "ゼロの場合"     $ over (Byoyomi  0) @?= True
  , testCase "ゼロ以外の場合" $ over (Byoyomi 60) @?= False
  ]

_Delay :: TestTree
_Delay = testGroup "Delay"
  [testCase "常にTrue" $ over (Delay 60) @?= True]

_TimeLimit :: TestTree
_TimeLimit = testGroup "TimeLimit"
  [ testCase "ゼロの場合"     $ over (TimeLimit  0) @?= True
  , testCase "ゼロ以外の場合" $ over (TimeLimit 60) @?= False
  ]

_ConsiderationTime :: TestTree
_ConsiderationTime = testGroup "ConsiderationTime"
  [ testCase "ゼロの場合"     $ over (ConsiderationTime  0) @?= True
  , testCase "ゼロ以外の場合" $ over (ConsiderationTime 60) @?= False
  ]
