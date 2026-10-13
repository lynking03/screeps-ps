module Screeps.Internal.ConstructionSite.Part3
  ( remove
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import Screeps.Constants (ReturnCode)
import Screeps.Types (ConstructionSite)

foreign import removeImpl :: EffectFn1 ConstructionSite ReturnCode

-- | Remove the construction site.
remove :: ConstructionSite -> Effect ReturnCode
remove = runEffectFn1 removeImpl
