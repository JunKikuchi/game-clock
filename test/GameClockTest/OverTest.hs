module GameClockTest.OverTest (tests) where

import           GameClock
import qualified GameClock.Clock  as Clock
import           Test.Tasty
import           Test.Tasty.HUnit

gameClock' :: GameClock Bool
gameClock' = countdown 90 False $ gameClock $ Clock.suddenDeath 3 60

tests :: TestTree
tests = testGroup "countdown"
  [ testCase "時間切れていない" $ over True  gameClock' @?= False
  , testCase "時間切れた"       $ over False gameClock' @?= True
  ]
