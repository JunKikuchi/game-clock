module GameClockTest.OverTest (tests) where

import Test.Tasty
import Test.Tasty.HUnit
import GameClock
import qualified GameClock.Clock as Clock

gameClock' = countDown 90 False $ gameClock $ Clock.suddenDeath 3 60

tests = testGroup "countDown"
  [ testCase "時間切れていない" $ over True  gameClock' @?= False
  , testCase "時間切れた"       $ over False gameClock' @?= True
  ]
