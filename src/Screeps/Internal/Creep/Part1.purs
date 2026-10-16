module Screeps.Internal.Creep.Part1
  ( BodyPart
  , body
  , fatigue
  , hits
  ) where

import Data.Nullable (Nullable)
import Screeps.Constants (BodyPartConstant, ResourceConstant)
import Screeps.Types (Creep)

-- | One element of a creep's body.
type BodyPart =
  { boost :: Nullable ResourceConstant
  , "type" :: BodyPartConstant
  , hits :: Int
  }

-- | An array describing the creep's body.
foreign import body :: Creep -> Array BodyPart

-- | The movement fatigue indicator.
foreign import fatigue :: Creep -> Int

-- | The current amount of hit points of the creep.
foreign import hits :: Creep -> Int
