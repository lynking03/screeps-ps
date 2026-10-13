module Screeps.Internal.StructureFactory.Part2
  ( produce
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Screeps.Constants (ResourceConstant, ReturnCode)
import Screeps.Types (StructureFactory)

foreign import produceImpl :: EffectFn2 StructureFactory ResourceConstant ReturnCode

-- | Produces the specified commodity. All ingredients should be available in the factory store.
produce :: StructureFactory -> ResourceConstant -> Effect ReturnCode
produce = runEffectFn2 produceImpl
