{-# LANGUAGE OverloadedStrings #-}

module GameClockTest.EncodeTest (tests) where

import           Data.Aeson
import           GameClock
import qualified GameClock.Clock  as Clock
import           Test.Tasty
import           Test.Tasty.HUnit

gameClock' :: GameClock Bool
gameClock' = countdown 90 False $ gameClock $ Clock.suddenDeath 3 60

tests :: TestTree
tests = testGroup "encode"
  [ testCase "エンコード" $ encode gameClock' @?= "{\"GameClock\":{\"false\":[{\"tag\":\"RoundDown\",\"contents\":3},{\"tag\":\"TimeLimit\",\"contents\":0}],\"true\":[{\"tag\":\"RoundDown\",\"contents\":3},{\"tag\":\"TimeLimit\",\"contents\":60}]}}"
  ]
