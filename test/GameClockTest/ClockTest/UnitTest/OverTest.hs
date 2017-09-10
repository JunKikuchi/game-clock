module GameClockTest.ClockTest.UnitTest.OverTest (tests) where

import Test.Tasty
import Test.Tasty.HUnit
import GameClock.Clock.Unit

tests = testGroup "over"
  [ _RoundDown
  , _Delay
  , _TimeLimit
  , _ConsiderationTime
  ]

_RoundDown = testGroup "RoundDown"
  [testCase "常にTrue" $ over (roundDown 60) @?= True]

_Delay = testGroup "Delay"
  [testCase "常にTrue" $ over (delay 60) @?= True]

_TimeLimit = testGroup "TimeLimit"
  [ testCase "ゼロの場合"     $ over (timeLimit  0) @?= True
  , testCase "ゼロ以外の場合" $ over (timeLimit 60) @?= False
  ]

_ConsiderationTime = testGroup "ConsiderationTime"
  [ testCase "ゼロの場合"     $ over (considerationTime  0) @?= True
  , testCase "ゼロ以外の場合" $ over (considerationTime 60) @?= False
  ]
