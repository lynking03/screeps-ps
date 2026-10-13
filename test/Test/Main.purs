-- | Smoke test for the shared modules. Run with test/run.sh.
module Test.Main where

import Prelude

import Data.Maybe (Maybe, isJust)
import Effect (Effect)
import Effect.Exception (throw)
import Foreign (unsafeToForeign)
import Screeps.Constants as C
import Screeps.Game.GetObjectById (getObjectById)
import Screeps.Memory as M
import Screeps.Types (Source, StructureSpawn, StructureTower, Structure, downcast)

foreign import newTower :: Effect Structure
foreign import registerObject :: String -> Structure -> Effect Unit

assert :: String -> Boolean -> Effect Unit
assert name ok = unless ok (throw ("FAILED: " <> name))

main :: Effect Unit
main = do
  t <- newTower
  assert "downcast to own type" (isJust (downcast t :: Maybe StructureTower))
  assert "downcast to other type" (not (isJust (downcast t :: Maybe StructureSpawn)))
  assert "ReturnCode show" (show [C.ok, C.errNotInRange] == "[OK,ERR_NOT_IN_RANGE]")
  assert "duplicate -6 shows as resources" (show C.errNotEnoughEnergy == "ERR_NOT_ENOUGH_RESOURCES")
  assert "exitToFind" (C.exitToFind C.exitBottom == C.findExitBottom)
  M.setPath [ "creeps", "Bob", "role" ] (unsafeToForeign "harvester")
  assert "getPath hit" <<< isJust =<< M.getPath [ "creeps", "Bob", "role" ]
  assert "getPath through non-object" <<< not <<< isJust =<< M.getPath [ "creeps", "Bob", "role", "x" ]
  M.deletePath [ "creeps", "Bob" ]
  assert "deletePath" <<< not <<< isJust =<< M.getPath [ "creeps", "Bob" ]
  registerObject "t1" t
  assert "getObjectById right type" <<< isJust =<< (getObjectById "t1" :: Effect (Maybe StructureTower))
  assert "getObjectById wrong type" <<< not <<< isJust =<< (getObjectById "t1" :: Effect (Maybe Source))
  assert "getObjectById missing" <<< not <<< isJust =<< (getObjectById "nope" :: Effect (Maybe Source))
  pure unit
