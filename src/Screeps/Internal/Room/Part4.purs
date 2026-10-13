module Screeps.Internal.Room.Part4
  ( deserializePath
  , createConstructionSite
  , createConstructionSiteName
  , createConstructionSiteXY
  , createConstructionSiteXYName
  , createFlag
  , createFlagName
  , createFlagNameColor
  , createFlagNameColorSecondaryColor
  , createFlagXY
  , createFlagXYName
  , createFlagXYNameColor
  , createFlagXYNameColorSecondaryColor
  ) where

import Data.Either (Either(..))
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn3, EffectFn4, EffectFn5, EffectFn6, EffectFn7, EffectFn8, runEffectFn1, runEffectFn3, runEffectFn4, runEffectFn5, runEffectFn6, runEffectFn7, runEffectFn8)
import Foreign (Foreign)
import Screeps.Constants (ColorConstant, ReturnCode, StructureConstant)
import Screeps.Types (Room, class HasPos)

-- deserializePath 'path' → 1 variant × 1 × 1 = 1 function
-- NOTE: path element format (x, y, dx, dy, direction) not described; left as Foreign
foreign import deserializePathImpl :: EffectFn1 String (Array Foreign)

-- | Deserialize a short string path representation into an array form.
deserializePath :: String -> Effect (Array Foreign)
deserializePath = runEffectFn1 deserializePathImpl

-- createConstructionSite 'x, y, structureType, [name]|pos, structureType, [name]' → 2 variants × 1 × 2 = 4 functions

foreign import createConstructionSiteImpl :: forall t. EffectFn3 Room t StructureConstant ReturnCode
foreign import createConstructionSiteNameImpl :: forall t. EffectFn4 Room t StructureConstant String ReturnCode
foreign import createConstructionSiteXYImpl :: EffectFn4 Room Int Int StructureConstant ReturnCode
foreign import createConstructionSiteXYNameImpl :: EffectFn5 Room Int Int StructureConstant String ReturnCode

-- | Create new ConstructionSite at the specified location.
createConstructionSite :: forall t. HasPos t => Room -> t -> StructureConstant -> Effect ReturnCode
createConstructionSite = runEffectFn3 createConstructionSiteImpl

-- | Create new ConstructionSite at the specified location.
createConstructionSiteName :: forall t. HasPos t => Room -> t -> StructureConstant -> String -> Effect ReturnCode
createConstructionSiteName = runEffectFn4 createConstructionSiteNameImpl

-- | Create new ConstructionSite at the specified location.
createConstructionSiteXY :: Room -> Int -> Int -> StructureConstant -> Effect ReturnCode
createConstructionSiteXY = runEffectFn4 createConstructionSiteXYImpl

-- | Create new ConstructionSite at the specified location.
createConstructionSiteXYName :: Room -> Int -> Int -> StructureConstant -> String -> Effect ReturnCode
createConstructionSiteXYName = runEffectFn5 createConstructionSiteXYNameImpl

-- createFlag 'x, y, [name], [color], [secondaryColor]|pos, [name], [color], [secondaryColor]' → 2 variants × 1 × 4 = 8 functions
-- Either args: left constructor, right constructor, room, then the call arguments

foreign import createFlagImpl :: forall t. EffectFn4 (ReturnCode -> Either ReturnCode String) (String -> Either ReturnCode String) Room t (Either ReturnCode String)
foreign import createFlagNameImpl :: forall t. EffectFn5 (ReturnCode -> Either ReturnCode String) (String -> Either ReturnCode String) Room t String (Either ReturnCode String)
foreign import createFlagNameColorImpl :: forall t. EffectFn6 (ReturnCode -> Either ReturnCode String) (String -> Either ReturnCode String) Room t String ColorConstant (Either ReturnCode String)
foreign import createFlagNameColorSecondaryColorImpl :: forall t. EffectFn7 (ReturnCode -> Either ReturnCode String) (String -> Either ReturnCode String) Room t String ColorConstant ColorConstant (Either ReturnCode String)

foreign import createFlagXYImpl :: EffectFn5 (ReturnCode -> Either ReturnCode String) (String -> Either ReturnCode String) Room Int Int (Either ReturnCode String)
foreign import createFlagXYNameImpl :: EffectFn6 (ReturnCode -> Either ReturnCode String) (String -> Either ReturnCode String) Room Int Int String (Either ReturnCode String)
foreign import createFlagXYNameColorImpl :: EffectFn7 (ReturnCode -> Either ReturnCode String) (String -> Either ReturnCode String) Room Int Int String ColorConstant (Either ReturnCode String)
foreign import createFlagXYNameColorSecondaryColorImpl :: EffectFn8 (ReturnCode -> Either ReturnCode String) (String -> Either ReturnCode String) Room Int Int String ColorConstant ColorConstant (Either ReturnCode String)

-- | Create new Flag at the specified location.
createFlag :: forall t. HasPos t => Room -> t -> Effect (Either ReturnCode String)
createFlag = runEffectFn4 createFlagImpl Left Right

-- | Create new Flag at the specified location.
createFlagName :: forall t. HasPos t => Room -> t -> String -> Effect (Either ReturnCode String)
createFlagName = runEffectFn5 createFlagNameImpl Left Right

-- | Create new Flag at the specified location.
createFlagNameColor :: forall t. HasPos t => Room -> t -> String -> ColorConstant -> Effect (Either ReturnCode String)
createFlagNameColor = runEffectFn6 createFlagNameColorImpl Left Right

-- | Create new Flag at the specified location.
createFlagNameColorSecondaryColor :: forall t. HasPos t => Room -> t -> String -> ColorConstant -> ColorConstant -> Effect (Either ReturnCode String)
createFlagNameColorSecondaryColor = runEffectFn7 createFlagNameColorSecondaryColorImpl Left Right

-- | Create new Flag at the specified location.
createFlagXY :: Room -> Int -> Int -> Effect (Either ReturnCode String)
createFlagXY = runEffectFn5 createFlagXYImpl Left Right

-- | Create new Flag at the specified location.
createFlagXYName :: Room -> Int -> Int -> String -> Effect (Either ReturnCode String)
createFlagXYName = runEffectFn6 createFlagXYNameImpl Left Right

-- | Create new Flag at the specified location.
createFlagXYNameColor :: Room -> Int -> Int -> String -> ColorConstant -> Effect (Either ReturnCode String)
createFlagXYNameColor = runEffectFn7 createFlagXYNameColorImpl Left Right

-- | Create new Flag at the specified location.
createFlagXYNameColorSecondaryColor :: Room -> Int -> Int -> String -> ColorConstant -> ColorConstant -> Effect (Either ReturnCode String)
createFlagXYNameColorSecondaryColor = runEffectFn8 createFlagXYNameColorSecondaryColorImpl Left Right
