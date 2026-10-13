module Screeps.Internal.RoomPosition.Part2
  ( y
  , createConstructionSite
  , createConstructionSiteName
  , createFlag
  , createFlagName
  , createFlagNameColor
  , createFlagNameColorSecondaryColor
  ) where

import Data.Either (Either(..))
import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, EffectFn4, EffectFn5, EffectFn6, runEffectFn2, runEffectFn3, runEffectFn4, runEffectFn5, runEffectFn6)
import Screeps.Constants (ColorConstant, ReturnCode, StructureConstant)
import Screeps.Types (RoomPosition)

-- | Y position in the room.
foreign import y :: RoomPosition -> Int

-- createConstructionSite 'structureType, [name]' → 1 variant × 1 × (1 optional + 1) = 2 functions
foreign import createConstructionSiteImpl :: EffectFn2 RoomPosition StructureConstant ReturnCode
foreign import createConstructionSiteNameImpl :: EffectFn3 RoomPosition StructureConstant String ReturnCode

-- | Create new ConstructionSite at the specified location.
createConstructionSite :: RoomPosition -> StructureConstant -> Effect ReturnCode
createConstructionSite = runEffectFn2 createConstructionSiteImpl

-- | Create new ConstructionSite at the specified location.
createConstructionSiteName :: RoomPosition -> StructureConstant -> String -> Effect ReturnCode
createConstructionSiteName = runEffectFn3 createConstructionSiteNameImpl

-- createFlag '[name], [color], [secondaryColor]' → 1 variant × 1 × (3 optional + 1) = 4 functions
-- The success value is the flag name (String); error codes are negative numbers, mapped to Left.
foreign import createFlagImpl :: EffectFn3 (ReturnCode -> Either ReturnCode String) (String -> Either ReturnCode String) RoomPosition (Either ReturnCode String)
foreign import createFlagNameImpl :: EffectFn4 (ReturnCode -> Either ReturnCode String) (String -> Either ReturnCode String) RoomPosition String (Either ReturnCode String)
foreign import createFlagNameColorImpl :: EffectFn5 (ReturnCode -> Either ReturnCode String) (String -> Either ReturnCode String) RoomPosition String ColorConstant (Either ReturnCode String)
foreign import createFlagNameColorSecondaryColorImpl :: EffectFn6 (ReturnCode -> Either ReturnCode String) (String -> Either ReturnCode String) RoomPosition String ColorConstant ColorConstant (Either ReturnCode String)

-- | Create new Flag at the specified location.
createFlag :: RoomPosition -> Effect (Either ReturnCode String)
createFlag = runEffectFn3 createFlagImpl Left Right

-- | Create new Flag at the specified location.
createFlagName :: RoomPosition -> String -> Effect (Either ReturnCode String)
createFlagName = runEffectFn4 createFlagNameImpl Left Right

-- | Create new Flag at the specified location.
createFlagNameColor :: RoomPosition -> String -> ColorConstant -> Effect (Either ReturnCode String)
createFlagNameColor = runEffectFn5 createFlagNameColorImpl Left Right

-- | Create new Flag at the specified location.
createFlagNameColorSecondaryColor :: RoomPosition -> String -> ColorConstant -> ColorConstant -> Effect (Either ReturnCode String)
createFlagNameColorSecondaryColor = runEffectFn6 createFlagNameColorSecondaryColorImpl Left Right
