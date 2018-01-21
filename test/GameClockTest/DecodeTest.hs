{-# LANGUAGE OverloadedStrings #-}

module GameClockTest.DecodeTest (tests) where

import           GameClock
import qualified GameClock.Clock  as Clock
import           Test.Tasty
import           Test.Tasty.HUnit

gameClock' :: GameClock Bool
gameClock' = countdown 90 False $ gameClock $ Clock.suddenDeath 3 60

tests :: TestTree
tests = testGroup "encode"
  [ testCase "デコード" $ decode "{\"GameClock\":{\"false\":[{\"tag\":\"RoundDown\",\"contents\":3},{\"tag\":\"TimeLimit\",\"contents\":0}],\"true\":[{\"tag\":\"RoundDown\",\"contents\":3},{\"tag\":\"TimeLimit\",\"contents\":60}]}}" @?= Just gameClock'
  , testCase "デコード不可" $ (decode "" :: Maybe (GameClock Bool)) @?= Nothing
  ]
