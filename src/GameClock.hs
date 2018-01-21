{-# LANGUAGE OverloadedStrings #-}

module GameClock
  ( GameClock
  , gameClock
  , countdown
  , lookup
  , over
  , encode
  , decode
  ) where

import           Data.Aeson
import           Data.Aeson.Types    (typeMismatch)
import qualified Data.Map            as Map
import           Data.Maybe          (fromMaybe)
import qualified GameClock.Clock     as Clock
import           GameClock.Clock.Sec (Sec)
import           Prelude             hiding (lookup)

-- | ゲーム時計データ
newtype GameClock color = GameClock (Map.Map color Clock.Clock) deriving (Show, Eq)

-- | Encoding
instance (ToJSONKey color) => ToJSON (GameClock color) where
  toJSON (GameClock gc) = object [ "GameClock" .= gc ]

-- | Decoding
instance (FromJSONKey color, Ord color) => FromJSON (GameClock color) where
  parseJSON (Object v) = GameClock <$> (v .: "GameClock")
  parseJSON invalid    = typeMismatch "GameClock" invalid

-- | ゲーム時計作成
gameClock :: (Ord color, Enum color, Bounded color) => Clock.Clock -> GameClock color
gameClock clock = GameClock . Map.fromAscList . map (flip (,) clock) $ [minBound..maxBound]

-- | 秒数カウントダウン
countdown :: (Ord color) => Sec -> color -> GameClock color -> GameClock color
countdown ms color (GameClock gc) = GameClock $ Map.update countdown' color gc
  where
    countdown' clock = Just $ Clock.countdown ms clock

-- | 時計取得
lookup :: (Ord color) => color -> GameClock color -> Clock.Clock
lookup color (GameClock gc) = fromMaybe Clock.empty (Map.lookup color gc)

-- | 時間切れ判定
over :: (Ord color) => color -> GameClock color -> Bool
over color gc = Clock.over $ lookup color gc
